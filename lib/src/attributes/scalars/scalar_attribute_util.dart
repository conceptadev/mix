import 'package:flutter/material.dart';

import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../constraints/constraints_attribute.dart';
import '../spacing/spacing_attribute.dart';
import '../spacing/spacing_dto.dart';
import '../spacing/spacing_util.dart';
import 'scalar_util.dart';
import 'scalars_attribute.dart';

@immutable
class AlignmentGeometryAttributeUtility<T> extends AlignmentUtility<T>
    with CallableUtilityMixin<T, AlignmentGeometry> {
  static const selfBuilder =
      AlignmentGeometryAttributeUtility(AlignmentGeometryAttribute.new);
  const AlignmentGeometryAttributeUtility(super.builder);
}

@immutable
class ClipBehaviorAttributeUtility<T> extends ClipUtility<T>
    with CallableUtilityMixin<T, Clip> {
  static const selfBuilder =
      ClipBehaviorAttributeUtility(ClipBehaviorAttribute.new);
  const ClipBehaviorAttributeUtility(super.builder);
}

@immutable
class TransformAttributeUtility<T> extends Matrix4Utility<T>
    with CallableUtilityMixin<T, Matrix4> {
  static const selfBuilder = TransformAttributeUtility(TransformAttribute.new);
  const TransformAttributeUtility(super.builder);
}

@immutable
class AxisAttributeUtility<T> extends AxisUtility<T>
    with CallableUtilityMixin<T, Axis> {
  static const selfBuilder = AxisAttributeUtility(AxisAttribute.new);
  const AxisAttributeUtility(super.builder);
}

@immutable
class BackgroundColorAttributeUtility<T> extends ColorUtility<T> {
  static const selfBuilder =
      BackgroundColorAttributeUtility(BackgroundColorAttribute.new);
  const BackgroundColorAttributeUtility(super.builder);

  T call(Color color) => builder(ColorDto(color));
}

typedef SpacingUtilityBuilder<T extends SpacingAttribute<T>> = T Function(
  SpacingDto dto,
);

@immutable
class PaddingAttributeUtility<T> extends SpacingUtility<T> {
  static const selfBuilder = PaddingAttributeUtility(PaddingAttribute.raw);
  const PaddingAttributeUtility(super.builder);
}

@immutable
class MarginAttributeUtility<T> extends SpacingUtility<T> {
  static const selfBuilder = MarginAttributeUtility(MarginAttribute.raw);
  const MarginAttributeUtility(super.builder);
}

@immutable
class WidthAttributeUtility<T> extends DoubleUtility<T>
    with CallableUtilityMixin<T, double> {
  static const selfBuilder = WidthAttributeUtility(WidthAttribute.new);
  const WidthAttributeUtility(super.builder);
}

@immutable
class HeightAttributeUtility<T> extends DoubleUtility<T>
    with CallableUtilityMixin<T, double> {
  static const selfBuilder = HeightAttributeUtility(HeightAttribute.new);
  const HeightAttributeUtility(super.builder);
}
