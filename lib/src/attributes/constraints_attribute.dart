import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

@immutable
abstract class ConstraintsAttribute<
        Self extends ConstraintsAttribute<Self, Value>,
        Value extends Constraints> extends MergeableStyleAttribute
    with Resolver<Value> {
  const ConstraintsAttribute();
}

@immutable
class BoxConstraintsAttribute
    extends ConstraintsAttribute<BoxConstraintsAttribute, BoxConstraints> {
  final double? width;
  final double? height;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  const BoxConstraintsAttribute({
    this.width,
    this.height,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  });

  @override
  BoxConstraintsAttribute merge(covariant BoxConstraintsAttribute? other) {
    if (other == null) return this;

    return BoxConstraintsAttribute(
      width: other.width ?? width,
      height: other.height ?? height,
      minWidth: other.minWidth ?? minWidth,
      maxWidth: other.maxWidth ?? maxWidth,
      minHeight: other.minHeight ?? minHeight,
      maxHeight: other.maxHeight ?? maxHeight,
    );
  }

  @override
  BoxConstraints resolve(MixData mix) {
    BoxConstraints? constraints;

    if (minWidth != null ||
        maxWidth != null ||
        minHeight != null ||
        maxHeight != null) {
      constraints = BoxConstraints(
        minWidth: minWidth ?? 0,
        maxWidth: maxWidth ?? double.infinity,
        minHeight: minHeight ?? 0,
        maxHeight: maxHeight ?? double.infinity,
      );
    }

    constraints = (width != null || height != null)
        ? constraints?.tighten(width: width, height: height) ??
            BoxConstraints.tightFor(width: width, height: height)
        : constraints;

    return constraints ?? const BoxConstraints();
  }

  @override
  get props => [minWidth, maxWidth, minHeight, maxHeight];
}
