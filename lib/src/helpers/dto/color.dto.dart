import 'dart:math';

import 'package:flutter/material.dart';

import '../../theme/refs/color_token.dart';
import 'dto.dart';

class ColorDto extends Dto<Color> {
  final Color value;

  const ColorDto(this.value);

  const ColorDto.from(Color color) : value = color;

  // Helper utility for internal API usage
  static ColorDto? maybeFrom(Color? token) {
    if (token == null) {
      return null;
    }

    return ColorDto.from(token);
  }

  @override
  Color resolve(BuildContext context) {
    final resolvedColor = value;

    if (resolvedColor is ColorToken) {
      return resolvedColor.resolve(context);
    }

    return value;
  }

  // Used mostly for testing
  factory ColorDto.random() {
    return ColorDto(
      Color.fromARGB(
        255,
        Random().nextInt(255),
        Random().nextInt(255),
        Random().nextInt(255),
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColorDto && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'ColorDto(value: $value)';
}
