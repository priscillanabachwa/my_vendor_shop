# DigitalVendor Application Setup Guide

## Complete Application Structure

Your DigitalVendor project now has a full working e-commerce application with 8 functional pages!

### 📁 Frontend Files

**Authentication Pages:**
- `login.html` - User login with email/password
- `signup.html` - User registration
- `reset-password.html` - Password reset page
- `auth-callback.html` - OAuth callback handler

**Main Application Pages:**
- `home.html` - Marketplace homepage (main dashboard)
- `profile.html` - User profile & settings
- `orders.html` - Order history
- `messages.html` - Messages/notifications
- `cart.html` - Shopping cart with checkout

**Project Configuration:**
- `package.json` - NPM dependencies
- `supabase/config.toml` - Supabase configuration
- `node_modules/` - Dependencies

## 🎯 Features Implemented

### Home Page (`home.html`)
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
✅ Help & Support
✅ **Fully functional Logout button**
✅ User verification badge
✅ Gold Merchant status display

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
✅ **Email/Password Login** - Full authentication
✅ **User Registration** - Create new accounts
✅ **Password Reset** - Request reset links
✅ **Google OAuth** - Sign in with Google (requires setup)
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

## 🛒 Shopping Features

**Product Catalog:**
- 4 sample products with images, prices, and locations
- Category filtering (Food, Clothes, Electronics, Produce)
- Search functionality
- Verified vendor badges

**Cart Management:**
- Add to cart from product cards
- Increase/decrease quantities
- Remove items
- Cart persists using localStorage
- Cart badge shows item count

## 🔐 Security & Authentication

All pages except login/signup require authentication:
- Auto-redirects to login if not authenticated
- Session persistence across page navigation
- Secure logout functionality

## ⚠️ IMPORTANT: Update Supabase Credentials

The application uses **placeholder Supabase keys**. You MUST update them:

### Steps:
1. Visit https://app.supabase.com
2. Select your DigitalVendor project
3. Go to **Settings** > **API**
4. Copy your **Project URL** and **Anon Key**
5. Update ALL HTML files - Replace these lines:

```javascript
const SUPABASE_URL = 'https://iunirrrnjxzxtqfgvjjn.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
```

With your actual credentials:
```javascript
const SUPABASE_URL = 'YOUR_ACTUAL_URL';
const SUPABASE_ANON_KEY = 'YOUR_ACTUAL_KEY';
```

### Files that need updating:
- login.html
- signup.html
- home.html
- profile.html
- cart.html
- orders.html
- messages.html
- reset-password.html
- auth-callback.html
- dashboard.html (optional - now redirects to home)

## 🚀 Running the Application

### Option 1: Direct Browser (Simplest)
```bash
# Just open login.html in your browser
# http://file:///C:/Users/hp/OneDrive/Desktop/DigitalVendor/login.html
```

### Option 2: Local Web Server (Recommended)
```bash
# Using Python
python -m http.server 8000

# Using Node.js
npx http-server

# Then visit: http://localhost:8000/login.html
```

### Option 3: VS Code Live Server
1. Install "Live Server" extension
2. Right-click login.html
3. Select "Open with Live Server"

## 📱 Testing the Application

### Test Flow:
1. **Sign Up** - Create new account at signup.html
2. **Login** - Sign in with your credentials
3. **Browse** - View products on home.html
4. **Search** - Filter products by name
5. **Categories** - Click category buttons
6. **Cart** - Add items and view cart
7. **Profile** - Check settings and logout
8. **Messages** - View vendor messages
9. **Orders** - Check order history

## 📊 Data Management

### Local Storage (Client-side):
- Cart items saved in localStorage
- Survives page refreshes

### Supabase (Backend):
- User authentication
- User profiles
- Will store orders, products, messages

### Sample Data:
Product data is currently hardcoded for demo purposes. To connect to Supabase database:

```javascript
// Example: Load products from Supabase
const { data: products } = await supabase
    .from('products')
    .select('*')
    .eq('category', 'food');
```

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

### Add More Products:
Add to the `products` array in home.html:
```javascript
{ 
    id: 5, 
    name: 'New Product', 
    price: 99.99, 
    location: 'New Location',
    category: 'food',
    image: 'image_url'
}
```

### Add New Categories:
1. Add button in home.html categories section
2. Add category to products array
3. Update category filtering logic

## 📝 Next Steps

1. ✅ Update Supabase credentials (REQUIRED)
2. Create database tables in Supabase:
   - products
   - orders
   - order_items
   - messages
3. Set up database relationships
4. Connect product loading to Supabase
5. Implement real order processing
6. Add payment integration (Stripe, etc.)
7. Set up email notifications
8. Deploy to production

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
