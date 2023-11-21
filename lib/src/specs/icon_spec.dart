import 'dart:ui';

import '../attributes/attribute.dart';
import '../attributes/icon/icon_attribute.dart';
import '../factory/mix_provider_data.dart';

class StyledIconRecipe extends StyleRecipe<StyledIconRecipe> {
  final Color? color;
  final double? size;

  const StyledIconRecipe({required this.color, required this.size});

  static StyledIconRecipe resolve(MixData mix) {
    final recipe = mix.attributeOfType<IconAttribute>()?.resolve(mix);

    return StyledIconRecipe(color: recipe?.color, size: recipe?.size);
  }

  @override
  StyledIconRecipe lerp(StyledIconRecipe other, double t) {
    return StyledIconRecipe(
      color: Color.lerp(color, other.color, t),
      size: lerpDouble(size, other.size, t),
    );
  }

  @override
  StyledIconRecipe copyWith({
    Color? color,
    double? size,
    TextDirection? textDirection,
  }) {
    return StyledIconRecipe(
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }

  @override
  get props => [color, size];
}
