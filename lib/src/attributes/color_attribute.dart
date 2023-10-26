import 'package:flutter/widgets.dart';

import '../core/dto/color_dto.dart';
import '../core/style_attribute.dart';

abstract class ColorAttribute
    extends DtoAttribute<ColorAttribute, ColorDto, Color> {
  const ColorAttribute(super.value);
}

class BackgroundColorAttribute extends ColorAttribute {
  const BackgroundColorAttribute(super.value);

  @override
  BackgroundColorAttribute create(value) => BackgroundColorAttribute(value);
}
