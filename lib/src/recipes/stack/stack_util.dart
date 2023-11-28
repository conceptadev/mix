import 'package:flutter/material.dart';

import '../../attributes/alignment_attribute.dart';
import '../../attributes/clip_behavior_attribute.dart';
import '../../attributes/text_direction_attribute.dart';
import '../../core/extensions/values_ext.dart';
import '../../utils/scalar_util.dart';
import 'stack_attribute.dart';

const stack = StackMixtureUtility.selfBuilder;

class StackMixtureUtility<T> extends MixUtility<T, StackMixAttribute> {
  static const selfBuilder = StackMixtureUtility(MixUtility.selfBuilder);

  const StackMixtureUtility(super.builder);

  T _alignment(AlignmentGeometry alignment) => call(alignment: alignment);
  T _fit(StackFit fit) => call(fit: fit);
  T _textDirection(TextDirection textDirection) =>
      call(textDirection: textDirection);
  T _clipBehavior(Clip clipBehavior) => call(clipBehavior: clipBehavior);

  T _only({
    AlignmentGeometryAttribute? alignment,
    StackFitAttribute? fit,
    TextDirectionAttribute? textDirection,
    ClipBehaviorAttribute? clipBehavior,
  }) {
    final stack = StackMixAttribute(
      alignment: alignment,
      fit: fit,
      textDirection: textDirection,
      clipBehavior: clipBehavior,
    );

    return as(stack);
  }

  AlignmentUtility<T> get alignment => AlignmentUtility(_alignment);
  StackFitUtility<T> get fit => StackFitUtility(_fit);
  TextDirectionUtility<T> get textDirection =>
      TextDirectionUtility(_textDirection);

  ClipUtility<T> get clipBehavior => ClipUtility(_clipBehavior);

  T call({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
  }) {
    return _only(
      alignment: alignment?.toAttribute(),
      fit: fit?.toAttribute(),
      textDirection: textDirection?.toAttribute(),
      clipBehavior: clipBehavior?.toAttribute(),
    );
  }
}
