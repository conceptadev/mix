// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

// ignore: avoid-importing-entrypoint-exports
import '../../../mix.dart';

part 'box_spec.g.dart';

typedef _prop = MixableFieldProperty;
typedef _utility = MixableFieldUtility;

const _constraintsUtil = _utility(
  properties: [
    _prop('maxWidth'),
    _prop('minWidth'),
    _prop('maxHeight'),
    _prop('minHeight'),
  ],
);

const _foregroundUtil = _utility(type: BoxDecorationUtility);
const _boxDecorationUtil = _utility(
  type: BoxDecorationUtility,
  properties: [
    _prop('color'),
    _prop('border'),
    _prop('borderDirectional'),
    _prop('borderRadius'),
    _prop('borderRadiusDirectional'),
    _prop(
      'gradient',
      properties: [
        _prop('radial', alias: 'radialGradient'),
        _prop('linear', alias: 'linearGradient'),
      ],
    ),
    _prop('boxShadows', alias: 'shadows'),
    _prop('boxShadow', alias: 'shadow'),
    _prop('elevation'),
  ],
  extraUtilities: [
    _utility(alias: 'shapeDecoration', type: ShapeDecorationUtility),
  ],
);

@MixableSpec()
final class BoxSpec extends Spec<BoxSpec> with BoxSpecMixable {
  static const of = BoxSpecMixable.of;

  static const from = BoxSpecMixable.from;

  /// Aligns the child within the box.
  final AlignmentGeometry? alignment;

  /// Adds empty space inside the box.
  final EdgeInsetsGeometry? padding;

  /// Adds empty space around the box.
  final EdgeInsetsGeometry? margin;

  /// Applies additional constraints to the child.
  @MixableField(utility: _constraintsUtil)
  final BoxConstraints? constraints;

  /// Paints a decoration behind the child.
  @MixableField(utility: _boxDecorationUtil)
  final Decoration? decoration;

  /// Paints a decoration in front of the child.
  @MixableField(utility: _foregroundUtil)
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
}
