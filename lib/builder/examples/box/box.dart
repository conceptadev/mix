import 'package:flutter/material.dart';

import '../../helpers/annotations.dart';

@MixSpec(name: 'BoxTest')
class BoxDef {
  const BoxDef({
    @MixProperty(description: 'Aligns the child within the box.')
    AlignmentGeometry? alignment,

    /// Adds empty space inside the box.
    EdgeInsetsGeometry? padding,

    /// Adds empty space around the box.
    EdgeInsetsGeometry? margin,

    /// Applies additional constraints to the child.
    BoxConstraints? constraints,

    /// Paints a decoration behind the child.
    Decoration? decoration,

    /// Paints a decoration in front of the child.
    Decoration? foregroundDecoration,

    /// Applies a transformation matrix before painting the box.
    Matrix4? transform,

    /// Aligns the origin of the coordinate system for the [transform].
    AlignmentGeometry? transformAlignment,

    /// Defines the clip behavior for the box when [BoxConstraints] has a negative
    /// minimum extent.
    Clip? clipBehavior,

    /// Specifies the width of the box.
    double? width,

    /// Specifies the height of the box.
    double? height,
  });
}
