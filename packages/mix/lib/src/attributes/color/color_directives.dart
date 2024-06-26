import 'package:flutter/widgets.dart';

import '../../internal/compare_mixin.dart';

@immutable
abstract class ColorDirective with EqualityMixin {
  const ColorDirective();

  Color modify(Color color);
}
