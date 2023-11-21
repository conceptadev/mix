import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../helpers/extensions/values_ext.dart';
import 'alignment_attribute.dart';
import 'attribute.dart';
import 'color_attribute.dart';

abstract class GradientDto<Value extends Gradient> extends Dto<Value> {
  const GradientDto();

  @override
  GradientDto merge(covariant GradientDto? other);
}

class LinearGradientDto extends GradientDto<LinearGradient> {
  final AlignmentGeometryDto? begin;
  final AlignmentGeometryDto? end;
  final List<ColorDto>? colors;
  final List<double>? stops;

  const LinearGradientDto({
    required this.begin,
    required this.end,
    required this.colors,
    required this.stops,
  });

  @override
  LinearGradient resolve(MixData mix) {
    return LinearGradient(
      begin: begin?.resolve(mix) ?? Alignment.centerLeft,
      end: end?.resolve(mix) ?? Alignment.centerRight,
      colors: colors?.map((e) => e.resolve(mix)).toList() ?? [],
      stops: stops?.map((e) => e).toList(),
    );
  }

  @override
  LinearGradientDto merge(LinearGradientDto? other) {
    if (other == null) return this;

    return LinearGradientDto(
      begin: begin?.merge(other.begin),
      end: end?.merge(other.end),
      colors: colors?.merge(other.colors),
      stops: stops?.merge(other.stops),
    );
  }

  @override
  List<Object?> get props => [begin, end, colors, stops];
}
