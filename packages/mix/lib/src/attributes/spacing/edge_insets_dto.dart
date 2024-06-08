import 'package:flutter/material.dart';

import '../../core/dto.dart';
import '../../core/models/mix_data.dart';

@immutable
abstract class EdgeInsetsGeometryDto<Self extends EdgeInsetsGeometryDto<Self>>
    extends Dto<EdgeInsetsGeometry> {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  // Directional
  final double? start;
  final double? end;

  const EdgeInsetsGeometryDto({
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.start,
    this.end,
  });

  bool get isDirectional => start != null || end != null;

  @override
  EdgeInsetsGeometry resolve(MixData mix);

  @override
  get props => [top, bottom, left, right, start, end];
}
