import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';
import '../theme/tokens/color_token.dart';
import '../utils/scalar_util.dart';

@immutable
class ColorDto extends Dto<Color> {
  final Color value;
  const ColorDto(this.value);

  static ColorDto? maybeFrom(Color? value) =>
      value == null ? null : ColorDto(value);

  @override
  Color resolve(MixData mix) {
    final colorRef = value;

    return colorRef is ColorRef ? mix.tokens.colorRef(colorRef) : colorRef;
  }

  @override
  ColorDto merge(covariant ColorDto? other) {
    return other == null ? this : ColorDto(other.value);
  }

  @override
  get props => [value];
}

@immutable
abstract class ColorAttribute<Self extends ColorAttribute<Self>>
    extends ResolvableAttribute<Self, Color> {
  final ColorDto value;
  const ColorAttribute(this.value);

  @override
  Color resolve(MixData mix) => value.resolve(mix);

  @override
  get props => [value];
}

@immutable
class BackgroundColorAttribute extends ColorAttribute<BackgroundColorAttribute>
    with SingleChildRenderAttributeMixin<ColoredBox> {
  const BackgroundColorAttribute(super.value);

  static BackgroundColorAttribute? maybeFrom(Color? value) =>
      value == null ? null : BackgroundColorAttribute(ColorDto(value));

  @override
  BackgroundColorAttribute merge(BackgroundColorAttribute? other) {
    return other == null ? this : BackgroundColorAttribute(other.value);
  }

  @override
  ColoredBox build(mix, child) {
    return ColoredBox(color: resolve(mix), child: child);
  }
}

@immutable
class ColorUtility<T> extends MixUtility<T, ColorDto> {
  const ColorUtility(super.builder);

  T call(Color color) => as(ColorDto(color));
}
