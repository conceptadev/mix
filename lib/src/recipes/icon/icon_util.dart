import 'package:flutter/material.dart';

import '../../attributes/color_attribute.dart';
import '../../core/extensions/values_ext.dart';
import 'icon_attribute.dart';

const icon = IconUtility();

class IconUtility {
  const IconUtility();

  IconMixAttribute _color(ColorAttribute color) =>
      IconMixAttribute(color: color);
  ColorUtility<IconMixAttribute> get color =>
      ColorUtility<IconMixAttribute>(_color);

  IconMixAttribute size(double size) => call(size: size);

  IconMixAttribute call({double? size, Color? color}) {
    return IconMixAttribute(size: size, color: color?.toAttribute());
  }
}
