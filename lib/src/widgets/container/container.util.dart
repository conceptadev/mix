import 'package:flutter/material.dart';

import '../../attributes/alignment/alignment_geometry.attribute.dart';
import '../../attributes/color/background_color.attribute.dart';
import '../../attributes/matrix4/matrix4.attribute.dart';
import 'container.attribute.dart';

ContainerAttributes backgroundColor(Color color) {
  return ContainerAttributes(color: BackgroundColorAttribute(color));
}

Matrix4Attribute transform(Matrix4 transform) {
  return Matrix4Attribute(transform);
}

@Deprecated('Use backgroundColor(style:style) instead')
ContainerAttributes bgColor(Color color) {
  return ContainerAttributes(color: BackgroundColorAttribute(color));
}

@Deprecated('Use alignment instead')
ContainerAttributes align(AlignmentGeometry align) {
  return ContainerAttributes(alignment: AlignmentGeometryAttribute.from(align));
}
