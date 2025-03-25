// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape_border_dto.dart';

// **************************************************************************
// MixGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

/// A mixin that provides DTO functionality for [RoundedRectangleBorderMix].
mixin _$RoundedRectangleBorderMix on Mixable<RoundedRectangleBorder> {
  /// Resolves to [RoundedRectangleBorder] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final roundedRectangleBorder = RoundedRectangleBorderMix(...).resolve(mix);
  /// ```
  @override
  RoundedRectangleBorder resolve(MixData mix) {
    return RoundedRectangleBorder(
      borderRadius: _$this.borderRadius?.resolve(mix) ?? BorderRadius.zero,
      side: _$this.side?.resolve(mix) ?? BorderSide.none,
    );
  }

  /// Merges the properties of this [RoundedRectangleBorderMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [RoundedRectangleBorderMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  RoundedRectangleBorderMix merge(RoundedRectangleBorderMix? other) {
    if (other == null) return _$this;

    return RoundedRectangleBorderMix(
      borderRadius:
          _$this.borderRadius?.merge(other.borderRadius) ?? other.borderRadius,
      side: _$this.side?.merge(other.side) ?? other.side,
    );
  }

  /// The list of properties that constitute the state of this [RoundedRectangleBorderMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [RoundedRectangleBorderMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.borderRadius,
        _$this.side,
      ];

  /// Returns this instance as a [RoundedRectangleBorderMix].
  RoundedRectangleBorderMix get _$this => this as RoundedRectangleBorderMix;
}

/// Utility class for configuring [RoundedRectangleBorder] properties.
///
/// This class provides methods to set individual properties of a [RoundedRectangleBorder].
/// Use the methods of this class to configure specific properties of a [RoundedRectangleBorder].
class RoundedRectangleBorderMixUtility<T extends Attribute>
    extends DtoUtility<T, RoundedRectangleBorderMix, RoundedRectangleBorder> {
  /// Utility for defining [RoundedRectangleBorderMix.borderRadius]
  late final borderRadius =
      BorderRadiusGeometryMixUtility((v) => only(borderRadius: v));

  /// Utility for defining [RoundedRectangleBorderMix.side]
  late final side = BorderSideMixUtility((v) => only(side: v));

  RoundedRectangleBorderMixUtility(super.builder)
      : super(valueToDto: (v) => v.toDto());

  /// Returns a new [RoundedRectangleBorderMix] with the specified properties.
  @override
  T only({
    BorderRadiusGeometryMix? borderRadius,
    BorderSideMix? side,
  }) {
    return builder(RoundedRectangleBorderMix(
      borderRadius: borderRadius,
      side: side,
    ));
  }

  T call({
    BorderRadiusGeometry? borderRadius,
    BorderSide? side,
  }) {
    return only(
      borderRadius: borderRadius?.toDto(),
      side: side?.toDto(),
    );
  }
}

/// Extension methods to convert [RoundedRectangleBorder] to [RoundedRectangleBorderMix].
extension RoundedRectangleBorderMixExt on RoundedRectangleBorder {
  /// Converts this [RoundedRectangleBorder] to a [RoundedRectangleBorderMix].
  RoundedRectangleBorderMix toDto() {
    return RoundedRectangleBorderMix(
      borderRadius: borderRadius.toDto(),
      side: side.toDto(),
    );
  }
}

/// Extension methods to convert List<[RoundedRectangleBorder]> to List<[RoundedRectangleBorderMix]>.
extension ListRoundedRectangleBorderMixExt on List<RoundedRectangleBorder> {
  /// Converts this List<[RoundedRectangleBorder]> to a List<[RoundedRectangleBorderMix]>.
  List<RoundedRectangleBorderMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [BeveledRectangleBorderMix].
mixin _$BeveledRectangleBorderMix on Mixable<BeveledRectangleBorder> {
  /// Resolves to [BeveledRectangleBorder] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final beveledRectangleBorder = BeveledRectangleBorderMix(...).resolve(mix);
  /// ```
  @override
  BeveledRectangleBorder resolve(MixData mix) {
    return BeveledRectangleBorder(
      borderRadius: _$this.borderRadius?.resolve(mix) ?? BorderRadius.zero,
      side: _$this.side?.resolve(mix) ?? BorderSide.none,
    );
  }

  /// Merges the properties of this [BeveledRectangleBorderMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [BeveledRectangleBorderMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  BeveledRectangleBorderMix merge(BeveledRectangleBorderMix? other) {
    if (other == null) return _$this;

    return BeveledRectangleBorderMix(
      borderRadius:
          _$this.borderRadius?.merge(other.borderRadius) ?? other.borderRadius,
      side: _$this.side?.merge(other.side) ?? other.side,
    );
  }

  /// The list of properties that constitute the state of this [BeveledRectangleBorderMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BeveledRectangleBorderMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.borderRadius,
        _$this.side,
      ];

  /// Returns this instance as a [BeveledRectangleBorderMix].
  BeveledRectangleBorderMix get _$this => this as BeveledRectangleBorderMix;
}

/// Utility class for configuring [BeveledRectangleBorder] properties.
///
/// This class provides methods to set individual properties of a [BeveledRectangleBorder].
/// Use the methods of this class to configure specific properties of a [BeveledRectangleBorder].
class BeveledRectangleBorderUtility<T extends Attribute>
    extends DtoUtility<T, BeveledRectangleBorderMix, BeveledRectangleBorder> {
  /// Utility for defining [BeveledRectangleBorderMix.borderRadius]
  late final borderRadius =
      BorderRadiusGeometryMixUtility((v) => only(borderRadius: v));

  /// Utility for defining [BeveledRectangleBorderMix.side]
  late final side = BorderSideMixUtility((v) => only(side: v));

  BeveledRectangleBorderUtility(super.builder)
      : super(valueToDto: (v) => v.toDto());

  /// Returns a new [BeveledRectangleBorderMix] with the specified properties.
  @override
  T only({
    BorderRadiusGeometryMix? borderRadius,
    BorderSideMix? side,
  }) {
    return builder(BeveledRectangleBorderMix(
      borderRadius: borderRadius,
      side: side,
    ));
  }

  T call({
    BorderRadiusGeometry? borderRadius,
    BorderSide? side,
  }) {
    return only(
      borderRadius: borderRadius?.toDto(),
      side: side?.toDto(),
    );
  }
}

/// Extension methods to convert [BeveledRectangleBorder] to [BeveledRectangleBorderMix].
extension BeveledRectangleBorderMixExt on BeveledRectangleBorder {
  /// Converts this [BeveledRectangleBorder] to a [BeveledRectangleBorderMix].
  BeveledRectangleBorderMix toDto() {
    return BeveledRectangleBorderMix(
      borderRadius: borderRadius.toDto(),
      side: side.toDto(),
    );
  }
}

/// Extension methods to convert List<[BeveledRectangleBorder]> to List<[BeveledRectangleBorderMix]>.
extension ListBeveledRectangleBorderMixExt on List<BeveledRectangleBorder> {
  /// Converts this List<[BeveledRectangleBorder]> to a List<[BeveledRectangleBorderMix]>.
  List<BeveledRectangleBorderMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [ContinuousRectangleBorderMix].
mixin _$ContinuousRectangleBorderMix on Mixable<ContinuousRectangleBorder> {
  /// Resolves to [ContinuousRectangleBorder] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final continuousRectangleBorder = ContinuousRectangleBorderMix(...).resolve(mix);
  /// ```
  @override
  ContinuousRectangleBorder resolve(MixData mix) {
    return ContinuousRectangleBorder(
      borderRadius: _$this.borderRadius?.resolve(mix) ?? BorderRadius.zero,
      side: _$this.side?.resolve(mix) ?? BorderSide.none,
    );
  }

  /// Merges the properties of this [ContinuousRectangleBorderMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [ContinuousRectangleBorderMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  ContinuousRectangleBorderMix merge(ContinuousRectangleBorderMix? other) {
    if (other == null) return _$this;

    return ContinuousRectangleBorderMix(
      borderRadius:
          _$this.borderRadius?.merge(other.borderRadius) ?? other.borderRadius,
      side: _$this.side?.merge(other.side) ?? other.side,
    );
  }

  /// The list of properties that constitute the state of this [ContinuousRectangleBorderMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ContinuousRectangleBorderMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.borderRadius,
        _$this.side,
      ];

  /// Returns this instance as a [ContinuousRectangleBorderMix].
  ContinuousRectangleBorderMix get _$this =>
      this as ContinuousRectangleBorderMix;
}

/// Utility class for configuring [ContinuousRectangleBorder] properties.
///
/// This class provides methods to set individual properties of a [ContinuousRectangleBorder].
/// Use the methods of this class to configure specific properties of a [ContinuousRectangleBorder].
class ContinuousRectangleBorderUtility<T extends Attribute> extends DtoUtility<
    T, ContinuousRectangleBorderMix, ContinuousRectangleBorder> {
  /// Utility for defining [ContinuousRectangleBorderMix.borderRadius]
  late final borderRadius =
      BorderRadiusGeometryMixUtility((v) => only(borderRadius: v));

  /// Utility for defining [ContinuousRectangleBorderMix.side]
  late final side = BorderSideMixUtility((v) => only(side: v));

  ContinuousRectangleBorderUtility(super.builder)
      : super(valueToDto: (v) => v.toDto());

  /// Returns a new [ContinuousRectangleBorderMix] with the specified properties.
  @override
  T only({
    BorderRadiusGeometryMix? borderRadius,
    BorderSideMix? side,
  }) {
    return builder(ContinuousRectangleBorderMix(
      borderRadius: borderRadius,
      side: side,
    ));
  }

  T call({
    BorderRadiusGeometry? borderRadius,
    BorderSide? side,
  }) {
    return only(
      borderRadius: borderRadius?.toDto(),
      side: side?.toDto(),
    );
  }
}

/// Extension methods to convert [ContinuousRectangleBorder] to [ContinuousRectangleBorderMix].
extension ContinuousRectangleBorderMixExt on ContinuousRectangleBorder {
  /// Converts this [ContinuousRectangleBorder] to a [ContinuousRectangleBorderMix].
  ContinuousRectangleBorderMix toDto() {
    return ContinuousRectangleBorderMix(
      borderRadius: borderRadius.toDto(),
      side: side.toDto(),
    );
  }
}

/// Extension methods to convert List<[ContinuousRectangleBorder]> to List<[ContinuousRectangleBorderMix]>.
extension ListContinuousRectangleBorderMixExt
    on List<ContinuousRectangleBorder> {
  /// Converts this List<[ContinuousRectangleBorder]> to a List<[ContinuousRectangleBorderMix]>.
  List<ContinuousRectangleBorderMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [CircleBorderMix].
mixin _$CircleBorderMix on Mixable<CircleBorder> {
  /// Resolves to [CircleBorder] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final circleBorder = CircleBorderMix(...).resolve(mix);
  /// ```
  @override
  CircleBorder resolve(MixData mix) {
    return CircleBorder(
      side: _$this.side?.resolve(mix) ?? BorderSide.none,
      eccentricity: _$this.eccentricity ?? 0.0,
    );
  }

  /// Merges the properties of this [CircleBorderMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [CircleBorderMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  CircleBorderMix merge(CircleBorderMix? other) {
    if (other == null) return _$this;

    return CircleBorderMix(
      side: _$this.side?.merge(other.side) ?? other.side,
      eccentricity: other.eccentricity ?? _$this.eccentricity,
    );
  }

  /// The list of properties that constitute the state of this [CircleBorderMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [CircleBorderMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.side,
        _$this.eccentricity,
      ];

  /// Returns this instance as a [CircleBorderMix].
  CircleBorderMix get _$this => this as CircleBorderMix;
}

/// Utility class for configuring [CircleBorder] properties.
///
/// This class provides methods to set individual properties of a [CircleBorder].
/// Use the methods of this class to configure specific properties of a [CircleBorder].
class CircleBorderUtility<T extends Attribute>
    extends DtoUtility<T, CircleBorderMix, CircleBorder> {
  /// Utility for defining [CircleBorderMix.side]
  late final side = BorderSideMixUtility((v) => only(side: v));

  /// Utility for defining [CircleBorderMix.eccentricity]
  late final eccentricity = DoubleUtility((v) => only(eccentricity: v));

  CircleBorderUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [CircleBorderMix] with the specified properties.
  @override
  T only({
    BorderSideMix? side,
    double? eccentricity,
  }) {
    return builder(CircleBorderMix(
      side: side,
      eccentricity: eccentricity,
    ));
  }

  T call({
    BorderSide? side,
    double? eccentricity,
  }) {
    return only(
      side: side?.toDto(),
      eccentricity: eccentricity,
    );
  }
}

/// Extension methods to convert [CircleBorder] to [CircleBorderMix].
extension CircleBorderMixExt on CircleBorder {
  /// Converts this [CircleBorder] to a [CircleBorderMix].
  CircleBorderMix toDto() {
    return CircleBorderMix(
      side: side.toDto(),
      eccentricity: eccentricity,
    );
  }
}

/// Extension methods to convert List<[CircleBorder]> to List<[CircleBorderMix]>.
extension ListCircleBorderMixExt on List<CircleBorder> {
  /// Converts this List<[CircleBorder]> to a List<[CircleBorderMix]>.
  List<CircleBorderMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [StarBorderMix].
mixin _$StarBorderMix on Mixable<StarBorder> {
  /// Resolves to [StarBorder] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final starBorder = StarBorderMix(...).resolve(mix);
  /// ```
  @override
  StarBorder resolve(MixData mix) {
    return StarBorder(
      side: _$this.side?.resolve(mix) ?? BorderSide.none,
      points: _$this.points ?? 5,
      innerRadiusRatio: _$this.innerRadiusRatio ?? 0.4,
      pointRounding: _$this.pointRounding ?? 0,
      valleyRounding: _$this.valleyRounding ?? 0,
      rotation: _$this.rotation ?? 0,
      squash: _$this.squash ?? 0,
    );
  }

  /// Merges the properties of this [StarBorderMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [StarBorderMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  StarBorderMix merge(StarBorderMix? other) {
    if (other == null) return _$this;

    return StarBorderMix(
      side: _$this.side?.merge(other.side) ?? other.side,
      points: other.points ?? _$this.points,
      innerRadiusRatio: other.innerRadiusRatio ?? _$this.innerRadiusRatio,
      pointRounding: other.pointRounding ?? _$this.pointRounding,
      valleyRounding: other.valleyRounding ?? _$this.valleyRounding,
      rotation: other.rotation ?? _$this.rotation,
      squash: other.squash ?? _$this.squash,
    );
  }

  /// The list of properties that constitute the state of this [StarBorderMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [StarBorderMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.side,
        _$this.points,
        _$this.innerRadiusRatio,
        _$this.pointRounding,
        _$this.valleyRounding,
        _$this.rotation,
        _$this.squash,
      ];

  /// Returns this instance as a [StarBorderMix].
  StarBorderMix get _$this => this as StarBorderMix;
}

/// Utility class for configuring [StarBorder] properties.
///
/// This class provides methods to set individual properties of a [StarBorder].
/// Use the methods of this class to configure specific properties of a [StarBorder].
class StarBorderUtility<T extends Attribute>
    extends DtoUtility<T, StarBorderMix, StarBorder> {
  /// Utility for defining [StarBorderMix.side]
  late final side = BorderSideMixUtility((v) => only(side: v));

  /// Utility for defining [StarBorderMix.points]
  late final points = DoubleUtility((v) => only(points: v));

  /// Utility for defining [StarBorderMix.innerRadiusRatio]
  late final innerRadiusRatio = DoubleUtility((v) => only(innerRadiusRatio: v));

  /// Utility for defining [StarBorderMix.pointRounding]
  late final pointRounding = DoubleUtility((v) => only(pointRounding: v));

  /// Utility for defining [StarBorderMix.valleyRounding]
  late final valleyRounding = DoubleUtility((v) => only(valleyRounding: v));

  /// Utility for defining [StarBorderMix.rotation]
  late final rotation = DoubleUtility((v) => only(rotation: v));

  /// Utility for defining [StarBorderMix.squash]
  late final squash = DoubleUtility((v) => only(squash: v));

  StarBorderUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [StarBorderMix] with the specified properties.
  @override
  T only({
    BorderSideMix? side,
    double? points,
    double? innerRadiusRatio,
    double? pointRounding,
    double? valleyRounding,
    double? rotation,
    double? squash,
  }) {
    return builder(StarBorderMix(
      side: side,
      points: points,
      innerRadiusRatio: innerRadiusRatio,
      pointRounding: pointRounding,
      valleyRounding: valleyRounding,
      rotation: rotation,
      squash: squash,
    ));
  }

  T call({
    BorderSide? side,
    double? points,
    double? innerRadiusRatio,
    double? pointRounding,
    double? valleyRounding,
    double? rotation,
    double? squash,
  }) {
    return only(
      side: side?.toDto(),
      points: points,
      innerRadiusRatio: innerRadiusRatio,
      pointRounding: pointRounding,
      valleyRounding: valleyRounding,
      rotation: rotation,
      squash: squash,
    );
  }
}

/// Extension methods to convert [StarBorder] to [StarBorderMix].
extension StarBorderMixExt on StarBorder {
  /// Converts this [StarBorder] to a [StarBorderMix].
  StarBorderMix toDto() {
    return StarBorderMix(
      side: side.toDto(),
      points: points,
      innerRadiusRatio: innerRadiusRatio,
      pointRounding: pointRounding,
      valleyRounding: valleyRounding,
      rotation: rotation,
      squash: squash,
    );
  }
}

/// Extension methods to convert List<[StarBorder]> to List<[StarBorderMix]>.
extension ListStarBorderMixExt on List<StarBorder> {
  /// Converts this List<[StarBorder]> to a List<[StarBorderMix]>.
  List<StarBorderMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [LinearBorderMix].
mixin _$LinearBorderMix on Mixable<LinearBorder> {
  /// Resolves to [LinearBorder] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final linearBorder = LinearBorderMix(...).resolve(mix);
  /// ```
  @override
  LinearBorder resolve(MixData mix) {
    return LinearBorder(
      side: _$this.side?.resolve(mix) ?? BorderSide.none,
      start: _$this.start?.resolve(mix),
      end: _$this.end?.resolve(mix),
      top: _$this.top?.resolve(mix),
      bottom: _$this.bottom?.resolve(mix),
    );
  }

  /// Merges the properties of this [LinearBorderMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [LinearBorderMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  LinearBorderMix merge(LinearBorderMix? other) {
    if (other == null) return _$this;

    return LinearBorderMix(
      side: _$this.side?.merge(other.side) ?? other.side,
      start: _$this.start?.merge(other.start) ?? other.start,
      end: _$this.end?.merge(other.end) ?? other.end,
      top: _$this.top?.merge(other.top) ?? other.top,
      bottom: _$this.bottom?.merge(other.bottom) ?? other.bottom,
    );
  }

  /// The list of properties that constitute the state of this [LinearBorderMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [LinearBorderMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.side,
        _$this.start,
        _$this.end,
        _$this.top,
        _$this.bottom,
      ];

  /// Returns this instance as a [LinearBorderMix].
  LinearBorderMix get _$this => this as LinearBorderMix;
}

/// Utility class for configuring [LinearBorder] properties.
///
/// This class provides methods to set individual properties of a [LinearBorder].
/// Use the methods of this class to configure specific properties of a [LinearBorder].
class LinearBorderUtility<T extends Attribute>
    extends DtoUtility<T, LinearBorderMix, LinearBorder> {
  /// Utility for defining [LinearBorderMix.side]
  late final side = BorderSideMixUtility((v) => only(side: v));

  /// Utility for defining [LinearBorderMix.start]
  late final start = LinearBorderEdgeMixUtility((v) => only(start: v));

  /// Utility for defining [LinearBorderMix.end]
  late final end = LinearBorderEdgeMixUtility((v) => only(end: v));

  /// Utility for defining [LinearBorderMix.top]
  late final top = LinearBorderEdgeMixUtility((v) => only(top: v));

  /// Utility for defining [LinearBorderMix.bottom]
  late final bottom = LinearBorderEdgeMixUtility((v) => only(bottom: v));

  LinearBorderUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [LinearBorderMix] with the specified properties.
  @override
  T only({
    BorderSideMix? side,
    LinearBorderEdgeMix? start,
    LinearBorderEdgeMix? end,
    LinearBorderEdgeMix? top,
    LinearBorderEdgeMix? bottom,
  }) {
    return builder(LinearBorderMix(
      side: side,
      start: start,
      end: end,
      top: top,
      bottom: bottom,
    ));
  }

  T call({
    BorderSide? side,
    LinearBorderEdge? start,
    LinearBorderEdge? end,
    LinearBorderEdge? top,
    LinearBorderEdge? bottom,
  }) {
    return only(
      side: side?.toDto(),
      start: start?.toDto(),
      end: end?.toDto(),
      top: top?.toDto(),
      bottom: bottom?.toDto(),
    );
  }
}

/// Extension methods to convert [LinearBorder] to [LinearBorderMix].
extension LinearBorderMixExt on LinearBorder {
  /// Converts this [LinearBorder] to a [LinearBorderMix].
  LinearBorderMix toDto() {
    return LinearBorderMix(
      side: side.toDto(),
      start: start?.toDto(),
      end: end?.toDto(),
      top: top?.toDto(),
      bottom: bottom?.toDto(),
    );
  }
}

/// Extension methods to convert List<[LinearBorder]> to List<[LinearBorderMix]>.
extension ListLinearBorderMixExt on List<LinearBorder> {
  /// Converts this List<[LinearBorder]> to a List<[LinearBorderMix]>.
  List<LinearBorderMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [LinearBorderEdgeMix].
mixin _$LinearBorderEdgeMix on Mixable<LinearBorderEdge> {
  /// Resolves to [LinearBorderEdge] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final linearBorderEdge = LinearBorderEdgeMix(...).resolve(mix);
  /// ```
  @override
  LinearBorderEdge resolve(MixData mix) {
    return LinearBorderEdge(
      size: _$this.size ?? 1.0,
      alignment: _$this.alignment ?? 0.0,
    );
  }

  /// Merges the properties of this [LinearBorderEdgeMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [LinearBorderEdgeMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  LinearBorderEdgeMix merge(LinearBorderEdgeMix? other) {
    if (other == null) return _$this;

    return LinearBorderEdgeMix(
      size: other.size ?? _$this.size,
      alignment: other.alignment ?? _$this.alignment,
    );
  }

  /// The list of properties that constitute the state of this [LinearBorderEdgeMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [LinearBorderEdgeMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.size,
        _$this.alignment,
      ];

  /// Returns this instance as a [LinearBorderEdgeMix].
  LinearBorderEdgeMix get _$this => this as LinearBorderEdgeMix;
}

/// Utility class for configuring [LinearBorderEdge] properties.
///
/// This class provides methods to set individual properties of a [LinearBorderEdge].
/// Use the methods of this class to configure specific properties of a [LinearBorderEdge].
class LinearBorderEdgeMixUtility<T extends Attribute>
    extends DtoUtility<T, LinearBorderEdgeMix, LinearBorderEdge> {
  /// Utility for defining [LinearBorderEdgeMix.size]
  late final size = DoubleUtility((v) => only(size: v));

  /// Utility for defining [LinearBorderEdgeMix.alignment]
  late final alignment = DoubleUtility((v) => only(alignment: v));

  LinearBorderEdgeMixUtility(super.builder)
      : super(valueToDto: (v) => v.toDto());

  /// Returns a new [LinearBorderEdgeMix] with the specified properties.
  @override
  T only({
    double? size,
    double? alignment,
  }) {
    return builder(LinearBorderEdgeMix(
      size: size,
      alignment: alignment,
    ));
  }

  T call({
    double? size,
    double? alignment,
  }) {
    return only(
      size: size,
      alignment: alignment,
    );
  }
}

/// Extension methods to convert [LinearBorderEdge] to [LinearBorderEdgeMix].
extension LinearBorderEdgeMixExt on LinearBorderEdge {
  /// Converts this [LinearBorderEdge] to a [LinearBorderEdgeMix].
  LinearBorderEdgeMix toDto() {
    return LinearBorderEdgeMix(
      size: size,
      alignment: alignment,
    );
  }
}

/// Extension methods to convert List<[LinearBorderEdge]> to List<[LinearBorderEdgeMix]>.
extension ListLinearBorderEdgeMixExt on List<LinearBorderEdge> {
  /// Converts this List<[LinearBorderEdge]> to a List<[LinearBorderEdgeMix]>.
  List<LinearBorderEdgeMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [StadiumBorderMix].
mixin _$StadiumBorderMix on Mixable<StadiumBorder> {
  /// Resolves to [StadiumBorder] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final stadiumBorder = StadiumBorderMix(...).resolve(mix);
  /// ```
  @override
  StadiumBorder resolve(MixData mix) {
    return StadiumBorder(
      side: _$this.side?.resolve(mix) ?? BorderSide.none,
    );
  }

  /// Merges the properties of this [StadiumBorderMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [StadiumBorderMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  StadiumBorderMix merge(StadiumBorderMix? other) {
    if (other == null) return _$this;

    return StadiumBorderMix(
      side: _$this.side?.merge(other.side) ?? other.side,
    );
  }

  /// The list of properties that constitute the state of this [StadiumBorderMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [StadiumBorderMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.side,
      ];

  /// Returns this instance as a [StadiumBorderMix].
  StadiumBorderMix get _$this => this as StadiumBorderMix;
}

/// Utility class for configuring [StadiumBorder] properties.
///
/// This class provides methods to set individual properties of a [StadiumBorder].
/// Use the methods of this class to configure specific properties of a [StadiumBorder].
class StadiumBorderUtility<T extends Attribute>
    extends DtoUtility<T, StadiumBorderMix, StadiumBorder> {
  /// Utility for defining [StadiumBorderMix.side]
  late final side = BorderSideMixUtility((v) => only(side: v));

  StadiumBorderUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [StadiumBorderMix] with the specified properties.
  @override
  T only({
    BorderSideMix? side,
  }) {
    return builder(StadiumBorderMix(
      side: side,
    ));
  }

  T call({
    BorderSide? side,
  }) {
    return only(
      side: side?.toDto(),
    );
  }
}

/// Extension methods to convert [StadiumBorder] to [StadiumBorderMix].
extension StadiumBorderMixExt on StadiumBorder {
  /// Converts this [StadiumBorder] to a [StadiumBorderMix].
  StadiumBorderMix toDto() {
    return StadiumBorderMix(
      side: side.toDto(),
    );
  }
}

/// Extension methods to convert List<[StadiumBorder]> to List<[StadiumBorderMix]>.
extension ListStadiumBorderMixExt on List<StadiumBorder> {
  /// Converts this List<[StadiumBorder]> to a List<[StadiumBorderMix]>.
  List<StadiumBorderMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
