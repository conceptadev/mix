import 'package:flutter/widgets.dart';

import '../core/dto/color.dto.dart';
import 'color.attribute.dart';

class BackgroundColorAttribute extends ColorAttribute {
  const BackgroundColorAttribute(super.color);

  factory BackgroundColorAttribute.from(Color color) {
    return BackgroundColorAttribute(ColorDto(color));
  }

  @override
  BackgroundColorAttribute merge(BackgroundColorAttribute? other) {
    return BackgroundColorAttribute(color.merge(other?.color));
  }
}
