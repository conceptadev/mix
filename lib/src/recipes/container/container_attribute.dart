import '../../attributes/alignment_attribute.dart';
import '../../attributes/clip_behavior_attribute.dart';
import '../../attributes/color_attribute.dart';
import '../../attributes/constraints/constraints_attribute.dart';
import '../../attributes/decoration/decoration_attribute.dart';
import '../../attributes/spacing_attribute.dart';
import '../../attributes/transform_attribute.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'container_mixture.dart';

class ContainerMixAttribute
    extends ResolvableAttribute<ContainerMixAttribute, ContainerMixture> {
  final AlignmentGeometryAttribute? alignment;
  final PaddingAttribute? padding;
  final MarginAttribute? margin;
  final BoxConstraintsAttribute? constraints;
  final DecorationAttribute? decoration;
  final TransformAttribute? transform;
  final ClipBehaviorAttribute? clipBehavior;
  final ColorAttribute? color;
  final double? width, height;

  const ContainerMixAttribute({
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.decoration,
    this.transform,
    this.clipBehavior,
    this.color,
    this.width,
    this.height,
  });

  @override
  ContainerMixture resolve(MixData mix) {
    return ContainerMixture(
      alignment: get<AlignmentGeometryAttribute>(mix, alignment)?.value,
      padding: get<PaddingAttribute>(mix, padding)?.resolve(mix),
      margin: get<MarginAttribute>(mix, margin)?.resolve(mix),
      constraints: get<BoxConstraintsAttribute>(mix, constraints)?.resolve(mix),
      decoration: get<DecorationAttribute>(mix, decoration)?.resolve(mix),
      transform: get<TransformAttribute>(mix, transform)?.value,
      clipBehavior: get<ClipBehaviorAttribute>(mix, clipBehavior)?.value,
      color: color?.resolve(mix),
      width: width,
      height: height,
    );
  }

  @override
  ContainerMixAttribute merge(covariant ContainerMixAttribute? other) {
    if (other == null) return this;

    return ContainerMixAttribute(
      alignment: other.alignment ?? alignment,
      padding: padding?.merge(other.padding) ?? other.padding,
      margin: margin?.merge(other.margin) ?? other.margin,
      constraints: other.constraints ?? constraints,
      decoration: other.decoration ?? decoration,
      transform: other.transform ?? transform,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      color: color?.merge(other.color) ?? other.color,
      width: other.width ?? width,
      height: other.height ?? height,
    );
  }

  @override
  List<Object?> get props => [
        alignment,
        padding,
        margin,
        constraints,
        decoration,
        transform,
        clipBehavior,
        color,
        width,
        height,
      ];
}
