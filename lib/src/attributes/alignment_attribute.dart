import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

@immutable
abstract class AlignmentGeometryAttribute<T extends AlignmentGeometry>
    extends VisualAttribute<T> {
  final double? start;
  final double? x;
  final double? y;

  const AlignmentGeometryAttribute({this.start, this.x, this.y});

  @override
  AlignmentGeometryAttribute<T> merge(
    covariant AlignmentGeometryAttribute<T>? other,
  );

  @override
  T resolve(MixData mix);

  @override
  get props => [start, x, y];
}

@immutable
class AlignmentAttribute extends AlignmentGeometryAttribute<Alignment> {
  const AlignmentAttribute({super.x, super.y});

  @override
  AlignmentAttribute merge(AlignmentAttribute? other) {
    return AlignmentAttribute(x: other?.x ?? x, y: other?.y ?? y);
  }

  @override
  Alignment resolve(MixData mix) {
    return Alignment(x ?? 0, y ?? 0);
  }
}

@immutable
class AlignmentDirectionalAttribute
    extends AlignmentGeometryAttribute<AlignmentDirectional> {
  const AlignmentDirectionalAttribute({super.start, super.y});
  @override
  AlignmentDirectionalAttribute merge(AlignmentDirectionalAttribute? other) {
    return AlignmentDirectionalAttribute(
      start: other?.start ?? start,
      y: other?.y ?? y,
    );
  }

  @override
  AlignmentDirectional resolve(MixData mix) =>
      AlignmentDirectional(start ?? 0, y ?? 0);
}
