import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/iterable_ext.dart';
import '../../factory/mix_provider_data.dart';
import '../color/color_dto.dart';

/// Abstract class representing a [Dto] Data transfer object for a gradient.
/// It provides common properties and methods for different types of gradients.
///
/// This is used to allow for resolvable value tokens, and also the correct merge and combining behavior.
/// It extends the [Dto] class and implements the [resolve] and [merge] methods.
/// It also overrides the [props] getter to provide a list of properties used for equality comparison.
///
/// See also:
/// * [GradientDto], which is the base class for this class.
/// * [LinearGradientDto], which is a type of gradient DTO.
/// * [RadialGradientDto], which is a type of gradient DTO.
/// * [SweepGradientDto], which is a type of gradient DTO.
/// * [Gradient], which is the Flutter counterpart of this class.
@immutable
abstract class GradientDto<T extends Gradient> extends Dto<GradientDto<T>, T> {
  /// The list of stops for the gradient.
  final List<double>? stops;

  /// The list of color DTOs for the gradient.
  final List<ColorDto>? colors;

  /// The transform applied to the gradient.
  final GradientTransform? transform;

  /// Constructs a [GradientDto] with the given [stops], [colors], and [transform].
  const GradientDto({this.stops, this.colors, this.transform});

  /// Creates a [GradientDto] from a given [gradient].
  /// Throws an [UnimplementedError] if the gradient type is unknown.
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

  /// Resolves the gradient DTO into a concrete gradient based on the given [mix] data.
  @override
  T resolve(MixData mix);

  /// Merges this gradient DTO with another [other] gradient DTO.
  @override
  GradientDto<T> merge(covariant GradientDto<T>? other);

  /// The list of properties used for equality comparison.
  @override
  get props => [stops, colors, transform];
}

/// A data transfer object [Dto] representing a linear gradient.
///
/// This DTO extends the [GradientDto] class and provides additional properties
/// specific to linear gradients, such as the [begin] and [end] alignment points,
/// [tileMode], and [transform].
///
/// Linear gradients can be created using the [LinearGradientDto.from] method,
/// which takes a [LinearGradient] object and returns a corresponding
/// [LinearGradientDto] instance.
///
/// Linear gradients can also be resolved using the [resolve] method, which
/// takes a [MixData] object and returns a resolved [LinearGradient] instance.
///
/// Linear gradients can be merged using the [merge] method, which takes
/// another [LinearGradientDto] object and returns a new [LinearGradientDto]
/// instance with merged properties. If the provided [LinearGradientDto] is null,
/// the merge operation returns the original [LinearGradientDto] instance.
///
/// Example usage:
/// ```dart
/// final gradient1 = LinearGradientDto(
///   begin: Alignment.topLeft,
///   end: Alignment.bottomRight,
///   colors: [Colors.red, Colors.blue],
///   stops: [0.0, 1.0],
/// );
///
/// final gradient2 = LinearGradientDto(
///   begin: Alignment.centerLeft,
///   end: Alignment.centerRight,
///   colors: [Colors.green, Colors.yellow],
///   stops: [0.0, 1.0],
/// );
///
/// final mergedGradient = gradient1.merge(gradient2);
/// ```
/// See also:
/// * [LinearGradient], which is the Flutter counterpart of this class.
/// * [GradientDto], which is the base class for this class.
/// * [RadialGradientDto], which is another type of gradient DTO.
/// * [SweepGradientDto], which is another type of gradient DTO.
@immutable
class LinearGradientDto extends GradientDto<LinearGradient> {
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

  static LinearGradientDto from(LinearGradient gradient) {
    return LinearGradientDto(
      begin: gradient.begin,
      end: gradient.end,
      tileMode: gradient.tileMode,
      transform: gradient.transform,
      colors: gradient.colors.map(ColorDto.new).toList(),
      stops: gradient.stops,
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
      tileMode: other.tileMode ?? tileMode,
      transform: other.transform ?? transform,
      colors: colors?.merge(other.colors),
      stops: stops?.merge(other.stops),
    );
  }

  @override
  List<Object?> get props => [begin, end, colors, stops, tileMode, transform];
}

/// A data transfer object [Dto] representing a radial gradient.
///
/// This DTO extends the [GradientDto] class and provides additional properties
/// specific to radial gradients, such as the [center], [radius], [focalRadius],
/// [focal], and [tileMode].
///
/// Radial gradients can be created using the [RadialGradientDto.from] method,
/// which takes a [RadialGradient] object and returns a corresponding
/// [RadialGradientDto] instance.
///
/// Radial gradients can also be resolved using the [resolve] method, which
/// takes a [MixData] object and returns a resolved [RadialGradient] instance.
///
/// Radial gradients can be merged using the [merge] method, which takes
/// another [RadialGradientDto] object and returns a new [RadialGradientDto]
/// instance with merged properties. If the provided [RadialGradientDto] is null,
/// the merge operation returns the original [RadialGradientDto] instance.
///
/// Example usage:
///
/// ```dart
/// final gradient1 = RadialGradientDto(
/// center: Alignment.center,
/// radius: 0.5,
/// colors: [Colors.red, Colors.blue],
/// stops: [0.0, 1.0],
/// );
///
/// final gradient2 = RadialGradientDto(
/// center: Alignment.center,
/// radius: 0.5,
/// colors: [Colors.green, Colors.yellow],
/// stops: [0.0, 1.0],
/// );
///
/// final mergedGradient = gradient1.merge(gradient2);
/// ```
///
/// See also:
/// * [RadialGradient], which is the Flutter counterpart of this class.
/// * [GradientDto], which is the base class for this class.
/// * [LinearGradientDto], which is another type of gradient DTO.
/// * [SweepGradientDto], which is another type of gradient DTO.
///
@immutable
class RadialGradientDto extends GradientDto<RadialGradient> {
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

  static RadialGradientDto from(RadialGradient gradient) {
    return RadialGradientDto(
      center: gradient.center,
      radius: gradient.radius,
      tileMode: gradient.tileMode,
      focal: gradient.focal,
      focalRadius: gradient.focalRadius,
      transform: gradient.transform,
      colors: gradient.colors.map(ColorDto.new).toList(),
      stops: gradient.stops,
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
      tileMode: other.tileMode ?? tileMode,
      focal: focal,
      focalRadius: other.focalRadius ?? focalRadius,
      transform: other.transform ?? transform,
      colors: colors?.merge(other.colors),
      stops: stops?.merge(other.stops),
    );
  }

  @override
  List<Object?> get props =>
      [center, radius, colors, stops, tileMode, focal, transform, focalRadius];
}

/// A data transfer object [Dto] representing a sweep gradient.
///
/// This DTO extends the [GradientDto] class and provides additional properties
/// specific to sweep gradients, such as the [center], [startAngle], [endAngle],
/// and [tileMode].
///
/// Sweep gradients can be created using the [SweepGradientDto.from] method,
/// which takes a [SweepGradient] object and returns a corresponding
/// [SweepGradientDto] instance.
///
/// Sweep gradients can also be resolved using the [resolve] method, which
/// takes a [MixData] object and returns a resolved [SweepGradient] instance.
///
/// Sweep gradients can be merged using the [merge] method, which takes
/// another [SweepGradientDto] object and returns a new [SweepGradientDto]
/// instance with merged properties. If the provided [SweepGradientDto] is null,
/// the merge operation returns the original [SweepGradientDto] instance.
///
/// Example usage:
///
/// ```dart
/// final gradient1 = SweepGradientDto(
///  center: Alignment.center,
/// startAngle: 0.0,
/// endAngle: 0.5,
/// colors: [Colors.red, Colors.blue],
/// stops: [0.0, 1.0],
/// );
///
/// final gradient2 = SweepGradientDto(
/// center: Alignment.center,
/// startAngle: 0.0,
/// endAngle: 0.5,
/// colors: [Colors.green, Colors.yellow],
/// stops: [0.0, 1.0],
/// );
///
/// final mergedGradient = gradient1.merge(gradient2);
/// ```
///
/// See also:
/// * [SweepGradient], which is the Flutter counterpart of this class.
/// * [GradientDto], which is the base class for this class.
/// * [LinearGradientDto], which is another type of gradient DTO.
/// * [RadialGradientDto], which is another type of gradient DTO.

@immutable
class SweepGradientDto extends GradientDto<SweepGradient> {
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

  static SweepGradientDto from(SweepGradient gradient) {
    return SweepGradientDto(
      center: gradient.center,
      startAngle: gradient.startAngle,
      endAngle: gradient.endAngle,
      tileMode: gradient.tileMode,
      transform: gradient.transform,
      colors: gradient.colors.map(ColorDto.new).toList(),
      stops: gradient.stops,
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
      tileMode: other.tileMode ?? tileMode,
      transform: other.transform ?? transform,
      colors: colors?.merge(other.colors),
      stops: stops?.merge(other.stops),
    );
  }

  @override
  List<Object?> get props =>
      [center, startAngle, endAngle, colors, stops, tileMode, transform];
}
