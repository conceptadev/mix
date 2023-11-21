import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

@immutable
abstract class EdgeInsetsGeometryDto<Value extends EdgeInsetsGeometry>
    extends Dto<Value> {
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

  static EdgeInsetsGeometryDto? from(EdgeInsetsGeometry? value) {
    if (value == null) return null;

    if (value is EdgeInsets) {
      return EdgeInsetsDto(
        top: value.top,
        bottom: value.bottom,
        left: value.left,
        right: value.right,
      );
    }

    if (value is EdgeInsetsDirectional) {
      return EdgeInsetsDirectionalDto(
        top: value.top,
        bottom: value.bottom,
        start: value.start,
        end: value.end,
      );
    }

    throw UnimplementedError('Cannot convert $value to EdgeInsetsDto');
  }

  @override
  EdgeInsetsGeometryDto merge(covariant EdgeInsetsGeometryDto? other);

  @override
  get props => [top, bottom, left, right, start, end];
}

@immutable
class EdgeInsetsDto extends EdgeInsetsGeometryDto<EdgeInsets> {
  const EdgeInsetsDto({super.top, super.bottom, super.left, super.right});

  @override
  EdgeInsetsDto merge(EdgeInsetsDto? other) {
    return EdgeInsetsDto(
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
class EdgeInsetsDirectionalDto
    extends EdgeInsetsGeometryDto<EdgeInsetsDirectional> {
  const EdgeInsetsDirectionalDto({
    super.top,
    super.bottom,
    super.start,
    super.end,
  });

  @override
  EdgeInsetsDirectionalDto merge(EdgeInsetsDirectionalDto? other) {
    return EdgeInsetsDirectionalDto(
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

@immutable
abstract class EdgeInsetsGeometryAttribute<
    T extends EdgeInsetsGeometryDto<Value>,
    Value extends EdgeInsetsGeometry> extends ResolvableAttribute<T, Value> {
  const EdgeInsetsGeometryAttribute(super.value);
}

@immutable
class EdgeInsetsAttribute
    extends EdgeInsetsGeometryAttribute<EdgeInsetsDto, EdgeInsets> {
  const EdgeInsetsAttribute(super.value);

  @override
  EdgeInsetsAttribute merge(EdgeInsetsAttribute? other) {
    return EdgeInsetsAttribute(value.merge(other?.value));
  }
}

@immutable
class EdgeInsetsDirectionalAttribute extends EdgeInsetsGeometryAttribute<
    EdgeInsetsDirectionalDto, EdgeInsetsDirectional> {
  const EdgeInsetsDirectionalAttribute(super.value);

  @override
  EdgeInsetsDirectionalAttribute merge(
    EdgeInsetsDirectionalAttribute? other,
  ) {
    return EdgeInsetsDirectionalAttribute(value.merge(other?.value));
  }
}
