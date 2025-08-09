# 🛒 Crafty Bay

A Flutter-based e-commerce app built with a **Feature-First Modular Architecture** and **MVVM-style state management** using [GetX](https://pub.dev/packages/get).  
The app is designed to be scalable, maintainable, and easy to extend for new features.

---

## 📌 Features

- **Authentication**
  - Email-based login
  - OTP verification
- **Product Management**
  - Product listing
  - Product details
- **Cart**
  - Add/remove items
  - View cart summary
- **Checkout**
  - SslCommerz payment gateway integration
- **UI Enhancements**
  - Image sliders (carousel)
  - SVG assets support
- **Persistent Storage**
  - Local preferences for token/session data
- **Error Tracking**
  - Firebase Crashlytics integration

---

## 🏗 Architecture

### **Feature-First Modular Structure**
Each feature (e.g., Auth, Cart, Product) contains its own:
- **Data Layer** → Models, API-related code
- **UI Layer** → Screens, Widgets
- **Controller Layer** → GetX Controllers managing state & API calls

```plaintext
lib/
├── core/               # Shared services, reusable widgets, utils
├── features/
│   ├── auth/
│   │   ├── data/models/
│   │   ├── ui/screens/
│   │   ├── ui/controllers/
│   ├── cart/
│   ├── home/
│   ├── product/
│   └── wishlist/
```
*MVVM with GetX**
  Model → Plain Dart classes for structured data (e.g., ProductModel, UserModel)

  View → Flutter UI widgets/screens that display data
  
  ViewModel (GetxController) → Handles:

  API calls

  Business logic

  Managing Rx reactive state

  Updating Models

