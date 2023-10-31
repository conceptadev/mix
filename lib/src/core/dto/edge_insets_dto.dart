import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../attribute.dart';

class EdgeInsetsGeometryData extends Data<EdgeInsetsGeometry> {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  // Directional
  final double? start;
  final double? end;

  final bool isDirectional;

  const EdgeInsetsGeometryData({
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.start,
    this.end,
    this.isDirectional = false,
  });

  const EdgeInsetsGeometryData.all(double all, {this.isDirectional = false})
      : top = all,
        bottom = all,
        left = all,
        right = all,
        start = all,
        end = all;

  const EdgeInsetsGeometryData.symmetric({
    double? vertical,
    double? horizontal,
    this.isDirectional = false,
  })  : top = vertical,
        bottom = vertical,
        left = horizontal,
        right = horizontal,
        start = horizontal,
        end = horizontal;

  @override
  EdgeInsetsGeometryData merge(EdgeInsetsGeometryData? other) {
    if (other == null) return this;

    if (other.isDirectional != isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional edgeinsets attributes",
      );
    }

    return EdgeInsetsGeometryData(
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

class SpacingGeometryData extends EdgeInsetsGeometryData {
  const SpacingGeometryData({
    super.top,
    super.bottom,
    super.left,
    super.right,
    super.start,
    super.end,
    super.isDirectional = false,
  });

  const SpacingGeometryData.all(double all, {super.isDirectional = false})
      : super.all(all);

  factory SpacingGeometryData.positional(
    double p1, [
    double? p2,
    double? p3,
    double? p4,
  ]) {
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

    return SpacingGeometryData(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      start: left,
      end: right,
    );
  }

  const SpacingGeometryData.symmetric({
    double? vertical,
    double? horizontal,
    super.isDirectional = false,
  }) : super.symmetric(vertical: vertical, horizontal: horizontal);

  SpacingGeometryData get toDirectional => copyWith(isDirectional: true);

  SpacingGeometryData copyWith({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
    bool? isDirectional,
  }) {
    return SpacingGeometryData(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      right: right ?? this.right,
      start: start ?? this.start,
      end: end ?? this.end,
      isDirectional: isDirectional ?? this.isDirectional,
    );
  }

  @override
  SpacingGeometryData merge(SpacingGeometryData? other) {
    if (other == null) return this;

    if (other.isDirectional != isDirectional) {
      throw UnsupportedError(
        "Cannot merge directional and non-directional edgeinsets attributes",
      );
    }

    return SpacingGeometryData(
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
}
