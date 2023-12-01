import 'package:flutter/material.dart';

import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../core/extensions/values_ext.dart';
import 'icon_attribute.dart';

const icon = IconUtility.selfBuilder;

class IconUtility<T> extends MixUtility<T, IconMixAttribute> {
  static const selfBuilder = IconUtility(MixUtility.selfBuilder);
  const IconUtility(super.builder);

  ColorUtility<T> get color {
    return ColorUtility((color) => builder(IconMixAttribute(color: color)));
  }

  DoubleUtility<T> get size {
    return DoubleUtility((size) => builder(IconMixAttribute(size: size)));
  }

  IconMixAttribute call({double? size, Color? color}) {
    return IconMixAttribute(size: size, color: color?.toDto());
  }
}
