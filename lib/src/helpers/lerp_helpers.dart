/// Linearly interpolates between two integers.
///
/// The [lerpInt] function takes two integers, [a] and [b], and a value [t]
/// between 0.0 and 1.0. It returns a new integer that is linearly interpolated
/// between [a] and [b] based on the value of [t].
///
/// Example usage:
/// ```dart
/// int a = 10;
/// int b = 20;
/// double t = 0.3;
/// int result = lerpInt(a, b, t);
/// print(result); // Output: 13
/// ```
int lerpInt(int a, int b, double t) {
  return ((1 - t) * a + t * b).round();
}

/// Snaps between two values based on a threshold.
///
/// The [lerpSnap] function takes two values, [from] and [to], and a threshold
/// value [t] between 0.0 and 1.0. If [t] is less than 0.5, it returns [from],
/// otherwise it returns [to].
///
/// Example usage:
/// ```dart
/// String from = 'Hello';
/// String to = 'World';
/// double t = 0.8;
/// String result = lerpSnap(from, to, t);
/// print(result); // Output: 'World'
/// ```
P lerpSnap<P>(P from, P to, double t) {
  return t < 0.5 ? from : to;
}
