import 'package:flutter/material.dart';

import '../../attributes/color/color_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../core/extensions/values_ext.dart';
import 'icon_attribute.dart';

const icon = IconUtility();

class IconUtility extends SpecUtility<IconSpecAttribute> {
  const IconUtility();

  ColorUtility<IconSpecAttribute> get color {
    return ColorUtility((color) => IconSpecAttribute(color: color));
  }

  IconSpecAttribute size(double size) {
    return call(size: size);
  }

  IconSpecAttribute call({double? size, Color? color}) {
    return IconSpecAttribute(size: size, color: color?.toDto());
  }
}
