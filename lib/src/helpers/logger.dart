import 'package:flutter/foundation.dart';

class Logger {
  Logger(this.tag);

  final String tag;
  final Stopwatch stopwatch = Stopwatch();

  void start() {
    stopwatch.start();
  }

  void stop() {
    stopwatch.stop();
    debugPrint('$tag: ${stopwatch.elapsedMicroseconds} microseconds');
  }

  void debug(String message) {
    debugPrint('$tag: $message');
  }
}
