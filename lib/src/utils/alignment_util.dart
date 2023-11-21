import 'package:flutter/material.dart';

import '../attributes/alignment_attribute.dart';
import '../helpers/extensions/values_ext.dart';
import 'scalar_util.dart';

/// Generates an [AlignmentAttribute] from given [x] and [y] values.
const alignment = AlignmentUtility(AlignmentGeometryAttribute.from);

class AlignmentUtility
    extends MixUtility<AlignmentGeometryAttribute, AlignmentGeometryDto> {
  const AlignmentUtility(super.builder);

  AlignmentGeometryAttribute topLeft() => builder(Alignment.topLeft.toDto());
  AlignmentGeometryAttribute topCenter() =>
      builder(Alignment.topCenter.toDto());
  AlignmentGeometryAttribute topRight() => builder(Alignment.topRight.toDto());
  AlignmentGeometryAttribute centerLeft() =>
      builder(Alignment.centerLeft.toDto());
  AlignmentGeometryAttribute center() => builder(Alignment.center.toDto());
  AlignmentGeometryAttribute centerRight() =>
      builder(Alignment.centerRight.toDto());
  AlignmentGeometryAttribute bottomLeft() =>
      builder(Alignment.bottomLeft.toDto());
  AlignmentGeometryAttribute bottomCenter() =>
      builder(Alignment.bottomCenter.toDto());
  AlignmentGeometryAttribute bottomRight() =>
      builder(Alignment.bottomRight.toDto());

  AlignmentGeometryAttribute topStart() =>
      builder(AlignmentDirectional.topStart.toDto());
  AlignmentGeometryAttribute topEnd() =>
      builder(AlignmentDirectional.topEnd.toDto());
  AlignmentGeometryAttribute centerStart() =>
      builder(AlignmentDirectional.centerStart.toDto());
  AlignmentGeometryAttribute centerEnd() =>
      builder(AlignmentDirectional.centerEnd.toDto());
  AlignmentGeometryAttribute bottomStart() =>
      builder(AlignmentDirectional.bottomStart.toDto());
  AlignmentGeometryAttribute bottomEnd() =>
      builder(AlignmentDirectional.bottomEnd.toDto());

  AlignmentGeometryAttribute y(double y) => builder(AlignmentDto(y: y));
  AlignmentGeometryAttribute x(double x) => builder(AlignmentDto(x: x));
  AlignmentGeometryAttribute start(double start) =>
      builder(AligmentDirectionalDto(start: start));

  AlignmentGeometryAttribute only({double? y, double? x, double? start}) {
    assert(x == null || start == null, 'Cannot have both x and start');

    return start == null
        ? builder(AlignmentDto(x: x, y: y))
        : builder(AligmentDirectionalDto(start: start, y: y));
  }

  AlignmentGeometryAttribute call(AlignmentGeometry value) =>
      builder(value.toDto());
}
