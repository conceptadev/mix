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

  SpaceGeometryAttribute<T> create({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  });

  @override
  SpaceGeometryAttribute<T> merge(
    covariant SpaceGeometryAttribute<T>? other,
  ) {
    return create(
      top: other?.top ?? top,
      bottom: other?.bottom ?? bottom,
      left: other?.left ?? left,
      right: other?.right ?? right,
      start: other?.start ?? start,
      end: other?.end ?? end,
    );
  }

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
class SpaceAttribute extends SpaceGeometryAttribute<EdgeInsets> {
  const SpaceAttribute({super.top, super.bottom, super.left, super.right});

  @override
  SpaceAttribute create({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    return SpaceAttribute(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      right: right ?? this.right,
    );
  }
}

@immutable
class SpaceDirectionalAttribute
    extends SpaceGeometryAttribute<EdgeInsetsDirectional> {
  const SpaceDirectionalAttribute({
    super.top,
    super.bottom,
    super.start,
    super.end,
  });

  @override
  SpaceDirectionalAttribute create({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    return SpaceDirectionalAttribute(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }
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
}

@immutable
class PaddingAttribute extends PaddingGeometryAttribute<EdgeInsets>
    implements SpaceAttribute {
  const PaddingAttribute({super.top, super.bottom, super.left, super.right});

  @override
  PaddingAttribute create({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    return PaddingAttribute(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      right: right ?? this.right,
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
  PaddingDirectionalAttribute create({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    return PaddingDirectionalAttribute(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      start: start ?? this.start,
      end: end ?? this.end,
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
}

@immutable
class MarginAttribute extends MarginGeometryAttribute<EdgeInsets>
    implements SpaceAttribute {
  const MarginAttribute({super.top, super.bottom, super.left, super.right});

  @override
  MarginAttribute create({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    return MarginAttribute(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
      right: right ?? this.right,
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
  MarginDirectionalAttribute create({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    return MarginDirectionalAttribute(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }
}
