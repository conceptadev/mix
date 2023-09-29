import 'package:flutter/foundation.dart';

class Logger {
  final String tag;
  final stopwatch = Stopwatch();

  Logger(this.tag);

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
