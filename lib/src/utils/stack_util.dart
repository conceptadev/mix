import 'package:flutter/widgets.dart';

import '../attributes/alignment_geometry_attribute.dart';
import '../attributes/value_attributes.dart';

@Deprecated('Use stack instead')
AlignmentAttribute zAligmnent(Alignment alignment) {
  return AlignmentAttribute(x: alignment.x, y: alignment.y);
}

@Deprecated('Use stack instead')
StackFitAttribute zFit(StackFit fit) {
  return StackFitAttribute(fit);
}

@Deprecated('Use stack instead')
ClipAttribute zClip(Clip clip) {
  return ClipAttribute(clip);
}
