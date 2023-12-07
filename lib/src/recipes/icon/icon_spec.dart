import 'dart:ui';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'icon_attribute.dart';

class IconSpec extends Spec<IconSpec> {
  final Color? color;
  final double? size;

  const IconSpec({required this.color, required this.size});

  const IconSpec.empty()
      : color = null,
        size = null;

  static IconSpec resolve(MixData mix) {
    final recipe = mix.attributeOf<IconSpecAttribute>()?.resolve(mix);

    return recipe ?? const IconSpecAttribute().resolve(mix);
  }

  @override
  IconSpec lerp(IconSpec other, double t) {
    return IconSpec(
      color: Color.lerp(color, other.color, t),
      size: lerpDouble(size, other.size, t),
    );
  }

  @override
  IconSpec copyWith({
    Color? color,
    double? size,
    TextDirection? textDirection,
  }) {
    return IconSpec(color: color ?? this.color, size: size ?? this.size);
  }

  @override
  get props => [color, size];
}
