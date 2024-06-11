import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../core/dto.dart';
import '../../core/models/mix_data.dart';
import '../color/color_dto.dart';

part 'gradient_dto.g.dart';

/// Represents a base Data transfer object of [Gradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[Gradient]
@immutable
abstract interface class GradientDto<T extends Gradient> extends Dto<T> {
  final List<double>? stops;

  final List<ColorDto>? colors;

  final GradientTransform? transform;

  const GradientDto({this.stops, this.colors, this.transform});
}

/// Represents a Data transfer object of [LinearGradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[LinearGradient]

@MixableDto()
class LinearGradientDto extends GradientDto<LinearGradient>
    with LinearGradientDtoMixable {
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final TileMode? tileMode;

  const LinearGradientDto({
    this.begin,
    this.end,
    this.tileMode,
    super.transform,
    super.colors,
    super.stops,
  });
}

/// Represents a Data transfer object of [RadialGradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[RadialGradient]
@MixableDto()
class RadialGradientDto extends GradientDto<RadialGradient>
    with RadialGradientDtoMixable {
  final AlignmentGeometry? center;
  final double? radius;

  // focalRadius
  final TileMode? tileMode;
  final AlignmentGeometry? focal;

  final double? focalRadius;

  const RadialGradientDto({
    this.center,
    this.radius,
    this.tileMode,
    this.focal,
    this.focalRadius,
    super.transform,
    super.colors,
    super.stops,
  });
}

/// Represents a Data transfer object of [SweepGradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[SweepGradient]

@MixableDto()
class SweepGradientDto extends GradientDto<SweepGradient>
    with SweepGradientDtoMixable {
  final AlignmentGeometry? center;
  final double? startAngle;
  final double? endAngle;

  final TileMode? tileMode;

  const SweepGradientDto({
    this.center,
    this.startAngle,
    this.endAngle,
    this.tileMode,
    super.transform,
    super.colors,
    super.stops,
  });
}

extension GradientExt on Gradient {
  // toDto
  GradientDto toDto() {
    if (this is LinearGradient) return (this as LinearGradient).toDto();
    if (this is RadialGradient) return (this as RadialGradient).toDto();
    if (this is SweepGradient) return (this as SweepGradient).toDto();

    throw UnimplementedError();
  }
}

extension LinearGradientExt on LinearGradient {
  LinearGradientDto toDto() {
    return LinearGradientDto(
      begin: begin,
      end: end,
      tileMode: tileMode,
      transform: transform,
      colors: colors.map((e) => e.toDto()).toList(),
      stops: stops,
    );
  }
}

extension RadialGradientExt on RadialGradient {
  RadialGradientDto toDto() {
    return RadialGradientDto(
      center: center,
      radius: radius,
      tileMode: tileMode,
      focal: focal,
      focalRadius: focalRadius,
      transform: transform,
      colors: colors.map((e) => e.toDto()).toList(),
      stops: stops,
    );
  }
}

extension SweepGradientExt on SweepGradient {
  SweepGradientDto toDto() {
    return SweepGradientDto(
      center: center,
      startAngle: startAngle,
      endAngle: endAngle,
      tileMode: tileMode,
      transform: transform,
      colors: colors.map((e) => e.toDto()).toList(),
      stops: stops,
    );
  }
}
