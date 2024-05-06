import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'stack_spec.dart';

class StackSpecAttribute extends SpecAttribute<StackSpec> {
  final Clip? _clipBehavior;
  final TextDirection? _textDirection;
  final StackFit? _fit;
  final AlignmentGeometry? _alignment;
  const StackSpecAttribute({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
  })  : _clipBehavior = clipBehavior,
        _textDirection = textDirection,
        _fit = fit,
        _alignment = alignment;

  static StackSpecAttribute of(MixData mix) {
    return mix.attributeOf() ?? const StackSpecAttribute();
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
  StackSpecAttribute merge(covariant StackSpecAttribute? other) {
    if (other == null) return this;

    return StackSpecAttribute(
      alignment: other._alignment ?? _alignment,
      fit: other._fit ?? _fit,
      textDirection: other._textDirection ?? _textDirection,
      clipBehavior: other._clipBehavior ?? _clipBehavior,
    );
  }

  @override
  List<Object?> get props => [_alignment, _fit, _textDirection, _clipBehavior];
}
