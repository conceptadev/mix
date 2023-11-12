// ignore_for_file: avoid-shadowing

import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

@immutable
abstract class SpaceGeometryAttribute<T extends EdgeInsetsGeometry>
    extends VisualAttribute<T> {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  // Directional
  final double? start;
  final double? end;

  const SpaceGeometryAttribute({
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.start,
    this.end,
  });

  @override
  SpaceGeometryAttribute<T> merge(
    covariant SpaceGeometryAttribute<T>? other,
  );

  @override
  T resolve(MixData mix) {
    final top = this.top ?? 0;
    final bottom = this.bottom ?? 0;

    if (this is SpaceAttribute) {
      final left = this.left ?? 0;
      final right = this.right ?? 0;

      return EdgeInsets.only(
        left: mix.resolver.spaceTokenRef(left),
        top: mix.resolver.spaceTokenRef(top),
        right: mix.resolver.spaceTokenRef(right),
        bottom: mix.resolver.spaceTokenRef(bottom),
      ) as T;
    } else if (this is SpaceDirectionalAttribute) {
      final start = this.start ?? 0;
      final end = this.end ?? 0;

      return EdgeInsetsDirectional.only(
        start: mix.resolver.spaceTokenRef(start),
        top: mix.resolver.spaceTokenRef(top),
        end: mix.resolver.spaceTokenRef(end),
        bottom: mix.resolver.spaceTokenRef(bottom),
      ) as T;
    }
    throw UnsupportedError(
      'SpaceGeometryAttribute must be either SpaceAttribute or SpaceDirectionalAttribute',
    );
  }

  @override
  get props => [top, bottom, left, right, start, end];
}

@immutable
abstract class SpaceAttribute extends SpaceGeometryAttribute<EdgeInsets> {
  const SpaceAttribute({super.top, super.bottom, super.left, super.right});

  @override
  SpaceAttribute merge(covariant SpaceAttribute? other);
}

@immutable
abstract class SpaceDirectionalAttribute
    extends SpaceGeometryAttribute<EdgeInsetsDirectional> {
  const SpaceDirectionalAttribute({
    super.top,
    super.bottom,
    super.start,
    super.end,
  });

  @override
  SpaceDirectionalAttribute merge(covariant SpaceDirectionalAttribute? other);
}

@immutable
abstract class PaddingGeometryAttribute<T extends EdgeInsetsGeometry>
    extends SpaceGeometryAttribute<T> {
  const PaddingGeometryAttribute({
    super.top,
    super.bottom,
    super.left,
    super.right,
    super.start,
    super.end,
  });

  @override
  PaddingGeometryAttribute<T> merge(
    covariant PaddingGeometryAttribute<T>? other,
  );
}

@immutable
class PaddingAttribute extends PaddingGeometryAttribute<EdgeInsets>
    implements SpaceAttribute {
  const PaddingAttribute({super.top, super.bottom, super.left, super.right});

  @override
  PaddingAttribute merge(PaddingAttribute? other) {
    return PaddingAttribute(
      top: other?.top ?? top,
      bottom: other?.bottom ?? bottom,
      left: other?.left ?? left,
      right: other?.right ?? right,
    );
  }
}

@immutable
class PaddingDirectionalAttribute
    extends PaddingGeometryAttribute<EdgeInsetsDirectional>
    implements SpaceDirectionalAttribute {
  const PaddingDirectionalAttribute({
    super.top,
    super.bottom,
    super.start,
    super.end,
  });

  @override
  PaddingDirectionalAttribute merge(PaddingDirectionalAttribute? other) {
    return PaddingDirectionalAttribute(
      top: other?.top ?? top,
      bottom: other?.bottom ?? bottom,
      start: other?.start ?? start,
      end: other?.end ?? end,
    );
  }
}

@immutable
abstract class MarginGeometryAttribute<T extends EdgeInsetsGeometry>
    extends SpaceGeometryAttribute<T> {
  const MarginGeometryAttribute({
    super.top,
    super.bottom,
    super.left,
    super.right,
    super.start,
    super.end,
  });

  @override
  MarginGeometryAttribute<T> merge(covariant MarginGeometryAttribute<T>? other);
}

@immutable
class MarginAttribute extends MarginGeometryAttribute<EdgeInsets>
    implements SpaceAttribute {
  const MarginAttribute({super.top, super.bottom, super.left, super.right});

  @override
  MarginAttribute merge(MarginAttribute? other) {
    return MarginAttribute(
      top: other?.top ?? top,
      bottom: other?.bottom ?? bottom,
      left: other?.left ?? left,
      right: other?.right ?? right,
    );
  }
}

@immutable
class MarginDirectionalAttribute
    extends MarginGeometryAttribute<EdgeInsetsDirectional>
    implements SpaceDirectionalAttribute {
  const MarginDirectionalAttribute({
    super.top,
    super.bottom,
    super.start,
    super.end,
  });

  @override
  MarginDirectionalAttribute merge(MarginDirectionalAttribute? other) {
    return MarginDirectionalAttribute(
      top: other?.top ?? top,
      bottom: other?.bottom ?? bottom,
      start: other?.start ?? start,
      end: other?.end ?? end,
    );
  }
}

typedef SpaceUtility<T extends SpaceGeometryAttribute> = T Function({
  double? top,
  double? bottom,
  double? left,
  double? right,
});
