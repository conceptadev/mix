import 'package:flutter/material.dart';

import '../../attributes/alignment_attribute.dart';
import '../../attributes/clip_behavior_attribute.dart';
import '../../attributes/text_direction_attribute.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'stack_mixture.dart';

class StackMixAttribute
    extends ResolvableAttribute<StackMixAttribute, StackMixture> {
  final ClipBehaviorAttribute? _clipBehavior;
  final TextDirectionAttribute? _textDirection;
  final StackFitAttribute? _fit;
  final AlignmentGeometryAttribute? _alignment;
  const StackMixAttribute({
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
  StackMixAttribute merge(covariant StackMixAttribute? other) {
    if (other == null) return this;

    return StackMixAttribute(
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
