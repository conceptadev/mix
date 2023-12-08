import '../../attributes/color/color_dto.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'icon_spec.dart';

class IconSpecAttribute extends SpecAttribute<IconSpecAttribute, IconSpec> {
  final double? size;
  final ColorDto? color;

  const IconSpecAttribute({this.size, this.color});

  @override
  IconSpec resolve(MixData mix) {
    return IconSpec(color: color?.resolve(mix), size: size);
  }

  @override
  IconSpecAttribute merge(covariant IconSpecAttribute? other) {
    if (other == null) return this;

    return IconSpecAttribute(
      size: size ?? other.size,
      color: color ?? other.color,
    );
  }

  @override
  get props => [size, color];
}
