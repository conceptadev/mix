import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../core/extensions/iterable_ext.dart';
import '../factory/mix_provider_data.dart';
import 'color_attribute.dart';

abstract class GradientAttribute<Value extends Gradient>
    extends ResolvableAttribute<GradientAttribute, Value> {
  const GradientAttribute();

  static GradientAttribute from(Gradient gradient) {
    if (gradient is LinearGradient) {
      return LinearGradientAttribute(
        begin: gradient.begin,
        end: gradient.end,
        colors: gradient.colors.map(ColorDto.new).toList(),
        stops: gradient.stops,
        tileMode: gradient.tileMode,
        transform: gradient.transform,
      );
    } else if (gradient is RadialGradient) {
      return RadialGradientAttribute(
        center: gradient.center,
        radius: gradient.radius,
        colors: gradient.colors.map(ColorDto.new).toList(),
        stops: gradient.stops,
        tileMode: gradient.tileMode,
        focal: gradient.focal,
        transform: gradient.transform,
        focalRadius: gradient.focalRadius,
      );
    } else if (gradient is SweepGradient) {
      return SweepGradientAttribute(
        center: gradient.center,
        startAngle: gradient.startAngle,
        endAngle: gradient.endAngle,
        colors: gradient.colors.map(ColorDto.new).toList(),
        stops: gradient.stops,
        tileMode: gradient.tileMode,
        transform: gradient.transform,
      );
    }
    throw UnimplementedError(
      'Cannot create GradientAttribute from gradient of type ${gradient.runtimeType}',
    );
  }

  static GradientAttribute? maybeFrom(Gradient? gradient) {
    return gradient == null ? null : from(gradient);
  }

  @override
  GradientAttribute merge(covariant GradientAttribute? other);
}

class LinearGradientAttribute extends GradientAttribute<LinearGradient> {
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final List<ColorDto>? colors;
  final List<double>? stops;
  final TileMode? tileMode;
  final GradientTransform? transform;

  const LinearGradientAttribute({
    this.begin,
    this.end,
    this.colors,
    this.stops,
    this.tileMode,
    this.transform,
  });

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
  LinearGradientAttribute merge(LinearGradientAttribute? other) {
    if (other == null) return this;

    return LinearGradientAttribute(
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
class RadialGradientAttribute extends GradientAttribute<RadialGradient> {
  final AlignmentGeometry? center;
  final double? radius;
  final List<ColorDto>? colors;
  final List<double>? stops;
  // focalRadius
  final TileMode? tileMode;
  final AlignmentGeometry? focal;
  final GradientTransform? transform;
  final double? focalRadius;

  const RadialGradientAttribute({
    this.center,
    this.radius,
    this.colors,
    this.stops,
    this.tileMode,
    this.focal,
    this.transform,
    this.focalRadius,
  });

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
  RadialGradientAttribute merge(RadialGradientAttribute? other) {
    if (other == null) return this;

    return RadialGradientAttribute(
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
class SweepGradientAttribute extends GradientAttribute<SweepGradient> {
  final AlignmentGeometry? center;
  final double? startAngle;
  final double? endAngle;
  final List<ColorDto>? colors;
  final List<double>? stops;
  final TileMode? tileMode;
  final GradientTransform? transform;

  const SweepGradientAttribute({
    this.center,
    this.startAngle,
    this.endAngle,
    this.colors,
    this.stops,
    this.tileMode,
    this.transform,
  });

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
  SweepGradientAttribute merge(SweepGradientAttribute? other) {
    if (other == null) return this;

    return SweepGradientAttribute(
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
