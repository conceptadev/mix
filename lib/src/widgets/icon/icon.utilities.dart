import 'package:flutter/material.dart';

import '../../dtos/color.dto.dart';
import 'icon.attributes.dart';

class IconUtility {
  const IconUtility._();

  static StyledIconAttributes icon({Color? color, double? size}) {
    return StyledIconAttributes(
      color: color != null ? ColorDto(color) : null,
      size: size,
    );
  }

  static StyledIconAttributes iconSize(double size) {
    return StyledIconAttributes(size: size);
  }

  static StyledIconAttributes iconColor(Color color) {
    return StyledIconAttributes(color: ColorDto(color));
  }
}
