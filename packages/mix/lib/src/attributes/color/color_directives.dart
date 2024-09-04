import 'package:flutter/widgets.dart';

import '../../internal/compare_mixin.dart';

@immutable
abstract class ColorDirective with EqualityMixin {
  const ColorDirective();

  Color modify(Color color);
}

@immutable
abstract class NumberBasedColorDirective<T extends num> extends ColorDirective {
  final T value;

  const NumberBasedColorDirective(this.value);

  @override
  get props => [value];
}

@immutable
abstract class HSLColorDirective extends NumberBasedColorDirective<double> {
  const HSLColorDirective(super.value);

  HSLColor transformer(HSLColor color, double value);

  @override
  Color modify(Color color) =>
      transformer(HSLColor.fromColor(color), value).toColor();
}
