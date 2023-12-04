import 'package:flutter/rendering.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';

abstract class ConstraintsDto<Self extends ConstraintsDto<Self, Value>,
    Value extends Constraints> extends Dto<Value> {
  const ConstraintsDto();
}

class BoxConstraintsDto
    extends ConstraintsDto<BoxConstraintsDto, BoxConstraints> {
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  const BoxConstraintsDto({
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  });

  static BoxConstraintsDto from(BoxConstraints constraints) {
    return BoxConstraintsDto(
      minWidth: constraints.minWidth,
      maxWidth: constraints.maxWidth,
      minHeight: constraints.minHeight,
      maxHeight: constraints.maxHeight,
    );
  }

  static BoxConstraintsDto? maybeFrom(BoxConstraints? constraints) {
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
  BoxConstraintsDto merge(BoxConstraintsDto? other) {
    if (other == null) return this;

    return BoxConstraintsDto(
      minWidth: other.minWidth ?? minWidth,
      maxWidth: other.maxWidth ?? maxWidth,
      minHeight: other.minHeight ?? minHeight,
      maxHeight: other.maxHeight ?? maxHeight,
    );
  }

  @override
  get props => [minWidth, maxWidth, minHeight, maxHeight];
}
