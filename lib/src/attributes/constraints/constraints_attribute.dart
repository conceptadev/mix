import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../scalars/scalars_attribute.dart';

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

  static BoxConstraintsAttribute from(BoxConstraints constraints) {
    return BoxConstraintsAttribute(
      minWidth: constraints.minWidth,
      maxWidth: constraints.maxWidth,
      minHeight: constraints.minHeight,
      maxHeight: constraints.maxHeight,
    );
  }

  static BoxConstraintsAttribute? maybeFrom(BoxConstraints? constraints) {
    return constraints == null ? null : from(constraints);
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
class WidthAttribute extends ScalarAttribute<WidthAttribute, double> {
  const WidthAttribute(super.value);

  static WidthAttribute? maybeFrom(double? value) {
    return value == null ? null : WidthAttribute(value);
  }
}

@immutable
class HeightAttribute extends ScalarAttribute<HeightAttribute, double> {
  const HeightAttribute(super.value);

  static HeightAttribute? maybeFrom(double? value) {
    return value == null ? null : HeightAttribute(value);
  }
}
