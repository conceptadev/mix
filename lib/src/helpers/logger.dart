class Logger {
  Logger(this.tag);

  final String tag;
  final Stopwatch stopwatch = Stopwatch();

  void start() {
    stopwatch.start();
  }

  void stop() {
    stopwatch.stop();
    print('$tag: ${stopwatch.elapsedMicroseconds} microseconds');
  }

  void debug(String message) {
    print('$tag: $message');
  }
}
