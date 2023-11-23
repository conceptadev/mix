import 'package:flutter/material.dart';

import '../../utils/scalar_util.dart';
import 'stack_attribute.dart';

const stack = StackUtility();

class StackUtility {
  const StackUtility();

  StackAttribute _alignment(AlignmentGeometry alignment) =>
      call(alignment: alignment);
  StackAttribute _fit(StackFit fit) => call(fit: fit);
  StackAttribute _textDirection(TextDirection textDirection) =>
      call(textDirection: textDirection);
  StackAttribute _clipBehavior(Clip clipBehavior) =>
      call(clipBehavior: clipBehavior);

  AlignmentUtility<StackAttribute> get alignment =>
      AlignmentUtility(_alignment);
  StackFitUtility<StackAttribute> get fit => StackFitUtility(_fit);
  TextDirectionUtility<StackAttribute> get textDirection =>
      TextDirectionUtility(_textDirection);

  ClipUtility<StackAttribute> get clipBehavior => ClipUtility(_clipBehavior);

  StackAttribute call({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
  }) {
    return StackAttribute(
      alignment: alignment,
      fit: fit,
      textDirection: textDirection,
      clipBehavior: clipBehavior,
    );
  }
}
