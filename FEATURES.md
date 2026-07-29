# DigitalVendor - Complete Feature Documentation

## 🎯 Role-Based Authentication System

### Login Page (`login-role.html`)
**Features:**
- Visual role selection cards (Buyer 🛍️ / Vendor 🏢)
- Email/password authentication
- Google OAuth integration
- Microsoft OAuth integration
- Form validation with error messages
- Remember me functionality
- Responsive design

### Signup Page (`signup-role.html`)
**Features:**
- Role selection during registration
- Full name input
- Email validation
- Password strength requirements (min 8 characters)
- Password confirmation matching
- Terms & conditions acceptance
- Social signup options
- Duplicate account prevention

---

## 📊 Vendor Dashboard (`vendor-dashboard.html`)

### Overview Tab
```
Displays key metrics:
- 📦 Total Products: Count of all products added
- 👥 Total Customers: Number of unique customers
- 💰 Total Revenue: Sum of all sales
- ⭐ Vendor Rating: Customer satisfaction (default: 4.8)
```

### My Products Tab
**Add Product:**
- Product Name (required)
- Category Selection:
  - 🍔 Food
  - 👕 Clothes
  - 📱 Electronics
  - 🥕 Produce
  - Other
- Price Input (with decimal support)
- Stock Quantity
- Custom Product Icon (emoji)
- Product Description (optional)

**Product Management:**
- View all products with icons and stats
- Edit existing products
- Delete products with confirmation
- Display stock and sold quantity
- Real-time inventory tracking

**Product Data Structure:**
```javascript
{
  id: 1,                          // Unique identifier
  name: "Product Name",           // Product name
  category: "food",               // Category
  price: 29.99,                   // Selling price
  stock: 50,                      // Available quantity
  icon: "🍕",                     // Visual representation
  description: "...",             // Product details
  sold: 5,                        // Quantity sold
  createdAt: "2026-06-24T..."     // Creation timestamp
}
```

### Customers Tab
**View Customer Information:**
- Customer Name
- Email Address
- Total Purchases (count)
- Total Spent (in $)
- Account Creation Date
- Sortable table format

**Use Cases:**
- Track customer engagement
- Identify top customers
- Send targeted offers
- Build customer relationships

### Messages Tab
**Message Features:**
- View all customer inquiries
- Display sender name
- Message content
- Timestamp for each message
- Reply functionality
- Message history
- Empty state when no messages

**Message Handling:**
- Receive notifications from customers
- Quick reply button
- Maintain conversation thread
- Track communication history

---

## 🛍️ Buyer Marketplace (`index.html`)

### Product Browsing
**Features:**
- Grid layout with product cards
- Product icons (emoji)
- Product names and descriptions
- Price display in bold orange
- Location information
- Verified vendor badges
- Add to cart button on each product

### Filtering & Search
**Category Filters:**
- All Products
- 🍔 Food
- 👕 Clothes
- 📱 Electronics
- 🥕 Produce

**Search Functionality:**
- Real-time search as you type
- Search by product name
- Search by vendor location
- Instant results filtering

### Cart Management
**Shopping Cart Button (Floating):**
- Fixed position in bottom-right
- Shows item count badge
- Click to view full cart
- Always visible while shopping

**Add to Cart:**
- Single click action
- Automatic quantity increment for duplicates
- Success notification
- Smooth user experience

### Navigation
**Bottom Navigation Bar:**
- 🏠 Home - Marketplace
- 📦 Orders - Order history
- 💬 Messages - Notifications
- 👤 Profile - Account settings

---

## 🛒 Shopping Cart (`cart.html`)

### Cart Items Display
- Product cards with:
  - Product name
  - Unit price
  - Quantity selector
  - Item subtotal
  - Remove button

### Quantity Management
- Increase/Decrease buttons
- Direct input option
- Minimum quantity: 1
- Real-time total calculation

### Order Summary
- Subtotal (sum of all items)
- Tax calculation (10%)
- Shipping cost (varies by amount)
- Grand Total (prominently displayed)

### Checkout
- Proceed to checkout button
- View order details
- Continue shopping option
- Clear cart option

---

## 📦 Orders Page (`orders.html`)

### Order History
- List of all past orders
- Order ID and date
- Items count
- Order total
- Delivery status
- Reorder option

### Order Details
- Item breakdown
- Unit prices
- Quantities
- Total per item
- Shipping information
- Tracking number

---

## 💬 Messages Page (`messages.html`)

### Message Inbox
- Thread-based conversations
- Sender name and avatar
- Message preview
- Last message timestamp
- Unread indicator

### Message Threads
- Full conversation history
- Message timestamps
- Sender/receiver indication
- Reply field
- Message search

---

## 👤 Profile Page (`profile.html`)

### User Information
- Avatar display
- Full name
- Email address
- Account type (Buyer/Vendor)
- Member since date

### Account Settings
- Email notifications toggle
- SMS notifications toggle
- Marketing emails toggle

### Payment Methods
- Add payment method
- Saved cards display
- Default payment selection
- Payment method management

### Preferences
- Language selection (English)
- Currency selection (USD)
- Theme selection
- Privacy settings

### Role Management
- Current role display
- Switch to Vendor Mode button
- Switch to Buyer Mode button
- Seamless role switching

### Help & Support
- Contact us button
- FAQs button
- Feedback submission
- Support ticket creation

### Logout
- Secure logout button
- Confirmation dialog
- Session clearing
- Redirect to login

---

## 💾 Data Persistence

### Supabase tables (`supabase/migrations/`)

**profiles** — `id`, `full_name`, `email`, `role` (`buyer` | `vendor`), auto-created by a database trigger on signup.

**products** — a vendor's catalog: `vendor_id`, `name`, `description`, `category`, `price`, `stock`, `icon`.

**orders** / **order_items** — created at checkout.

**messages** — `sender_id`, `recipient_id`, `product_id`, `body`, `read`.

All tables have row level security enabled: a user can only read/write the rows they're entitled to (their own profile, their own products, orders they bought or sold into, messages they sent or received).

### Browser localStorage
Only the pre-checkout shopping cart (`cart`) lives in localStorage — it's cleared once checkout creates a real `orders` row.

### Data Availability
- Product/order/message data is shared across devices and browsers (it's in the database, not per-browser)
- The cart itself is per-browser until checkout
- Clearing cache only affects the in-progress cart, not your account data

---

## 🔐 Authentication Flow

### Login Flow
1. User navigates to `login-role.html`
2. Selects role (Buyer or Vendor) — used to pick which dashboard to open after login
3. Enters email and password
4. `supabase.auth.signInWithPassword()` validates credentials against the real backend
5. The user's actual `profiles.role` (not the button they clicked) decides the redirect

### Signup Flow
1. User navigates to `signup-role.html`
2. Selects role (Buyer or Vendor)
3. Fills registration form and accepts terms
4. `supabase.auth.signUp()` creates the account; a database trigger creates the matching `profiles` row from the role/name passed in
5. Redirects to the role-specific dashboard

### Logout Flow
1. User clicks logout button
2. Confirmation dialog appears
3. `supabase.auth.signOut()` clears the real session
4. Redirects to `login-role.html`

### Role Switching
1. User clicks "Switch to Buyer/Vendor Mode"
2. `profiles.role` is updated in the database (a real, persistent change — not just a local flag)
3. Redirect to the matching dashboard

---

## 🎨 UI/UX Features

### Design Elements
- Gradient color scheme (Purple to Blue)
- Consistent button styling
- Smooth transitions and animations
- Loading states
- Error messages with visual feedback
- Success confirmations
- Empty states with guidance

### Responsive Design
- Mobile-first approach
- Tablet-friendly layouts
- Desktop optimized
- Touch-friendly buttons
- Adaptive navigation
- Flexible grid layouts

### Accessibility
- Semantic HTML structure
- Clear form labels
- Keyboard navigation support
- Color contrast compliance
- ARIA labels for icons
- Screen reader friendly

---

## 🔄 User Workflows

### Vendor Workflow
```
1. Signup as Vendor
2. Access Vendor Dashboard
3. Add Products with details
4. Monitor sales in Overview
5. View customer interactions
6. Communicate with customers
7. Track performance metrics
8. Switch to Buyer mode if needed
```

### Buyer Workflow
```
1. Signup as Buyer
2. Browse marketplace
3. Search or filter products
4. Add items to cart
5. Review cart and checkout
6. Track orders
7. Communicate with vendors
8. Switch to Vendor mode if needed
```

---

## 🚀 Performance Features

- **Fast Loading:** Minimal external dependencies
- **Smooth Navigation:** Instant route switching
- **Responsive Layout:** CSS Grid and Flexbox

---

## 🛡️ Security Considerations

### Current Implementation
- Real authentication via Supabase Auth (`supabase.auth`), passwords never touch application code
- Row level security policies on every table scope reads/writes to what a user actually owns
- Client-supplied text (product names/descriptions, messages, customer names) is HTML-escaped before being rendered

### Still worth doing before production
- Add rate limiting / captcha on auth endpoints (Supabase supports this via `auth.rate_limit` / `auth.captcha` in `supabase/config.toml`)
- Add server-side validation for numeric fields (price/stock) beyond the client-side form constraints
- Add payment integration — checkout currently records an order but doesn't collect payment

---

## 📈 Analytics & Metrics

### Vendor Metrics
- Total products created
- Total revenue generated
- Customer acquisition count
- Average order value
- Vendor rating
- Message response time
- Product performance

### Buyer Metrics
- Total purchases
- Average order value
- Favorite vendors
- Browsing history
- Saved items

---

## 🔧 Technical Stack

**Frontend:**
- HTML5
- CSS3 (Gradient, Flexbox, Grid)
- Vanilla JavaScript
- LocalStorage API
- Responsive Design

**No External Dependencies:**
- No jQuery
- No Bootstrap
- No external UI libraries
- Pure CSS styling
- Lightweight implementation

---

## 📱 Device Compatibility

- ✅ Desktop Browsers (Chrome, Firefox, Safari, Edge)
- ✅ Tablets (iPad, Android tablets)
- ✅ Mobile Phones (iPhone, Android)
- ✅ Landscape and Portrait modes
- ✅ Touch and Click interactions

---

This comprehensive feature set creates a functional e-commerce platform with complete role-based separation and real-world business logic!