import 'package:flutter/material.dart';

import 'alignment_attribute.dart';

const aligment = AlignmentAttribute.from;

/// The top left corner.
final alignmentTopLeft = aligment(Alignment.topLeft);

/// The center point along the top edge.
final alignmentTopCenter = aligment(Alignment.topCenter);

/// The top right corner.
final alignmentTopRight = aligment(Alignment.topRight);

/// The center point along the left edge.
final alignmentCenterLeft = aligment(Alignment.centerLeft);

/// The center point, both horizontally and vertically.
final alignmentCenter = aligment(Alignment.center);

/// The center point along the right edge.
final alignmentCenterRight = aligment(Alignment.centerRight);

/// The bottom left corner.
final alignmentBottomLeft = aligment(Alignment.bottomLeft);

/// The center point along the bottom edge.
final alignmentBottomCenter = aligment(Alignment.bottomCenter);

/// The bottom right corner.
final alignmentBottomRight = aligment(Alignment.bottomRight);

/// The top corner on the "start" side.
final alignmentTopStart = aligment(AlignmentDirectional.topStart);

/// The top corner on the "end" side.
final alignmentTopEnd = aligment(AlignmentDirectional.topEnd);

/// The center point along the "start" edge.
final alignmentCenterStart = aligment(AlignmentDirectional.centerStart);

/// The center point along the "end" edge.
final alignmentCenterEnd = aligment(AlignmentDirectional.centerEnd);

/// The bottom corner on the "start" side.
final alignmentBottomStart = aligment(AlignmentDirectional.bottomStart);

/// The bottom corner on the "end" side.
final alignmentBottomEnd = aligment(AlignmentDirectional.bottomEnd);
