import 'package:flutter/material.dart';

import '../../attributes/alignment/alignment_geometry.attribute.dart';
import '../../attributes/box_constraints/box_constraints.attribute.dart';
import '../../attributes/color/color.dto.dart';
import '../../attributes/decoration/decoration.attribute.dart';
import '../../attributes/matrix4/matrix4.attribute.dart';
import '../../attributes/padding/padding.attribute.dart';
import '../../attributes/painting/clip.attribute.dart';
import '../../attributes/resolvable_attribute.dart';
import '../../attributes/width_height/width_height_attribute.dart';
import '../../factory/mix_provider_data.dart';

class ContainerAttributes
    extends ResolvableAttribute<ContainerAttributesResolved> {
  final AlignmentGeometryAttribute? alignment;
  final PaddingAttribute? padding;
  final BoxConstraintsAttribute? constraints;
  final DecorationAttribute? decoration;
  final WidthAttribute? width;
  final HeightAttribute? height;
  final Matrix4Attribute? transform;
  final ColorDto? color;
  final ClipAttribute? clipBehavior;

  const ContainerAttributes({
    this.alignment,
    this.padding,
    this.constraints,
    this.decoration,
    this.width,
    this.height,
    this.transform,
    this.color,
    this.clipBehavior,
  });

  @override
  ContainerAttributes merge(ContainerAttributes? other) {
    if (other == null) return this;

    return ContainerAttributes(
      alignment: alignment?.merge(other.alignment) ?? other.alignment,
      padding: padding?.merge(other.padding) ?? other.padding,
      constraints: constraints?.merge(other.constraints) ?? other.constraints,
      decoration: decoration?.merge(other.decoration) ?? other.decoration,
      width: width?.merge(other.width) ?? other.width,
      height: height?.merge(other.height) ?? other.height,
      transform: transform?.merge(other.transform) ?? other.transform,
      color: color?.merge(other.color) ?? other.color,
      clipBehavior:
          clipBehavior?.merge(other.clipBehavior) ?? other.clipBehavior,
    );
  }

  @override
  ContainerAttributesResolved resolve(MixData mix) {
    return ContainerAttributesResolved(
      alignment: alignment?.resolve(mix),
      padding: padding?.resolve(mix),
      constraints: constraints?.resolve(mix),
      decoration: decoration?.resolve(mix),
      width: width?.resolve(mix),
      height: height?.resolve(mix),
      transform: transform?.resolve(mix),
      color: color?.resolve(mix),
      clipBehavior: clipBehavior?.resolve(mix),
    );
  }

  @override
  List<Object?> get props => [
        alignment,
        padding,
        constraints,
        decoration,
        width,
        height,
        transform,
        color,
        clipBehavior,
      ];
}

class ContainerAttributesResolved {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final Matrix4? transform;
  final Color? color;
  final Clip? clipBehavior;

  const ContainerAttributesResolved({
    this.alignment,
    this.padding,
    this.constraints,
    this.decoration,
    this.width,
    this.height,
    this.transform,
    this.color,
    this.clipBehavior,
  });
}
