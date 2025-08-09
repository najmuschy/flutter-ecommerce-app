# 🛒 Crafty Bay

Crafty Bay is a modern Flutter-based e-commerce application built with **Feature-First Modular Architecture** and **GetX** for state management.  
It provides a clean, scalable structure for building multi-feature apps while keeping the code maintainable and organized.

---

## 📱 Features

- 🔑 User Authentication (Sign up, Login, OTP Verification)
- 🏠 Home with Carousel & Featured Products
- 🛍️ Product Listing with Categories
- 🛒 Cart Management
- ❤️ Wishlist
- 🛠️ Modular & Feature-based code organization
- 📡 API Integration with `http`
- 🔔 State Management & Navigation with **GetX**
- ☁️ Firebase integration for Crashlytics

---

## 🏗️ Architecture

This project follows a **Feature-First Modular Architecture** with an **MVC/MVVM flavor**, powered by **GetX**.

**Structure Overview:**

- **Features** – each major app feature is in its own folder with:
  - `data` → Models, data classes
  - `ui` → Screens, Widgets, and Controllers
- **Core** – reusable services and shared UI components
- **App** – global configs, themes, routes, and bindings

**Flow:**

