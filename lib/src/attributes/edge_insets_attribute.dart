// ignore_for_file: avoid-shadowing

import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

@immutable
abstract class EdgeInsetsGeometryAttribute<
        T extends EdgeInsetsGeometryAttribute<T>>
    extends VisualAttribute<EdgeInsetsGeometry> {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  // Directional
  final double? start;
  final double? end;

  final bool isDirectional;

  const EdgeInsetsGeometryAttribute({
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.start,
    this.end,
    this.isDirectional = false,
  });

  T Function({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
    bool isDirectional,
  }) get createFactory;

  T get toDirectional => copyWith(isDirectional: true);

  T fromEdgeInsets(EdgeInsetsGeometry edgeInsets) {
    if (edgeInsets is EdgeInsetsDirectional) {
      return createFactory(
        bottom: edgeInsets.bottom,
        end: edgeInsets.end,
        isDirectional: true,
        start: edgeInsets.start,
        top: edgeInsets.top,
      );
    }

    if (edgeInsets is EdgeInsets) {
      return createFactory(
        bottom: edgeInsets.bottom,
        left: edgeInsets.left,
        right: edgeInsets.right,
        top: edgeInsets.top,
      );
    }

    throw UnimplementedError();
  }

  T copyWith({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
    bool isDirectional = false,
  }) {
    return createFactory(
      bottom: bottom ?? this.bottom,
      end: end ?? this.end,
      isDirectional: isDirectional,
      left: left ?? this.left,
      right: right ?? this.right,
      start: start ?? this.start,
      top: top ?? this.top,
    );
  }

  @override
  T merge(T? other) {
    if (other == null) return this as T;

    if (other.isDirectional != isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional edgeinsets attributes",
      );
    }

    return copyWith(
      top: other.top ?? top,
      bottom: other.bottom ?? bottom,
      left: other.left ?? left,
      right: other.right ?? right,
      start: other.start ?? start,
      end: other.end ?? end,
    );
  }

  @override
  EdgeInsetsGeometry resolve(MixData mix) {
    const defaultValue = EdgeInsets.zero;
    const defalutDirectionalvalue = EdgeInsetsDirectional.zero;

    return isDirectional
        ? EdgeInsetsDirectional.only(
            start: start ?? defalutDirectionalvalue.start,
            top: top ?? defalutDirectionalvalue.top,
            end: end ?? defalutDirectionalvalue.end,
            bottom: bottom ?? defalutDirectionalvalue.bottom,
          )
        : EdgeInsets.only(
            left: left ?? defaultValue.left,
            top: top ?? defaultValue.top,
            right: right ?? defaultValue.right,
            bottom: bottom ?? defaultValue.bottom,
          );
  }

  @override
  get props => [top, bottom, left, right, start, end];
}

@immutable
abstract class SpacingGeometryAttribute<T extends SpacingGeometryAttribute<T>>
    extends EdgeInsetsGeometryAttribute<T> {
  const SpacingGeometryAttribute({
    super.top,
    super.bottom,
    super.left,
    super.right,
    super.start,
    super.end,
    super.isDirectional = false,
  });

  @override
  EdgeInsetsGeometry resolve(MixData mix) {
    const defaultValue = EdgeInsets.zero;
    const defalutDirectionalvalue = EdgeInsetsDirectional.zero;

    return isDirectional
        ? EdgeInsetsDirectional.only(
            start: start ?? defalutDirectionalvalue.start,
            top: top ?? defalutDirectionalvalue.top,
            end: end ?? defalutDirectionalvalue.end,
            bottom: bottom ?? defalutDirectionalvalue.bottom,
          )
        : EdgeInsets.only(
            left: left ?? defaultValue.left,
            top: top ?? defaultValue.top,
            right: right ?? defaultValue.right,
            bottom: bottom ?? defaultValue.bottom,
          );
  }
}

@immutable
class SpacingDataFactory<T extends SpacingGeometryAttribute<T>> {
  final T Function({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
    bool isDirectional,
  }) create;

  const SpacingDataFactory(this.create);

  T all(double all) {
    return create(
      bottom: all,
      end: all,
      left: all,
      right: all,
      start: all,
      top: all,
    );
  }

  T symmetric({double? vertical, double? horizontal}) {
    return create(
      bottom: vertical,
      end: horizontal,
      left: horizontal,
      right: horizontal,
      start: horizontal,
      top: vertical,
    );
  }

  T fromEdgeInsets(EdgeInsetsGeometry edgeInsets) {
    if (edgeInsets is EdgeInsetsDirectional) {
      return create(
        bottom: edgeInsets.bottom,
        end: edgeInsets.end,
        isDirectional: true,
        start: edgeInsets.start,
        top: edgeInsets.top,
      );
    }

    if (edgeInsets is EdgeInsets) {
      return create(
        bottom: edgeInsets.bottom,
        left: edgeInsets.left,
        right: edgeInsets.right,
        top: edgeInsets.top,
      );
    }

    throw UnimplementedError();
  }

  T positional(double p1, [double? p2, double? p3, double? p4]) {
    double top = p1;
    double bottom = p1;
    double left = p1;
    double right = p1;

    if (p2 != null) {
      left = p2;
      right = p2;
    }

    if (p3 != null) bottom = p3;
    if (p4 != null) right = p4;

    return create(
      bottom: bottom,
      end: right,
      left: left,
      right: right,
      start: left,
      top: top,
    );
  }
}

@immutable
class PaddingAttribute extends SpacingGeometryAttribute<PaddingAttribute> {
  @override
  final createFactory = PaddingAttribute.new;

  const PaddingAttribute({
    super.top,
    super.bottom,
    super.left,
    super.right,
    super.start,
    super.end,
    super.isDirectional = false,
  });
}

@immutable
class MarginAttribute extends SpacingGeometryAttribute<MarginAttribute> {
  @override
  final createFactory = MarginAttribute.new;

  const MarginAttribute({
    super.top,
    super.bottom,
    super.left,
    super.right,
    super.start,
    super.end,
    super.isDirectional = false,
  });
}
