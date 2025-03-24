// ignore_for_file: prefer_relative_imports, avoid-importing-entrypoint-exports
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../internal/diagnostic_properties_builder_ext.dart';
import '../../internal/mix_error.dart';

part 'edge_insets_dto.g.dart';

@Deprecated('Use EdgeInsetsGeometryDto instead')
typedef SpacingDto = EdgeInsetsGeometryMix<EdgeInsetsGeometry>;

@immutable
sealed class EdgeInsetsGeometryMix<T extends EdgeInsetsGeometry>
    extends Mixable<T> {
  final double? top;
  final double? bottom;

  const EdgeInsetsGeometryMix({this.top, this.bottom});

  static EdgeInsetsGeometryMix only({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    final isDirectional = start != null || end != null;
    final isNotDirectional = left != null || right != null;

    assert(
      (!isDirectional && !isNotDirectional) ||
          isDirectional == !isNotDirectional,
      'Cannot provide both directional and non-directional values',
    );
    if (start != null || end != null) {
      return EdgeInsetsDirectionalMix(
        top: top,
        bottom: bottom,
        start: start,
        end: end,
      );
    }

    return EdgeInsetsMix(top: top, bottom: bottom, left: left, right: right);
  }

  static EdgeInsetsGeometryMix? tryToMerge(
    EdgeInsetsGeometryMix? a,
    EdgeInsetsGeometryMix? b,
  ) {
    if (b == null) return a;
    if (a == null) return b;

    return a.runtimeType == b.runtimeType ? a.merge(b) : _exhaustiveMerge(a, b);
  }

  static B _exhaustiveMerge<A extends EdgeInsetsGeometryMix,
      B extends EdgeInsetsGeometryMix>(A a, B b) {
    if (a.runtimeType == b.runtimeType) return a.merge(b) as B;

    return switch (b) {
      (EdgeInsetsMix g) => a._asEdgeInset().merge(g) as B,
      (EdgeInsetsDirectionalMix g) => a._asEdgeInsetDirectional().merge(g) as B,
    };
  }

  EdgeInsetsMix _asEdgeInset() {
    if (this is EdgeInsetsMix) return this as EdgeInsetsMix;

    return EdgeInsetsMix(top: top, bottom: bottom);
  }

  EdgeInsetsDirectionalMix _asEdgeInsetDirectional() {
    if (this is EdgeInsetsDirectionalMix) {
      return this as EdgeInsetsDirectionalMix;
    }

    return EdgeInsetsDirectionalMix(top: top, bottom: bottom);
  }

  @override
  EdgeInsetsGeometryMix<T> merge(covariant EdgeInsetsGeometryMix<T>? other);
}

@MixableProperty()
final class EdgeInsetsMix extends EdgeInsetsGeometryMix<EdgeInsets>
    with _$EdgeInsetsMix, Diagnosticable {
  final double? left;
  final double? right;

  const EdgeInsetsMix({super.top, super.bottom, this.left, this.right});

  const EdgeInsetsMix.all(double value)
      : this(top: value, bottom: value, left: value, right: value);

  const EdgeInsetsMix.none() : this.all(0);

  @override
  EdgeInsets resolve(MixData mix) {
    return EdgeInsets.only(
      left: mix.tokens.spaceTokenRef(left ?? 0),
      top: mix.tokens.spaceTokenRef(top ?? 0),
      right: mix.tokens.spaceTokenRef(right ?? 0),
      bottom: mix.tokens.spaceTokenRef(bottom ?? 0),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.addUsingDefault('top', top);
    properties.addUsingDefault('bottom', bottom);
    properties.addUsingDefault('left', left);
    properties.addUsingDefault('right', right);
  }
}

@MixableProperty()
final class EdgeInsetsDirectionalMix
    extends EdgeInsetsGeometryMix<EdgeInsetsDirectional>
    with _$EdgeInsetsDirectionalMix {
  final double? start;
  final double? end;

  const EdgeInsetsDirectionalMix.all(double value)
      : this(top: value, bottom: value, start: value, end: value);

  const EdgeInsetsDirectionalMix.none() : this.all(0);

  const EdgeInsetsDirectionalMix({
    super.top,
    super.bottom,
    this.start,
    this.end,
  });

  @override
  EdgeInsetsDirectional resolve(MixData mix) {
    return EdgeInsetsDirectional.only(
      start: mix.tokens.spaceTokenRef(start ?? 0),
      top: mix.tokens.spaceTokenRef(top ?? 0),
      end: mix.tokens.spaceTokenRef(end ?? 0),
      bottom: mix.tokens.spaceTokenRef(bottom ?? 0),
    );
  }
}

extension EdgeInsetsGeometryExt on EdgeInsetsGeometry {
  EdgeInsetsGeometryMix toDto() {
    final self = this;
    if (self is EdgeInsetsDirectional) return self.toDto();
    if (self is EdgeInsets) return self.toDto();

    throw MixError.unsupportedTypeInDto(
      EdgeInsetsGeometry,
      ['EdgeInsetsDirectional', 'EdgeInsets'],
    );
  }
}
