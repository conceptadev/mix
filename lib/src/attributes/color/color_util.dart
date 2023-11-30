import 'package:flutter/material.dart';

import '../scalars/scalar_util.dart';
import 'color_dto.dart';

@immutable
class ColorUtility<T> extends DtoUtility<T, ColorDto, Color> {
  const ColorUtility(super.builder) : super(dtoBuilder: ColorDto.new);
}

@immutable
class ColorAttributeUtility<T> extends ColorUtility<T> {
  const ColorAttributeUtility(super.builder);

  T call(Color value) => builder(ColorDto(value));
}
