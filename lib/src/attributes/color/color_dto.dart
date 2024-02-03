import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../../theme/tokens/color_token.dart';
import 'color_directives.dart';

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
  final Color? value;
  final List<ColorDirective> directives;

  const ColorDto.raw({this.value, this.directives = const []});

  const ColorDto(Color value) : this.raw(value: value);

  ColorDto.directive(ColorDirective directive) : this.raw(directives: [directive]);

  static ColorDto? maybeFrom(Color? value) => value == null ? null : ColorDto(value);

  @override
  Color resolve(MixData mix) {
    Color color = value ?? Colors.transparent;

    if (color is ColorRef) {
      color = mix.tokens.colorRef(color);
    }

    for (final directive in directives) {
      color = directive.modify(color);
    }

    return color;
  }

  @override
  ColorDto merge(ColorDto? other) {
    return other == null
        ? this
        : ColorDto.raw(
            value: other.value ?? value,
            directives: [...directives, ...other.directives],
          );
  }

  @override
  List<Object?> get props => [value, directives];
}
