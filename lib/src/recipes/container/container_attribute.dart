import 'package:flutter/material.dart';

import '../../attributes/color/color_dto.dart';
import '../../attributes/constraints/constraints_attribute.dart';
import '../../attributes/constraints/constraints_dto.dart';
import '../../attributes/decoration/decoration_attribute.dart';
import '../../attributes/decoration/decoration_dto.dart';
import '../../attributes/scalars/scalars_attribute.dart';
import '../../attributes/spacing/spacing_attribute.dart';
import '../../attributes/spacing/spacing_dto.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'container_spec.dart';

class ContainerSpecAttribute
    extends ResolvableAttribute<ContainerSpecAttribute, ContainerSpec> {
  final AlignmentGeometry? alignment;
  final SpacingDto? padding;
  final SpacingDto? margin;
  final BoxConstraintsDto? constraints;
  final DecorationDto? decoration;
  final Matrix4? transform;
  final Clip? clipBehavior;
  final ColorDto? color;
  final double? width;
  final double? height;

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
      alignment: mix.attributeOf<AlignmentGeometryAttribute>()?.value,
      padding: mix.attributeOf<PaddingAttribute>()?.value,
      margin: mix.attributeOf<MarginAttribute>()?.value,
      constraints: mix.attributeOf<BoxConstraintsAttribute>()?.value,
      decoration: mix.attributeOf<DecorationAttribute>()?.value,
      transform: mix.attributeOf<TransformAttribute>()?.value,
      clipBehavior: mix.attributeOf<ClipBehaviorAttribute>()?.value,
      color: mix.attributeOf<BackgroundColorAttribute>()?.value,
      width: mix.attributeOf<WidthAttribute>()?.value,
      height: mix.attributeOf<HeightAttribute>()?.value,
    ).merge(attribute);
  }

  @override
  ContainerSpec resolve(MixData mix) {
    return ContainerSpec(
      alignment: alignment,
      padding: padding?.resolve(mix),
      margin: margin?.resolve(mix),
      constraints: constraints?.resolve(mix),
      decoration: decoration?.resolve(mix),
      transform: transform,
      clipBehavior: clipBehavior,
      color: color?.resolve(mix),
      width: width,
      height: height,
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
