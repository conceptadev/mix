import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../core/dto.dart';
import '../../core/factory/mix_data.dart';
import '../../theme/tokens/color_token.dart';
import 'color_directives.dart';
import 'color_directives_impl.dart';

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
class ColorDto extends Dto<Color> with Diagnosticable {
  final Color? value;
  final List<ColorDirective> directives;

  const ColorDto.raw({this.value, this.directives = const []});
  const ColorDto(Color value) : this.raw(value: value);

  factory ColorDto.cleaner() => const _ColorDtoCleaner();

  ColorDto.directive(ColorDirective directive)
      : this.raw(directives: [directive]);

  @override
  Color resolve(MixData mix) {
    Color color = value ?? defaultValue;

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
    if (other == null) return this;
    if (other is _ColorDtoCleaner) return ColorDto.raw(value: value);

    return ColorDto.raw(
      value: other.value ?? value,
      directives: [...directives, ...other.directives],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    Color color = value ?? defaultValue;

    if (color is ColorRef) {
      properties.add(DiagnosticsProperty('token', color.token.name));
    }

    properties.add(ColorProperty('color', color));
  }

  @override
  Color get defaultValue => const Color(0x00000000);

  @override
  List<Object?> get props => [value, directives];
}

extension ColorExt on Color {
  ColorDto toDto() => ColorDto(this);
}

class _ColorDtoCleaner extends ColorDto {
  const _ColorDtoCleaner() : super.raw();
}
