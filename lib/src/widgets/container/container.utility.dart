import 'package:flutter/material.dart';

import './container.attributes.dart';
import '../../dtos/border/border.dto.dart';
import '../../dtos/color.dto.dart';
import '../../dtos/shadow/box_shadow.dto.dart';

class ContainerStyleUtilities {
  const ContainerStyleUtilities();

  StyledContainerAttributes backgroundColor(Color color) {
    return StyledContainerAttributes(color: ColorDto.from(color));
  }

  StyledContainerAttributes transform(Matrix4 transform) {
    return StyledContainerAttributes(transform: transform);
  }

  @Deprecated('Use backgroundColor(style:style) instead')
  StyledContainerAttributes bgColor(Color color) {
    return StyledContainerAttributes(color: ColorDto.from(color));
  }

  @Deprecated('Use alignment instead')
  StyledContainerAttributes align(AlignmentGeometry align) {
    return StyledContainerAttributes(alignment: align);
  }
}
