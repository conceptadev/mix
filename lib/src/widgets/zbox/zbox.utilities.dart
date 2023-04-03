import 'package:flutter/widgets.dart';

import 'zbox.attributes.dart';

class ZBoxUtility {
  const ZBoxUtility._();

  static ZBoxAttributes alignment(AlignmentGeometry alignment) {
    return ZBoxAttributes(alignment: alignment);
  }

  static ZBoxAttributes fit(StackFit fit) {
    return ZBoxAttributes(fit: fit);
  }

  static ZBoxAttributes clipBehavior(Clip clip) {
    return ZBoxAttributes(clipBehavior: clip);
  }
}
