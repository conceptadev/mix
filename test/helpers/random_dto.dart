// Used mostly for testing

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class RandomGenerator {
  const RandomGenerator._();

  static PaddingAttribute paddingAttribute() {
    final random = Random();

    return PaddingAttribute(
      top: random.nextDouble() * 100,
      bottom: random.nextDouble() * 100,
      left: random.nextDouble() * 100,
      right: random.nextDouble() * 100,
    );
  }

  static MarginAttribute marginAttribute() {
    final random = Random();

    return MarginAttribute(
      top: random.nextDouble() * 100,
      bottom: random.nextDouble() * 100,
      left: random.nextDouble() * 100,
      right: random.nextDouble() * 100,
    );
  }

  static BorderRadiusGeometryAttribute borderRadiusAttribute() {
    final random = Random();

    return BorderRadiusGeometryAttribute(
      topLeft: Radius.circular(random.nextDouble() * 20),
      topRight: Radius.circular(random.nextDouble() * 20),
      bottomLeft: Radius.circular(random.nextDouble() * 20),
      bottomRight: Radius.circular(random.nextDouble() * 20),
    );
  }

  static BoxBorderAttribute borderAttribute() {
    final side = borderSideAttribute();

    return BoxBorderAttribute(
      top: side,
      right: side,
      bottom: side,
      left: side,
    );
  }

  static ColorAttribute collorAttribute() {
    return ColorAttribute(
      Color.fromARGB(
        255,
        Random().nextInt(255),
        Random().nextInt(255),
        Random().nextInt(255),
      ),
    );
  }

  static BorderSideAttribute borderSideAttribute() {
    return BorderSideAttribute(
      color: collorAttribute(),
      width: Random().nextDouble() * 4,
      style: BorderStyle.values.random(),
    );
  }

  static ShadowAttribute shadowAttribute() {
    return ShadowAttribute(
      color: collorAttribute(),
      offset: Offset(
        Random().nextMaxDouble(10),
        Random().nextMaxDouble(10),
      ),
      blurRadius: Random().nextMaxDouble(10),
    );
  }

  static Alignment alignmentAttribute() {
    return Random().randomElement([
      Alignment.center,
      Alignment.centerLeft,
      Alignment.centerRight,
      Alignment.topCenter,
      Alignment.topLeft,
      Alignment.topRight,
      Alignment.bottomCenter,
      Alignment.bottomLeft,
      Alignment.bottomRight,
    ]);
  }

  static BoxShadowAttribute boxShadowAttribute() {
    // Use shadow as a starting point
    final shadow = shadowAttribute();

    return BoxShadowAttribute(
      color: shadow.color,
      offset: shadow.offset,
      blurRadius: shadow.blurRadius,
      spreadRadius: Random().nextMaxDouble(10),
    );
  }

  static TextStyleAttribute textStyleAttribute() {
    return TextStyleAttribute(
      color: collorAttribute(),
      backgroundColor: collorAttribute(),
      decorationColor: collorAttribute(),
      decorationStyle: TextDecorationStyle.values.random(),
      fontFamily: 'Roboto',
      fontSize: Random().nextDoubleInRange(12, 32),
      fontStyle: FontStyle.values.random(),
      fontWeight: FontWeight.values.random(),
      letterSpacing: Random().nextDoubleInRange(0, 2),
      wordSpacing: Random().nextDoubleInRange(0, 2),
      height: Random().nextDoubleInRange(0, 2),
      locale: const Locale('en', 'US'),
      shadows: [
        shadowAttribute(),
        shadowAttribute(),
        shadowAttribute(),
        shadowAttribute(),
      ],
      decoration: [
        TextDecoration.none,
        TextDecoration.underline,
        TextDecoration.lineThrough,
        TextDecoration.overline,
      ].random(),
    );
  }
}

extension RandomExt on Random {
  T randomElement<T>(List<T> list) {
    if (list.isEmpty) throw StateError('List is empty');

    return list[nextInt(list.length)];
  }

  T? randomElementOrNull<T>(List<T> list) {
    return list.isEmpty ? null : randomElement(list);
  }

  T randomElementOr<T>(List<T> list, T or) {
    return list.isEmpty ? or : randomElement(list);
  }

  double nextDoubleInRange(double min, double max) {
    return min + nextDouble() * (max - min);
  }

  int nextIntInRange(int min, int max) {
    return min + nextInt(max - min);
  }

  // Returns a double within the max value range.
  double nextMaxDouble(double max) {
    return nextDoubleInRange(0, max);
  }
}

extension ListRandomExt<T> on List<T> {
  T random() {
    return Random().randomElement(this);
  }
}
