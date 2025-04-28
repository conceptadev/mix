# Headless Widgets Example App

A showcase application demonstrating the Headless Widgets library.

## Getting Started

This project demonstrates how to use the Headless Widgets library to create customizable UI components with separation of concerns between behavior and appearance.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Testing

### Running Integration Tests on macOS

To run the integration tests on macOS, follow these steps:

1. **Ensure macOS platform is supported**:
   ```bash
   flutter create --platforms=macos .
   ```

2. **Run the integration tests**:
   ```bash
   flutter test integration_test/app_navigation_test.dart -d macos
   ```

3. **Viewing test results**:
   - Integration tests will launch the application and perform automated UI testing
   - Test results will be displayed in the terminal
   - Any failures will be reported with details about the specific issue

### Debugging Integration Tests

If you encounter issues with integration tests:

1. **Run the app manually first**:
   ```bash
   flutter run -d macos
   ```

2. **Check for UI rendering issues** by navigating to all components manually

3. **Examine specific test failures** in the terminal output to pinpoint the failing widgets or navigation issues

4. **Update test expectations** if the UI structure has changed
