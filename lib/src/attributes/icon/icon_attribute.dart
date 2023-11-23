import '../../attributes/attribute.dart';
import '../../attributes/color_attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'icon_recipe.dart';

class IconMixAttribute extends ResolvableAttribute<IconMix> {
  final double? size;
  final ColorAttribute? color;

  const IconMixAttribute({this.size, this.color});

  @override
  IconMix resolve(MixData mix) {
    return IconMix(color: color?.resolve(mix), size: size);
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
