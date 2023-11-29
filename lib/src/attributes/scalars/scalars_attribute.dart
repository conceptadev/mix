import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/attribute.dart';

@immutable
abstract class ScalarAttribute<Self extends ScalarAttribute<Self, Value>, Value>
    extends StyleAttribute {
  final Value value;
  const ScalarAttribute(this.value);

  @override
  Type get type => Self;

  @override
  get props => [value];
}

@immutable
class AxisAttribute extends ScalarAttribute<AxisAttribute, Axis> {
  const AxisAttribute(super.value);

  static AxisAttribute? maybeFrom(Axis? value) =>
      value == null ? null : AxisAttribute(value);
}

@immutable
class TransformAttribute extends ScalarAttribute<TransformAttribute, Matrix4>
    with SingleChildRenderAttributeMixin<Transform> {
  const TransformAttribute(super.value);

  static TransformAttribute? maybeFrom(Matrix4? value) =>
      value == null ? null : TransformAttribute(value);

  @override
  Transform build(mix, child) {
    return Transform(transform: value, child: child);
  }
}

@immutable
class AlignmentGeometryAttribute
    extends ScalarAttribute<AlignmentGeometryAttribute, AlignmentGeometry>
    with SingleChildRenderAttributeMixin<Align> {
  const AlignmentGeometryAttribute(super.value);

  static AlignmentGeometryAttribute? maybeFrom(AlignmentGeometry? value) =>
      value == null ? null : AlignmentGeometryAttribute(value);

  @override
  Align build(mix, child) {
    return Align(alignment: value, child: child);
  }
}

@immutable
class ClipBehaviorAttribute
    extends ScalarAttribute<ClipBehaviorAttribute, Clip> {
  const ClipBehaviorAttribute(super.value);

  static ClipBehaviorAttribute? maybeFrom(Clip? value) =>
      value == null ? null : ClipBehaviorAttribute(value);
}
