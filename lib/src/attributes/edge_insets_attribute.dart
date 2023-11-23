import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';

@immutable
abstract class EdgeInsetsGeometryAttribute<Value extends EdgeInsetsGeometry>
    extends ResolvableAttribute<Value> {
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

  static EdgeInsetsGeometryAttribute? from(EdgeInsetsGeometry? value) {
    if (value == null) return null;

    if (value is EdgeInsets) {
      return EdgeInsetsAttribute(
        top: value.top,
        bottom: value.bottom,
        left: value.left,
        right: value.right,
      );
    }

    if (value is EdgeInsetsDirectional) {
      return EdgeInsetsDirectionalAttribute(
        top: value.top,
        bottom: value.bottom,
        start: value.start,
        end: value.end,
      );
    }

    throw UnimplementedError('Cannot convert $value to EdgeInsetsDto');
  }

  @override
  EdgeInsetsGeometryAttribute<Value> merge(
    covariant EdgeInsetsGeometryAttribute<Value>? other,
  );

  @override
  get props => [top, bottom, left, right, start, end];
}

@immutable
class EdgeInsetsAttribute extends EdgeInsetsGeometryAttribute<EdgeInsets> {
  const EdgeInsetsAttribute({super.top, super.bottom, super.left, super.right});

  factory EdgeInsetsAttribute.all(double value) {
    return EdgeInsetsAttribute(
      top: value,
      bottom: value,
      left: value,
      right: value,
    );
  }

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
class EdgeInsetsDirectionalAttribute
    extends EdgeInsetsGeometryAttribute<EdgeInsetsDirectional> {
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
