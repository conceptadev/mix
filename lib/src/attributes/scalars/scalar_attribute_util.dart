import 'package:flutter/material.dart';

import '../color/color_util.dart';
import 'scalar_util.dart';
import 'scalars_attribute.dart';

@immutable
class AlignmentGeometryAttributeUtility
    extends AlignmentUtility<AlignmentGeometryAttribute>
    with CallableUtilityMixin<AlignmentGeometryAttribute, AlignmentGeometry> {
  const AlignmentGeometryAttributeUtility()
      : super(AlignmentGeometryAttribute.new);
}

@immutable
class ClipBehaviorAttributeUtility extends ClipUtility<ClipBehaviorAttribute>
    with CallableUtilityMixin<ClipBehaviorAttribute, Clip> {
  const ClipBehaviorAttributeUtility() : super(ClipBehaviorAttribute.new);
}

@immutable
class TransformAttributeUtility extends Matrix4Utility<TransformAttribute>
    with CallableUtilityMixin<TransformAttribute, Matrix4> {
  const TransformAttributeUtility() : super(TransformAttribute.new);
}

@immutable
class AxisAttributeUtility extends AxisUtility<AxisAttribute>
    with CallableUtilityMixin<AxisAttribute, Axis> {
  const AxisAttributeUtility() : super(AxisAttribute.new);
}

@immutable
class BackgroundColorAttributeUtility
    extends ColorUtility<BackgroundColorAttribute> {
  const BackgroundColorAttributeUtility() : super(BackgroundColorAttribute.new);
}
