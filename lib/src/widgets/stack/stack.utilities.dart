import 'package:flutter/widgets.dart';

import 'stack.attributes.dart';

class ZBoxUtility {
  const ZBoxUtility._();

  static StyledStackAttributes alignment(AlignmentGeometry alignment) {
    return StyledStackAttributes(alignment: alignment);
  }

  static StyledStackAttributes fit(StackFit fit) {
    return StyledStackAttributes(fit: fit);
  }

  static StyledStackAttributes clipBehavior(Clip clip) {
    return StyledStackAttributes(clipBehavior: clip);
  }
}
