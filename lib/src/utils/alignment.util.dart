import 'package:flutter/material.dart';

import '../attributes/alignment_geometry.attribute.dart';

const alignment = AlignmentGeometryAttribute.from;

/// The top left corner.
final alignmentTopLeft = alignment(Alignment.topLeft);

/// The center point along the top edge.
final alignmentTopCenter = alignment(Alignment.topCenter);

/// The top right corner.
final alignmentTopRight = alignment(Alignment.topRight);

/// The center point along the left edge.
final alignmentCenterLeft = alignment(Alignment.centerLeft);

/// The center point, both horizontally and vertically.
final alignmentCenter = alignment(Alignment.center);

/// The center point along the right edge.
final alignmentCenterRight = alignment(Alignment.centerRight);

/// The bottom left corner.
final alignmentBottomLeft = alignment(Alignment.bottomLeft);

/// The center point along the bottom edge.
final alignmentBottomCenter = alignment(Alignment.bottomCenter);

/// The bottom right corner.
final alignmentBottomRight = alignment(Alignment.bottomRight);

/// The top corner on the "start" side.
final alignmentTopStart = alignment(AlignmentDirectional.topStart);

/// The top corner on the "end" side.
final alignmentTopEnd = alignment(AlignmentDirectional.topEnd);

/// The center point along the "start" edge.
final alignmentCenterStart = alignment(AlignmentDirectional.centerStart);

/// The center point along the "end" edge.
final alignmentCenterEnd = alignment(AlignmentDirectional.centerEnd);

/// The bottom corner on the "start" side.
final alignmentBottomStart = alignment(AlignmentDirectional.bottomStart);

/// The bottom corner on the "end" side.
final alignmentBottomEnd = alignment(AlignmentDirectional.bottomEnd);
