import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';

abstract class ConstraintsAttribute<
    Self extends ConstraintsAttribute<Self, Value>,
    Value extends Constraints> extends ResolvableAttribute<Self, Value> {
  const ConstraintsAttribute();
}

class BoxConstraintsAttribute
    extends ConstraintsAttribute<BoxConstraintsAttribute, BoxConstraints>
    with SingleChildRenderAttributeMixin<ConstrainedBox> {
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

    return constraints ?? const BoxConstraints();
  }

  @override
  BoxConstraintsAttribute merge(BoxConstraintsAttribute? other) {
    if (other == null) return this;

    return BoxConstraintsAttribute(
      minWidth: other.minWidth ?? minWidth,
      maxWidth: other.maxWidth ?? maxWidth,
      minHeight: other.minHeight ?? minHeight,
      maxHeight: other.maxHeight ?? maxHeight,
    );
  }

  @override
  get props => [minWidth, maxWidth, minHeight, maxHeight];

  @override
  ConstrainedBox build(MixData mix, Widget child) {
    return ConstrainedBox(constraints: resolve(mix), child: child);
  }
}

@immutable
class WidthAttribute extends ScalarAttribute {
  const WidthAttribute(super.value);
}

@immutable
class HeightAttribute extends ScalarAttribute {
  const HeightAttribute(super.value);
}
