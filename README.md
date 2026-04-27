# 🛒 Just Ecommerce App

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

A modern, sleek Flutter e-commerce application built with clean architecture and beautiful UI. Browse products, add to cart, and enjoy a seamless shopping experience!

## ✨ Features

- 🏠 **Home Screen**: Browse featured products with stunning product cards
- 🛍️ **Product Catalog**: View detailed product information with cached images
- 🛒 **Shopping Cart**: Add/remove items with real-time cart updates
- ❤️ **Wishlist**: Save favorite products for later (Student Assignment Implementation)
- 🎨 **Beautiful UI**: Modern design with smooth animations and shimmer effects
- 📱 **Cross-Platform**: Runs on Android, iOS, Web, Windows, Linux, and macOS
- 🔄 **State Management**: Powered by Provider for efficient state handling
- 🔔 **Badge Notifications**: Real-time badge counts for cart items (extendable to wishlist)

## � Student Assignment: Add Wishlist Functionality

**🎓 Assignment Objective:** Implement a complete wishlist feature following the existing app architecture and design patterns.

### Assignment Requirements

**Phase 1: Setup and Dependencies**
1. Add the `badges` package to `pubspec.yaml`:
   ```yaml
   dependencies:
     badges: ^3.1.2
   ```
2. Run `flutter pub get` to install the new dependency

**Phase 2: Create WishlistProvider**
1. Create `lib/providers/wishlist_provider.dart`
2. Implement the following methods:
   - `addToWishlist(ProductModel product)` - Add product if not already in wishlist
   - `removeFromWishlist(ProductModel product)` - Remove specific product
   - `toggleWishlist(ProductModel product)` - Add if not present, remove if present
   - `isInWishlist(ProductModel product)` - Check if product exists in wishlist
   - `get totalWishlistItems` - Return count of wishlist items
   - `clearWishlist()` - Remove all items

**Phase 3: Update App Architecture**
1. Add `WishlistProvider` to `main.dart` in the `MultiProvider`
2. Import the new provider in `main.dart`

**Phase 4: Update ProductCard Component**
1. Import `WishlistProvider` in `product_Card.dart`
2. Make the heart icon functional:
   - Change icon from `Iconsax.heart` to filled `Iconsax.heart5` when in wishlist
   - Change color to red when in wishlist
   - Add `onTap` to toggle wishlist status
   - Show appropriate snackbar messages

**Phase 5: Update AppBar with Badges**
1. Import `badges` package in `home_view.dart`
2. Import `WishlistProvider` in `home_view.dart`
3. Wrap both heart and cart icons with `Badge` widgets
4. Display item counts in badges (only show badge when count > 0)
5. Add navigation to wishlist view when heart icon is tapped

**Phase 6: Create WishlistView**
1. Create `lib/views/wishlist_view.dart`
2. Follow the same structure as `CartView` but adapted for wishlist:
   - AppBar with title "My Wishlist"
   - Clear wishlist action button
   - Empty state with appropriate messaging
   - List of wishlist items with remove functionality
   - Each item should show product image, name, description, price
   - Remove button for each item

### Implementation Guidelines

- **Follow Existing Patterns**: Use the same code style and structure as `CartProvider` and `CartView`
- **State Management**: Use Provider pattern consistently
- **UI Consistency**: Match the design language of existing components
- **User Feedback**: Provide snackbar messages for all user actions
- **Navigation**: Implement proper navigation between screens
- **Error Handling**: Handle edge cases (empty wishlist, duplicate additions)

### Testing Checklist

- [ ] Heart icon changes color and fill when tapped
- [ ] Badge shows correct count for wishlist items
- [ ] Badge shows correct count for cart items
- [ ] Wishlist view displays added items
- [ ] Can remove items from wishlist view
- [ ] Can clear entire wishlist
- [ ] Navigation works between screens
- [ ] SnackBar messages appear for all actions
- [ ] No duplicate items in wishlist
- [ ] App doesn't crash with empty states

### Learning Outcomes

By completing this assignment, students will learn:
- Advanced state management with multiple providers
- Working with external packages (badges)
- Implementing complex UI interactions
- Following existing code architecture
- Creating new screens and navigation
- Handling user interactions and feedback
- Managing app-wide state across multiple screens

 

## 📱 App Screens Preview

<table>
<tr>
<td align="center">
<img src="https://github.com/user-attachments/assets/dee99d59-c39b-46db-84bd-9f30db593dd3" width="260"/>
</td>
<td align="center">
<img src="https://github.com/user-attachments/assets/1685f0f5-04a8-4a0d-8746-9b2414545a00" width="260"/>
</td>
</tr>

<tr>
<td align="center">
<img src="https://github.com/user-attachments/assets/6edca6c7-de4b-45ca-b781-7ba4bc893075" width="260"/>
</td>
<td align="center">
<img src="https://github.com/user-attachments/assets/f867cae8-a486-412b-baa0-45608e01301b" width="260"/>
</td>
</tr>
</table>

<p align="center">
<img src="https://github.com/user-attachments/assets/7dec9529-bfe8-40c3-97ce-e46bf6bf7e63" width="280"/>
</p>



## �🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.11.4)
- Dart SDK (^3.11.4)
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/just_eccomerce_app.git
   cd just_eccomerce_app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Building for Production

- **Android APK**: `flutter build apk --release`
- **iOS**: `flutter build ios --release`
- **Web**: `flutter build web --release`

## 📁 Project Structure

```
just_eccomerce_app/
├── lib/
│   ├── components/          # Reusable UI components
│   │   ├── cart_item_widget.dart
│   │   └── product_Card.dart
│   ├── data/                # Data models and mock data
│   │   ├── cart_item_model.dart
│   │   └── product_data.dart
│   ├── models/              # Business logic models
│   │   └── product_model.dart
│   ├── providers/           # State management providers
│   │   ├── cart_provider.dart
│   │   └── product_provider.dart
│   ├── utils/               # Utility classes and constants
│   │   ├── colors.dart
│   │   ├── constants.dart
│   │   ├── exports.dart
│   │   ├── sizes.dart
│   │   └── string_text.dart
│   ├── views/               # Main application screens
│   │   ├── cart_view.dart
│   │   └── home_view.dart
│   └── main.dart            # Application entry point
├── android/                 # Android platform code
├── ios/                     # iOS platform code
├── web/                     # Web platform code
├── windows/                 # Windows platform code
├── linux/                   # Linux platform code
├── macos/                   # macOS platform code
├── test/                    # Unit and widget tests
├── pubspec.yaml             # Project dependencies
├── analysis_options.yaml    # Code analysis configuration
└── README.md               # Project documentation
```

## 📦 Dependencies

### Production Dependencies

- **flutter**: The Flutter SDK
- **cupertino_icons**: iOS-style icons
- **provider**: State management solution
- **after_layout**: Execute code after first layout
- **shimmer**: Loading animation effects
- **cached_network_image**: Image caching and loading
- **iconsax**: Modern icon pack
- **gap**: Spacing widget for Flutter
- **badges**: Badge widgets for notifications (to be added by students)

### Development Dependencies

- **flutter_test**: Flutter testing framework
- **flutter_lints**: Recommended linting rules

## 🛠️ Architecture

This app follows a clean architecture pattern with:

- **Presentation Layer**: Views and components handle UI
- **Business Logic Layer**: Providers manage application state
- **Data Layer**: Models and data classes define data structures

## 🎯 Usage

1. Launch the app
2. Browse products on the home screen
3. Tap on products to view details
4. Add items to cart using the cart icon
5. Navigate to cart to review and manage items

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

- **Author**: Salim Abukar Ahmed
- **GitHub**: [@Saliim242](https://github.com/Saliim242)

---

Made with ❤️ using Flutter
