import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';

abstract class ConstraintsDto<T extends Constraints> extends Dto<T> {
  const ConstraintsDto();
}

class BoxConstraintsDto extends ConstraintsDto<BoxConstraints> {
  final double? width;
  final double? height;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  const BoxConstraintsDto({
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
  BoxConstraintsDto merge(BoxConstraintsDto? other) {
    if (other == null) return this;

    return BoxConstraintsDto(
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
}

@immutable
abstract class ConstraintsAttribute<D extends ConstraintsDto<Value>,
    Value extends Constraints> extends DtoStyleAttribute<D, Value> {
  const ConstraintsAttribute(super.value);
}

@immutable
class BoxConstraintsAttribute
    extends ConstraintsAttribute<BoxConstraintsDto, BoxConstraints> {
  const BoxConstraintsAttribute(super.value);

  @override
  BoxConstraintsAttribute merge(covariant BoxConstraintsAttribute? other) {
    return other == null
        ? this
        : BoxConstraintsAttribute(value.merge(other.value));
  }

  @override
  BoxConstraints resolve(MixData mix) => value;
}
