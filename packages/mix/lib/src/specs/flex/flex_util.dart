import 'package:flutter/material.dart';

import '../../attributes/animated/animated_data_dto.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/spacing/spacing_util.dart';
import '../../core/attribute.dart';
import '../../core/spec.dart';
import 'flex_attribute.dart';

class FlexSpecUtility<T extends Attribute>
    extends SpecUtility<T, FlexSpecAttribute> {
  late final direction = AxisUtility((v) => only(direction: v));
  late final mainAxisAlignment =
      MainAxisAlignmentUtility((v) => only(mainAxisAlignment: v));
  late final crossAxisAlignment =
      CrossAxisAlignmentUtility((v) => only(crossAxisAlignment: v));
  late final mainAxisSize = MainAxisSizeUtility((v) => only(mainAxisSize: v));
  late final verticalDirection =
      VerticalDirectionUtility((v) => only(verticalDirection: v));
  late final textDirection =
      TextDirectionUtility((v) => only(textDirection: v));
  late final textBaseline = TextBaselineUtility((v) => only(textBaseline: v));
  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));
  late final gap = SpacingSideUtility((v) => only(gap: v));

  late final row = direction.horizontal;
  late final column = direction.vertical;

  FlexSpecUtility(super.builder);

  @override
  T only({
    Axis? direction,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
    VerticalDirection? verticalDirection,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Clip? clipBehavior,
    double? gap,
    AnimatedDataDto? animated,
  }) {
    return builder(FlexSpecAttribute(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      gap: gap,
      animated: animated,
    ));
  }
}
