// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_dto.dart';

// **************************************************************************
// MixableDtoGenerator
// **************************************************************************

base mixin _$LinearGradientDto on Dto<LinearGradient> {
  /// Resolves to [LinearGradient] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final linearGradient = LinearGradientDto(...).resolve(mix);
  /// ```
  @override
  LinearGradient resolve(MixData mix) {
    return LinearGradient(
      begin: _$this.begin ?? defaultValue.begin,
      end: _$this.end ?? defaultValue.end,
      tileMode: _$this.tileMode ?? defaultValue.tileMode,
      transform: _$this.transform ?? defaultValue.transform,
      colors: _$this.colors?.map((e) => e.resolve(mix)).toList() ??
          defaultValue.colors,
      stops: _$this.stops ?? defaultValue.stops,
    );
  }

  /// Merges the properties of this [LinearGradientDto] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [LinearGradientDto] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  LinearGradientDto merge(LinearGradientDto? other) {
    if (other == null) return _$this;

    return LinearGradientDto(
      begin: other.begin ?? _$this.begin,
      end: other.end ?? _$this.end,
      tileMode: other.tileMode ?? _$this.tileMode,
      transform: other.transform ?? _$this.transform,
      colors: MixHelpers.mergeList(_$this.colors, other.colors),
      stops: MixHelpers.mergeList(_$this.stops, other.stops),
    );
  }

  /// The list of properties that constitute the state of this [LinearGradientDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [LinearGradientDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.begin,
        _$this.end,
        _$this.tileMode,
        _$this.transform,
        _$this.colors,
        _$this.stops,
      ];

  LinearGradientDto get _$this => this as LinearGradientDto;
}

/// Utility class for configuring [LinearGradientDto] properties.
///
/// This class provides methods to set individual properties of a [LinearGradientDto].
/// Use the methods of this class to configure specific properties of a [LinearGradientDto].
class LinearGradientUtility<T extends Attribute>
    extends DtoUtility<T, LinearGradientDto, LinearGradient> {
  /// Utility for defining [LinearGradientDto.begin]
  late final begin = AlignmentGeometryUtility((v) => only(begin: v));

  /// Utility for defining [LinearGradientDto.end]
  late final end = AlignmentGeometryUtility((v) => only(end: v));

  /// Utility for defining [LinearGradientDto.tileMode]
  late final tileMode = TileModeUtility((v) => only(tileMode: v));

  /// Utility for defining [LinearGradientDto.transform]
  late final transform = GradientTransformUtility((v) => only(transform: v));

  /// Utility for defining [LinearGradientDto.colors]
  late final colors = ColorListUtility((v) => only(colors: v));

  /// Utility for defining [LinearGradientDto.stops]
  late final stops = ListUtility<T, double>((v) => only(stops: v));

  LinearGradientUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [LinearGradientDto] with the specified properties.
  @override
  T only({
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    TileMode? tileMode,
    GradientTransform? transform,
    List<ColorDto>? colors,
    List<double>? stops,
  }) {
    return build(LinearGradientDto(
      begin: begin,
      end: end,
      tileMode: tileMode,
      transform: transform,
      colors: colors,
      stops: stops,
    ));
  }

  T call({
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    TileMode? tileMode,
    GradientTransform? transform,
    List<Color>? colors,
    List<double>? stops,
  }) {
    return only(
      begin: begin,
      end: end,
      tileMode: tileMode,
      transform: transform,
      colors: colors?.map((e) => e.toDto()).toList(),
      stops: stops,
    );
  }
}

extension LinearGradientMixExt on LinearGradient {
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

extension ListLinearGradientMixExt on List<LinearGradient> {
  List<LinearGradientDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

base mixin _$RadialGradientDto on Dto<RadialGradient> {
  /// Resolves to [RadialGradient] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final radialGradient = RadialGradientDto(...).resolve(mix);
  /// ```
  @override
  RadialGradient resolve(MixData mix) {
    return RadialGradient(
      center: _$this.center ?? defaultValue.center,
      radius: _$this.radius ?? defaultValue.radius,
      tileMode: _$this.tileMode ?? defaultValue.tileMode,
      focal: _$this.focal ?? defaultValue.focal,
      focalRadius: _$this.focalRadius ?? defaultValue.focalRadius,
      transform: _$this.transform ?? defaultValue.transform,
      colors: _$this.colors?.map((e) => e.resolve(mix)).toList() ??
          defaultValue.colors,
      stops: _$this.stops ?? defaultValue.stops,
    );
  }

  /// Merges the properties of this [RadialGradientDto] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [RadialGradientDto] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  RadialGradientDto merge(RadialGradientDto? other) {
    if (other == null) return _$this;

    return RadialGradientDto(
      center: other.center ?? _$this.center,
      radius: other.radius ?? _$this.radius,
      tileMode: other.tileMode ?? _$this.tileMode,
      focal: other.focal ?? _$this.focal,
      focalRadius: other.focalRadius ?? _$this.focalRadius,
      transform: other.transform ?? _$this.transform,
      colors: MixHelpers.mergeList(_$this.colors, other.colors),
      stops: MixHelpers.mergeList(_$this.stops, other.stops),
    );
  }

  /// The list of properties that constitute the state of this [RadialGradientDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [RadialGradientDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.center,
        _$this.radius,
        _$this.tileMode,
        _$this.focal,
        _$this.focalRadius,
        _$this.transform,
        _$this.colors,
        _$this.stops,
      ];

  RadialGradientDto get _$this => this as RadialGradientDto;
}

/// Utility class for configuring [RadialGradientDto] properties.
///
/// This class provides methods to set individual properties of a [RadialGradientDto].
/// Use the methods of this class to configure specific properties of a [RadialGradientDto].
class RadialGradientUtility<T extends Attribute>
    extends DtoUtility<T, RadialGradientDto, RadialGradient> {
  /// Utility for defining [RadialGradientDto.center]
  late final center = AlignmentGeometryUtility((v) => only(center: v));

  /// Utility for defining [RadialGradientDto.radius]
  late final radius = DoubleUtility((v) => only(radius: v));

  /// Utility for defining [RadialGradientDto.tileMode]
  late final tileMode = TileModeUtility((v) => only(tileMode: v));

  /// Utility for defining [RadialGradientDto.focal]
  late final focal = AlignmentGeometryUtility((v) => only(focal: v));

  /// Utility for defining [RadialGradientDto.focalRadius]
  late final focalRadius = DoubleUtility((v) => only(focalRadius: v));

  /// Utility for defining [RadialGradientDto.transform]
  late final transform = GradientTransformUtility((v) => only(transform: v));

  /// Utility for defining [RadialGradientDto.colors]
  late final colors = ColorListUtility((v) => only(colors: v));

  /// Utility for defining [RadialGradientDto.stops]
  late final stops = ListUtility<T, double>((v) => only(stops: v));

  RadialGradientUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [RadialGradientDto] with the specified properties.
  @override
  T only({
    AlignmentGeometry? center,
    double? radius,
    TileMode? tileMode,
    AlignmentGeometry? focal,
    double? focalRadius,
    GradientTransform? transform,
    List<ColorDto>? colors,
    List<double>? stops,
  }) {
    return build(RadialGradientDto(
      center: center,
      radius: radius,
      tileMode: tileMode,
      focal: focal,
      focalRadius: focalRadius,
      transform: transform,
      colors: colors,
      stops: stops,
    ));
  }

  T call({
    AlignmentGeometry? center,
    double? radius,
    TileMode? tileMode,
    AlignmentGeometry? focal,
    double? focalRadius,
    GradientTransform? transform,
    List<Color>? colors,
    List<double>? stops,
  }) {
    return only(
      center: center,
      radius: radius,
      tileMode: tileMode,
      focal: focal,
      focalRadius: focalRadius,
      transform: transform,
      colors: colors?.map((e) => e.toDto()).toList(),
      stops: stops,
    );
  }
}

extension RadialGradientMixExt on RadialGradient {
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

extension ListRadialGradientMixExt on List<RadialGradient> {
  List<RadialGradientDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

base mixin _$SweepGradientDto on Dto<SweepGradient> {
  /// Resolves to [SweepGradient] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final sweepGradient = SweepGradientDto(...).resolve(mix);
  /// ```
  @override
  SweepGradient resolve(MixData mix) {
    return SweepGradient(
      center: _$this.center ?? defaultValue.center,
      startAngle: _$this.startAngle ?? defaultValue.startAngle,
      endAngle: _$this.endAngle ?? defaultValue.endAngle,
      tileMode: _$this.tileMode ?? defaultValue.tileMode,
      transform: _$this.transform ?? defaultValue.transform,
      colors: _$this.colors?.map((e) => e.resolve(mix)).toList() ??
          defaultValue.colors,
      stops: _$this.stops ?? defaultValue.stops,
    );
  }

  /// Merges the properties of this [SweepGradientDto] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [SweepGradientDto] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  SweepGradientDto merge(SweepGradientDto? other) {
    if (other == null) return _$this;

    return SweepGradientDto(
      center: other.center ?? _$this.center,
      startAngle: other.startAngle ?? _$this.startAngle,
      endAngle: other.endAngle ?? _$this.endAngle,
      tileMode: other.tileMode ?? _$this.tileMode,
      transform: other.transform ?? _$this.transform,
      colors: MixHelpers.mergeList(_$this.colors, other.colors),
      stops: MixHelpers.mergeList(_$this.stops, other.stops),
    );
  }

  /// The list of properties that constitute the state of this [SweepGradientDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SweepGradientDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.center,
        _$this.startAngle,
        _$this.endAngle,
        _$this.tileMode,
        _$this.transform,
        _$this.colors,
        _$this.stops,
      ];

  SweepGradientDto get _$this => this as SweepGradientDto;
}

/// Utility class for configuring [SweepGradientDto] properties.
///
/// This class provides methods to set individual properties of a [SweepGradientDto].
/// Use the methods of this class to configure specific properties of a [SweepGradientDto].
class SweepGradientUtility<T extends Attribute>
    extends DtoUtility<T, SweepGradientDto, SweepGradient> {
  /// Utility for defining [SweepGradientDto.center]
  late final center = AlignmentGeometryUtility((v) => only(center: v));

  /// Utility for defining [SweepGradientDto.startAngle]
  late final startAngle = DoubleUtility((v) => only(startAngle: v));

  /// Utility for defining [SweepGradientDto.endAngle]
  late final endAngle = DoubleUtility((v) => only(endAngle: v));

  /// Utility for defining [SweepGradientDto.tileMode]
  late final tileMode = TileModeUtility((v) => only(tileMode: v));

  /// Utility for defining [SweepGradientDto.transform]
  late final transform = GradientTransformUtility((v) => only(transform: v));

  /// Utility for defining [SweepGradientDto.colors]
  late final colors = ColorListUtility((v) => only(colors: v));

  /// Utility for defining [SweepGradientDto.stops]
  late final stops = ListUtility<T, double>((v) => only(stops: v));

  SweepGradientUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [SweepGradientDto] with the specified properties.
  @override
  T only({
    AlignmentGeometry? center,
    double? startAngle,
    double? endAngle,
    TileMode? tileMode,
    GradientTransform? transform,
    List<ColorDto>? colors,
    List<double>? stops,
  }) {
    return build(SweepGradientDto(
      center: center,
      startAngle: startAngle,
      endAngle: endAngle,
      tileMode: tileMode,
      transform: transform,
      colors: colors,
      stops: stops,
    ));
  }

  T call({
    AlignmentGeometry? center,
    double? startAngle,
    double? endAngle,
    TileMode? tileMode,
    GradientTransform? transform,
    List<Color>? colors,
    List<double>? stops,
  }) {
    return only(
      center: center,
      startAngle: startAngle,
      endAngle: endAngle,
      tileMode: tileMode,
      transform: transform,
      colors: colors?.map((e) => e.toDto()).toList(),
      stops: stops,
    );
  }
}

extension SweepGradientMixExt on SweepGradient {
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

extension ListSweepGradientMixExt on List<SweepGradient> {
  List<SweepGradientDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
