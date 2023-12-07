import 'package:flutter/material.dart';

import '../../attributes/scalars/scalar_util.dart';
import 'stack_attribute.dart';

const stack = StackSpecUtility();

class StackSpecUtility extends SpecUtility<StackSpecAttribute> {
  const StackSpecUtility();

  StackSpecAttribute _only({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
  }) {
    return StackSpecAttribute(
      alignment: alignment,
      fit: fit,
      textDirection: textDirection,
      clipBehavior: clipBehavior,
    );
  }

  AlignmentUtility<StackSpecAttribute> get alignment {
    return AlignmentUtility((alignment) => _only(alignment: alignment));
  }

  StackFitUtility<StackSpecAttribute> get fit {
    return StackFitUtility((fit) => _only(fit: fit));
  }

  TextDirectionUtility<StackSpecAttribute> get textDirection {
    return TextDirectionUtility(
      (textDirection) => _only(textDirection: textDirection),
    );
  }

  ClipUtility<StackSpecAttribute> get clipBehavior {
    return ClipUtility((clipBehavior) => _only(clipBehavior: clipBehavior));
  }

  StackSpecAttribute call({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
  }) {
    return _only(
      alignment: alignment,
      fit: fit,
      textDirection: textDirection,
      clipBehavior: clipBehavior,
    );
  }
}
