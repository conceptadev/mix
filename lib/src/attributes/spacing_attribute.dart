// ignore_for_file: unnecessary_overrides, prefer-moving-to-variable

import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';

/// Represents a function that can be used to build a [SpacingAttribute].
///
/// Matches SpacingAttribute.new
typedef SpacingAttributeBuilder<T extends SpacingAttribute> = T Function({
  double? top,
  double? bottom,
  double? left,
  double? right,
  double? start,
  double? end,
});

@immutable
abstract class SpacingAttribute
    extends ResolvableAttribute<SpacingAttribute, EdgeInsetsGeometry>
    with SingleChildRenderAttributeMixin<Padding> {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  // Directional
  final double? start;
  final double? end;

  const SpacingAttribute({
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.start,
    this.end,
  });

  bool get isDirectional => start != null || end != null;

  @override
  SpacingAttribute merge(covariant SpacingAttribute? other);

  @override
  EdgeInsetsGeometry resolve(MixData mix) {
    return isDirectional
        ? EdgeInsetsDirectional.only(
            start: mix.tokens.spaceTokenRef(start ?? 0),
            top: mix.tokens.spaceTokenRef(top ?? 0),
            end: mix.tokens.spaceTokenRef(end ?? 0),
            bottom: mix.tokens.spaceTokenRef(bottom ?? 0),
          )
        : EdgeInsets.only(
            left: mix.tokens.spaceTokenRef(left ?? 0),
            top: mix.tokens.spaceTokenRef(top ?? 0),
            right: mix.tokens.spaceTokenRef(right ?? 0),
            bottom: mix.tokens.spaceTokenRef(bottom ?? 0),
          );
  }

  @override
  get props => [top, bottom, left, right, start, end];

  @override
  Padding build(MixData mix, Widget child) {
    return Padding(padding: resolve(mix), child: child);
  }
}

@immutable
class PaddingAttribute extends SpacingAttribute {
  const PaddingAttribute({
    super.top,
    super.bottom,
    super.left,
    super.right,
    super.start,
    super.end,
  });

  @override
  PaddingAttribute merge(PaddingAttribute? other) {
    return other == null
        ? this
        : PaddingAttribute(
            top: other.top ?? top,
            bottom: other.bottom ?? bottom,
            left: other.left ?? left,
            right: other.right ?? right,
            start: other.start ?? start,
            end: other.end ?? end,
          );
  }
}

@immutable
class MarginAttribute extends SpacingAttribute {
  const MarginAttribute({
    super.top,
    super.bottom,
    super.left,
    super.right,
    super.start,
    super.end,
  });

  @override
  MarginAttribute merge(MarginAttribute? other) {
    return other == null
        ? this
        : MarginAttribute(
            top: other.top ?? top,
            bottom: other.bottom ?? bottom,
            left: other.left ?? left,
            right: other.right ?? right,
            start: other.start ?? start,
            end: other.end ?? end,
          );
  }
}
