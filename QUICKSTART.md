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

## 👤 Test Account Credentials

Since the app uses local storage, you can create any account you want!

**Example Buyer Account:**
- Email: buyer@example.com
- Password: password123

**Example Vendor Account:**
- Email: vendor@example.com
- Password: password123

## 🎯 Quick Tasks

### Add a Product as Vendor
1. Go to http://127.0.0.1:8000/login-role.html
2. Select **Vendor** role
3. Enter email: `vendor@example.com` and password: `password123`
4. Click "My Products" tab
5. Click "+ Add New Product"
6. Fill in details and save
7. View product on dashboard

### Browse Products as Buyer
1. Go to http://127.0.0.1:8000/login-role.html
2. Select **Buyer** role
3. Enter email: `buyer@example.com` and password: `password123`
4. Browse products from the marketplace
5. Use category filters or search
6. Add items to cart
7. View order summary

### Switch Between Roles
**From Vendor Dashboard:**
- Click "Switch to Buyer Mode" button (top-right)

**From Buyer Home:**
- Go to Profile (👤)
- Click "Switch to Vendor Mode"
- Both redirect seamlessly

### Logout
- Click the "Logout" button in the header or profile
- You'll be redirected to login page
- All data is persisted in browser storage

## 📊 Dashboard Statistics

### Vendor Dashboard Shows:
- Total Products Created
- Total Customers
- Total Revenue (sum of all sales)
- Vendor Rating (default: 4.8)

### Updates When:
- New product is added
- Product is sold (calculated from sales data)
- Customer interacts with your products

## 💬 Features to Try

### Vendor Features:
- ✅ Add, edit, delete products
- ✅ View customer list
- ✅ Monitor sales per product
- ✅ Receive and reply to messages
- ✅ View dashboard analytics
- ✅ Switch to buyer mode

### Buyer Features:
- ✅ Browse all products
- ✅ Filter by category
- ✅ Search products
- ✅ Add items to cart
- ✅ Manage cart quantities
- ✅ View profile settings
- ✅ Switch to vendor mode
- ✅ Simulate role switching

## 🔧 Troubleshooting

### App Not Loading
- Ensure server is running: `npm start`
- Check browser console for errors (F12)
- Clear browser cache (Ctrl+Shift+Delete)

### Role Not Switching
- Check browser's localStorage is enabled
- Clear localStorage: Open DevTools → Application → Storage → Clear All

### Data Not Saving
- All data uses localStorage
- Make sure JavaScript is enabled
- Check browser console for errors

### Session Lost
- localStorage persists until you clear it manually
- Logout clears the session
- Opening new tab keeps session

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
   - Add a message in the messages tab (vendor)
   - Message will appear with timestamp
   - Reply to maintain conversation history

4. **Sample Data:**
   - Default products are pre-loaded for buyers
   - Vendors start with empty product list
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
├── package.json             # NPM config
└── README.md                # Full documentation
```

## 🆘 Need Help?

- Check README.md for full documentation
- Review inline code comments
- Check browser console (F12) for errors
- All data is in browser localStorage (DevTools → Application)

---

**Happy Testing! 🎉**

The app is fully functional and ready to demonstrate role-based e-commerce features!