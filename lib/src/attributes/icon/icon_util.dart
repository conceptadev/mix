import 'package:flutter/material.dart';

import '../../helpers/extensions/values_ext.dart';
import '../../utils/scalar_util.dart';
import '../color_attribute.dart';
import 'icon_attribute.dart';

const icon = IconUtility();

class IconUtility extends MixUtility<IconAttribute, IconDto> {
  const IconUtility() : super(IconAttribute.new);

  ColorUtility<IconAttribute> get color => ColorUtility<IconAttribute>(_color);

  IconAttribute size(double size) => call(size: size);

  IconAttribute call({double? size, Color? color}) {
    final icon = IconDto(size: size, color: color?.toDto());

    return builder(icon);
  }

  IconAttribute _color(Color color) => call(color: color);
}
