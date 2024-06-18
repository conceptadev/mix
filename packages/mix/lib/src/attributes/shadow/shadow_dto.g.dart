// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shadow_dto.dart';

// **************************************************************************
// Generator: DtoDefinitionBuilder
// **************************************************************************

base mixin _$ShadowDto on Dto<Shadow> {
  @override
  Shadow resolve(MixData mix) {
    return Shadow(
      blurRadius: _$this.blurRadius ?? defaultValue.blurRadius,
      color: _$this.color?.resolve(mix) ?? defaultValue.color,
      offset: _$this.offset ?? defaultValue.offset,
    );
  }

  @override
  ShadowDto merge(ShadowDto? other) {
    if (other == null) return _$this;

    return ShadowDto(
      blurRadius: other.blurRadius ?? _$this.blurRadius,
      color: _$this.color?.merge(other.color) ?? other.color,
      offset: other.offset ?? _$this.offset,
    );
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
///
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

base mixin _$BoxShadowDto on Dto<BoxShadow> {
  @override
  BoxShadow resolve(MixData mix) {
    return BoxShadow(
      color: _$this.color?.resolve(mix) ?? defaultValue.color,
      offset: _$this.offset ?? defaultValue.offset,
      blurRadius: _$this.blurRadius ?? defaultValue.blurRadius,
      spreadRadius: _$this.spreadRadius ?? defaultValue.spreadRadius,
    );
  }

  @override
  BoxShadowDto merge(BoxShadowDto? other) {
    if (other == null) return _$this;

    return BoxShadowDto(
      color: _$this.color?.merge(other.color) ?? other.color,
      offset: other.offset ?? _$this.offset,
      blurRadius: other.blurRadius ?? _$this.blurRadius,
      spreadRadius: other.spreadRadius ?? _$this.spreadRadius,
    );
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
///
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
