import 'package:flutter/material.dart';

import '../../core/extensions/values_ext.dart';
import '../color/color_dto.dart';
import '../scalars/scalar_util.dart';
import 'gradient_attribute.dart';
import 'gradient_dto.dart';

class GradientUtility<T> extends MixUtility<T, GradientDto> {
  static const selfBuilder = GradientUtility(GradientAttribute.new);

  const GradientUtility(super.builder);

  T _radial(RadialGradientDto radial) => builder(radial);

  T _linear(LinearGradientDto linear) => builder(linear);

  T _sweep(SweepGradientDto sweep) => builder(sweep);

  RadialGradientUtility<T> get radial => RadialGradientUtility(_radial);

  LinearGradientUtility<T> get linear => LinearGradientUtility(_linear);

  SweepGradientUtility<T> get sweep => SweepGradientUtility(_sweep);

  T from(Gradient gradient) {
    if (gradient is RadialGradient) {
      return _radial(RadialGradientDto.from(gradient));
    } else if (gradient is LinearGradient) {
      return _linear(LinearGradientDto.from(gradient));
    } else if (gradient is SweepGradient) {
      return _sweep(SweepGradientDto.from(gradient));
    }
    throw UnimplementedError(
      'Cannot create GradientAttribute from gradient of type ${gradient.runtimeType}',
    );
  }
}

class RadialGradientUtility<T> extends MixUtility<T, RadialGradientDto> {
  static const selfBuilder = RadialGradientUtility(GradientAttribute.new);

  const RadialGradientUtility(super.builder);

  T _colors(List<Color> colors) => call(colors: colors);

  T _stops(List<double> stops) => call(stops: stops);

  T _center(AlignmentGeometry center) => call(center: center);

  T _radius(double radius) => call(radius: radius);

  T _focal(AlignmentGeometry focal) => call(focal: focal);

  T _focalRadius(double focalRadius) => call(focalRadius: focalRadius);

  T _tileMode(TileMode tileMode) => call(tileMode: tileMode);

  T _transform(GradientTransform transform) => call(transform: transform);

  ListUtility<T, Color> get colors => ListUtility(_colors);

  ListUtility<T, double> get stops => ListUtility(_stops);

  AlignmentUtility<T> get center => AlignmentUtility(_center);

  DoubleUtility<T> get radius => DoubleUtility(_radius);

  AlignmentUtility<T> get focal => AlignmentUtility(_focal);

  DoubleUtility<T> get focalRadius => DoubleUtility(_focalRadius);

  TileModeUtility<T> get tileMode => TileModeUtility(_tileMode);

  GradientTransformUtility<T> get transform =>
      GradientTransformUtility(_transform);

  T from(RadialGradient gradient) {
    return builder(RadialGradientDto.from(gradient));
  }

  T call({
    List<Color>? colors,
    List<double>? stops,
    AlignmentGeometry? center,
    double? radius,
    AlignmentGeometry? focal,
    double? focalRadius,
    TileMode? tileMode,
    GradientTransform? transform,
  }) {
    final gradient = RadialGradientDto(
      center: center,
      radius: radius,
      tileMode: tileMode,
      focal: focal,
      focalRadius: focalRadius,
      transform: transform,
      colors: colors?.map((e) => e.toDto()).toList(),
      stops: stops,
    );

    return builder(gradient);
  }
}

class LinearGradientUtility<T> extends MixUtility<T, LinearGradientDto> {
  static const selfBuilder = LinearGradientUtility(GradientAttribute.new);

  const LinearGradientUtility(super.builder);

  T _colors(List<Color> colors) => call(colors: colors);

  T _stops(List<double> stops) => builder(LinearGradientDto(stops: stops));

  T _begin(AlignmentGeometry begin) => builder(LinearGradientDto(begin: begin));

  T _end(AlignmentGeometry end) => builder(LinearGradientDto(end: end));

  T _tileMode(TileMode tileMode) =>
      builder(LinearGradientDto(tileMode: tileMode));

  T _transform(GradientTransform transform) =>
      builder(LinearGradientDto(transform: transform));

  ListUtility<T, Color> get colors => ListUtility(_colors);

  ListUtility<T, double> get stops => ListUtility(_stops);

  AlignmentUtility<T> get begin => AlignmentUtility(_begin);

  AlignmentUtility<T> get end => AlignmentUtility(_end);

  TileModeUtility<T> get tileMode => TileModeUtility(_tileMode);

  GradientTransformUtility<T> get transform =>
      GradientTransformUtility(_transform);

  T from(LinearGradient gradient) {
    return builder(LinearGradientDto.from(gradient));
  }

  T call({
    List<Color>? colors,
    List<double>? stops,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    TileMode? tileMode,
    GradientTransform? transform,
  }) {
    final gradient = LinearGradientDto(
      begin: begin,
      end: end,
      tileMode: tileMode,
      transform: transform,
      colors: colors?.map(ColorDto.new).toList(),
      stops: stops,
    );

    return builder(gradient);
  }
}

class SweepGradientUtility<T> extends MixUtility<T, SweepGradientDto> {
  static const selfBuilder = SweepGradientUtility(GradientAttribute.new);

  const SweepGradientUtility(super.builder);

  T _colors(List<Color> colors) => call(colors: colors);

  T _stops(List<double> stops) => call(stops: stops);

  T _center(AlignmentGeometry center) => call(center: center);

  T _startAngle(double startAngle) => call(startAngle: startAngle);

  T _endAngle(double endAngle) => call(endAngle: endAngle);

  T _tileMode(TileMode tileMode) => call(tileMode: tileMode);

  T _transform(GradientTransform transform) => call(transform: transform);

  ListUtility<T, Color> get colors => ListUtility(_colors);

  ListUtility<T, double> get stops => ListUtility(_stops);

  AlignmentUtility<T> get center => AlignmentUtility(_center);

  DoubleUtility<T> get startAngle => DoubleUtility(_startAngle);

  DoubleUtility<T> get endAngle => DoubleUtility(_endAngle);

  TileModeUtility<T> get tileMode => TileModeUtility(_tileMode);

  GradientTransformUtility<T> get transform =>
      GradientTransformUtility(_transform);

  T from(SweepGradient gradient) {
    return builder(SweepGradientDto.from(gradient));
  }

  T call({
    List<Color>? colors,
    List<double>? stops,
    AlignmentGeometry? center,
    double? startAngle,
    double? endAngle,
    TileMode? tileMode,
    GradientTransform? transform,
  }) {
    final gradient = SweepGradientDto(
      center: center,
      startAngle: startAngle,
      endAngle: endAngle,
      tileMode: tileMode,
      transform: transform,
      colors: colors?.map(ColorDto.new).toList(),
      stops: stops,
    );

    return builder(gradient);
  }
}
