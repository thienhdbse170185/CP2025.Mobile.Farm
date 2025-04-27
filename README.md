# CP2025 Mobile Farm

A cross-platform Flutter application for farm staff to manage daily tasks and monitor operations at Ut Thoi’s Farm.

## Table of Contents

- [About](#about)
- [Features](#features)
- [Architecture & Folder Structure](#architecture--folder-structure)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the App](#running-the-app)
- [Configuration](#configuration)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

---

## About

This is a **Flutter**-based mobile application designed to help staff at Ut Thoi’s Farm:

- View and update assigned tasks (e.g., feeding, medication, cleaning).
- Scan QR codes on chicken coops to fetch task details.
- Receive real-time push notifications for new or overdue tasks.
- Report and track health symptoms in livestock.
- Access localized UI in multiple languages.

## Features

- **Task Management**: List, detail view, status updates.
- **QR Code Scanning**: Quickly load tasks per coop.
- **Push Notifications**: Via Firebase Cloud Messaging (FCM).
- **Authentication**: JSON Web Token (JWT)-based login.
- **Offline Support**: Cache recent tasks for unstable connectivity.
- **Localization**: ARB-based translations under `lib/src/localization`.
- **Theming**: Centralized color, typography, and styling under `lib/src/core/theme`.

## Architecture & Folder Structure

```text
lib
├── api_endpoints.dart       # REST API URL definitions
├── environment.dart         # Build-time environment constants
├── main.dart                # App entry point
└── src
    ├── core/                # Shared utilities & configuration
    │   ├── common/          # Reusable widgets & helpers
    │   ├── constants/       # App-wide constants
    │   ├── data/            # Data models & repositories
    │   ├── network/         # HTTP client & interceptors
    │   ├── service/         # Firebase, Auth, Messaging services
    │   ├── theme/           # App theming & styles
    │   └── utils/           # Helper functions (e.g., date formatting)
    ├── localization/        # .arb files & localization delegates
    ├── model/               # Dart data classes
    ├── view/                # UI screens & widgets
    └── viewmodel/           # MVVM viewmodels / BLoC controllers
```

## Tech Stack

- **Flutter & Dart**  
- **State Management**: MVVM + BLoC pattern  
- **Backend**: REST API (configured in `api_endpoints.dart`)  
- **Authentication**: JWT tokens  
- **Database**: Firebase Firestore  
- **Notifications**: Firebase Cloud Messaging  
- **QR Code**: `qr_code_scanner` package  
- **Localization**: ARB files (via `l10n.yaml`)  

## Getting Started

### Prerequisites

- Flutter SDK ≥ 3.0  
- Android Studio or Xcode (for iOS builds)  
- A Firebase project with Firestore & FCM enabled  
- Device or emulator (Android/iOS)

### Installation

1. **Clone the repo**  
   ```bash
   git clone https://github.com/thienhdbse170185/CP2025.Mobile.Farm.git
   cd CP2025.Mobile.Farm
   ```

2. **Fetch packages**  
   ```bash
   flutter pub get
   ```

3. **Set up Firebase**  
   - Place `google-services.json` under `android/app/`  
   - Place `GoogleService-Info.plist` under `ios/Runner/`  
   - Update `environment.dart` with your Firebase project settings.

### Running the App

- **Android**  
  ```bash
  flutter run -d emulator-5554
  ```
- **iOS**  
  ```bash
  flutter run -d <your-iOS-device-ID>
  ```

## Configuration

- **API Base URL**: `environment.dart`  
- **Route Definitions**: `lib/src/core/router.dart`  
- **Localization Files**: `lib/src/localization/*.arb`  

## Testing

Unit and widget tests are located under the `/test` directory. Run all tests with:

```bash
flutter test
```

## Contributing

1. Fork the repo  
2. Create a feature branch (`git checkout -b feature/NewFeature`)  
3. Commit your changes (`git commit -m 'Add new feature'`)  
4. Push to the branch (`git push origin feature/NewFeature`)  
5. Open a Pull Request  

## License

This project is released under the [MIT License](LICENSE).

