import 'dart:ui';

import 'package:flutter/material.dart';

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
int lerpInt(int? a, int? b, double t) {
  if (a == null && b == null) return 0;
  if (a == null) return b!.round();
  if (b == null) return a.round();

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

/// Linearly interpolates between two [StrutStyle] objects.
///
/// The [lerpStrutStyle] function takes two [StrutStyle] objects, [a] and [b],
/// and a value [t] between 0.0 and 1.0. It returns a new [StrutStyle] object
/// that is linearly interpolated between [a] and [b] based on the value of [t].
///
/// Example usage:
///
/// ```dart
/// StrutStyle a = StrutStyle(
///   fontFamily: 'Roboto',
///   fontSize: 16,
/// );
///
/// StrutStyle b = StrutStyle(
///   fontFamily: 'Roboto',
///   fontSize: 24,
/// );
///
/// double t = 0.5;
///
/// StrutStyle result = lerpStrutStyle(a, b, t);
///
/// print(result.fontSize); // Output: 20
/// ```
StrutStyle? lerpStrutStyle(StrutStyle? a, StrutStyle? b, double t) {
  if (a == null && b == null) return null;
  if (a == null) return b;
  if (b == null) return a;

  return StrutStyle(
    fontFamily: t < 0.5 ? a.fontFamily : b.fontFamily,
    fontFamilyFallback: t < 0.5 ? a.fontFamilyFallback : b.fontFamilyFallback,
    fontSize: lerpDouble(a.fontSize, b.fontSize, t),
    height: lerpDouble(a.height, b.height, t),
    leading: lerpDouble(a.leading, b.leading, t),
    fontWeight: FontWeight.lerp(a.fontWeight, b.fontWeight, t),
    fontStyle: t < 0.5 ? a.fontStyle : b.fontStyle,
    forceStrutHeight: t < 0.5 ? a.forceStrutHeight : b.forceStrutHeight,
  );
}
