import 'package:flutter/material.dart';

import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../core/attribute.dart';
import '../../core/extensions/values_ext.dart';
import 'icon_attribute.dart';

const icon = IconUtility.selfBuilder;

class IconUtility<T extends StyleAttribute>
    extends MixUtility<T, IconSpecAttribute> {
  static const selfBuilder = IconUtility(MixUtility.selfBuilder);
  const IconUtility(super.builder);

  ColorUtility<T> get color {
    return ColorUtility((color) => builder(IconSpecAttribute(color: color)));
  }

  T size(double size) {
    return builder(IconSpecAttribute(size: size));
  }

  IconSpecAttribute call({double? size, Color? color}) {
    return IconSpecAttribute(size: size, color: color?.toDto());
  }
}
