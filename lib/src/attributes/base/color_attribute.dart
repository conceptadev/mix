import 'package:flutter/widgets.dart';

import '../../core/dto/dtos.dart';
import '../../core/style_attribute.dart';

abstract class ColorAttribute
    extends ModifiableDtoAttribute<ColorAttribute, ColorDto, Color> {
  const ColorAttribute(super.value);
}
