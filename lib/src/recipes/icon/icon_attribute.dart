import '../../attributes/color/color_dto.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'icon_spec.dart';

class IconMixAttribute extends ResolvableAttribute<IconMixAttribute, IconSpec> {
  final double? size;
  final ColorDto? color;

  const IconMixAttribute({this.size, this.color});

  static IconMixAttribute of(MixData mix) {
    return mix.attributeOf<IconMixAttribute>() ?? const IconMixAttribute();
  }

  @override
  IconSpec resolve(MixData mix) {
    return IconSpec(color: color?.resolve(mix), size: size);
  }

  @override
  IconMixAttribute merge(covariant IconMixAttribute? other) {
    if (other == null) return this;

    return IconMixAttribute(
      size: size ?? other.size,
      color: color ?? other.color,
    );
  }

  @override
  get props => [size, color];
}
