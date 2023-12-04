import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import 'strut_style_dto.dart';

@immutable
class StrutStyleAttribute
    extends DtoAttribute<StrutStyleAttribute, StrutStyleDto, StrutStyle> {
  const StrutStyleAttribute(super.value);

  @override
  StrutStyleAttribute merge(StrutStyleAttribute? other) {
    return StrutStyleAttribute(value.merge(other?.value));
  }
}
