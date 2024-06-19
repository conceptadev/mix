// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports, camel_case_types
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'box_spec.g.dart';

const _constraints = MixableUtility(
  type: BoxConstraints,
  properties: [
    (path: 'minWidth', alias: 'minWidth'),
    (path: 'maxWidth', alias: 'maxWidth'),
    (path: 'minHeight', alias: 'minHeight'),
    (path: 'maxHeight', alias: 'maxHeight'),
  ],
);

const _foreground = MixableUtility(type: BoxDecoration);
const _boxDecor = MixableUtility(
  type: BoxDecoration,
  properties: [
    (path: 'color', alias: 'color'),
    (path: 'border', alias: 'border'),
    (path: 'border.directional', alias: 'borderDirectional'),
    (path: 'borderRadius', alias: 'borderRadius'),
    (path: 'borderRadius.directional', alias: 'borderRadiusDirectional'),
    (path: 'gradient', alias: 'gradient'),
    (path: 'gradient.sweep', alias: 'sweepGradient'),
    (path: 'gradient.radial', alias: 'radialGradient'),
    (path: 'gradient.linear', alias: 'linearGradient'),
    (path: 'boxShadows', alias: 'shadows'),
    (path: 'boxShadow', alias: 'shadow'),
    (path: 'elevation', alias: 'elevation'),
  ],
);

const _shapeDecor = MixableUtility(
  alias: 'shapeDecoration',
  type: ShapeDecoration,
);

@MixableSpec()
final class BoxSpec extends Spec<BoxSpec> with _$BoxSpec {
  /// {@macro box_spec_of}
  static const of = _$BoxSpec.of;

  static const from = _$BoxSpec.from;

  /// Aligns the child within the box.
  final AlignmentGeometry? alignment;

  /// Adds empty space inside the box.
  final EdgeInsetsGeometry? padding;

  /// Adds empty space around the box.
  final EdgeInsetsGeometry? margin;

  /// Applies additional constraints to the child.
  @MixableProperty(utilities: [_constraints])
  final BoxConstraints? constraints;

  /// Paints a decoration behind the child.
  @MixableProperty(utilities: [_boxDecor, _shapeDecor])
  final Decoration? decoration;

  /// Paints a decoration in front of the child.
  @MixableProperty(utilities: [_foreground])
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

  const BoxSpec({
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

  Widget call({Widget? child}) {
    return isAnimated
        ? AnimatedBoxSpecWidget(
            duration: animated!.duration,
            curve: animated!.curve,
            spec: this,
            child: child,
          )
        : BoxSpecWidget(
            spec: this,
            child: child,
          );
  }
}
