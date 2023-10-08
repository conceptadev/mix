import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../base/color.dto.dart';
import '../style_attribute.dart';

class BackgroundColorAttribute extends StyleAttribute<Color> {
  final ColorDto color;
  const BackgroundColorAttribute(this.color);

  factory BackgroundColorAttribute.from(Color color) {
    return BackgroundColorAttribute(ColorDto(color));
  }

  @override
  BackgroundColorAttribute merge(BackgroundColorAttribute? other) {
    return BackgroundColorAttribute(color.merge(other?.color));
  }

  @override
  Color resolve(MixData mix) => color.resolve(mix);

  @override
  get props => [color];
}
