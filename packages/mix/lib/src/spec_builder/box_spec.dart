import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../core/spec.dart';
import 'box_spec.g.dart';

@MixSpec()
class BoxDef extends Spec<BoxDef> with BoxDefMixin {
  /// Aligns the child within the box.
  final AlignmentGeometry? alignment;

  /// Adds empty space inside the box.
  final EdgeInsetsGeometry? padding;

  /// Adds empty space around the box.
  final EdgeInsetsGeometry? margin;

  /// Applies additional constraints to the child.
  final BoxConstraints? constraints;

  /// Paints a decoration behind the child.
  final Decoration? decoration;

  /// Paints a decoration in front of the child.
  final Decoration? foregroundDecoration;

  /// Applies a transformation matrix before painting the box.
  final Matrix4? transform;

  /// Aligns the origin of the coordinate system for the [transform].
  final AlignmentGeometry? transformAlignment;

  /// Defines the clip behavior for the box
  /// when [BoxConstraints] has a negative minimum extent.
  final Clip? clipBehavior;

  /// Specifies the width of the box.
  final double? width;

  /// Specifies the height of the box.
  final double? height;

  const BoxDef({
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.clipBehavior,
    this.width,
    this.height,
    super.animated,
  });
}
