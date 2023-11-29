import '../../attributes/color_attribute.dart';
import '../../attributes/constraints/constraints_attribute.dart';
import '../../attributes/decoration/decoration_attribute.dart';
import '../../attributes/scalars/scalars_attribute.dart';
import '../../attributes/spacing_attribute.dart';
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
  final BackgroundColorAttribute? color;
  final WidthAttribute? width;
  final HeightAttribute? height;

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

  static ContainerMixAttribute of(MixData mix) {
    final attribute = mix.attributeOf<ContainerMixAttribute>();

    return ContainerMixAttribute(
      alignment: mix.attributeOf<AlignmentGeometryAttribute>(),
      padding: mix.attributeOf<PaddingAttribute>(),
      margin: mix.attributeOf<MarginAttribute>(),
      constraints: mix.attributeOf<BoxConstraintsAttribute>(),
      decoration: mix.attributeOf<DecorationAttribute>(),
      transform: mix.attributeOf<TransformAttribute>(),
      clipBehavior: mix.attributeOf<ClipBehaviorAttribute>(),
      color: mix.attributeOf<BackgroundColorAttribute>(),
      width: mix.attributeOf<WidthAttribute>(),
      height: mix.attributeOf<HeightAttribute>(),
    ).merge(attribute);
  }

  @override
  ContainerMixture resolve(MixData mix) {
    return ContainerMixture(
      alignment: alignment?.value,
      padding: padding?.resolve(mix),
      margin: margin?.resolve(mix),
      constraints: constraints?.resolve(mix),
      decoration: decoration?.resolve(mix),
      transform: transform?.value,
      clipBehavior: clipBehavior?.value,
      color: color?.resolve(mix),
      width: width?.value,
      height: height?.value,
    );
  }

  @override
  ContainerMixAttribute merge(ContainerMixAttribute? other) {
    if (other == null) return this;

    return ContainerMixAttribute(
      alignment: other.alignment ?? alignment,
      padding: padding?.merge(other.padding) ?? other.padding,
      margin: margin?.merge(other.margin) ?? other.margin,
      constraints: constraints?.merge(other.constraints) ?? other.constraints,
      decoration: decoration?.merge(other.decoration) ?? other.decoration,
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
