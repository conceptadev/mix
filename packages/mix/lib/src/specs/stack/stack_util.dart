import 'package:flutter/material.dart';

import '../../attributes/animated/animated_data_dto.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../core/attribute.dart';
import '../../core/spec.dart';
import 'stack_attribute.dart';

class StackSpecUtility<T extends Attribute>
    extends SpecUtility<T, StackSpecAttribute> {
  late final alignment = AlignmentUtility((v) => only(alignment: v));
  late final fit = StackFitUtility((v) => only(fit: v));
  late final textDirection =
      TextDirectionUtility((v) => only(textDirection: v));
  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));

  StackSpecUtility(super.builder);

  @override
  T only({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
    AnimatedDataDto? animated,
  }) {
    return builder(
      StackSpecAttribute(
        alignment: alignment,
        fit: fit,
        textDirection: textDirection,
        clipBehavior: clipBehavior,
        animated: animated,
      ),
    );
  }
}
