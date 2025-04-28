// This file handles URL updates with platform-specific code

// Import implementation based on platform
// The if/else is evaluated at compile time based on dart:html availability
import 'package:flutter/foundation.dart';

// Conditionally import web or mobile implementation
// ignore: uri_does_not_exist
import 'url_strategy_web.dart' if (dart.library.io) 'url_strategy_mobile.dart';

/// Abstract interface for URL strategy.
///
/// This allows platform-specific URL handling with a unified interface.
abstract class UrlStrategy {
  /// Updates the URL in the browser address bar without triggering navigation.
  ///
  /// On non-web platforms, this is a no-op.
  void updateUrl(String url);

  /// Initialize this URL strategy instance.
  void initializeInstance();

  /// Initialize the URL strategy for the current platform.
  ///
  /// This should be called early in the app initialization process,
  /// typically before runApp().
  static void initialize() {
    if (kIsWeb) {
      // Web initialization is handled in the web-specific implementation
      getUrlStrategy().initializeInstance();
    } else {
      // Mobile initialization is handled in the mobile-specific implementation
      getUrlStrategy().initializeInstance();
    }
  }
}

/// Updates the URL in the browser address bar without triggering navigation.
///
/// On non-web platforms, this is a no-op.
void updateUrl(String url) {
  getUrlStrategy().updateUrl(url);
}
