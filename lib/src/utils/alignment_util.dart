import 'package:flutter/material.dart';

// Import custom attributes and extension methods
import '../attributes/alignment_attribute.dart';
import '../helpers/extensions/values_ext.dart';

/// Converts an [x] and [y] value into an [AlignmentGeometryAttribute] object.
///
/// The [x] and [y] values are used to create an [Alignment] object.
/// The [Alignment] object is then converted into an [AlignmentGeometryAttribute] object.
AlignmentGeometryAttribute alignment(double x, double y) {
  return Alignment(x, y).toAttribute();
}

/// Convers a [start] and [y] value into an [AlignmentGeometryAttribute] object.
AlignmentGeometry alignmentDirectional(double start, double y) {
  return AlignmentDirectional(start, y);
}

// Convenience methods follow below, providing predefined [AlignmentGeometryAttribute]s for common alignments.
// These methods simplify the creation of [AlignmentGeometryAttribute] objects by abstracting away
// the need to directly use the [Alignment] class.

/// Provides an [AlignmentGeometryAttribute] for top-left alignment.
AlignmentGeometryAttribute alignmentTopLeft() =>
    Alignment.topLeft.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for top-center alignment.
AlignmentGeometryAttribute alignmentTopCenter() =>
    Alignment.topCenter.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for top-right alignment.
AlignmentGeometryAttribute alignmentTopRight() =>
    Alignment.topRight.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for center-left alignment.
AlignmentGeometryAttribute alignmentCenterLeft() =>
    Alignment.centerLeft.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for center alignment.
AlignmentGeometryAttribute alignmentCenter() => Alignment.center.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for center-right alignment.
AlignmentGeometryAttribute alignmentCenterRight() =>
    Alignment.centerRight.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for bottom-left alignment.
AlignmentGeometryAttribute alignmentBottomLeft() =>
    Alignment.bottomLeft.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for bottom-center alignment.
AlignmentGeometryAttribute alignmentBottomCenter() =>
    Alignment.bottomCenter.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for bottom-right alignment.
AlignmentGeometryAttribute alignmentBottomRight() =>
    Alignment.bottomRight.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for top-start alignment considering text direction.
AlignmentGeometryAttribute alignmentTopStart() =>
    AlignmentDirectional.topStart.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for top-end alignment considering text direction.
AlignmentGeometryAttribute alignmentTopEnd() =>
    AlignmentDirectional.topEnd.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for center-start alignment considering text direction.
AlignmentGeometryAttribute alignmentCenterStart() =>
    AlignmentDirectional.centerStart.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for center-end alignment considering text direction.
AlignmentGeometryAttribute alignmentCenterEnd() =>
    AlignmentDirectional.centerEnd.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for bottom-start alignment considering text direction.
AlignmentGeometryAttribute alignmentBottomStart() =>
    AlignmentDirectional.bottomStart.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for bottom-end alignment considering text direction.
AlignmentGeometryAttribute alignmentBottomEnd() =>
    AlignmentDirectional.bottomEnd.toAttribute();
