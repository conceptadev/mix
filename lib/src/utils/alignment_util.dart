import 'package:flutter/material.dart';

// Import custom attributes and extension methods
import '../attributes/alignment_attribute.dart';
import '../helpers/extensions/values_ext.dart';

/// Converts an [x] and [y] value into an [AlignmentAttribute] object.
///
/// The [x] and [y] values are used to create an [Alignment] object.
/// The [Alignment] object is then converted into an [AlignmentAttribute] object.
const alignment = AlignmentAttribute.pos;

/// Convers a [start] and [y] value into an [AlignmentDirectionalAttribute] object.
const alignmentDirectional = AlignmentDirectionalAttribute.pos;

// Convenience methods follow below, providing predefined [AlignmentGeometryAttribute]s for common alignments.
// These methods simplify the creation of [AlignmentGeometryAttribute] objects by abstracting away
// the need to directly use the [Alignment] class.

/// Provides an [AlignmentAttribute] for top-left alignment.
AlignmentAttribute alignmentTopLeft() => Alignment.topLeft.toAttribute();

/// Provides an [AlignmentAttribute] for top-center alignment.
AlignmentAttribute alignmentTopCenter() => Alignment.topCenter.toAttribute();

/// Provides an [AlignmentAttribute] for top-right alignment.
AlignmentAttribute alignmentTopRight() => Alignment.topRight.toAttribute();

/// Provides an [AlignmentAttribute] for center-left alignment.
AlignmentAttribute alignmentCenterLeft() => Alignment.centerLeft.toAttribute();

/// Provides an [AlignmentAttribute] for center alignment.
AlignmentAttribute alignmentCenter() => Alignment.center.toAttribute();

/// Provides an [AlignmentAttribute] for center-right alignment.
AlignmentAttribute alignmentCenterRight() =>
    Alignment.centerRight.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for bottom-left alignment.
AlignmentAttribute alignmentBottomLeft() => Alignment.bottomLeft.toAttribute();

/// Provides an [AlignmentAttribute] for bottom-center alignment.
AlignmentAttribute alignmentBottomCenter() =>
    Alignment.bottomCenter.toAttribute();

/// Provides an [AlignmentAttribute] for bottom-right alignment.
AlignmentAttribute alignmentBottomRight() =>
    Alignment.bottomRight.toAttribute();

/// Provides an [AlignmentGeometryAttribute] for top-start alignment considering text direction.
AlignmentDirectionalAttribute alignmentTopStart() =>
    AlignmentDirectional.topStart.toAttribute();

/// Provides an [AlignmentDirectionalAttribute] for top-end alignment considering text direction.
AlignmentDirectionalAttribute alignmentTopEnd() =>
    AlignmentDirectional.topEnd.toAttribute();

/// Provides an [AlignmentDirectionalAttribute] for center-start alignment considering text direction.
AlignmentDirectionalAttribute alignmentCenterStart() =>
    AlignmentDirectional.centerStart.toAttribute();

/// Provides an [AlignmentDirectionalAttribute] for center-end alignment considering text direction.
AlignmentDirectionalAttribute alignmentCenterEnd() =>
    AlignmentDirectional.centerEnd.toAttribute();

/// Provides an [AlignmentDirectionalAttribute] for bottom-start alignment considering text direction.
AlignmentDirectionalAttribute alignmentBottomStart() =>
    AlignmentDirectional.bottomStart.toAttribute();

/// Provides an [AlignmentDirectionalAttribute] for bottom-end alignment considering text direction.
AlignmentDirectionalAttribute alignmentBottomEnd() =>
    AlignmentDirectional.bottomEnd.toAttribute();
