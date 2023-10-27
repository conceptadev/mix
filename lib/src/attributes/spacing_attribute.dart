import 'package:flutter/material.dart';

import '../core/dto/dtos.dart';
import '../core/style_attribute.dart';

abstract class SpacingAttribute<T extends SpacingAttribute<T>>
    extends DtoAttribute<T, SpacingGeometryDto, EdgeInsetsGeometry> {
  const SpacingAttribute(super.value);
}
