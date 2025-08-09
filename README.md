# 🛒 Crafty Bay

A Flutter-based e-commerce application built with a **Feature-First Modular Architecture** and **MVVM-style state management** using [GetX](https://pub.dev/packages/get).

This architecture ensures a clean separation of concerns, better scalability, and maintainability.

---

## 📌 Features

### **Authentication**
- Email-based login
- OTP verification

### **Product Management**
- Product listing
- Product details

### **Cart**
- Add/remove items
- View cart summary

### **Checkout**
- Integrated with [SslCommerz](https://sslcommerz.com/) payment gateway

### **UI Enhancements**
- Image sliders using `carousel_slider`
- SVG asset rendering

### **Persistent Storage**
- Store tokens and session data using `shared_preferences`

### **Error Tracking**
- Integrated with Firebase Crashlytics for error logging

---

## 🏗 Architecture

### **Feature-First Modular Structure**

The project is organized by features, each containing its own:
- **Data Layer** → Models and API-related code
- **UI Layer** → Screens and Widgets
- **Controller Layer** → GetX Controllers that handle state and logic

#### Example Folder Structure:
```plaintext
lib/
├── core/               # Shared services, reusable widgets, and utilities
├── features/
│   ├── auth/
│   │   ├── data/models/
│   │   ├── ui/screens/
│   │   └── ui/controllers/
│   ├── cart/
│   │   ├── data/models/
│   │   ├── ui/screens/
│   │   └── ui/controllers/
│   ├── home/
│   ├── product/
│   └── wishlist/
```

### **MVVM with GetX**

- **Model** → Plain Dart classes representing structured data (e.g., `ProductModel`, `UserModel`)
- **View** → Flutter UI Widgets that display data
- **ViewModel (GetxController)** → Responsible for:
  - Fetching data from APIs
  - Processing business logic
  - Managing `Rx` reactive state
  - Updating Models for the View

**Data Flow:**
```plaintext
View ← observes → GetxController (ViewModel) ↕ API Calls ↕ Data Models
```

This approach ensures:
- UI is declarative and reacts automatically to state changes
- Business logic and data fetching remain separated from UI code

---

## 📦 Dependencies

This project uses the following key packages:

| Package | Purpose |
|---------|---------|
| `get` | State management and navigation |
| `http` | Networking and API requests |
| `shared_preferences` | Local storage for key-value data |
| `flutter_svg` | Rendering SVG assets |
| `carousel_slider` | Image sliders and carousels |
| `pin_code_fields` | OTP input fields |
| `firebase_core` | Firebase core integration |
| `firebase_crashlytics` | Crash and error reporting |
| `flutter_sslcommerz` | Payment gateway integration |
| `logger` | Logging utility for debugging |
| `email_validator` | Email validation |

For the full list, see `pubspec.yaml`.

---

## 🚀 Getting Started

### 1️⃣ Clone the repository
```bash
git clone https://github.com/your-username/crafty_bay.git
cd crafty_bay
```

### 2️⃣ Install dependencies
```bash
flutter pub get
```

### 3️⃣ Run the application
```bash
flutter run
```

---

## 📁 Assets

All image assets are stored under:
```plaintext
assets/images/
```

They are registered in `pubspec.yaml` for use within the app.

---


## 📊 Project Overview Diagram

```plaintext
+-----------+     +-------------------+     +--------+
|   View    | <-> | GetxController    | <-> | Model  |
+-----------+     +-------------------+     +--------+
      ↑                    ↑                    ↑
      |                    |                    |
 Flutter UI          API Requests         Data Classes
(Screens/Widgets)   (via HTTP/Services)  (Product, User, etc.)
```

This diagram shows the **MVVM with GetX** flow — the View observes changes in the GetxController, which handles API calls and updates Models.

---

## 🔧 Tech Stack

**Frontend:** Flutter  
**State Management:** GetX  
**Architecture:** MVVM + Feature-First Modular  
**Payment Gateway:** SslCommerz  
**Error Tracking:** Firebase Crashlytics  
**Local Storage:** Shared Preferences  

---

## 📱 Screenshots

> Add your app screenshots here to showcase the UI

---

## 🌟 Show your support

Give a ⭐️ if this project helped you!

---
