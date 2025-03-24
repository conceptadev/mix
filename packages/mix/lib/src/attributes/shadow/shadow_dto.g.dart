// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shadow_dto.dart';

// **************************************************************************
// MixGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

/// A mixin that provides DTO functionality for [ShadowMix].
mixin _$ShadowMix on Mixable<Shadow>, HasDefaultValue<Shadow> {
  /// Resolves to [Shadow] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final shadow = ShadowMix(...).resolve(mix);
  /// ```
  @override
  Shadow resolve(MixData mix) {
    return Shadow(
      blurRadius: _$this.blurRadius ?? defaultValue.blurRadius,
      color: _$this.color?.resolve(mix) ?? defaultValue.color,
      offset: _$this.offset ?? defaultValue.offset,
    );
  }

  /// Merges the properties of this [ShadowMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [ShadowMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  ShadowMix merge(ShadowMix? other) {
    if (other == null) return _$this;

    return ShadowMix(
      blurRadius: other.blurRadius ?? _$this.blurRadius,
      color: _$this.color?.merge(other.color) ?? other.color,
      offset: other.offset ?? _$this.offset,
    );
  }

  /// The list of properties that constitute the state of this [ShadowMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ShadowMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.blurRadius,
        _$this.color,
        _$this.offset,
      ];

  /// Returns this instance as a [ShadowMix].
  ShadowMix get _$this => this as ShadowMix;
}

/// Utility class for configuring [Shadow] properties.
///
/// This class provides methods to set individual properties of a [Shadow].
/// Use the methods of this class to configure specific properties of a [Shadow].
class ShadowMixUtility<T extends Attribute>
    extends DtoUtility<T, ShadowMix, Shadow> {
  /// Utility for defining [ShadowMix.blurRadius]
  late final blurRadius = DoubleUtility((v) => only(blurRadius: v));

  /// Utility for defining [ShadowMix.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [ShadowMix.offset]
  late final offset = OffsetUtility((v) => only(offset: v));

  ShadowMixUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [ShadowMix] with the specified properties.
  @override
  T only({
    double? blurRadius,
    ColorDto? color,
    Offset? offset,
  }) {
    return builder(ShadowMix(
      blurRadius: blurRadius,
      color: color,
      offset: offset,
    ));
  }

  T call({
    double? blurRadius,
    Color? color,
    Offset? offset,
  }) {
    return only(
      blurRadius: blurRadius,
      color: color?.toDto(),
      offset: offset,
    );
  }
}

/// Extension methods to convert [Shadow] to [ShadowMix].
extension ShadowMixExt on Shadow {
  /// Converts this [Shadow] to a [ShadowMix].
  ShadowMix toDto() {
    return ShadowMix(
      blurRadius: blurRadius,
      color: color.toDto(),
      offset: offset,
    );
  }
}

/// Extension methods to convert List<[Shadow]> to List<[ShadowMix]>.
extension ListShadowMixExt on List<Shadow> {
  /// Converts this List<[Shadow]> to a List<[ShadowMix]>.
  List<ShadowMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [BoxShadowMix].
mixin _$BoxShadowMix on Mixable<BoxShadow>, HasDefaultValue<BoxShadow> {
  /// Resolves to [BoxShadow] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final boxShadow = BoxShadowMix(...).resolve(mix);
  /// ```
  @override
  BoxShadow resolve(MixData mix) {
    return BoxShadow(
      color: _$this.color?.resolve(mix) ?? defaultValue.color,
      offset: _$this.offset ?? defaultValue.offset,
      blurRadius: _$this.blurRadius ?? defaultValue.blurRadius,
      spreadRadius: _$this.spreadRadius ?? defaultValue.spreadRadius,
    );
  }

  /// Merges the properties of this [BoxShadowMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [BoxShadowMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  BoxShadowMix merge(BoxShadowMix? other) {
    if (other == null) return _$this;

    return BoxShadowMix(
      color: _$this.color?.merge(other.color) ?? other.color,
      offset: other.offset ?? _$this.offset,
      blurRadius: other.blurRadius ?? _$this.blurRadius,
      spreadRadius: other.spreadRadius ?? _$this.spreadRadius,
    );
  }

  /// The list of properties that constitute the state of this [BoxShadowMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BoxShadowMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.color,
        _$this.offset,
        _$this.blurRadius,
        _$this.spreadRadius,
      ];

  /// Returns this instance as a [BoxShadowMix].
  BoxShadowMix get _$this => this as BoxShadowMix;
}

/// Utility class for configuring [BoxShadow] properties.
///
/// This class provides methods to set individual properties of a [BoxShadow].
/// Use the methods of this class to configure specific properties of a [BoxShadow].
class BoxShadowMixUtility<T extends Attribute>
    extends DtoUtility<T, BoxShadowMix, BoxShadow> {
  /// Utility for defining [BoxShadowMix.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [BoxShadowMix.offset]
  late final offset = OffsetUtility((v) => only(offset: v));

  /// Utility for defining [BoxShadowMix.blurRadius]
  late final blurRadius = DoubleUtility((v) => only(blurRadius: v));

  /// Utility for defining [BoxShadowMix.spreadRadius]
  late final spreadRadius = DoubleUtility((v) => only(spreadRadius: v));

  BoxShadowMixUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [BoxShadowMix] with the specified properties.
  @override
  T only({
    ColorDto? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return builder(BoxShadowMix(
      color: color,
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    ));
  }

  T call({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return only(
      color: color?.toDto(),
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );
  }
}

/// Extension methods to convert [BoxShadow] to [BoxShadowMix].
extension BoxShadowMixExt on BoxShadow {
  /// Converts this [BoxShadow] to a [BoxShadowMix].
  BoxShadowMix toDto() {
    return BoxShadowMix(
      color: color.toDto(),
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );
  }
}

/// Extension methods to convert List<[BoxShadow]> to List<[BoxShadowMix]>.
extension ListBoxShadowMixExt on List<BoxShadow> {
  /// Converts this List<[BoxShadow]> to a List<[BoxShadowMix]>.
  List<BoxShadowMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
