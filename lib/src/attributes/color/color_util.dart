import 'package:flutter/material.dart';

import '../scalars/scalar_util.dart';
import 'color_attribute.dart';

@immutable
class ColorUtility<T> extends MixUtility<T, ColorDto> {
  const ColorUtility(super.builder);

  T call(Color color) => as(ColorDto(color));
}
