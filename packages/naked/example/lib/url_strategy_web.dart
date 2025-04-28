// Web-specific URL handling
import 'dart:js' as js;

import 'package:flutter/foundation.dart';
import 'package:url_strategy/url_strategy.dart' as url_strategy;

import 'url_strategy.dart';

/// Implementation of UrlStrategy for web platforms
class WebUrlStrategy implements UrlStrategy {
  WebUrlStrategy._() {
    // Private constructor
  }

  static final WebUrlStrategy _instance = WebUrlStrategy._();

  /// Factory constructor that returns the singleton instance
  factory WebUrlStrategy() => _instance;

  @override
  void updateUrl(String url) {
    if (kIsWeb) {
      // Fix: Use correct JS interop approach to call window.history.replaceState
      try {
        // Access history from window object and call replaceState method
        js.context['history'].callMethod('replaceState', [null, '', url]);
      } catch (e) {
        // Handle the error gracefully
        debugPrint('Error updating URL: $e');
      }
    }
  }

  @override
  void initializeInstance() {
    // Use the url_strategy package to remove the hash from URLs
    url_strategy.setPathUrlStrategy();
  }

  /// Initialize the URL strategy for web platforms
  static void initialize() {
    // This is now just a wrapper around the instance method
    WebUrlStrategy().initializeInstance();
  }
}

/// Get the UrlStrategy implementation for web
UrlStrategy getUrlStrategy() => WebUrlStrategy();
