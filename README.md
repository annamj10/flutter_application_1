# JoJo's - Homemade Goodness Near You

## 📱 Project Description
JoJo's is a mobile application connecting local women entrepreneurs with customers in their neighborhood. Users can buy homemade dishes, baked items, and fresh farm produce, or sell their own creations.

## 🛠️ Tech Stack
- **Frontend**: Flutter (Dart)
- **State Management**: setState
- **Navigation**: Navigator 2.0
- **Dependencies**:
  - google_fonts: ^6.1.0
  - cupertino_icons: ^1.0.6
  - smooth_page_indicator: ^1.1.0

## ✨ Features
1. **User Authentication** - Sign up/Login as buyer or seller
2. **Role-Based Interface** - Different views for buyers and sellers
3. **Product Categories** - Browse by Baked Goods, Pickles, Sweets, etc.
4. **Location-Based Discovery** - Find products near you
5. **Product Management** - Sellers can add and manage products
6. **Shopping Cart** - Add items and checkout
7. **User Profile** - Manage account and preferences

## 📸 Screenshots
![Splash Screen](assets/screenshots/splash.png)
![Home Screen](assets/screenshots/home.png)
![Product Details](assets/screenshots/product.png)
![Cart Screen](assets/screenshots/cart.png)

## 🎥 Demo Video
[Watch Demo Video](link-to-your-video)

## 📊 App Flow Diagram
![App Flow Diagram](docs/diagrams/app_flow.png)

## 🏗️ Architecture Diagram
![Architecture Diagram](docs/diagrams/architecture.png)

## 📦 Installation

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code

### Build Commands
```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/jojos_app.git

# Navigate to project
cd jojos_app

# Get dependencies
flutter pub get

# Run the app
flutter run

# Build APK
flutter build apk --release
