import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'stack_spec.dart';

class StackMixAttribute
    extends ResolvableAttribute<StackMixAttribute, StackSpec> {
  final Clip? _clipBehavior;
  final TextDirection? _textDirection;
  final StackFit? _fit;
  final AlignmentGeometry? _alignment;
  const StackMixAttribute({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
  })  : _clipBehavior = clipBehavior,
        _textDirection = textDirection,
        _fit = fit,
        _alignment = alignment;

  static StackMixAttribute of(MixData mix) {
    return mix.attributeOf<StackMixAttribute>() ?? const StackMixAttribute();
  }

  @override
  StackSpec resolve(MixData mix) {
    return StackSpec(
      alignment: _alignment,
      fit: _fit,
      textDirection: _textDirection,
      clipBehavior: _clipBehavior,
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
