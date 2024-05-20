# web_viewproject

Sure, let's update the documentation for the WebView app and modify the code to use the `WebView` widget and its controller.

---

## Nutrahara Inc. WebView App Documentation

### Overview

The Nutrahara Inc. WebView App is a Flutter application designed to display the Nutrahara Inc. website (https://nutrahara.com/) within a web view. It includes basic navigation controls (back, forward, refresh) and implements error handling for situations where the website cannot be loaded.

### Features

- Display the Nutrahara Inc. website within a web view.
- Basic navigation controls (back, forward, refresh).
- Error handling for failed website loading.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Web View Project Documentation

## Project Overview
`web_viewproject` is a Flutter application designed to integrate web views into a Flutter app. This document serves as a guide to understanding the project structure, dependencies, and configurations.

## Project Structure

```plaintext
lib
├── Screen Widgets
│   ├── ErrorWidget.dart
│   └── WebViewStack.dart
├── screens
│   ├── SplashScreen.dart
│   └── WebViewScreen.dart
├── Ui
│   ├── network.dart
│   └── widgets.dart
└── main.dart
```

### Folders and Files
- **lib/Screen Widgets**: Contains widgets specific to the web view functionality, such as error handling and web view stack management.
  - `ErrorWidget.dart`: Widget to display error Screen.
  - `WebViewStack.dart`: Widget to handle the stack of web views.
  
- **lib/screens**: Contains screen components for the application.
  - `SplashScreen.dart`: The splash screen displayed at the start of the application.
  - `WebViewScreen.dart`: The screen that hosts the web view.
  
- **lib/Ui**: Contains UI components and network-related functionalities.
  - `network.dart`: Handles network-related operations to check connectivity.
  - `widgets.dart`: Custom widgets used throughout the application.
  
- **lib/main.dart**: The main entry point of the application.


## Dependencies

The project utilizes the following dependencies:

- **flutter:** The Flutter SDK.
- **cupertino_icons:** Provides Cupertino icons for iOS-style UI.
- **webview_flutter:** Enables the integration of webviews into the Flutter app.
- **lottie:** Facilitates the usage of Lottie animations in the app.
- **flutter_launcher_icons:** Simplifies the process of setting app icons for both Android and iOS platforms.
- **connectivity:** Allows monitoring network connectivity state.

## Development Dependencies

- **flutter_test:** Provides tools for testing Flutter applications.
- **flutter_lints:** Offers a set of recommended lints to encourage good coding practices.

## Assets

The project includes the following assets:

- **Images:**
  - `assets/images/logo.png`
  - `assets/images/logo-png.png`
  - `assets/animations/loading_anim.json`
  - `assets/animations/waiting_anim.json`
  - `assets/animations/waiting_anim.gif`

## Flutter Configuration

- **Uses Material Design:** Ensures that the Material Icons font is included with the application.
- **Assets:**
  - Configured assets for images and animations.

## Flutter Icons

- **Android:** Uses `launcher_icon` for the app icon.
- **iOS:** Configured for iOS app icons.
- **Image Path:** `"assets/images/logo.png"`

## Versioning

- **Version:** 1.0.0
- **Build Number:** 1

## Environment

- **SDK:** Flutter SDK version `>=3.3.4 <4.0.0`

## Publishing

The project is not intended for publication on pub.dev. The `publish_to` attribute is set to `'none'`.

Certainly! Here's a more detailed guide on how to use the WebViewProject:

---

## How to Use 

### 1. Installation

To use WebViewProject in your Flutter development environment, follow these steps:

1. Clone the project repository to your local machine:

    ```
    git clone <repository-url>
    ```

2. Ensure that Flutter is installed on your machine. If not, follow the [official Flutter installation instructions](https://flutter.dev/docs/get-started/install).

3. Open the project in your preferred IDE or text editor.

4. Run the following command in the terminal to fetch project dependencies:

    ```
    flutter pub get
    ```

### 2. Configuration

#### 2.1. Project Configuration

- Ensure that your `pubspec.yaml` file includes the necessary dependencies as specified in the project's documentation.

#### 2.2. Assets

- Make sure that the required assets, including images and animations, are located in the specified directories under `assets`.

#### 2.3. Icons

- Customize the app icons for Android and iOS platforms according to your preferences by replacing the existing icon files with your desired ones.

### 3. Major Dependencies

#### 3.1. WebView Integration

- To integrate webview functionality into your Flutter app, import the `webview_flutter` package and use the `WebView` widget to display web content.

```dart
import 'package:webview_flutter/webview_flutter.dart';

WebView(
  initialUrl: 'https://example.com',
)
```

#### 3.2. Lottie Animations

- Incorporate Lottie animations into your app by importing the `lottie` package and using the `Lottie.asset` widget to render animations.

```dart
import 'package:lottie/lottie.dart';

Lottie.asset('assets/animations/loading_anim.json')
```

#### 3.3. Network Connectivity

- Monitor network connectivity state using the `connectivity` package. You can check for network availability and react accordingly in your app.

```dart
import 'package:connectivity/connectivity.dart';

var connectivityResult = await Connectivity().checkConnectivity();
if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
  // Connected to the internet
} else {
  // No internet connection
}
```

### 4.  Usage
1. Run the app on an emulator or physical device.
2. The Nutrahara Inc. website will be displayed within the app's web view.
3. Use the navigation controls (back, forward, refresh) to interact with the website.
4. If the website fails to load, an error Screen will be be displayed.

### 5. **Run the application**:
   ```sh
   flutter run
   ```

### Building for Release
To build the application for release, use the following command:
```sh
flutter build apk --release
```
Or for iOS:
```sh
flutter build ios --release
```


## Additional Resources

For more information about Flutter and Dart:
- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)

For dependency-specific documentation:
- [webview_flutter](https://pub.dev/packages/webview_flutter)
- [lottie](https://pub.dev/packages/lottie)
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
- [connectivity](https://pub.dev/packages/connectivity)

By following this documentation, you should be able to understand, run, and develop further on the `web_viewproject` Flutter application.


## Outputs

<div class="image-grid">
  <img src="https://github.com/PrathameshMalavi/Nutrahara-task/assets/114830029/acd30397-baca-4678-b8f5-bf788977277c" alt="IMG_20240520_191609" />
  <img src="https://github.com/PrathameshMalavi/Nutrahara-task/assets/114830029/e9b87213-07c2-4557-a3c0-8d1955808947" alt="IMG_20240520_191616" />
  <img src="https://github.com/PrathameshMalavi/Nutrahara-task/assets/114830029/f332de22-12e0-4cf1-aee5-4cd5257a2509" alt="IMG_20240520_191635" />
  <img src="https://github.com/PrathameshMalavi/Nutrahara-task/assets/114830029/b521579b-9b36-4953-80c8-3e79aa778571" alt="IMG_20240520_191649" />
  <img src="https://github.com/PrathameshMalavi/Nutrahara-task/assets/114830029/a1383942-6701-4425-ad07-815d124b9ff7" alt="IMG_20240520_191705" />
  <img src="https://github.com/PrathameshMalavi/Nutrahara-task/assets/114830029/4de76469-529d-433f-86dc-c794bf548555" alt="IMG_20240520_191719" />
</div>

<style>
  .image-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    grid-gap: 10px;
    justify-items: center;
    align-items: center;
  }

  .image-grid img {
    max-width: 100%;
    height: auto;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }
</style>


## Contributing

Contributions to the project are welcome. If you encounter any issues or have suggestions for improvements, please feel free to submit a pull request or open an issue on the project's repository.


