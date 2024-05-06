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
///
/// Example usage:
/// ```dart
/// final gradient = GradientUtility(builder);
///
/// final linearGradient = gradient.linear(
///   begin: Alignment.topLeft,
///   end: Alignment.bottomRight,
///   colors: [Colors.red, Colors.blue],
/// );
///
/// final radialGradient = gradient.radial(
///   center: Alignment.center,
///   radius: 0.5,
///   colors: [Colors.red, Colors.blue],
/// );
///
/// final sweepGradient = gradient.sweep(
///   center: Alignment.center,
///   startAngle: 0.0,
///   endAngle: 0.5,
///   colors: [Colors.red, Colors.blue],
/// );
///
///
/// final gradientAttribute = gradient.as(linearGradient);
/// ```
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
///
/// Example usage:
///
/// ```dart
/// final gradient = RadialGradientUtility<StyleAttribute>(builder);
/// final radialGradient = gradient(
///   center: Alignment.center,
///   radius: 0.5,
///   colors: [Colors.red, Colors.blue],
/// );
/// ```
///
/// See also:
/// * [RadialGradient], a class for creating radial gradients.
/// * [RadialGradientDto], a class for creating radial gradient values.
/// * [GradientAttribute], a class for creating gradient attributes.
/// * [GradientDto], a class for creating gradient values.
@immutable
class RadialGradientUtility<T extends Attribute>
    extends DtoUtility<T, RadialGradientDto, RadialGradient> {
  late final center = AlignmentUtility((v) => only(center: v));

  late final focal = AlignmentUtility((v) => only(focal: v));

  late final tileMode = TileModeUtility((v) => only(tileMode: v));

  late final transform = GradientTransformUtility((v) => only(transform: v));

  RadialGradientUtility(super.builder)
      : super(valueToDto: RadialGradientDto.from);

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
///
/// Example usage:
///
// final gradient = LinearGradientUtility<StyleAttribute>(builder);
// final linearGradient = gradient(
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
//   colors: [Colors.red, Colors.blue],
// );
///
///
/// See also:
/// * [LinearGradient], a class for creating linear gradients.
/// * [LinearGradientDto], a class for creating linear gradient values.
/// * [GradientAttribute], a class for creating gradient attributes.
/// * [GradientDto], a class for creating gradient values.
@immutable
class LinearGradientUtility<T extends Attribute>
    extends DtoUtility<T, LinearGradientDto, LinearGradient> {
  late final begin = AlignmentUtility((v) => only(begin: v));
  late final end = AlignmentUtility((v) => only(end: v));
  late final tileMode = TileModeUtility((v) => only(tileMode: v));
  late final transform = GradientTransformUtility((v) => only(transform: v));
  LinearGradientUtility(super.builder)
      : super(valueToDto: LinearGradientDto.from);

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
///
/// Example usage:
///
/// ```dart
/// final gradient = SweepGradientUtility<StyleAttribute>(builder);
/// final sweepGradient = gradient(
///   center: Alignment.center,
///   startAngle: 0.0,
///   endAngle: pi,
///   colors: [Colors.red, Colors.blue],
/// );
/// ```
///
/// See also:
/// * [SweepGradient], a class for creating sweep gradients.
/// * [SweepGradientDto], a class for creating sweep gradient values.
/// * [GradientAttribute], a class for creating gradient attributes.
/// * [GradientDto], a class for creating gradient values.
class SweepGradientUtility<T extends Attribute>
    extends DtoUtility<T, SweepGradientDto, SweepGradient> {
  late final transform = GradientTransformUtility((v) => only(transform: v));
  late final center = AlignmentUtility((v) => only(center: v));
  late final tileMode = TileModeUtility((v) => only(tileMode: v));

  SweepGradientUtility(super.builder)
      : super(valueToDto: SweepGradientDto.from);

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
