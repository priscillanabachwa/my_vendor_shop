# DigitalVendor - Quick Start Guide

## 🚀 Getting Started

### 1. Start the Server
The server is already running at: **http://127.0.0.1:8000**

If you need to restart it:
```bash
cd c:\Users\hp\Desktop\DigitalVendor
npm start
```

### 2. Access the Application

**For Buyers:**
- Login: http://127.0.0.1:8000/login-role.html
- Signup: http://127.0.0.1:8000/signup-role.html
- Marketplace: http://127.0.0.1:8000/index.html

**For Vendors:**
- Login: http://127.0.0.1:8000/login-role.html
- Signup: http://127.0.0.1:8000/signup-role.html
- Dashboard: http://127.0.0.1:8000/vendor-dashboard.html

## 👤 Test Accounts

Auth is real (Supabase), so you need to actually sign up — there's no bypass or hardcoded demo login. Use two different email addresses (one per role) at http://127.0.0.1:8000/signup-role.html; passwords must be 8+ characters.

## 🎯 Quick Tasks

### Add a Product as Vendor
1. Sign up at http://127.0.0.1:8000/signup-role.html with the **Vendor** role
2. Click "My Products" tab
3. Click "+ Add New Product"
4. Fill in details and save — this inserts a row into the real `products` table
5. View product on dashboard

### Browse Products as Buyer
1. Sign up at http://127.0.0.1:8000/signup-role.html with the **Buyer** role (use a different email than your vendor account)
2. Browse products from the marketplace — you'll see the product(s) your vendor account added
3. Use category filters or search
4. Add items to cart, then checkout to create a real order

### Switch Between Roles
**From Vendor Dashboard:**
- Click "Switch to Buyer Mode" button (top-right) — this really updates your account's role in the database

**From Buyer Profile:**
- Go to Profile (👤)
- Click "Switch to Vendor Mode"

### Logout
- Click the "Logout" button in the header or profile
- Ends the real Supabase session and redirects to the login page

## 📊 Dashboard Statistics

### Vendor Dashboard Shows:
- Total Products (real count from your `products` rows)
- Total Customers (distinct buyers who've ordered from you)
- Total Revenue (sum of your `order_items`)
- Rating (shows "—" — there's no reviews feature yet)

### Updates When:
- You add/edit/delete a product
- A buyer checks out with one of your products in their cart
- A buyer messages you

## 💬 Features to Try

### Vendor Features:
- ✅ Add, edit, delete products
- ✅ View customer list (derived from real orders)
- ✅ View dashboard analytics (real product/customer/revenue counts)
- ✅ Receive and reply to messages
- ✅ Switch to buyer mode

### Buyer Features:
- ✅ Browse all products
- ✅ Filter by category
- ✅ Search products
- ✅ Add items to cart, checkout to place a real order
- ✅ View order history
- ✅ Message a vendor about a product
- ✅ View/edit profile settings
- ✅ Switch to vendor mode

## 🔧 Troubleshooting

### App Not Loading
- Ensure server is running: `npm start`
- Check browser console for errors (F12)
- Clear browser cache (Ctrl+Shift+Delete)

### Signup/Login Fails
- Password must be at least 8 characters (signup) or the account's real password (login) — there's no demo bypass
- Check the browser console for the actual Supabase error message
- Confirm `supabase/migrations/` has been pushed to the linked project (`npx supabase db push --linked`) — signup fails if the `profiles` table/trigger doesn't exist yet

### Products/Orders Not Showing Up
- Confirm the migration in `supabase/migrations/` has been applied — without it, the `products`/`orders`/`messages` tables don't exist
- Check the browser console for RLS ("row level security") errors, which usually mean you're signed in as the wrong account

### Session Lost
- Supabase sessions persist across tabs/refreshes until you log out or the token expires
- Logout calls `supabase.auth.signOut()` and clears the real session

## 📱 Supported Browsers

- ✅ Chrome / Edge (Recommended)
- ✅ Firefox
- ✅ Safari
- ✅ Mobile browsers (iOS Safari, Chrome Mobile)

## 💡 Tips

1. **Testing Multiple Roles:**
   - Open app in regular window as buyer
   - Open incognito window as vendor
   - Or use "Switch" buttons for quick role changes

2. **Simulating Purchases:**
   - Add products as vendor
   - Switch to buyer mode
   - Add products to cart
   - Switch back to vendor to see customer/revenue updates

3. **Testing Messages:**
   - As a buyer, click "💬 Message Vendor" on a product card
   - As the vendor, check the Messages tab and reply
   - Replies show up in the buyer's messages.html too

4. **Sample Data:**
   - There's no pre-loaded data — vendors start with an empty product list
   - Add your own products to test features

## 🚀 Next Steps

1. Explore all dashboard tabs
2. Create sample products as vendor
3. Browse and search as buyer
4. Test role switching
5. Try adding to cart and checkout flow
6. Switch modes and test messaging

## 📝 File Structure

```
DigitalVendor/
├── login-role.html          # Login with role selection
├── signup-role.html         # Signup with role selection
├── index.html               # Buyer marketplace
├── vendor-dashboard.html    # Vendor management dashboard
├── cart.html                # Shopping cart
├── orders.html              # Order history
├── messages.html            # Messages
├── profile.html             # User profile
├── auth-callback.html       # OAuth callback handler
├── reset-password.html      # Password reset page
├── js/supabase-client.js    # Shared Supabase client + auth guard
├── supabase/migrations/     # Database schema + RLS policies
├── package.json             # NPM config
└── README.md                # Full documentation
```

## 🆘 Need Help?

- Check README.md for full documentation
- Check browser console (F12) for errors
- Check the Supabase dashboard's Table Editor / Logs if data isn't showing up as expected

---

**Happy Testing! 🎉**