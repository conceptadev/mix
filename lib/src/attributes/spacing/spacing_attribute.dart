// ignore_for_file: unnecessary_overrides, prefer-moving-to-variable

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'spacing_dto.dart';

@immutable
abstract class SpacingAttribute<Self extends SpacingAttribute<Self>>
    extends DtoAttribute<Self, SpacingDto, EdgeInsetsGeometry>
    with SingleChildRenderAttributeMixin<Padding> {
  const SpacingAttribute(super.value);

  bool get isDirectional => value.isDirectional;

  double? get top => value.top;
  double? get bottom => value.bottom;
  double? get left => value.left;
  double? get right => value.right;
  double? get start => value.start;
  double? get end => value.end;

  @override
  Padding build(MixData mix, Widget child) {
    return Padding(padding: resolve(mix), child: child);
  }
}

@immutable
class PaddingAttribute extends SpacingAttribute<PaddingAttribute> {
  const PaddingAttribute(super.value);

  factory PaddingAttribute.only({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    return PaddingAttribute(
      SpacingDto(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        start: start,
        end: end,
      ),
    );
  }

  static PaddingAttribute from(EdgeInsetsGeometry edgeInsets) {
    return PaddingAttribute(SpacingDto.from(edgeInsets));
  }

  static PaddingAttribute? maybeFrom(EdgeInsetsGeometry? edgeInsets) {
    return edgeInsets == null ? null : from(edgeInsets);
  }

  @override
  PaddingAttribute merge(PaddingAttribute? other) {
    return other == null ? this : PaddingAttribute(value.merge(other.value));
  }
}

@immutable
class MarginAttribute extends SpacingAttribute<MarginAttribute> {
  const MarginAttribute(super.value);

  factory MarginAttribute.only({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    return MarginAttribute(
      SpacingDto(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        start: start,
        end: end,
      ),
    );
  }

  static MarginAttribute from(EdgeInsetsGeometry edgeInsets) {
    return MarginAttribute(SpacingDto.from(edgeInsets));
  }

  static MarginAttribute? maybeFrom(EdgeInsetsGeometry? edgeInsets) {
    return edgeInsets == null ? null : from(edgeInsets);
  }

  @override
  MarginAttribute merge(MarginAttribute? other) {
    return other == null ? this : MarginAttribute(value.merge(other.value));
  }
}
