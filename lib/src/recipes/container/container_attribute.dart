import 'package:flutter/material.dart';

import '../../attributes/constraints/constraints_dto.dart';
import '../../attributes/decoration/decoration_dto.dart';
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
    this.width,
    this.height,
  });

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
        width,
        height,
      ];
}
