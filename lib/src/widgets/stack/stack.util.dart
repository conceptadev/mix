import 'package:flutter/widgets.dart';

import '../../attributes/alignment/alignment_geometry.attribute.dart';
import '../../attributes/enum/clip.attribute.dart';
import '../../attributes/stack/stack_fit.attribute.dart';
import '../../attributes/text/text_direction/text_direction.attribute.dart';
import 'stack.attributes.dart';

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
