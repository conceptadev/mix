import 'package:flutter/material.dart';

import '../attributes/gradient_attribute.dart';
import '../core/extensions/values_ext.dart';
import 'scalar_util.dart';

const radialGradient = RadialGradientAttributeUtility.selfBuilder;
const linearGradient = LinearGradientAttributeUtility.selfBuilder;

class RadialGradientAttributeUtility<T>
    extends MixUtility<T, RadialGradientAttribute> {
  static const selfBuilder =
      RadialGradientAttributeUtility(MixUtility.selfBuilder);

  const RadialGradientAttributeUtility(super.builder);

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
    final gradient = RadialGradientAttribute(
      center: center,
      radius: radius,
      colors: colors?.map((e) => e.toDto()).toList(),
      stops: stops,
      tileMode: tileMode,
      focal: focal,
      transform: transform,
      focalRadius: focalRadius,
    );

    return as(gradient);
  }
}

class LinearGradientAttributeUtility<T>
    extends MixUtility<T, LinearGradientAttribute> {
  static const selfBuilder =
      LinearGradientAttributeUtility(MixUtility.selfBuilder);

  const LinearGradientAttributeUtility(super.builder);

  T _colors(List<Color> colors) => call(colors: colors);

  T _stops(List<double> stops) => as(LinearGradientAttribute(stops: stops));

  T _begin(AlignmentGeometry begin) =>
      as(LinearGradientAttribute(begin: begin));

  T _end(AlignmentGeometry end) => as(LinearGradientAttribute(end: end));

  T _tileMode(TileMode tileMode) =>
      as(LinearGradientAttribute(tileMode: tileMode));

  T _transform(GradientTransform transform) =>
      as(LinearGradientAttribute(transform: transform));

  ListUtility<T, Color> get colors => ListUtility(_colors);

  ListUtility<T, double> get stops => ListUtility(_stops);

  AlignmentUtility<T> get begin => AlignmentUtility(_begin);

  AlignmentUtility<T> get end => AlignmentUtility(_end);

  TileModeUtility<T> get tileMode => TileModeUtility(_tileMode);

  GradientTransformUtility<T> get transform =>
      GradientTransformUtility(_transform);

  T call({
    List<Color>? colors,
    List<double>? stops,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    TileMode? tileMode,
    GradientTransform? transform,
  }) {
    final gradient = LinearGradientAttribute(
      begin: begin,
      end: end,
      colors: colors?.map((e) => e.toDto()).toList(),
      stops: stops,
      tileMode: tileMode,
      transform: transform,
    );

    return as(gradient);
  }
}
