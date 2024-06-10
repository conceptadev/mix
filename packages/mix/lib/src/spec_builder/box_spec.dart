import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../mix.dart';

part 'box_spec.g.dart';

@MixableSpec()
class BoxDef extends Spec<BoxDef> with BoxDefMixable {
  /// Aligns the child within the box.
  final AlignmentGeometry? alignment;

  /// Adds empty space inside the box.
  final EdgeInsetsGeometry? padding;

  /// Adds empty space around the box.
  final EdgeInsetsGeometry? margin;

  /// Applies additional constraints to the child.
  @MixableField(
    utility: MixableFieldUtility(
      properties: [
        MixableFieldProperty('maxWidth'),
        MixableFieldProperty('minWidth'),
        MixableFieldProperty('maxHeight'),
        MixableFieldProperty('minHeight')
      ],
    ),
  )
  final BoxConstraints? constraints;

  /// Paints a decoration behind the child.
  @MixableField(
    utility: MixableFieldUtility(
      type: BoxDecorationUtility,
      extraUtilities: [
        MixableFieldUtility(
          alias: 'shapeDecoration',
          type: ShapeDecorationUtility,
        )
      ],
      properties: [
        MixableFieldProperty('color'),
        MixableFieldProperty('border'),
        MixableFieldProperty('borderRadius'),
        MixableFieldProperty(
          'gradient',
          properties: [
            MixableFieldProperty(
              'radial',
              alias: 'radialGradient',
            ),
            MixableFieldProperty(
              'linear',
              alias: 'linearGradient',
            )
          ],
        ),
        MixableFieldProperty(
          'boxShadows',
          alias: 'shadows',
        ),
        MixableFieldProperty(
          'boxShadow',
          alias: 'shadow',
        ),
        MixableFieldProperty('elevation'),
        MixableFieldProperty('borderRadiusDirectional'),
        MixableFieldProperty('borderDirectional'),
      ],
    ),
  )
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
