import '../../attributes/attribute.dart';
import '../../attributes/color_attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../../recipes/icon/icon_recipe.dart';

class IconMixAttribute extends ResolvableAttribute<IconRecipeMix> {
  final double? size;
  final ColorAttribute? color;

  const IconMixAttribute({this.size, this.color});

  @override
  IconRecipeMix resolve(MixData mix) {
    return IconRecipeMix(color: color?.resolve(mix), size: size);
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
