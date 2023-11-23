import 'dart:ui';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'icon_attribute.dart';

class IconRecipeMix extends RecipeMix<IconRecipeMix> {
  final Color? color;
  final double? size;

  const IconRecipeMix({required this.color, required this.size});

  const IconRecipeMix.empty()
      : color = null,
        size = null;

  static IconRecipeMix resolve(MixData mix) {
    final recipe = mix.attributeOfType<IconMixAttribute>()?.resolve(mix);

    return recipe ?? const IconRecipeMix.empty();
  }

  @override
  IconRecipeMix lerp(IconRecipeMix other, double t) {
    return IconRecipeMix(
      color: Color.lerp(color, other.color, t),
      size: lerpDouble(size, other.size, t),
    );
  }

  @override
  IconRecipeMix copyWith({
    Color? color,
    double? size,
    TextDirection? textDirection,
  }) {
    return IconRecipeMix(color: color ?? this.color, size: size ?? this.size);
  }

  @override
  get props => [color, size];
}
