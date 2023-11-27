import 'package:flutter/material.dart';

import '../../attributes/alignment_attribute.dart';
import '../../attributes/clip_behavior_attribute.dart';
import '../../attributes/text_direction_attribute.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'stack_mixture.dart';

class StackMixtureAttribute
    extends ResolvableAttribute<StackMixtureAttribute, StackMixture> {
  final ClipBehaviorAttribute? _clipBehavior;

  final TextDirectionAttribute? _textDirection;
  final StackFitAttribute? _fit;
  final AlignmentGeometryAttribute? _alignment;
  const StackMixtureAttribute({
    AlignmentGeometryAttribute? alignment,
    StackFitAttribute? fit,
    TextDirectionAttribute? textDirection,
    ClipBehaviorAttribute? clipBehavior,
  })  : _clipBehavior = clipBehavior,
        _textDirection = textDirection,
        _fit = fit,
        _alignment = alignment;

  @override
  StackMixture resolve(MixData mix) {
    return StackMixture(
      alignment: get<AlignmentGeometryAttribute>(mix, _alignment)?.value,
      fit: get<StackFitAttribute>(mix, _fit)?.value,
      textDirection: get<TextDirectionAttribute>(mix, _textDirection)?.value,
      clipBehavior: get<ClipBehaviorAttribute>(mix, _clipBehavior)?.value,
    );
  }

  @override
  StackMixtureAttribute merge(covariant StackMixtureAttribute? other) {
    if (other == null) return this;

    return StackMixtureAttribute(
      alignment: other._alignment ?? _alignment,
      fit: other._fit ?? _fit,
      textDirection: other._textDirection ?? _textDirection,
      clipBehavior: other._clipBehavior ?? _clipBehavior,
    );
  }

  @override
  List<Object?> get props => [_alignment, _fit, _textDirection, _clipBehavior];
}

class StackFitAttribute extends ScalarAttribute<StackFit> {
  const StackFitAttribute(super.value);
}
