import '../../attributes/alignment_attribute.dart';
import '../../attributes/clip_behavior_attribute.dart';
import '../../attributes/constraints/constraints_attribute.dart';
import '../../attributes/decoration/decoration_attribute.dart';
import '../../attributes/spacing_attribute.dart';
import '../../attributes/transform_attribute.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'container_mixture.dart';

class ContainerMixtureAttribute
    extends ResolvableAttribute<ContainerMixtureAttribute, ContainerMixture> {
  final AlignmentGeometryAttribute? alignment;
  final PaddingAttribute? padding;
  final MarginAttribute? margin;
  final BoxConstraintsAttribute? constraints;
  final DecorationAttribute? decoration;
  final TransformAttribute? transform;
  final ClipBehaviorAttribute? clipBehavior;

  const ContainerMixtureAttribute({
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.decoration,
    this.transform,
    this.clipBehavior,
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
    );
  }

  @override
  ContainerMixtureAttribute merge(covariant ContainerMixtureAttribute? other) {
    if (other == null) return this;

    return ContainerMixtureAttribute(
      alignment: alignment ?? other.alignment,
      padding: padding ?? other.padding,
      margin: margin ?? other.margin,
      constraints: constraints ?? other.constraints,
      decoration: decoration ?? other.decoration,
      transform: transform ?? other.transform,
      clipBehavior: clipBehavior ?? other.clipBehavior,
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
      ];
}
