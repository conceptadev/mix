// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_radius_dto.dart';

// **************************************************************************
// Generator: DtoDefinitionBuilder
// **************************************************************************

base mixin _$BorderRadiusDto on Dto<BorderRadius> {
  @override
  BorderRadiusDto merge(BorderRadiusDto? other) {
    if (other == null) return _$this;

    return BorderRadiusDto(
      topLeft: other.topLeft ?? _$this.topLeft,
      topRight: other.topRight ?? _$this.topRight,
      bottomLeft: other.bottomLeft ?? _$this.bottomLeft,
      bottomRight: other.bottomRight ?? _$this.bottomRight,
    );
  }

  /// The list of properties that constitute the state of this [BorderRadiusDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BorderRadiusDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.topLeft,
        _$this.topRight,
        _$this.bottomLeft,
        _$this.bottomRight,
      ];

  BorderRadiusDto get _$this => this as BorderRadiusDto;
}

extension BorderRadiusMixExt on BorderRadius {
  BorderRadiusDto toDto() {
    return BorderRadiusDto(
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
    );
  }
}

base mixin _$BorderRadiusDirectionalDto on Dto<BorderRadiusDirectional> {
  @override
  BorderRadiusDirectionalDto merge(BorderRadiusDirectionalDto? other) {
    if (other == null) return _$this;

    return BorderRadiusDirectionalDto(
      topStart: other.topStart ?? _$this.topStart,
      topEnd: other.topEnd ?? _$this.topEnd,
      bottomStart: other.bottomStart ?? _$this.bottomStart,
      bottomEnd: other.bottomEnd ?? _$this.bottomEnd,
    );
  }

  /// The list of properties that constitute the state of this [BorderRadiusDirectionalDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BorderRadiusDirectionalDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.topStart,
        _$this.topEnd,
        _$this.bottomStart,
        _$this.bottomEnd,
      ];

  BorderRadiusDirectionalDto get _$this => this as BorderRadiusDirectionalDto;
}

extension BorderRadiusDirectionalMixExt on BorderRadiusDirectional {
  BorderRadiusDirectionalDto toDto() {
    return BorderRadiusDirectionalDto(
      topStart: topStart,
      topEnd: topEnd,
      bottomStart: bottomStart,
      bottomEnd: bottomEnd,
    );
  }
}
