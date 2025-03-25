// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_dto.dart';

// **************************************************************************
// MixGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

/// A mixin that provides DTO functionality for [LinearGradientMix].
mixin _$LinearGradientMix
    on Mixable<LinearGradient>, HasDefaultValue<LinearGradient> {
  /// Resolves to [LinearGradient] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final linearGradient = LinearGradientMix(...).resolve(mix);
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

  /// Merges the properties of this [LinearGradientMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [LinearGradientMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  LinearGradientMix merge(LinearGradientMix? other) {
    if (other == null) return _$this;

    return LinearGradientMix(
      begin: other.begin ?? _$this.begin,
      end: other.end ?? _$this.end,
      tileMode: other.tileMode ?? _$this.tileMode,
      transform: other.transform ?? _$this.transform,
      colors: MixHelpers.mergeList(_$this.colors, other.colors),
      stops: MixHelpers.mergeList(_$this.stops, other.stops),
    );
  }

  /// The list of properties that constitute the state of this [LinearGradientMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [LinearGradientMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.begin,
        _$this.end,
        _$this.tileMode,
        _$this.transform,
        _$this.colors,
        _$this.stops,
      ];

  /// Returns this instance as a [LinearGradientMix].
  LinearGradientMix get _$this => this as LinearGradientMix;
}

/// Utility class for configuring [LinearGradient] properties.
///
/// This class provides methods to set individual properties of a [LinearGradient].
/// Use the methods of this class to configure specific properties of a [LinearGradient].
class LinearGradientMixUtility<T extends Attribute>
    extends DtoUtility<T, LinearGradientMix, LinearGradient> {
  /// Utility for defining [LinearGradientMix.begin]
  late final begin = AlignmentGeometryUtility((v) => only(begin: v));

  /// Utility for defining [LinearGradientMix.end]
  late final end = AlignmentGeometryUtility((v) => only(end: v));

  /// Utility for defining [LinearGradientMix.tileMode]
  late final tileMode = TileModeUtility((v) => only(tileMode: v));

  /// Utility for defining [LinearGradientMix.transform]
  late final transform = GradientTransformMixUtility((v) => only(transform: v));

  /// Utility for defining [LinearGradientMix.colors]
  late final colors = ColorListMixUtility((v) => only(colors: v));

  /// Utility for defining [LinearGradientMix.stops]
  late final stops = ListUtility<T, double>((v) => only(stops: v));

  LinearGradientMixUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [LinearGradientMix] with the specified properties.
  @override
  T only({
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
    TileMode? tileMode,
    GradientTransform? transform,
    List<ColorMix>? colors,
    List<double>? stops,
  }) {
    return builder(LinearGradientMix(
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

/// Extension methods to convert [LinearGradient] to [LinearGradientMix].
extension LinearGradientMixExt on LinearGradient {
  /// Converts this [LinearGradient] to a [LinearGradientMix].
  LinearGradientMix toDto() {
    return LinearGradientMix(
      begin: begin,
      end: end,
      tileMode: tileMode,
      transform: transform,
      colors: colors.map((e) => e.toDto()).toList(),
      stops: stops,
    );
  }
}

/// Extension methods to convert List<[LinearGradient]> to List<[LinearGradientMix]>.
extension ListLinearGradientMixExt on List<LinearGradient> {
  /// Converts this List<[LinearGradient]> to a List<[LinearGradientMix]>.
  List<LinearGradientMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [RadialGradientMix].
mixin _$RadialGradientMix
    on Mixable<RadialGradient>, HasDefaultValue<RadialGradient> {
  /// Resolves to [RadialGradient] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final radialGradient = RadialGradientMix(...).resolve(mix);
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

  /// Merges the properties of this [RadialGradientMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [RadialGradientMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  RadialGradientMix merge(RadialGradientMix? other) {
    if (other == null) return _$this;

    return RadialGradientMix(
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

  /// The list of properties that constitute the state of this [RadialGradientMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [RadialGradientMix] instances for equality.
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

  /// Returns this instance as a [RadialGradientMix].
  RadialGradientMix get _$this => this as RadialGradientMix;
}

/// Utility class for configuring [RadialGradient] properties.
///
/// This class provides methods to set individual properties of a [RadialGradient].
/// Use the methods of this class to configure specific properties of a [RadialGradient].
class RadialGradientMixUtility<T extends Attribute>
    extends DtoUtility<T, RadialGradientMix, RadialGradient> {
  /// Utility for defining [RadialGradientMix.center]
  late final center = AlignmentGeometryUtility((v) => only(center: v));

  /// Utility for defining [RadialGradientMix.radius]
  late final radius = DoubleUtility((v) => only(radius: v));

  /// Utility for defining [RadialGradientMix.tileMode]
  late final tileMode = TileModeUtility((v) => only(tileMode: v));

  /// Utility for defining [RadialGradientMix.focal]
  late final focal = AlignmentGeometryUtility((v) => only(focal: v));

  /// Utility for defining [RadialGradientMix.focalRadius]
  late final focalRadius = DoubleUtility((v) => only(focalRadius: v));

  /// Utility for defining [RadialGradientMix.transform]
  late final transform = GradientTransformMixUtility((v) => only(transform: v));

  /// Utility for defining [RadialGradientMix.colors]
  late final colors = ColorListMixUtility((v) => only(colors: v));

  /// Utility for defining [RadialGradientMix.stops]
  late final stops = ListUtility<T, double>((v) => only(stops: v));

  RadialGradientMixUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [RadialGradientMix] with the specified properties.
  @override
  T only({
    AlignmentGeometry? center,
    double? radius,
    TileMode? tileMode,
    AlignmentGeometry? focal,
    double? focalRadius,
    GradientTransform? transform,
    List<ColorMix>? colors,
    List<double>? stops,
  }) {
    return builder(RadialGradientMix(
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

/// Extension methods to convert [RadialGradient] to [RadialGradientMix].
extension RadialGradientMixExt on RadialGradient {
  /// Converts this [RadialGradient] to a [RadialGradientMix].
  RadialGradientMix toDto() {
    return RadialGradientMix(
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

/// Extension methods to convert List<[RadialGradient]> to List<[RadialGradientMix]>.
extension ListRadialGradientMixExt on List<RadialGradient> {
  /// Converts this List<[RadialGradient]> to a List<[RadialGradientMix]>.
  List<RadialGradientMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [SweepGradientMix].
mixin _$SweepGradientMix
    on Mixable<SweepGradient>, HasDefaultValue<SweepGradient> {
  /// Resolves to [SweepGradient] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final sweepGradient = SweepGradientMix(...).resolve(mix);
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

  /// Merges the properties of this [SweepGradientMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [SweepGradientMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  SweepGradientMix merge(SweepGradientMix? other) {
    if (other == null) return _$this;

    return SweepGradientMix(
      center: other.center ?? _$this.center,
      startAngle: other.startAngle ?? _$this.startAngle,
      endAngle: other.endAngle ?? _$this.endAngle,
      tileMode: other.tileMode ?? _$this.tileMode,
      transform: other.transform ?? _$this.transform,
      colors: MixHelpers.mergeList(_$this.colors, other.colors),
      stops: MixHelpers.mergeList(_$this.stops, other.stops),
    );
  }

  /// The list of properties that constitute the state of this [SweepGradientMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SweepGradientMix] instances for equality.
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

  /// Returns this instance as a [SweepGradientMix].
  SweepGradientMix get _$this => this as SweepGradientMix;
}

/// Utility class for configuring [SweepGradient] properties.
///
/// This class provides methods to set individual properties of a [SweepGradient].
/// Use the methods of this class to configure specific properties of a [SweepGradient].
class SweepGradientMixUtility<T extends Attribute>
    extends DtoUtility<T, SweepGradientMix, SweepGradient> {
  /// Utility for defining [SweepGradientMix.center]
  late final center = AlignmentGeometryUtility((v) => only(center: v));

  /// Utility for defining [SweepGradientMix.startAngle]
  late final startAngle = DoubleUtility((v) => only(startAngle: v));

  /// Utility for defining [SweepGradientMix.endAngle]
  late final endAngle = DoubleUtility((v) => only(endAngle: v));

  /// Utility for defining [SweepGradientMix.tileMode]
  late final tileMode = TileModeUtility((v) => only(tileMode: v));

  /// Utility for defining [SweepGradientMix.transform]
  late final transform = GradientTransformMixUtility((v) => only(transform: v));

  /// Utility for defining [SweepGradientMix.colors]
  late final colors = ColorListMixUtility((v) => only(colors: v));

  /// Utility for defining [SweepGradientMix.stops]
  late final stops = ListUtility<T, double>((v) => only(stops: v));

  SweepGradientMixUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [SweepGradientMix] with the specified properties.
  @override
  T only({
    AlignmentGeometry? center,
    double? startAngle,
    double? endAngle,
    TileMode? tileMode,
    GradientTransform? transform,
    List<ColorMix>? colors,
    List<double>? stops,
  }) {
    return builder(SweepGradientMix(
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

/// Extension methods to convert [SweepGradient] to [SweepGradientMix].
extension SweepGradientMixExt on SweepGradient {
  /// Converts this [SweepGradient] to a [SweepGradientMix].
  SweepGradientMix toDto() {
    return SweepGradientMix(
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

/// Extension methods to convert List<[SweepGradient]> to List<[SweepGradientMix]>.
extension ListSweepGradientMixExt on List<SweepGradient> {
  /// Converts this List<[SweepGradient]> to a List<[SweepGradientMix]>.
  List<SweepGradientMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
