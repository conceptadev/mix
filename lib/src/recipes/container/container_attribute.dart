import '../../attributes/constraints/constraints_attribute.dart';
import '../../attributes/decoration/decoration_attribute.dart';
import '../../attributes/scalars/scalars_attribute.dart';
import '../../attributes/spacing/spacing_attribute.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'container_spec.dart';

class ContainerSpecAttribute
    extends ResolvableAttribute<ContainerSpecAttribute, ContainerSpec> {
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

  const ContainerSpecAttribute({
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

  static ContainerSpecAttribute of(MixData mix) {
    final attribute = mix.attributeOf<ContainerSpecAttribute>();

    return ContainerSpecAttribute(
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
  ContainerSpec resolve(MixData mix) {
    return ContainerSpec(
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
  ContainerSpecAttribute merge(ContainerSpecAttribute? other) {
    if (other == null) return this;

    return ContainerSpecAttribute(
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
