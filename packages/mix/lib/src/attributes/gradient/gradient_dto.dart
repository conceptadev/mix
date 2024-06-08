import 'package:flutter/material.dart';

import '../../core/dto.dart';
import '../../core/models/mix_data.dart';
import '../../internal/iterable_ext.dart';
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
abstract class GradientDto<T extends Gradient> extends Dto<T> {
  final List<double>? stops;

  final List<ColorDto>? colors;

  final GradientTransform? transform;

  const GradientDto({this.stops, this.colors, this.transform});

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
