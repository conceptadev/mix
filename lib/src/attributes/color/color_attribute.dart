import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'color_dto.dart';

@immutable
abstract class ColorAttribute<Self extends ColorAttribute<Self>>
    extends ResolvableAttribute<Self, Color> {
  final ColorDto value;
  const ColorAttribute(this.value);

  // mergeWith
  Self mergeWith(ColorDto otherValue);

  // merge
  @override
  Self merge(covariant Self? other) {
    return other == null ? this as Self : mergeWith(other.value);
  }

  @override
  Color resolve(MixData mix) => value.resolve(mix);

  @override
  get props => [value];
}
