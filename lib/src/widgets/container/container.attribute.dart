import 'package:flutter/material.dart';

import '../../attributes/alignment/alignment_geometry.attribute.dart';
import '../../attributes/box_constraints/box_constraints.attribute.dart';
import '../../attributes/color/background_color.attribute.dart';
import '../../attributes/decoration/decoration.attribute.dart';
import '../../attributes/enum/clip.attribute.dart';
import '../../attributes/size/height.attribute.dart';
import '../../attributes/size/width.attribute.dart';
import '../../attributes/space/margin_attribute.dart';
import '../../attributes/space/padding.attribute.dart';
import '../../attributes/style_attribute.dart';
import '../../attributes/transform/matrix4.attribute.dart';
import '../../factory/mix_provider_data.dart';

class ContainerAttributes
    extends WidgetAttributes<ContainerAttributesResolved> {
  final AlignmentGeometryAttribute? alignment;
  final PaddingAttribute? padding;
  final MarginAttribute? margin;
  final BoxConstraintsAttribute? constraints;
  final DecorationAttribute? decoration;
  final WidthAttribute? width;
  final HeightAttribute? height;
  final Matrix4Attribute? transform;
  final BackgroundColorAttribute? color;
  final ClipAttribute? clipBehavior;

  const ContainerAttributes({
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.decoration,
    this.width,
    this.height,
    this.transform,
    this.color,
    this.clipBehavior,
    super.animation,
    super.visible,
  });

  @override
  ContainerAttributes merge(ContainerAttributes? other) {
    if (other == null) return this;

    return ContainerAttributes(
      alignment: mergeProp(alignment, other.alignment),
      padding: mergeProp(padding, other.padding),
      margin: mergeProp(margin, other.margin),
      constraints: mergeProp(constraints, other.constraints),
      decoration: mergeProp(decoration, other.decoration),
      width: mergeProp(width, other.width),
      height: mergeProp(height, other.height),
      transform: mergeProp(transform, other.transform),
      color: mergeProp(color, other.color),
      clipBehavior: mergeProp(clipBehavior, other.clipBehavior),
      animation: mergeProp(animation, other.animation),
      visible: mergeProp(visible, other.visible),
    );
  }

  @override
  ContainerAttributesResolved resolve(MixData mix) {
    return ContainerAttributesResolved(
      alignment: resolveAttribute(alignment, mix),
      padding: resolveAttribute(padding, mix),
      margin: resolveAttribute(margin, mix),
      constraints: resolveAttribute(constraints, mix),
      decoration: resolveAttribute(decoration, mix),
      width: resolveAttribute(width, mix),
      height: resolveAttribute(height, mix),
      transform: resolveAttribute(transform, mix),
      color: resolveAttribute(color, mix),
      clipBehavior: resolveAttribute(clipBehavior, mix),
      animation: resolveAttribute(animation, mix),
      visible: resolveAttribute(visible, mix),
    );
  }

  @override
  List<Object?> get props => [
        alignment,
        padding,
        margin,
        constraints,
        decoration,
        width,
        height,
        transform,
        color,
        clipBehavior,
        super.animation,
        super.visible,
      ];
}

class ContainerAttributesResolved extends WidgetAttributesResolved {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final BoxConstraints? constraints;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final Matrix4? transform;
  final Color? color;
  final Clip? clipBehavior;

  static const defaults = ContainerAttributesResolved(
    alignment: null,
    padding: null,
    margin: null,
    constraints: null,
    decoration: null,
    width: null,
    height: null,
    transform: null,
    color: null,
    clipBehavior: null,
    animation: null,
    visible: true,
  );
  const ContainerAttributesResolved({
    required this.alignment,
    required this.padding,
    required this.margin,
    required this.constraints,
    required this.decoration,
    required this.width,
    required this.height,
    required this.transform,
    required this.color,
    required this.clipBehavior,
    required super.animation,
    required super.visible,
  });

  @override
  get props => [
        alignment,
        padding,
        margin,
        constraints,
        decoration,
        width,
        height,
        transform,
        color,
        clipBehavior,
        super.animation,
        super.visible,
      ];
}
