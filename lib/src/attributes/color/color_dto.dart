import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../../theme/tokens/color_token.dart';

/// A Data transfer object that represents a [Color] value.
///
/// This DTO is used to resolve a [Color] value from a [MixData] instance.
///
/// See also:
/// * [ColorToken], which is used to resolve a [Color] value from a [MixData] instance.
/// * [ColorRef], which is used to reference a [Color] value from a [MixData] instance.
/// * [Color], which is the Flutter equivalent class.
/// {@category DTO}
@immutable
class ColorDto extends Dto<Color> with Mergeable<ColorDto> {
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
