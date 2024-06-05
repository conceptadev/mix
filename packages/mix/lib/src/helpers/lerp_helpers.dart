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
  return ((1 - t) * (a ?? 0) + t * (b ?? 0)).round();
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
P? lerpSnap<P>(P? from, P? to, double t) {
  if (from == null) return to;
  if (to == null) return from;

  return t < 0.5 ? from : to;
}

TextStyle? lerpTextStyle(TextStyle? from, TextStyle? other, double t) {
  if (from == null && other == null) return null;
  if (from == null) return other;
  if (other == null) return from;

  return TextStyle(
    color: Color.lerp(from.color, other.color, t),
    backgroundColor: Color.lerp(from.backgroundColor, other.backgroundColor, t),
    fontSize: lerpDouble(from.fontSize, other.fontSize, t),
    fontWeight: FontWeight.lerp(from.fontWeight, other.fontWeight, t),
    fontStyle: t < 0.5 ? from.fontStyle : other.fontStyle,
    letterSpacing: lerpDouble(from.letterSpacing, other.letterSpacing, t),
    wordSpacing: lerpDouble(from.wordSpacing, other.wordSpacing, t),
    textBaseline: t < 0.5 ? from.textBaseline : other.textBaseline,
    height: lerpDouble(from.height, other.height, t),
    locale: t < 0.5 ? from.locale : other.locale,
    foreground: lerpSnap(from.foreground, other.foreground, t),
    background: lerpSnap(from.background, other.background, t),
    shadows: Shadow.lerpList(from.shadows, other.shadows, t),
    fontFeatures: t < 0.5 ? from.fontFeatures : other.fontFeatures,
    decoration: t < 0.5 ? from.decoration : other.decoration,
    decorationColor: Color.lerp(from.decorationColor, other.decorationColor, t),
    decorationStyle: t < 0.5 ? from.decorationStyle : other.decorationStyle,
    decorationThickness:
        lerpDouble(from.decorationThickness, other.decorationThickness, t),
    fontFamily: t < 0.5 ? from.fontFamily : other.fontFamily,
    fontFamilyFallback:
        t < 0.5 ? from.fontFamilyFallback : other.fontFamilyFallback,
  );
}

Matrix4? lerpMatrix4(Matrix4? from, Matrix4? other, double t) {
  return from != null && other != null
      ? Matrix4Tween(begin: from, end: other).lerp(t)
      : lerpSnap(from, other, t);
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
