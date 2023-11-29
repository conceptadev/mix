// ignore_for_file: unnecessary_overrides, prefer-moving-to-variable

import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';

/// Represents a function that can be used to build a [SpacingAttribute].
///
/// Matches SpacingAttribute.new
typedef SpacingAttributeBuilder<T extends SpacingAttribute<T>> = T Function({
  double? top,
  double? bottom,
  double? left,
  double? right,
  double? start,
  double? end,
});

@immutable
abstract class SpacingAttribute<Self extends SpacingAttribute<Self>>
    extends ResolvableAttribute<Self, EdgeInsetsGeometry>
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
  Self merge(Self? other);

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
class PaddingAttribute extends SpacingAttribute<PaddingAttribute> {
  const PaddingAttribute({
    super.top,
    super.bottom,
    super.left,
    super.right,
    super.start,
    super.end,
  });

  static PaddingAttribute from(EdgeInsetsGeometry edgeInsets) {
    if (edgeInsets is EdgeInsetsDirectional) {
      return PaddingAttribute(
        top: edgeInsets.top,
        bottom: edgeInsets.bottom,
        start: edgeInsets.start,
        end: edgeInsets.end,
      );
    } else if (edgeInsets is EdgeInsets) {
      return PaddingAttribute(
        top: edgeInsets.top,
        bottom: edgeInsets.bottom,
        left: edgeInsets.left,
        right: edgeInsets.right,
      );
    }

    throw ArgumentError.value(
      edgeInsets,
      'edgeInsets',
      'Must be either EdgeInsets or EdgeInsetsDirectional',
    );
  }

  static PaddingAttribute? maybeFrom(EdgeInsetsGeometry? edgeInsets) {
    return edgeInsets == null ? null : from(edgeInsets);
  }

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
class MarginAttribute extends SpacingAttribute<MarginAttribute> {
  const MarginAttribute({
    super.top,
    super.bottom,
    super.left,
    super.right,
    super.start,
    super.end,
  });

  static MarginAttribute from(EdgeInsetsGeometry edgeInsets) {
    if (edgeInsets is EdgeInsetsDirectional) {
      return MarginAttribute(
        top: edgeInsets.top,
        bottom: edgeInsets.bottom,
        start: edgeInsets.start,
        end: edgeInsets.end,
      );
    } else if (edgeInsets is EdgeInsets) {
      return MarginAttribute(
        top: edgeInsets.top,
        bottom: edgeInsets.bottom,
        left: edgeInsets.left,
        right: edgeInsets.right,
      );
    }

    throw ArgumentError.value(
      edgeInsets,
      'edgeInsets',
      'Must be either EdgeInsets or EdgeInsetsDirectional',
    );
  }

  static MarginAttribute? maybeFrom(EdgeInsetsGeometry? edgeInsets) {
    return edgeInsets == null ? null : from(edgeInsets);
  }

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
