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
  T resolve(MixData mix);

  @override
  get props => [top, bottom, left, right, start, end];
}

@immutable
class SpaceAttribute extends SpaceGeometryAttribute<EdgeInsets> {
  const SpaceAttribute({super.top, super.bottom, super.left, super.right});

  @override
  SpaceAttribute merge(SpaceAttribute? other) {
    return SpaceAttribute(
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
class SpaceDirectionalAttribute
    extends SpaceGeometryAttribute<EdgeInsetsDirectional> {
  const SpaceDirectionalAttribute({
    super.top,
    super.bottom,
    super.start,
    super.end,
  });

  @override
  SpaceDirectionalAttribute merge(SpaceDirectionalAttribute? other) {
    return SpaceDirectionalAttribute(
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
class SpaceUtilityFactory<T extends SpaceAttribute> {
  final T Function({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) create;

  const SpaceUtilityFactory(this.create);

  T all(double all) {
    return create(bottom: all, left: all, right: all, top: all);
  }

  T symmetric({double? vertical, double? horizontal}) {
    return create(
      bottom: vertical,
      left: horizontal,
      right: horizontal,
      top: vertical,
    );
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

    return create(bottom: bottom, left: left, right: right, top: top);
  }
}

@immutable
class SpaceDirectionalUtilityFactory<T extends SpaceDirectionalAttribute> {
  final T Function({
    double? top,
    double? bottom,
    double? start,
    double? end,
  }) create;

  const SpaceDirectionalUtilityFactory(this.create);

  T all(double all) {
    return create(bottom: all, end: all, start: all, top: all);
  }

  T symmetric({double? vertical, double? horizontal}) {
    return create(
      bottom: vertical,
      end: horizontal,
      start: horizontal,
      top: vertical,
    );
  }

  T positional(double p1, [double? p2, double? p3]) {
    double top = p1;
    double bottom = p1;
    double start = p1;
    double end = p1;

    if (p2 != null) {
      start = p2;
      end = p2;
    }

    if (p3 != null) bottom = p3;

    return create(bottom: bottom, end: end, start: start, top: top);
  }
}
