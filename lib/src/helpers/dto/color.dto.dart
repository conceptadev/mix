import 'package:flutter/material.dart';

import '../../theme/refs/color_token.dart';
import 'dto.dart';

class ColorDto extends Dto<Color> {
  final Color value;

  const ColorDto(this.value);

  @override
  Color resolve(BuildContext context) {
    final resolvedColor = value;

    if (resolvedColor is ColorToken) {
      return resolvedColor.resolve(context);
    }

    return value;
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
