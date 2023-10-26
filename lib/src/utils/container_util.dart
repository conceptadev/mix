import 'package:flutter/material.dart';

import '../attributes/decoration_attribute.dart';
import '../core/dto/color_dto.dart';

BoxDecorationAttribute backgroundColor(Color color) {
  return BoxDecorationAttribute(color: ColorDto(color));
}

@Deprecated('Use backgroundColor(style:style) instead')
BoxDecorationAttribute bgColor(Color color) => backgroundColor(color);
