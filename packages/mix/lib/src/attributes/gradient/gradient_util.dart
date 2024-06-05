import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../color/color_dto.dart';
import '../scalars/scalar_util.dart';
import 'gradient_dto.dart';

/// A utility class for working with gradients.
///
/// This class provides convenient methods for creating different types of gradients,
/// such as radial gradients, linear gradients, and sweep gradients.
/// It also provides a method for converting a generic [Gradient] object to a specific type [T].
///
/// Accepts a [builder] function that takes a [GradientDto] and returns an object of type [T].
class GradientUtility<T extends Attribute> extends MixUtility<T, GradientDto> {
  late final radial = RadialGradientUtility(builder);
  late final linear = LinearGradientUtility(builder);
  late final sweep = SweepGradientUtility(builder);

  GradientUtility(super.builder);

  /// Converts a [Gradient] object to the specific type [T].
  ///
  /// Throws an [UnimplementedError] if the given gradient type is not supported.
  T as(Gradient gradient) {
    if (gradient is RadialGradient) {
      return radial.as(gradient);
    } else if (gradient is LinearGradient) {
      return linear.as(gradient);
    } else if (gradient is SweepGradient) {
      return sweep.as(gradient);
    }
    throw UnimplementedError(
      'Cannot create GradientAttribute from gradient of type ${gradient.runtimeType}',
    );
  }
}

/// Utility class for creating and manipulating [RadialGradient] attributes.
///
/// Accepts a [builder] function that takes a [RadialGradientDto] and returns an object of type [T].
@immutable
class RadialGradientUtility<T extends Attribute>
    extends DtoUtility<T, RadialGradientDto, RadialGradient> {
  late final center = AlignmentUtility((v) => only(center: v));

  late final focal = AlignmentUtility((v) => only(focal: v));

  late final tileMode = TileModeUtility((v) => only(tileMode: v));

  late final transform = GradientTransformUtility((v) => only(transform: v));

  RadialGradientUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  T focalRadius(double v) => only(focalRadius: v);

  T radius(double v) => only(radius: v);

  T colors(List<Color> v) => call(colors: v);

  T stops(List<double> v) => only(stops: v);

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
    return only(
      center: center,
      radius: radius,
      colors: colors?.map(ColorDto.new).toList(),
      stops: stops,
      focal: focal,
      focalRadius: focalRadius,
      tileMode: tileMode,
      transform: transform,
    );
  }

  @override
  T only({
    AlignmentGeometry? center,
    double? radius,
    List<ColorDto>? colors,
    List<double>? stops,
    AlignmentGeometry? focal,
    double? focalRadius,
    TileMode? tileMode,
    GradientTransform? transform,
  }) {
    return builder(
      RadialGradientDto(
        center: center,
        radius: radius,
        tileMode: tileMode,
        focal: focal,
        focalRadius: focalRadius,
        transform: transform,
        colors: colors,
        stops: stops,
      ),
    );
  }
}

/// Utility class for creating and manipulating [LinearGradient] attributes.
///
/// Accepts a [builder] function that takes a [LinearGradientDto] and returns an object of type [T].
@immutable
class LinearGradientUtility<T extends Attribute>
    extends DtoUtility<T, LinearGradientDto, LinearGradient> {
  late final begin = AlignmentUtility((v) => only(begin: v));
  late final end = AlignmentUtility((v) => only(end: v));
  late final tileMode = TileModeUtility((v) => only(tileMode: v));
  late final transform = GradientTransformUtility((v) => only(transform: v));
  LinearGradientUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  T colors(List<Color> v) => call(colors: v);

  T stops(List<double> v) => only(stops: v);

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

  @override
  T only({
    List<ColorDto>? colors,
    List<double>? stops,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    TileMode? tileMode,
    GradientTransform? transform,
  }) {
    return builder(
      LinearGradientDto(
        begin: begin,
        end: end,
        tileMode: tileMode,
        transform: transform,
        colors: colors,
        stops: stops,
      ),
    );
  }
}

/// Utility class for creating and manipulating [SweepGradient] attributes.
///
/// Accepts a [builder] function that takes a [SweepGradientDto] and returns an object of type [T].
class SweepGradientUtility<T extends Attribute>
    extends DtoUtility<T, SweepGradientDto, SweepGradient> {
  late final transform = GradientTransformUtility((v) => only(transform: v));
  late final center = AlignmentUtility((v) => only(center: v));
  late final tileMode = TileModeUtility((v) => only(tileMode: v));

  SweepGradientUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  T endAngle(double v) => call(endAngle: v);

  T startAngle(double v) => call(startAngle: v);

  T colors(List<Color> v) => call(colors: v);

  T stops(List<double> v) => call(stops: v);

  T call({
    List<Color>? colors,
    List<double>? stops,
    AlignmentGeometry? center,
    double? startAngle,
    double? endAngle,
    TileMode? tileMode,
    GradientTransform? transform,
  }) {
    return only(
      center: center,
      startAngle: startAngle,
      endAngle: endAngle,
      colors: colors?.map(ColorDto.new).toList(),
      stops: stops,
      tileMode: tileMode,
      transform: transform,
    );
  }

  @override
  T only({
    AlignmentGeometry? center,
    double? startAngle,
    double? endAngle,
    List<ColorDto>? colors,
    List<double>? stops,
    TileMode? tileMode,
    GradientTransform? transform,
  }) {
    return builder(
      SweepGradientDto(
        center: center,
        startAngle: startAngle,
        endAngle: endAngle,
        tileMode: tileMode,
        transform: transform,
        colors: colors,
        stops: stops,
      ),
    );
  }
}
