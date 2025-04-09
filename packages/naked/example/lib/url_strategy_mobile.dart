import 'url_strategy.dart';

/// Implementation of UrlStrategy for mobile platforms
class MobileUrlStrategy implements UrlStrategy {
  MobileUrlStrategy._() {
    // Private constructor
  }

  static final MobileUrlStrategy _instance = MobileUrlStrategy._();

  /// Factory constructor that returns the singleton instance
  factory MobileUrlStrategy() => _instance;

  @override
  void updateUrl(String url) {
    // No-op for mobile platforms as they don't have browser URLs
  }

  @override
  void initializeInstance() {
    // No-op initialization for mobile platforms
    // Do nothing as mobile platforms don't need URL strategy initialization
  }

  /// Initialize the URL strategy for mobile platforms
  static void initialize() {
    // This is now just a wrapper around the instance method
    MobileUrlStrategy().initializeInstance();
  }
}

/// Get the UrlStrategy implementation for mobile
UrlStrategy getUrlStrategy() => MobileUrlStrategy();
