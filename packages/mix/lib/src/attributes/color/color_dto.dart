import 'package:flutter/material.dart';

import '../../core/dto.dart';
import '../../core/factory/mix_data.dart';
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
class ColorDto extends Dto<Color> {
  final Color? value;
  final List<ColorDirective> directives;

  const ColorDto.raw({this.value, this.directives = const []});

  const ColorDto(Color value) : this.raw(value: value);

  ColorDto.directive(ColorDirective directive)
      : this.raw(directives: [directive]);

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
  Color get defaultValue => Colors.transparent;

  @override
  List<Object?> get props => [value, directives];
}

extension ColorExt on Color {
  ColorDto toDto() => ColorDto(this);
}
