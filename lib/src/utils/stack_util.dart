import 'package:flutter/widgets.dart';

import '../attributes/alignment_geometry_attribute.dart';
import '../attributes/clip_attribute.dart';
import '../attributes/stack_attribute.dart';
import '../attributes/stack_fit_attribute.dart';
import '../attributes/text_direction_attribute.dart';

StackAttributes stack({
  AlignmentGeometryAttribute? alignment,
  StackFitAttribute? fit,
  TextDirectionAttribute? textDirection,
  ClipAttribute? clipBehavior,
}) {
  return StackAttributes(
    alignment: alignment,
    fit: fit,
    textDirection: textDirection,
    clipBehavior: clipBehavior,
  );
}

@Deprecated('Use stack instead')
StackAttributes zAligmnent(Alignment alignment) {
  return StackAttributes(alignment: AlignmentGeometryAttribute.from(alignment));
}

@Deprecated('Use stack instead')
StackAttributes zFit(StackFit fit) {
  return StackAttributes(fit: StackFitAttribute(fit));
}

@Deprecated('Use stack instead')
StackAttributes zClip(Clip clip) {
  return StackAttributes(clipBehavior: ClipAttribute(clip));
}
