import 'package:flutter/material.dart';

import '../attributes/alignment_geometry.attribute.dart';
import '../attributes/background_color.attribute.dart';
import '../attributes/container.attribute.dart';

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
