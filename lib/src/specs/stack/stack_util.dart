import 'package:flutter/material.dart';

import '../../attributes/scalars/scalar_util.dart';
import '../../core/attribute.dart';
import '../../decorators/widget_decorators_util.dart';
import 'stack_attribute.dart';

final stack = StackSpecUtility(selfBuilder);

final $stack = StackSpecUtility(selfBuilder);

class StackSpecUtility<T extends SpecAttribute>
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
  }) {
    return builder(
      StackSpecAttribute(
        alignment: alignment,
        fit: fit,
        textDirection: textDirection,
        clipBehavior: clipBehavior,
      ),
    );
  }
}
