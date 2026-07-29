# DigitalVendor Application - Role-Based Marketplace

## 🚀 Overview

DigitalVendor is a modern e-commerce platform with **role-based functionality** supporting both **Buyers** and **Vendors**. Users can choose their role during login/signup and access tailored dashboards and features.

### Key Features
- ✅ **Dual-Role System**: Buyers and Vendors with separate dashboards
- ✅ **Vendor Dashboard**: Complete product management system
- ✅ **Buyer Marketplace**: Browse, search, and purchase products
- ✅ **Real-time Features**: Customer management, messaging, and analytics
- ✅ **Product Management**: Add, edit, delete products with pricing
- ✅ **Local Storage Persistence**: All data saved in browser

## Complete Application Structure

Your DigitalVendor project now has a full working e-commerce application with role-based dashboards and features!

### 📁 Frontend Files

**Authentication Pages (Role-Based):**
- `login-role.html` - Login with role selection (Buyer or Vendor)
- `signup-role.html` - Sign up with role selection
- `reset-password.html` - Password reset page
- `auth-callback.html` - OAuth callback handler

**Buyer Pages:**
- `index.html` - Marketplace homepage for buyers
- `cart.html` - Shopping cart with checkout
- `orders.html` - Order history
- `messages.html` - Messages/notifications
- `profile.html` - Buyer profile & settings

**Vendor Pages:**
- `vendor-dashboard.html` - Complete vendor management system

**Shared:**
- `js/supabase-client.js` - One place for the Supabase URL/anon key, the `requireSession()` auth guard, and the `escapeHtml()` helper used across every page

**Project Configuration:**
- `package.json` - NPM dependencies
- `supabase/config.toml` - Supabase configuration
- `supabase/migrations/` - Database schema (profiles, products, orders, order_items, messages) with row level security policies

## 🎯 Features Implemented

### 🔐 Role-Based Authentication

**Login & Signup System:**
- Choose between **Buyer** or **Vendor** during login/signup
- Role selection stored in browser's local storage
- Automatic redirect based on selected role
- OAuth support (Google, Microsoft)

**Getting Started:**
1. Go to `http://127.0.0.1:8000/login-role.html` or `http://127.0.0.1:8000/signup-role.html`
2. Select your role: 👤 **Buyer** or 🏢 **Vendor**
3. Enter your credentials
4. Access role-specific dashboard

### 📊 Vendor Dashboard (`vendor-dashboard.html`)

**Overview Tab:**
- 📦 Total Products count
- 👥 Total Customers count
- 💰 Total Revenue tracker
- ⭐ Vendor Rating display

**Products Tab:**
- ✅ Add new products with:
  - Product name and description
  - Category selection (Food, Clothes, Electronics, Produce)
  - Pricing
  - Stock quantity
  - Custom product icons
- ✏️ Edit existing products
- 🗑️ Delete products
- 📊 View sales data per product

**Customers Tab:**
- 👥 View all customers
- 📊 Customer statistics:
  - Purchase history
  - Total spent
  - Join dates
- 📧 Customer email tracking

**Messages Tab:**
- 💬 Receive messages from customers
- 📝 Reply to customer inquiries
- 📅 Message timestamps
- 📌 Message history

**Features:**
- Dashboard statistics update in real-time
- Switch between Buyer and Vendor modes
- Secure logout functionality
- Data persistence using local storage

### 🛍️ Buyer Marketplace (`index.html`)
### 🛍️ Buyer Marketplace (`index.html`)
✅ Product browsing with category filtering
✅ Search functionality for products
✅ Add to cart button for each product
✅ Product cards with images, prices, and location
✅ Floating cart button with item counter
✅ Navigation bar (fixed bottom)
✅ Nearby deals section
✅ Category buttons (Food, Clothes, Electronics, Produce)

### Profile Page (`profile.html`)
✅ User profile display with avatar
✅ Edit Profile button
✅ Payment Methods management
✅ Notifications settings
✅ Language selection
✅ Switch to Vendor mode
✅ Fully functional Logout button
✅ User verification badge

### Shopping Cart (`cart.html`)
✅ Display all cart items
✅ Quantity increase/decrease buttons
✅ Remove item functionality
✅ Order summary with subtotal, tax, shipping
✅ Checkout button
✅ Empty cart state with link to browse
✅ Dynamic total calculation

### Orders Page (`orders.html`)
✅ Order history display
✅ Link to browse products
✅ Navigation integration

### Messages Page (`messages.html`)
✅ Message thread display
✅ Vendor messages
✅ Timestamps
✅ Unread indicator badge
✅ Message previews

### Authentication Pages
✅ **Email/Password Login** - Full authentication with role selection
✅ **User Registration** - Create new accounts with role selection
✅ **Password Reset** - Request reset links
✅ **Google OAuth** - Sign in with Google (requires setup)
✅ **Microsoft OAuth** - Sign in with Microsoft (requires setup)
✅ **Form Validation** - Email and password checks
✅ **Error Handling** - Clear error messages
✅ **Success Feedback** - Confirmation messages

## 🛠️ Navigation Flow

All pages are connected with a **persistent bottom navigation bar** showing:
- 🏠 Home - Browse products
- 📦 Orders - View order history
- 💬 Messages - Check messages
- 👤 Profile - Account settings

The active page is highlighted in orange, making navigation intuitive.

## � How to Use the New Role-Based Features

### As a Buyer 🛍️

1. **Sign Up/Login:**
   - Navigate to `http://127.0.0.1:8000/login-role.html`
   - Click on the **Buyer** role card
   - Enter credentials or use social login
   - Click "Sign In"

2. **Browse Products:**
   - View all available products on the marketplace
   - Use category filters to narrow down options
   - Use search bar to find specific products

3. **Make Purchases:**
   - Click "Add to Cart" on any product
   - View cart by clicking the floating 🛒 button
   - Manage quantities and remove items
   - Proceed to checkout

4. **Manage Account:**
   - Click on Profile (👤) in bottom navigation
   - View account settings
   - Switch to Vendor mode if desired
   - Logout when done

### As a Vendor 🏢

1. **Sign Up/Login:**
   - Navigate to `http://127.0.0.1:8000/login-role.html`
   - Click on the **Vendor** role card
   - Enter credentials or use social login
   - Click "Sign In"

2. **Add Products:**
   - Navigate to the "My Products" tab
   - Click "+ Add New Product"
   - Fill in product details:
     - Product name
     - Category
     - Price
     - Stock quantity
     - Product icon (emoji or symbol)
     - Description
   - Click "Save Product"

3. **Manage Products:**
   - View all your products in the "My Products" tab
   - Click "Edit" to modify product details
   - Click "Delete" to remove products
   - Monitor stock levels and sales

4. **View Customers:**
   - Go to "Customers" tab
   - See all customers who purchased from you
   - View purchase history and spending
   - Track customer join dates

5. **Communicate:**
   - Check "Messages" tab for customer inquiries
   - Reply to customer messages
   - Maintain communication history

6. **Monitor Performance:**
   - View dashboard overview stats:
     - Total products
     - Customer count
     - Total revenue
     - Vendor rating

## 🛒 Shopping Features

**Product Catalog:**
- Multiple sample products with images, prices, and locations
- Category filtering (Food, Clothes, Electronics, Produce)
- Search functionality
- Verified vendor badges

**Cart Management:**
- Add to cart from product cards
- Increase/decrease quantities
- Remove items
- Real-time total calculation
- Remove items
- Cart persists using localStorage
- Cart badge shows item count

## � Data Storage

Authentication, products, orders and messages are stored in **real Supabase tables** (see `supabase/migrations/`). Only the shopping cart stays in the browser until checkout:

**Supabase tables:**
- `profiles` - one row per user (`full_name`, `email`, `role`), auto-created by a trigger when someone signs up
- `products` - a vendor's product catalog
- `orders` / `order_items` - created at checkout
- `messages` - buyer/vendor conversations

**Browser localStorage:**
- `cart` - JSON array of items in the shopping cart, cleared once checkout creates a real order

## 🔄 Switching Between Roles

**From Buyer Dashboard:**
- Go to Profile (👤)
- Click "Switch to Vendor Mode"
- Redirects to Vendor Dashboard

**From Vendor Dashboard:**
- Click "Switch to Buyer Mode" in top-right
- Redirects to Buyer Marketplace

## �🔐 Security & Authentication

All pages except login/signup require authentication:
- Auto-redirects to login if not authenticated
- Session persistence across page navigation
- Secure logout functionality

## ⚠️ Supabase setup

`js/supabase-client.js` already points at the real linked project (ref `iunirrrnjxzxtqfgvjjn`) — every page includes that one file instead of each having its own copy of the URL/anon key. If you fork this into your own Supabase project, that's the only file you need to change:

```javascript
const SUPABASE_URL = 'YOUR_PROJECT_URL';
const SUPABASE_ANON_KEY = 'YOUR_ANON_KEY';
```

### Applying the database schema

The tables/RLS policies live in `supabase/migrations/`. Push them to the linked project with:

```bash
npx supabase db push --linked
```

This will prompt for the database password (Settings > Database in the Supabase dashboard) if it isn't already cached locally. Alternatively, paste the contents of the migration file into the Supabase Studio SQL editor and run it there.

## 🚀 Running the Application

### Option 1: Direct Browser (Simplest)
```bash
# Just open login-role.html in your browser
```

### Option 2: Local Web Server (Recommended)
```bash
npm start
# Then visit: http://localhost:8000/login-role.html
```

### Option 3: VS Code Live Server
1. Install "Live Server" extension
2. Right-click login-role.html
3. Select "Open with Live Server"

## 📱 Testing the Application

### Test Flow:
1. **Sign Up as a vendor** at signup-role.html, add a product from the dashboard
2. **Log out**, **sign up as a buyer**, confirm the product appears on index.html
3. **Search / Categories** - Filter products
4. **Cart** - Add the product, proceed to checkout
5. **Orders** - Confirm the order you just placed shows up
6. **Messages** - Message the vendor from a product card, then check the vendor dashboard's Messages tab
7. **Profile** - Check settings and logout

## 📊 Data Management

### Local Storage (Client-side):
- Cart items saved in localStorage
- Survives page refreshes

### Supabase (Backend):
- User authentication
- User profiles (with role)
- Products, orders, order items, messages

Vendors start with an empty product catalog — sign up as a vendor and add a product or two from the dashboard to populate the marketplace.

## 🎨 UI/UX Features

**Design System:**
- Tailwind CSS for styling
- Material Design icons
- Custom color palette (orange/brown theme)
- Responsive layout (mobile-first)
- Smooth animations and transitions
- Touch-friendly buttons (min 48px)

**Accessibility:**
- Semantic HTML
- Clear button labels
- Icon + text navigation
- Color contrast compliance
- Keyboard navigation support

## 🔧 Customization Guide

### Change Brand Colors:
Edit Tailwind config in each HTML file's `<script id="tailwind-config">` section

### Add Products:
Sign in as a vendor and use the "+ Add New Product" button on vendor-dashboard.html — this inserts a row into the real `products` table.

### Add New Categories:
1. Add an `<option>` to the category `<select>` in vendor-dashboard.html's product form
2. Add a matching filter button in index.html's category-buttons section

## 📝 Next Steps

1. Push `supabase/migrations/` to the linked project (`npx supabase db push --linked`) if you haven't yet
2. Add payment integration (Stripe, etc.) — checkout currently creates a real order but doesn't collect payment
3. Set up email notifications (order confirmations, new messages)
4. Configure Google/Microsoft OAuth in the Supabase dashboard if you want those login buttons to work
5. Add a product rating/review system to back the vendor dashboard's Rating stat
6. Deploy to production

## 🐛 Troubleshooting

**"Supabase is not defined"**
- Ensure CDN script: `<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2.39.6"></script>`

**Cart items not persisting**
- Check browser localStorage settings
- Try incognito/private mode
- Check browser console for errors

**Authentication not working**
- Verify Supabase credentials
- Check email authentication is enabled in Supabase
- Review browser console for specific error

**Images not loading**
- All sample images use Google CDN URLs
- Ensure internet connection
- Replace with your own image URLs

## 📞 Support Resources

- [Supabase Docs](https://supabase.com/docs)
- [Tailwind CSS](https://tailwindcss.com)
- [Material Icons](https://fonts.google.com/icons)
- [Supabase Discord](https://discord.supabase.com)

---

**Your DigitalVendor e-commerce application is ready to use! 🎉**
