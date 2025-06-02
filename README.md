# ProUI

A lightweight SwiftUI component library for reusable and stylish buttons, including primary, outlined, and floating action buttons.

## ✨ Features

- **PrimaryButton** — Filled capsule button with customizable colors.
- **OutlinedButton** — Capsule-shaped bordered button with optional customization.
- **SquareButtons** — Square-cornered versions for more compact or alternative UI styles.
- **FloatingActionButton** — A customizable FAB with text or SF Symbol support.
- **OutlinedTextField** - A customizable Text Field with supporting text and/or SF Symbol support.
- **OutlinedDropDown**

## 📦 Installation

Add this package via Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/amrOmran89/ProUI.git", from: "1.0.0")
]
```

## 🛠️ How to use it

```swift
PrimaryButton(
    "Continue",
    color: .black,
    textColor: .white,
    font: .headline,
    maxWidth: .infinity
) {
    // Handle tap
}
```
<img src="./Simulator Screenshot - iPhone 16 Pro - 2025-05-31 at 22.32.15.png" alt="Screenshot" width="200" />

