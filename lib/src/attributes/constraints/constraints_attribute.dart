import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../scalars/scalars_attribute.dart';
import 'constraints_dto.dart';

abstract class ConstraintsAttribute<Self, D extends ConstraintsDto<D, Value>,
    Value extends Constraints> extends DtoAttribute<Self, D, Value> {
  const ConstraintsAttribute(super.value);
}

class BoxConstraintsAttribute extends ConstraintsAttribute<
    BoxConstraintsAttribute,
    BoxConstraintsDto,
    BoxConstraints> with SingleChildRenderAttributeMixin<ConstrainedBox> {
  const BoxConstraintsAttribute(super.value);

  factory BoxConstraintsAttribute.only({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) =>
      BoxConstraintsAttribute(BoxConstraintsDto(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ));

  static BoxConstraintsAttribute from(BoxConstraints constraints) =>
      BoxConstraintsAttribute(BoxConstraintsDto.from(constraints));

  static BoxConstraintsAttribute? maybeFrom(BoxConstraints? constraints) {
    return constraints == null ? null : from(constraints);
  }

  @override
  BoxConstraintsAttribute merge(BoxConstraintsAttribute? other) {
    return other == null
        ? this
        : BoxConstraintsAttribute(value.merge(other.value));
  }

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
