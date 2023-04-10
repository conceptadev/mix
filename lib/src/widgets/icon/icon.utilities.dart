import 'package:flutter/material.dart';

import '../../dtos/color.dto.dart';
import 'icon.attributes.dart';

class IconUtility {
  const IconUtility._();

  static StyledIconAttributes icon({double? size, Color? color}) {
    return StyledIconAttributes(
      size: size,
      color: color != null ? ColorDto(color) : null,
    );
  }

  static StyledIconAttributes iconSize(double size) {
    return StyledIconAttributes(
      size: size,
    );
  }

  static StyledIconAttributes iconColor(Color color) {
    return StyledIconAttributes(
      color: ColorDto(color),
    );
  }
}
