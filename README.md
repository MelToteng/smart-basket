# SmartBasket

**SmartBasket** is a .NET MAUI mobile app that turns your device into a smart barcode scanner for managing shopping and budgeting lists. Whether you're in the store or planning ahead, simply scan product barcodes to add them to your list, get product details, and keep track of your total spending — all stored locally on your device.

---

## ✨ Features

- 📷 **Barcode Scanning**: Scan barcodes using your phone camera with the [`BarcodeScanning`](https://learn.microsoft.com/en-us/dotnet/maui/platform-integration/device/media-picker#barcodescanning) library.
- 🛒 **List Modes**: Choose between **Budget** or **Buy** mode to plan or track purchases.
- 💾 **Local Storage**: All lists are stored locally on the device for quick offline access.
- 💸 **Running Totals**: Instantly view the total cost of your scanned items.
- 🌍 **Product Lookup**: Automatically fetch item names and info using public APIs and a custom API for local products.
- 🤖 **Android First**: The current version targets Android; iOS support will be added later when available.
- 🧹 **Refactor In Progress**: Focus has been on functionality. MVVM and structural improvements are planned.

---

## 🚧 Work in Progress

This project began as a simple barcode scanning test. It’s now evolving into a fully-featured shopping assistant. Refactoring and additional features are ongoing.

---

## 🛠️ Tech Stack

- **.NET MAUI** (C#)
- **BarcodeScanning** library for barcode capture
- **HTTPClient** for external API calls
- Public and custom APIs for product lookup
- **Local device storage** for offline list management

---

## 📦 Installation

To run locally on Android:
1. Clone the repo:
   ```bash
   git clone https://github.com/MelToteng/smart-basket.git

