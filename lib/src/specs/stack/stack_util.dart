import 'package:flutter/material.dart';

import '../../attributes/scalars/scalar_util.dart';
import '../../core/attribute.dart';
import '../../decorators/widget_decorators_util.dart';
import 'stack_attribute.dart';

const stack = StackSpecUtility(selfBuilder);

class StackSpecUtility<T extends SpecAttribute>
    extends SpecUtility<T, StackSpecAttribute> {
  const StackSpecUtility(super.builder);

  AlignmentUtility<T> get alignment {
    return AlignmentUtility((alignment) => only(alignment: alignment));
  }

  StackFitUtility<T> get fit {
    return StackFitUtility((fit) => only(fit: fit));
  }

  TextDirectionUtility<T> get textDirection {
    return TextDirectionUtility(
      (textDirection) => only(textDirection: textDirection),
    );
  }

  ClipUtility<T> get clipBehavior {
    return ClipUtility((clipBehavior) => only(clipBehavior: clipBehavior));
  }

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
