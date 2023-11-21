import '../../factory/mix_provider_data.dart';
import '../../specs/icon_spec.dart';
import '../attribute.dart';
import '../color_attribute.dart';

class IconDto extends Dto<StyledIconRecipe> {
  final double? size;
  final ColorDto? color;

  const IconDto({required this.size, required this.color});

  @override
  StyledIconRecipe resolve(MixData mix) {
    return StyledIconRecipe(color: color?.resolve(mix), size: size);
  }

  @override
  IconDto merge(covariant IconDto? other) {
    if (other == null) return this;

    return IconDto(size: size ?? other.size, color: color ?? other.color);
  }

  @override
  get props => [size, color];
}

class IconAttribute extends ResolvableAttribute<IconDto, StyledIconRecipe> {
  const IconAttribute(super.value);

  @override
  IconAttribute merge(covariant IconAttribute? other) {
    return IconAttribute(value.merge(other?.value));
  }
}
