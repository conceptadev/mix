import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/iterable_ext.dart';
import '../../factory/mix_provider_data.dart';
import '../color/color_dto.dart';

/// Represents a base Data transfer object of [Gradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[Gradient]
///
/// See also:
/// * [Gradient], which is the Flutter counterpart of this class.
/// * [LinearGradientDto], which extends this class.
/// * [RadialGradientDto], which extends this class.
/// * [SweepGradientDto], which extends this class.
///
/// {@category DTO}
@immutable
abstract class GradientDto<T extends Gradient> extends Dto<T>
    with Mergeable<GradientDto<T>> {
  final List<double>? stops;

  final List<ColorDto>? colors;

  final GradientTransform? transform;

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

  /// Creates a [GradientDto] from a given [gradient].
  ///
  /// Returns null if the gradient is null.
  static GradientDto? maybeFrom(Gradient? gradient) {
    return gradient == null ? null : from(gradient);
  }

  /// Resolves [GradientDto] given a [MixData] into a [Gradient
  @override
  T resolve(MixData mix);

  /// Merges [GradientDto] with another `other` [GradientDto]
  @override
  GradientDto<T> merge(covariant GradientDto<T>? other);

  @override
  get props => [stops, colors, transform];
}

/// Represents a Data transfer object of [LinearGradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[LinearGradient]
///
/// See also:
/// * [LinearGradient], which is the Flutter counterpart of this class.
/// * [GradientDto], which is the base class for this class.
/// * [RadialGradientDto], which is another type of gradient DTO.
/// * [SweepGradientDto], which is another type of gradient DTO.
///
/// {@category DTO}
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

  /// Creates a [LinearGradientDto] from a given [gradient].
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

  /// Creates a [LinearGradientDto] from a given [gradient].
  ///
  /// Returns null if the gradient is null.
  static LinearGradientDto? maybeFrom(LinearGradient? gradient) {
    return gradient == null ? null : from(gradient);
  }

  /// Resolves [LinearGradientDto] given a [MixData] into a [LinearGradient]
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

  /// Merges [LinearGradientDto] with another `other` [LinearGradientDto
  @override
  LinearGradientDto merge(LinearGradientDto? other) {
    if (other == null) return this;

    return LinearGradientDto(
      begin: other.begin ?? begin,
      end: other.end ?? end,
      tileMode: other.tileMode ?? tileMode,
      transform: other.transform ?? transform,
      colors: colors?.merge(other.colors) ?? other.colors,
      stops: stops?.merge(other.stops) ?? other.stops,
    );
  }

  @override
  List<Object?> get props => [begin, end, colors, stops, tileMode, transform];
}

/// Represents a Data transfer object of [RadialGradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[RadialGradient]
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
/// {@category DTO}
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

  /// Creates a [RadialGradientDto] from a given [RadialGradient].
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

  /// Creates a [RadialGradientDto] from a given [RadialGradient].
  ///
  /// Returns null if the gradient is null.
  static RadialGradientDto? maybeFrom(RadialGradient? gradient) {
    return gradient == null ? null : from(gradient);
  }

  /// Resolves [RadialGradientDto] given a [MixData] into a [RadialGradient
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

  /// Merges [RadialGradientDto] with another `other` [RadialGradientDto]
  @override
  RadialGradientDto merge(RadialGradientDto? other) {
    if (other == null) return this;

    return RadialGradientDto(
      center: other.center ?? center,
      radius: other.radius ?? radius,
      tileMode: other.tileMode ?? tileMode,
      focal: other.focal ?? focal,
      focalRadius: other.focalRadius ?? focalRadius,
      transform: other.transform ?? transform,
      colors: colors?.merge(other.colors) ?? other.colors,
      stops: stops?.merge(other.stops) ?? other.stops,
    );
  }

  @override
  List<Object?> get props =>
      [center, radius, colors, stops, tileMode, focal, transform, focalRadius];
}

/// Represents a Data transfer object of [SweepGradient]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[SweepGradient]
///
/// See also:
/// * [SweepGradient], which is the Flutter counterpart of this class.
/// * [GradientDto], which is the base class for this class.
/// * [LinearGradientDto], which is another type of gradient DTO.
/// * [RadialGradientDto], which is another type of gradient DTO.
///
/// {@category DTO}
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

  /// Creates a [SweepGradientDto] from a given [SweepGradient].
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

  /// Creates a [SweepGradientDto] from a given [SweepGradient].
  ///
  /// Returns null if the gradient is null.
  static SweepGradientDto? maybeFrom(SweepGradient? gradient) {
    return gradient == null ? null : from(gradient);
  }

  /// Resolves [SweepGradientDto] given a [MixData] into a [SweepGradient]
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

  /// Merges [SweepGradientDto] with another `other` [SweepGradientDto]
  @override
  SweepGradientDto merge(SweepGradientDto? other) {
    if (other == null) return this;

    return SweepGradientDto(
      center: other.center ?? center,
      startAngle: other.startAngle ?? startAngle,
      endAngle: other.endAngle ?? endAngle,
      tileMode: other.tileMode ?? tileMode,
      transform: other.transform ?? transform,
      colors: colors?.merge(other.colors) ?? other.colors,
      stops: stops?.merge(other.stops) ?? other.stops,
    );
  }

  @override
  List<Object?> get props =>
      [center, startAngle, endAngle, colors, stops, tileMode, transform];
}
