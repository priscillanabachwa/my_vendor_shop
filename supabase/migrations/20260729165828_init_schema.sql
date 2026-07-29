-- DigitalVendor core schema: profiles, products, orders, order_items, messages
-- with row level security so the anon/public client key can be used safely.

create table if not exists public.profiles (
    id uuid primary key references auth.users(id) on delete cascade,
    full_name text,
    email text,
    role text not null check (role in ('buyer', 'vendor')),
    created_at timestamptz not null default now()
);

create table if not exists public.products (
    id uuid primary key default gen_random_uuid(),
    vendor_id uuid not null references public.profiles(id) on delete cascade,
    name text not null,
    description text,
    category text,
    price numeric(10, 2) not null check (price >= 0),
    stock integer not null default 0 check (stock >= 0),
    icon text,
    created_at timestamptz not null default now()
);

create table if not exists public.orders (
    id uuid primary key default gen_random_uuid(),
    buyer_id uuid not null references public.profiles(id) on delete cascade,
    status text not null default 'pending',
    total numeric(10, 2) not null default 0,
    created_at timestamptz not null default now()
);

create table if not exists public.order_items (
    id uuid primary key default gen_random_uuid(),
    order_id uuid not null references public.orders(id) on delete cascade,
    product_id uuid references public.products(id) on delete set null,
    vendor_id uuid not null references public.profiles(id) on delete cascade,
    quantity integer not null check (quantity > 0),
    price numeric(10, 2) not null
);

create table if not exists public.messages (
    id uuid primary key default gen_random_uuid(),
    sender_id uuid not null references public.profiles(id) on delete cascade,
    recipient_id uuid not null references public.profiles(id) on delete cascade,
    product_id uuid references public.products(id) on delete set null,
    body text not null,
    read boolean not null default false,
    created_at timestamptz not null default now()
);

create index if not exists products_vendor_id_idx on public.products(vendor_id);
create index if not exists orders_buyer_id_idx on public.orders(buyer_id);
create index if not exists order_items_order_id_idx on public.order_items(order_id);
create index if not exists order_items_vendor_id_idx on public.order_items(vendor_id);
create index if not exists messages_sender_id_idx on public.messages(sender_id);
create index if not exists messages_recipient_id_idx on public.messages(recipient_id);

-- Auto-create a profile row whenever a new auth user signs up, reading
-- full_name/role out of the signUp() options.data metadata.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
    insert into public.profiles (id, full_name, email, role)
    values (
        new.id,
        new.raw_user_meta_data->>'full_name',
        new.email,
        coalesce(new.raw_user_meta_data->>'role', 'buyer')
    );
    return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
    after insert on auth.users
    for each row execute procedure public.handle_new_user();

alter table public.profiles enable row level security;
alter table public.products enable row level security;
alter table public.orders enable row level security;
alter table public.order_items enable row level security;
alter table public.messages enable row level security;

-- profiles: readable by any authenticated user, writable only by owner
create policy "profiles are readable by authenticated users"
    on public.profiles for select
    to authenticated
    using (true);

create policy "users can insert their own profile"
    on public.profiles for insert
    to authenticated
    with check (id = auth.uid());

create policy "users can update their own profile"
    on public.profiles for update
    to authenticated
    using (id = auth.uid())
    with check (id = auth.uid());

-- products: readable by any authenticated user, writable only by the owning vendor
create policy "products are readable by authenticated users"
    on public.products for select
    to authenticated
    using (true);

create policy "vendors can insert their own products"
    on public.products for insert
    to authenticated
    with check (vendor_id = auth.uid());

create policy "vendors can update their own products"
    on public.products for update
    to authenticated
    using (vendor_id = auth.uid())
    with check (vendor_id = auth.uid());

create policy "vendors can delete their own products"
    on public.products for delete
    to authenticated
    using (vendor_id = auth.uid());

-- orders: visible to the buyer, and to any vendor with a line item on the order
create policy "buyers can read their own orders"
    on public.orders for select
    to authenticated
    using (
        buyer_id = auth.uid()
        or exists (
            select 1 from public.order_items oi
            where oi.order_id = orders.id and oi.vendor_id = auth.uid()
        )
    );

create policy "buyers can create their own orders"
    on public.orders for insert
    to authenticated
    with check (buyer_id = auth.uid());

-- order_items: visible to the buyer on the parent order, and the vendor on the item
create policy "order items readable by buyer or vendor"
    on public.order_items for select
    to authenticated
    using (
        vendor_id = auth.uid()
        or exists (
            select 1 from public.orders o
            where o.id = order_items.order_id and o.buyer_id = auth.uid()
        )
    );

create policy "buyers can create order items on their own orders"
    on public.order_items for insert
    to authenticated
    with check (
        exists (
            select 1 from public.orders o
            where o.id = order_items.order_id and o.buyer_id = auth.uid()
        )
    );

-- messages: visible to sender or recipient
create policy "messages readable by sender or recipient"
    on public.messages for select
    to authenticated
    using (sender_id = auth.uid() or recipient_id = auth.uid());

create policy "users can send messages as themselves"
    on public.messages for insert
    to authenticated
    with check (sender_id = auth.uid());
