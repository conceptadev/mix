import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/iterable_ext.dart';
import '../../factory/mix_provider_data.dart';
import '../color/color_attribute.dart';

@immutable
abstract class GradientDto<T extends Gradient> extends Dto<GradientDto<T>, T> {
  const GradientDto();

  static GradientDto from(Gradient gradient) {
    if (gradient is LinearGradient) {
      return LinearGradientDto.from(gradient);
    }
    if (gradient is RadialGradient) {
      return RadialGradientDto.from(gradient);
    }
    if (gradient is SweepGradient) {
      return SweepGradientDto.from(gradient);
    }

    throw UnimplementedError('Unknown gradient type: $gradient');
  }

  @override
  T resolve(MixData mix);

  @override
  GradientDto<T> merge(covariant GradientDto<T>? other);
}

class LinearGradientDto extends GradientDto<LinearGradient> {
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final List<ColorDto>? colors;
  final List<double>? stops;
  final TileMode? tileMode;
  final GradientTransform? transform;

  const LinearGradientDto({
    this.begin,
    this.end,
    this.colors,
    this.stops,
    this.tileMode,
    this.transform,
  });

  static LinearGradientDto from(LinearGradient gradient) {
    return LinearGradientDto(
      begin: gradient.begin,
      end: gradient.end,
      colors: gradient.colors.map(ColorDto.new).toList(),
      stops: gradient.stops,
      tileMode: gradient.tileMode,
      transform: gradient.transform,
    );
  }

  static LinearGradientDto? maybeFrom(LinearGradient? gradient) {
    return gradient == null ? null : from(gradient);
  }

  @override
  LinearGradient resolve(MixData mix) {
    return LinearGradient(
      begin: begin ?? Alignment.centerLeft,
      end: end ?? Alignment.centerRight,
      colors: colors?.map((e) => e.resolve(mix)).toList() ?? [],
      stops: stops?.map((e) => e).toList(),
      tileMode: tileMode ?? TileMode.clamp,
      transform: transform,
    );
  }

  @override
  LinearGradientDto merge(LinearGradientDto? other) {
    if (other == null) return this;

    return LinearGradientDto(
      begin: other.begin ?? begin,
      end: other.end ?? end,
      colors: colors?.merge(other.colors),
      stops: stops?.merge(other.stops),
      tileMode: other.tileMode ?? tileMode,
      transform: other.transform ?? transform,
    );
  }

  @override
  List<Object?> get props => [begin, end, colors, stops, tileMode, transform];
}

@immutable
class RadialGradientDto extends GradientDto<RadialGradient> {
  final AlignmentGeometry? center;
  final double? radius;
  final List<ColorDto>? colors;
  final List<double>? stops;
  // focalRadius
  final TileMode? tileMode;
  final AlignmentGeometry? focal;
  final GradientTransform? transform;
  final double? focalRadius;

  const RadialGradientDto({
    this.center,
    this.radius,
    this.colors,
    this.stops,
    this.tileMode,
    this.focal,
    this.transform,
    this.focalRadius,
  });

  static RadialGradientDto from(RadialGradient gradient) {
    return RadialGradientDto(
      center: gradient.center,
      radius: gradient.radius,
      colors: gradient.colors.map(ColorDto.new).toList(),
      stops: gradient.stops,
      tileMode: gradient.tileMode,
      focal: gradient.focal,
      transform: gradient.transform,
      focalRadius: gradient.focalRadius,
    );
  }

  static RadialGradientDto? maybeFrom(RadialGradient? gradient) {
    return gradient == null ? null : from(gradient);
  }

  @override
  RadialGradient resolve(MixData mix) {
    return RadialGradient(
      center: center ?? Alignment.center,
      radius: radius ?? 0.5,
      colors: colors?.map((e) => e.resolve(mix)).toList() ?? [],
      stops: stops?.map((e) => e).toList(),
      tileMode: tileMode ?? TileMode.clamp,
      focal: focal,
      focalRadius: focalRadius ?? 0.0,
      transform: transform,
    );
  }

  @override
  RadialGradientDto merge(RadialGradientDto? other) {
    if (other == null) return this;

    return RadialGradientDto(
      center: center,
      radius: radius ?? other.radius,
      colors: colors?.merge(other.colors),
      stops: stops?.merge(other.stops),
      tileMode: other.tileMode ?? tileMode,
      focal: focal,
      transform: other.transform ?? transform,
      focalRadius: other.focalRadius ?? focalRadius,
    );
  }

  @override
  List<Object?> get props =>
      [center, radius, colors, stops, tileMode, focal, transform, focalRadius];
}

@immutable
class SweepGradientDto extends GradientDto<SweepGradient> {
  final AlignmentGeometry? center;
  final double? startAngle;
  final double? endAngle;
  final List<ColorDto>? colors;
  final List<double>? stops;
  final TileMode? tileMode;
  final GradientTransform? transform;

  const SweepGradientDto({
    this.center,
    this.startAngle,
    this.endAngle,
    this.colors,
    this.stops,
    this.tileMode,
    this.transform,
  });

  static SweepGradientDto from(SweepGradient gradient) {
    return SweepGradientDto(
      center: gradient.center,
      startAngle: gradient.startAngle,
      endAngle: gradient.endAngle,
      colors: gradient.colors.map(ColorDto.new).toList(),
      stops: gradient.stops,
      tileMode: gradient.tileMode,
      transform: gradient.transform,
    );
  }

  static SweepGradientDto? maybeFrom(SweepGradient? gradient) {
    return gradient == null ? null : from(gradient);
  }

  @override
  SweepGradient resolve(MixData mix) {
    return SweepGradient(
      center: center ?? Alignment.center,
      startAngle: startAngle ?? 0.0,
      endAngle: endAngle ?? 0.0,
      colors: colors?.map((e) => e.resolve(mix)).toList() ?? [],
      stops: stops?.map((e) => e).toList(),
      tileMode: tileMode ?? TileMode.clamp,
      transform: transform,
    );
  }

  @override
  SweepGradientDto merge(SweepGradientDto? other) {
    if (other == null) return this;

    return SweepGradientDto(
      center: other.center ?? center,
      startAngle: startAngle ?? other.startAngle,
      endAngle: endAngle ?? other.endAngle,
      colors: colors?.merge(other.colors),
      stops: stops?.merge(other.stops),
      tileMode: other.tileMode ?? tileMode,
      transform: other.transform ?? transform,
    );
  }

  @override
  List<Object?> get props =>
      [center, startAngle, endAngle, colors, stops, tileMode, transform];
}
