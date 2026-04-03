# RentEase 🏢

A modern, cross-platform **SaaS property management application** built with Flutter. RentEase simplifies property management, tenant coordination, rent tracking, and financial reporting with an intuitive and powerful interface.

[![Flutter](https://img.shields.io/badge/Flutter-3.4+-blue.svg)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Platform: Multi-platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android%20%7C%20Web%20%7C%20Windows%20%7C%20macOS%20%7C%20Linux-brightgreen)](https://flutter.dev)

## 📋 Features

### Core Functionality
- **🔐 Authentication**: Secure user authentication with Firebase Auth
- **🏠 Property Management**: Add, edit, and manage multiple properties
- **👥 Tenant Management**: Keep track of tenants, contacts, and lease details
- **💰 Rent & Billing**: Track rent payments, manage billing cycles, and generate invoices
- **⚡ Utilities Tracking**: Monitor and track electricity consumption and bills
- **📊 Dashboard**: Real-time overview of property metrics and financial data
- **📈 Reports**: Generate comprehensive property management reports (PDF export)
- **🔔 Notifications**: Stay updated with push notifications for important events
- **📱 Responsive Design**: Optimized for mobile, tablet, and desktop screens

### Technical Features
- **💾 Cloud Storage**: Firebase Cloud Storage for document management
- **🗄️ Real-time Database**: Firestore for scalable data synchronization
- **🎯 State Management**: Riverpod for efficient and reactive state handling
- **🗺️ Navigation**: GoRouter for type-safe and declarative routing
- **🎨 Modern UI**: Material Design 3 with custom theming
- **📱 Multi-platform**: Native support for iOS, Android, Web, Windows, macOS, and Linux
- **🔐 Secure Storage**: Flutter Secure Storage for sensitive data
- **📊 Charts & Analytics**: FL Charts for data visualization
- **🖼️ Image Management**: Image picker and cached network images

## 🛠️ Tech Stack

### Frontend
- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [Riverpod](https://riverpod.dev)
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router)
- **UI Kit**: Material Design 3, [Google Fonts](https://fonts.google.com/), [Flutter SVG](https://pub.dev/packages/flutter_svg)

### Backend & Services
- **Backend-as-a-Service**: [Firebase](https://firebase.google.com/)
  - Authentication
  - Cloud Firestore
  - Cloud Storage
  - Cloud Messaging
- **Local Storage**: Flutter Secure Storage, Shared Preferences

### Code Generation & Build
- **Code Generation**: Freezed, JSON Serializable, Riverpod Generator
- **Build Tools**: Build Runner
- **Linting**: Flutter Lints

### Additional Libraries
- **Utilities**: Dartz (Functional Programming), Equatable, UUID, Intl
- **Export & Sharing**: PDF generation, Printing, Share Plus
- **Notifications**: Flutter Local Notifications
- **Image Handling**: Image Picker, Cached Network Image

## 📦 Project Structure

```
lib/
├── main.dart                 # App entry point
├── app.dart                  # Root app widget configuration
├── firebase_options.dart     # Firebase configuration
├── core/                     # Core application layer
│   ├── constants/            # App-wide constants
│   ├── errors/               # Error handling
│   ├── extensions/           # Dart extensions
│   ├── providers/            # Global Riverpod providers
│   ├── router/               # GoRouter configuration
│   ├── services/             # Business logic services
│   ├── theme/                # App theming
│   └── utils/                # Utility functions
├── features/                 # Feature modules (MVVM/Clean Architecture)
│   ├── auth/                 # Authentication feature
│   ├── dashboard/            # Dashboard feature
│   ├── properties/           # Property management
│   ├── buildings/            # Building management
│   ├── tenants/              # Tenant management
│   ├── rent/                 # Rent tracking & billing
│   ├── electricity/          # Utility billing
│   ├── reports/              # Reporting & exports
│   ├── owner_settings/       # Owner profile & settings
│   └── onboarding/           # User onboarding flow
└── shared/                   # Shared widgets & utilities
    ├── widgets/              # Reusable UI components
    ├── models/               # Shared data models
    └── resources/            # Assets & resources
```

## 🚀 Getting Started

### Prerequisites
- **Flutter SDK**: 3.4.0 or higher
- **Dart SDK**: 3.4.0 or higher
- **Firebase Project**: Set up a Firebase project and download configuration files

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/rentease.git
   cd rentease
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Configure Firebase**
   - For Android: Copy `google-services.json` to `android/app/`
   - For iOS: Follow Firebase iOS setup guide
   - For Web: Update `web/index.html` with Firebase config
   - Update `lib/firebase_options.dart` with your Firebase credentials

5. **Run the application**
   ```bash
   flutter run
   ```

## 📱 Platform Support

| Platform | Status | Notes |
|----------|--------|-------|
| **iOS** | ✅ Supported | iOS 12.0+ |
| **Android** | ✅ Supported | Android 5.0+ |
| **Web** | ✅ Supported | Chrome, Firefox, Safari |
| **Windows** | ✅ Supported | Windows 10+ |
| **macOS** | ✅ Supported | macOS 10.14+ |
| **Linux** | ✅ Supported | Ubuntu 20.04+ |

## 🏗️ Architecture

RentEase follows **Clean Architecture** principles with:

- **Presentation Layer**: UI & State Management (Riverpod)
- **Domain Layer**: Business Logic & Use Cases
- **Data Layer**: Repositories, Data Sources, Models

Features are organized as independent modules with their own presentation, domain, and data layers, promoting scalability and maintainability.

## 🔧 Development Workflow

### Code Generation
Automatic code generation is setup for:
- **Freezed**: Immutable data classes
- **Riverpod Generator**: Type-safe providers
- **JSON Serializable**: JSON serialization/deserialization

```bash
# Watch mode for continuous generation
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Running Tests
```bash
flutter test
```

### Build Release
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# Windows
flutter build windows --release

# macOS
flutter build macos --release

# Linux
flutter build linux --release
```

## 📋 Documentation

- [Flutter Documentation](https://docs.flutter.dev)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Riverpod Documentation](https://riverpod.dev)
- [GoRouter Documentation](https://pub.dev/packages/go_router/documentation)

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Development Guidelines
- Follow Dart & Flutter best practices
- Use meaningful commit messages
- Add tests for new features
- Ensure code passes linting: `flutter analyze`
- Format code: `dart format .`

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**RentEase Development Team**

- GitHub: [@yourusername](https://github.com/prajwalsde)

## 🗺️ Roadmap

- [ ] Advanced analytics dashboard
- [ ] Tenant communication portal
- [ ] Automated rent reminders
- [ ] Integration with payment gateways
- [ ] Mobile app push notifications enhancement
- [ ] Multi-language support
- [ ] Dark mode support
- [ ] Offline mode capabilities

## ⚠️ Known Issues

Currently, there are no known critical issues. Please report bugs using the [GitHub Issues](https://github.com/yourusername/rentease/issues) page.

## 📞 Support

For support, please:
- Open an issue on [GitHub Issues](https://github.com/yourusername/rentease/issues)
- Check [Discussions](https://github.com/yourusername/rentease/discussions) for Q&A

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for reliable backend services
- All contributors and community members
- Open-source libraries used in this project

---

**Made with ❤️ by the RentEase Team**
