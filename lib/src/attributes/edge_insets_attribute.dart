import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

@immutable
abstract class EdgeInsetsGeometryAttribute<
        Self extends EdgeInsetsGeometryAttribute<Self, Value>,
        Value extends EdgeInsetsGeometry> extends DtoStyleAttribute
    with Resolver<Value> {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  // Directional
  final double? start;
  final double? end;

  const EdgeInsetsGeometryAttribute({
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.start,
    this.end,
  });

  @override
  get props => [top, bottom, left, right, start, end];
}

@immutable
class EdgeInsetsAttribute
    extends EdgeInsetsGeometryAttribute<EdgeInsetsAttribute, EdgeInsets> {
  const EdgeInsetsAttribute({
    super.top,
    super.bottom,
    super.left,
    super.right,
  });

  @override
  EdgeInsetsAttribute merge(EdgeInsetsAttribute? other) {
    return EdgeInsetsAttribute(
      top: other?.top ?? top,
      bottom: other?.bottom ?? bottom,
      left: other?.left ?? left,
      right: other?.right ?? right,
    );
  }

  @override
  EdgeInsets resolve(MixData mix) {
    return EdgeInsets.only(
      left: left ?? 0,
      top: top ?? 0,
      right: right ?? 0,
      bottom: bottom ?? 0,
    );
  }
}

@immutable
class EdgeInsetsDirectionalAttribute extends EdgeInsetsGeometryAttribute<
    EdgeInsetsDirectionalAttribute, EdgeInsetsDirectional> {
  const EdgeInsetsDirectionalAttribute({
    super.top,
    super.bottom,
    super.start,
    super.end,
  });

  @override
  EdgeInsetsDirectionalAttribute merge(EdgeInsetsDirectionalAttribute? other) {
    return EdgeInsetsDirectionalAttribute(
      top: other?.top ?? top,
      bottom: other?.bottom ?? bottom,
      start: other?.start ?? start,
      end: other?.end ?? end,
    );
  }

  @override
  EdgeInsetsDirectional resolve(MixData mix) {
    return EdgeInsetsDirectional.only(
      start: start ?? 0,
      top: top ?? 0,
      end: end ?? 0,
      bottom: bottom ?? 0,
    );
  }
}
