import 'package:flutter/material.dart';

import '../attributes/alignment_geometry_attribute.dart';
import '../attributes/color_attribute.dart';
import '../attributes/container_attribute.dart';

ContainerAttributes backgroundColor(Color color) {
  return ContainerAttributes(color: BackgroundColorAttribute.from(color));
}

@Deprecated('Use backgroundColor(style:style) instead')
ContainerAttributes bgColor(Color color) {
  return ContainerAttributes(color: BackgroundColorAttribute.from(color));
}

@Deprecated('Use alignment instead')
ContainerAttributes align(AlignmentGeometry align) {
  return ContainerAttributes(alignment: AlignmentGeometryAttribute.from(align));
}
