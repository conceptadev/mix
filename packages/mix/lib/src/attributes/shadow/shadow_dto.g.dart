// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shadow_dto.dart';

// **************************************************************************
// MixableDtoGenerator
// **************************************************************************

base mixin _$ShadowDto on Dto<Shadow> {
  /// Resolves to [Shadow] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final shadow = ShadowDto(...).resolve(mix);
  /// ```
  @override
  Shadow resolve(MixData mix) {
    return Shadow(
        blurRadius: _$this.blurRadius ?? defaultValue.blurRadius,
        color: _$this.color?.resolve(mix) ?? defaultValue.color,
        offset: _$this.offset ?? defaultValue.offset);
  }

  /// Merges the properties of this [ShadowDto] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [ShadowDto] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  ShadowDto merge(ShadowDto? other) {
    if (other == null) return _$this;

    return ShadowDto(
        blurRadius: other.blurRadius ?? _$this.blurRadius,
        color: _$this.color?.merge(other.color) ?? other.color,
        offset: other.offset ?? _$this.offset);
  }

  /// The list of properties that constitute the state of this [ShadowDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ShadowDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.blurRadius,
        _$this.color,
        _$this.offset,
      ];

  ShadowDto get _$this => this as ShadowDto;
}

/// Utility class for configuring [ShadowDto] properties.
///
/// This class provides methods to set individual properties of a [ShadowDto].
/// Use the methods of this class to configure specific properties of a [ShadowDto].
final class ShadowUtility<T extends Attribute>
    extends DtoUtility<T, ShadowDto, Shadow> {
  /// Utility for defining [ShadowDto.blurRadius]
  late final blurRadius = DoubleUtility((v) => only(blurRadius: v));

  /// Utility for defining [ShadowDto.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [ShadowDto.offset]
  late final offset = OffsetUtility((v) => only(offset: v));

  ShadowUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [ShadowDto] with the specified properties.
  @override
  T only({
    double? blurRadius,
    ColorDto? color,
    Offset? offset,
  }) {
    return builder(ShadowDto(
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

extension ShadowMixExt on Shadow {
  ShadowDto toDto() {
    return ShadowDto(
      blurRadius: blurRadius,
      color: color.toDto(),
      offset: offset,
    );
  }
}

extension ListShadowMixExt on List<Shadow> {
  List<ShadowDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

base mixin _$BoxShadowDto on Dto<BoxShadow> {
  /// Resolves to [BoxShadow] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final boxShadow = BoxShadowDto(...).resolve(mix);
  /// ```
  @override
  BoxShadow resolve(MixData mix) {
    return BoxShadow(
        color: _$this.color?.resolve(mix) ?? defaultValue.color,
        offset: _$this.offset ?? defaultValue.offset,
        blurRadius: _$this.blurRadius ?? defaultValue.blurRadius,
        spreadRadius: _$this.spreadRadius ?? defaultValue.spreadRadius);
  }

  /// Merges the properties of this [BoxShadowDto] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [BoxShadowDto] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  BoxShadowDto merge(BoxShadowDto? other) {
    if (other == null) return _$this;

    return BoxShadowDto(
        color: _$this.color?.merge(other.color) ?? other.color,
        offset: other.offset ?? _$this.offset,
        blurRadius: other.blurRadius ?? _$this.blurRadius,
        spreadRadius: other.spreadRadius ?? _$this.spreadRadius);
  }

  /// The list of properties that constitute the state of this [BoxShadowDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BoxShadowDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.color,
        _$this.offset,
        _$this.blurRadius,
        _$this.spreadRadius,
      ];

  BoxShadowDto get _$this => this as BoxShadowDto;
}

/// Utility class for configuring [BoxShadowDto] properties.
///
/// This class provides methods to set individual properties of a [BoxShadowDto].
/// Use the methods of this class to configure specific properties of a [BoxShadowDto].
final class BoxShadowUtility<T extends Attribute>
    extends DtoUtility<T, BoxShadowDto, BoxShadow> {
  /// Utility for defining [BoxShadowDto.color]
  late final color = ColorUtility((v) => only(color: v));

  /// Utility for defining [BoxShadowDto.offset]
  late final offset = OffsetUtility((v) => only(offset: v));

  /// Utility for defining [BoxShadowDto.blurRadius]
  late final blurRadius = DoubleUtility((v) => only(blurRadius: v));

  /// Utility for defining [BoxShadowDto.spreadRadius]
  late final spreadRadius = DoubleUtility((v) => only(spreadRadius: v));

  BoxShadowUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [BoxShadowDto] with the specified properties.
  @override
  T only({
    ColorDto? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return builder(BoxShadowDto(
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

extension BoxShadowMixExt on BoxShadow {
  BoxShadowDto toDto() {
    return BoxShadowDto(
      color: color.toDto(),
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );
  }
}

extension ListBoxShadowMixExt on List<BoxShadow> {
  List<BoxShadowDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
