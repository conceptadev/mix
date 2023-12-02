import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../scalars/scalar_util.dart';
import 'color_dto.dart';

@immutable
class ColorUtility<T extends StyleAttribute>
    extends DtoUtility<T, ColorDto, Color>
    with CallableDtoUtilityMixin<T, ColorDto, Color> {
  const ColorUtility(super.builder) : super(valueToDto: ColorDto.new);
}

@immutable
class ColorAttributeUtility<T extends StyleAttribute> extends ColorUtility<T> {
  const ColorAttributeUtility(super.builder);
}
