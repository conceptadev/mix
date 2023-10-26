import 'package:flutter/material.dart';

import '../attributes/color_attribute.dart';
import '../core/dto/double_dto.dart';
import '../core/style_attribute.dart';

class IconColorAttribute extends ColorAttribute {
  const IconColorAttribute(super.color);

  @override
  IconColorAttribute create(value) => IconColorAttribute(value);
}

class IconSizeAttribute extends DoubleAttribute {
  const IconSizeAttribute(super.value);

  @override
  IconSizeAttribute create(value) => IconSizeAttribute(value);
}

class IconDataAttribute extends ValueAttribute<IconDataAttribute, IconData> {
  const IconDataAttribute(super.value);

  @override
  IconDataAttribute create(value) => IconDataAttribute(value);
}
