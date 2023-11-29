// ignore_for_file: unnecessary_overrides, prefer-moving-to-variable

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'edge_insets_dto.dart';
import 'spacing_dto.dart';

/// Represents a function that can be used to build a [SpacingAttribute].
///
/// Matches SpacingAttribute.new
typedef SpacingAttributeBuilder<T extends SpacingAttribute<T>> = T Function(
  EdgeInsetsGeometryDto value,
);

@immutable
abstract class SpacingAttribute<Self extends SpacingAttribute<Self>>
    extends ResolvableAttribute<Self, EdgeInsetsGeometry>
    with SingleChildRenderAttributeMixin<Padding> {
  final EdgeInsetsGeometryDto value;

  const SpacingAttribute(this.value);

  bool get isDirectional => value.isDirectional;

  double? get top => value.top;
  double? get bottom => value.bottom;
  double? get left => value.left;
  double? get right => value.right;
  double? get start => value.start;
  double? get end => value.end;

  @override
  Self merge(Self? other);

  @override
  EdgeInsetsGeometry resolve(MixData mix) => value.resolve(mix);

  @override
  get props => [value];

  @override
  Padding build(MixData mix, Widget child) {
    return Padding(padding: resolve(mix), child: child);
  }
}

@immutable
class PaddingAttribute extends SpacingAttribute<PaddingAttribute> {
  const PaddingAttribute.raw(super.value);

  factory PaddingAttribute.only({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    return PaddingAttribute.raw(
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
    return PaddingAttribute.raw(SpacingDto.from(edgeInsets));
  }

  static PaddingAttribute? maybeFrom(EdgeInsetsGeometry? edgeInsets) {
    return edgeInsets == null ? null : from(edgeInsets);
  }

  @override
  PaddingAttribute merge(PaddingAttribute? other) {
    return other == null
        ? this
        : PaddingAttribute.raw(value.merge(other.value));
  }
}

@immutable
class MarginAttribute extends SpacingAttribute<MarginAttribute> {
  const MarginAttribute.raw(super.value);

  factory MarginAttribute.only({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    return MarginAttribute.raw(
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
    return MarginAttribute.raw(SpacingDto.from(edgeInsets));
  }

  static MarginAttribute? maybeFrom(EdgeInsetsGeometry? edgeInsets) {
    return edgeInsets == null ? null : from(edgeInsets);
  }

  @override
  MarginAttribute merge(MarginAttribute? other) {
    return other == null ? this : MarginAttribute.raw(value.merge(other.value));
  }
}
