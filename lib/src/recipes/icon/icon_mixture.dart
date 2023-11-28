import 'dart:ui';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'icon_attribute.dart';

class IconMixture extends Mixture<IconMixture> {
  final Color? color;
  final double? size;

  const IconMixture({required this.color, required this.size});

  const IconMixture.empty()
      : color = null,
        size = null;

  static IconMixture resolve(MixData mix) {
    final recipe = mix.attributeOf<IconMixAttribute>()?.resolve(mix);

    return recipe ?? const IconMixAttribute().resolve(mix);
  }

  @override
  IconMixture lerp(IconMixture other, double t) {
    return IconMixture(
      color: Color.lerp(color, other.color, t),
      size: lerpDouble(size, other.size, t),
    );
  }

  @override
  IconMixture merge(IconMixture? other) {
    return copyWith(color: other?.color, size: other?.size);
  }

  @override
  IconMixture copyWith({
    Color? color,
    double? size,
    TextDirection? textDirection,
  }) {
    return IconMixture(color: color ?? this.color, size: size ?? this.size);
  }

  @override
  get props => [color, size];
}
