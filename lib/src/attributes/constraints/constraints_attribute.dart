import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../factory/mix_provider_data.dart';
import '../attribute.dart';

abstract class ConstraintsAttribute<T extends Constraints>
    extends ResolvableAttribute<T> {
  const ConstraintsAttribute();
}

class BoxConstraintsAttribute extends ConstraintsAttribute<BoxConstraints>
    with SingleChildRenderAttributeMixin<ConstrainedBox> {
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
  BoxConstraintsAttribute merge(BoxConstraintsAttribute? other) {
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
  get props => [width, height, minWidth, maxWidth, minHeight, maxHeight];

  @override
  ConstrainedBox build(MixData mix, Widget child) {
    return ConstrainedBox(constraints: resolve(mix), child: child);
  }
}
