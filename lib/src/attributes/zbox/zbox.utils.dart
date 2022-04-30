import 'package:flutter/widgets.dart';

import 'zbox.attributes.dart';

class ZBoxUtils {
  const ZBoxUtils._();

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
