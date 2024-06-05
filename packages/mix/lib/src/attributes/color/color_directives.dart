import 'package:flutter/material.dart';

import '../../helpers/compare_mixin.dart';

@immutable
abstract class ColorDirective with EqualityMixin {
  const ColorDirective();

  Color modify(Color color);
}
