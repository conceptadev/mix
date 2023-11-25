import 'package:flutter/material.dart';

import '../../attributes/alignment_attribute.dart';
import '../../attributes/clip_behavior_attribute.dart';
import '../../attributes/text_direction_attribute.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'stack_mixture.dart';

class StackMixtureAttribute extends ResolvableAttribute<StackMixture> {
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
      alignment: _alignment?.value,
      fit: _fit?.value,
      textDirection: _textDirection?.value,
      clipBehavior: _clipBehavior?.value,
    );
  }

  @override
  StackMixtureAttribute merge(covariant StackMixtureAttribute? other) {
    if (other == null) return this;

    return StackMixtureAttribute(
      alignment: _alignment ?? other._alignment,
      fit: _fit ?? other._fit,
      textDirection: _textDirection ?? other._textDirection,
      clipBehavior: _clipBehavior ?? other._clipBehavior,
    );
  }

  @override
  List<Object?> get props => [_alignment, _fit, _textDirection, _clipBehavior];
}

class StackFitAttribute extends ScalarAttribute<StackFit> {
  const StackFitAttribute(super.value);

  @override
  StackFitAttribute merge(covariant StackFitAttribute? other) {
    return other == null ? this : StackFitAttribute(other.value);
  }
}
