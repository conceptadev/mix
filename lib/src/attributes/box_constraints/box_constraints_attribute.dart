import 'package:flutter/material.dart';

import '../../factory/exports.dart';
import '../resolvable_attribute.dart';

class BoxConstraintsAttribute extends ResolvableAttribute<BoxConstraints> {
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  const BoxConstraintsAttribute({
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  });

  BoxConstraintsAttribute.from(BoxConstraints constraints)
      : minWidth = constraints.minWidth,
        maxWidth = constraints.maxWidth,
        minHeight = constraints.minHeight,
        maxHeight = constraints.maxHeight;

  @override
  BoxConstraintsAttribute merge(covariant BoxConstraintsAttribute? other) {
    if (other == null) return this;

    return BoxConstraintsAttribute(
      minWidth: other.minWidth ?? minWidth,
      maxWidth: other.maxWidth ?? maxWidth,
      minHeight: other.minHeight ?? minHeight,
      maxHeight: other.maxHeight ?? maxHeight,
    );
  }

  @override
  BoxConstraints resolve(MixData data) {
    return BoxConstraints(
      minWidth: minWidth ?? 0,
      maxWidth: maxWidth ?? double.infinity,
      minHeight: minHeight ?? 0,
      maxHeight: maxHeight ?? double.infinity,
    );
  }

  @override
  get props => [minWidth, maxWidth, minHeight, maxHeight];
}
