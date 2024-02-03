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
class GradientUtility<T extends StyleAttribute> extends MixUtility<T, GradientDto> {
  const GradientUtility(super.builder);

  /// Returns a [RadialGradientUtility] for creating radial gradients.
  RadialGradientUtility<T> get radial {
    return RadialGradientUtility(builder);
  }

  /// Returns a [LinearGradientUtility] for creating linear gradients.
  LinearGradientUtility<T> get linear {
    return LinearGradientUtility(builder);
  }

  /// Returns a [SweepGradientUtility] for creating sweep gradients.
  SweepGradientUtility<T> get sweep {
    return SweepGradientUtility(builder);
  }

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
class RadialGradientUtility<T extends StyleAttribute> extends MixUtility<T, RadialGradientDto> {
  const RadialGradientUtility(super.builder);

  /// Returns an [AlignmentUtility] for setting the center of the radial gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = RadialGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.center.center();
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [RadialGradientDto]
  /// that has a center value of Alignment.center.
  ///
  /// See also:
  /// * [AlignmentUtility], a utility class for creating and manipulating [AlignmentGeometry] attributes.
  AlignmentUtility<T> get center {
    return AlignmentUtility((center) => call(center: center));
  }

  /// Returns an [AlignmentUtility] for setting the focal point of the radial gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = RadialGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.focal.center();
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [RadialGradientDto]
  /// that has a focal value of Alignment.center.
  ///
  /// See also:
  /// * [AlignmentUtility], a utility class for creating and manipulating [AlignmentGeometry] attributes.
  AlignmentUtility<T> get focal {
    return AlignmentUtility((focal) => call(focal: focal));
  }

  /// Returns a [TileModeUtility] for setting the tile mode of the radial gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = RadialGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.tileMode.clamp();
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [RadialGradientDto]
  /// that has a tileMode value of TileMode.clamp.
  ///
  /// See also:
  /// * [TileModeUtility], a utility class for creating and manipulating [TileMode] attributes.
  TileModeUtility<T> get tileMode {
    return TileModeUtility((tileMode) => call(tileMode: tileMode));
  }

  /// Returns a [GradientTransformUtility] for setting the transform of the radial gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = RadialGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.transform.rotate(pi / 4);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [RadialGradientDto]
  /// that has a transform value of a Matrix4 rotation of pi / 4.
  ///
  /// See also:
  /// * [GradientTransformUtility], a utility class for creating and manipulating [GradientTransform] attributes.
  GradientTransformUtility<T> get transform {
    return GradientTransformUtility((transform) => call(transform: transform));
  }

  /// Method for setting the focal radius of the radial gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = RadialGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.focalRadius(0.2);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [RadialGradientDto]
  /// that has a focalRadius value of 0.2.
  T focalRadius(double focalRadius) => call(focalRadius: focalRadius);

  /// Function for setting the radius of the radial gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = RadialGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.radius(0.5);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [RadialGradientDto]
  /// that has a radius value of 0.5.
  T radius(double radius) => call(radius: radius);

  /// Sets the colors of the radial gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = RadialGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.colors([Colors.red, Colors.blue]);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [RadialGradientDto]
  /// that has a colors value of [Colors.red, Colors.blue].
  T colors(List<Color> colors) => call(colors: colors);

  /// Sets the stops of the radial gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = RadialGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.stops([0.0, 1.0]);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [RadialGradientDto]
  /// that has a stops value of [0.0, 1.0].
  T stops(List<double> stops) => call(stops: stops);

  /// Converts the provided [RadialGradient] to the specified type [T].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = RadialGradientUtility<StyleAttribute>(builder);
  /// final gradient = RadialGradient(center: Alignment.center, radius: 0.5);
  /// final attribute = gradient.as(gradient);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [RadialGradientDto]
  /// that has a center value of Alignment.center and a radius of 0.5.
  T as(RadialGradient gradient) {
    return builder(RadialGradientDto.from(gradient));
  }

  /// Creates a [RadialGradientDto] with the provided parameters and calls the [builder] function.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = RadialGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient(center: Alignment.center, radius: 0.5);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [RadialGradientDto]
  /// that has a center value of Alignment.center and a radius of 0.5.
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
      colors: colors?.map(ColorDto.new).toList(),
      stops: stops,
    );

    return builder(gradient);
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
class LinearGradientUtility<T extends StyleAttribute> extends MixUtility<T, LinearGradientDto> {
  const LinearGradientUtility(super.builder);

  /// Returns an [AlignmentUtility] for setting the begin of the linear gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = LinearGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.begin.topLeft();
  ///
  /// ```
  /// Attribute now holds a [GradientAttribute] with a [LinearGradientDto]
  /// that has a begin value of Alignment.topLeft.
  ///
  /// See also:
  /// * [AlignmentUtility], a utility class for creating and manipulating [AlignmentGeometry] attributes.
  /// * [AlignmentGeometry], a class for creating alignment values.
  /// * [Alignment], a class for creating alignment values.
  AlignmentUtility<T> get begin {
    return AlignmentUtility((AlignmentGeometry begin) {
      return builder(LinearGradientDto(begin: begin));
    });
  }

  /// Returns an [AlignmentUtility] for setting the end of the linear gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = LinearGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.end.bottomRight();
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [LinearGradientDto]
  /// that has an end value of Alignment.bottomRight.
  ///
  /// See also:
  /// * [AlignmentUtility], a utility class for creating and manipulating [AlignmentGeometry] attributes.
  /// * [AlignmentGeometry], a class for creating alignment values.
  /// * [Alignment], a class for creating alignment values.
  AlignmentUtility<T> get end {
    return AlignmentUtility((AlignmentGeometry end) {
      return builder(LinearGradientDto(end: end));
    });
  }

  /// Returns a [TileModeUtility] for setting the tile mode of the linear gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = LinearGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.tileMode.clamp();
  ///
  /// ```
  /// Attribute now holds a [GradientAttribute] with a [LinearGradientDto]
  /// that has a tileMode value of TileMode.clamp.
  ///
  /// See also:
  /// * [TileModeUtility], a utility class for creating and manipulating [TileMode] attributes.
  /// * [TileMode], an enum for setting the tile mode of a gradient.
  ///
  TileModeUtility<T> get tileMode {
    return TileModeUtility(
      (tileMode) => builder(LinearGradientDto(tileMode: tileMode)),
    );
  }

  /// Returns a [GradientTransformUtility] for setting the transform of the linear gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = LinearGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.transform.rotate(pi / 4);
  ///
  /// ```
  /// Attribute now holds a [GradientAttribute] with a [LinearGradientDto]
  /// that has a transform value of a Matrix4 rotation of pi / 4.
  ///
  /// See also:
  /// * [GradientTransformUtility], a utility class for creating and manipulating [GradientTransform] attributes.
  /// * [Matrix4], a class for creating 4D matrices.
  GradientTransformUtility<T> get transform {
    return GradientTransformUtility((GradientTransform transform) {
      return builder(LinearGradientDto(transform: transform));
    });
  }

  /// Sets the colors of the linear gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = LinearGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.colors([Colors.red, Colors.blue]);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [LinearGradientDto]
  /// that has a colors value of [Colors.red, Colors.blue].
  ///
  /// See also:
  /// * [LinearGradient], a class for creating linear gradients.
  /// * [LinearGradientDto], a class for creating linear gradient values.
  T colors(List<Color> colors) => call(colors: colors);

  /// Sets the stops of the linear gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = LinearGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.stops([0.0, 1.0]);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [LinearGradientDto]
  /// that has a stops value of [0.0, 1.0].
  ///
  /// See also:
  /// * [LinearGradient], a class for creating linear gradients.
  /// * [LinearGradientDto], a class for creating linear gradient values.
  T stops(List<double> stops) => builder(LinearGradientDto(stops: stops));

  /// Converts the provided [LinearGradient] to the specified type [T].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = LinearGradientUtility<StyleAttribute>(builder);
  /// final gradient = LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight);
  ///
  /// final attribute = gradient.as(gradient);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [LinearGradientDto]
  /// that has a begin value of Alignment.topLeft and an end value of Alignment.bottomRight.
  ///
  /// See also:
  /// * [LinearGradient], a class for creating linear gradients.
  /// * [LinearGradientDto], a class for creating linear gradient values.
  T as(LinearGradient gradient) {
    return builder(LinearGradientDto.from(gradient));
  }

  /// Creates a [LinearGradientDto] with the provided parameters and calls the [builder] function.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = LinearGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient(begin: Alignment.topLeft, end: Alignment.bottomRight);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [LinearGradientDto]
  /// that has a begin value of Alignment.topLeft and an end value of Alignment.bottomRight.
  ///
  /// See also:
  /// * [LinearGradient], a class for creating linear gradients.
  /// * [LinearGradientDto], a class for creating linear gradient values.
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
class SweepGradientUtility<T extends StyleAttribute>
    extends DtoUtility<T, SweepGradientDto, SweepGradient> {
  const SweepGradientUtility(super.builder) : super(valueToDto: SweepGradientDto.from);

  /// Returns an [AlignmentUtility] for setting the center of the sweep gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = SweepGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.center.center();
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [SweepGradientDto]
  /// that has a center value of Alignment.center.
  ///
  /// See also:
  /// * [AlignmentUtility], a utility class for creating and manipulating [AlignmentGeometry] attributes.
  AlignmentUtility<T> get center {
    return AlignmentUtility((AlignmentGeometry center) {
      return builder(SweepGradientDto(center: center));
    });
  }

  /// Returns a [TileModeUtility] for setting the tile mode of the sweep gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = SweepGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.tileMode.clamp();
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [SweepGradientDto]
  /// that has a tileMode value of TileMode.clamp.
  ///
  /// See also:
  /// * [TileModeUtility], a utility class for creating and manipulating [TileMode] attributes.
  TileModeUtility<T> get tileMode {
    return TileModeUtility((TileMode tileMode) {
      return builder(SweepGradientDto(tileMode: tileMode));
    });
  }

  /// Returns a [GradientTransformUtility] for setting the transform of the sweep gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = SweepGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.transform.rotate(pi / 4);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [SweepGradientDto]
  /// that has a transform value of a Matrix4 rotation of pi / 4.
  ///
  /// See also:
  /// * [GradientTransformUtility], a utility class for creating and manipulating [GradientTransform] attributes.
  GradientTransformUtility<T> get transform {
    return GradientTransformUtility((GradientTransform transform) {
      return builder(SweepGradientDto(transform: transform));
    });
  }

  /// Method for setting the end angle of the sweep gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = SweepGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.endAngle(pi);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [SweepGradientDto]
  /// that has an endAngle value of pi (3.14159...).
  T endAngle(double endAngle) => call(endAngle: endAngle);

  /// Method for setting the start angle of the sweep gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = SweepGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.startAngle(0.0);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [SweepGradientDto]
  /// that has a startAngle value of 0.0.
  T startAngle(double startAngle) => call(startAngle: startAngle);

  /// Sets the colors of the sweep gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = SweepGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.colors([Colors.red, Colors.blue]);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [SweepGradientDto]
  /// that has a colors value of [Colors.red, Colors.blue].
  T colors(List<Color> colors) => call(colors: colors);

  /// Sets the stops of the sweep gradient.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = SweepGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient.stops([0.0, 1.0]);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [SweepGradientDto]
  /// that has a stops value of [0.0, 1.0].
  T stops(List<double> stops) => call(stops: stops);

  /// Creates a [SweepGradientDto] with the provided parameters and calls the [builder] function.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = SweepGradientUtility<StyleAttribute>(builder);
  /// final attribute = gradient(center: Alignment.center, startAngle: 0.0, endAngle: pi);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [SweepGradientDto]
  /// that has a center value of Alignment.center, a startAngle of 0.0, and an endAngle of pi.
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

  /// Converts the provided [SweepGradient] to the specified type [T].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final gradient = SweepGradientUtility<StyleAttribute>(builder);
  /// final gradient = SweepGradient(center: Alignment.center, startAngle: 0.0, endAngle: pi);
  /// final attribute = gradient.as(gradient);
  /// ```
  ///
  /// Attribute now holds a [GradientAttribute] with a [SweepGradientDto]
  /// that has a center value of Alignment.center, a startAngle of 0.0, and an endAngle of pi.
  @override
  T as(SweepGradient gradient) {
    return builder(SweepGradientDto.from(gradient));
  }
}
