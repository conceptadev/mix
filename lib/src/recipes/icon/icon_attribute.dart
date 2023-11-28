import '../../attributes/color_attribute.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'icon_mixture.dart';

class IconMixAttribute
    extends ResolvableAttribute<IconMixAttribute, IconMixture> {
  final double? size;
  final ColorDto? color;

  const IconMixAttribute({this.size, this.color});

  @override
  IconMixture resolve(MixData mix) {
    return IconMixture(color: color?.resolve(mix), size: size);
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
