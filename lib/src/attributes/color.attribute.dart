import 'package:flutter/widgets.dart';

import '../core/dto/color.dto.dart';
import '../factory/mix_provider_data.dart';
import 'style_attribute.dart';

class ColorAttribute extends StyleAttribute<Color> {
  final ColorDto color;
  const ColorAttribute(this.color);

  factory ColorAttribute.from(Color color) {
    return ColorAttribute(ColorDto(color));
  }

  @override
  ColorAttribute merge(ColorAttribute? other) {
    return ColorAttribute(color.merge(other?.color));
  }

  @override
  Color resolve(MixData mix) => color.resolve(mix);

  @override
  get props => [color];
}
