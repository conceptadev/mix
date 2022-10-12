import 'package:flutter/widgets.dart';

import 'zbox.attributes.dart';

/// ## Widget:
/// - [ZBox](ZBox-class.html)
///
/// Utility functions and short utils are listed in [Static Methods](#static-methods)
///
/// {@category Utilities}
///
class ZBoxUtility {
  const ZBoxUtility._();

  /// Short Utils: zAlignment
  static ZBoxAttributes alignment(AlignmentGeometry alignment) {
    return ZBoxAttributes(alignment: alignment);
  }

  /// Short Utils: zFit
  static ZBoxAttributes fit(StackFit fit) {
    return ZBoxAttributes(fit: fit);
  }

  /// Short Utils: zClip
  static ZBoxAttributes clipBehavior(Clip clip) {
    return ZBoxAttributes(clipBehavior: clip);
  }
}
