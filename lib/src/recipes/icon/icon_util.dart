import 'package:flutter/material.dart';

import '../../attributes/color/color_dto.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../core/extensions/values_ext.dart';
import 'icon_attribute.dart';

const icon = IconUtility.selfBuilder;

class IconUtility<T> extends MixUtility<T, IconMixAttribute> {
  static const selfBuilder = IconUtility(MixUtility.selfBuilder);
  const IconUtility(super.builder);

  IconMixAttribute _color(ColorDto color) => IconMixAttribute(color: color);
  IconMixAttribute _size(double size) => IconMixAttribute(size: size);
  ColorUtility<IconMixAttribute> get color =>
      ColorUtility<IconMixAttribute>(_color);

  SizingUtility<IconMixAttribute> get size => SizingUtility(_size);

  IconMixAttribute call({double? size, Color? color}) {
    return IconMixAttribute(size: size, color: color?.toDto());
  }
}