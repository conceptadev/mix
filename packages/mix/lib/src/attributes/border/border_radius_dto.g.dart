// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'border_radius_dto.dart';

// **************************************************************************
// MixGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

/// A mixin that provides DTO functionality for [BorderRadiusMix].
mixin _$BorderRadiusMix on Mixable<BorderRadius> {
  /// Merges the properties of this [BorderRadiusMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [BorderRadiusMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  BorderRadiusMix merge(BorderRadiusMix? other) {
    if (other == null) return _$this;

    return BorderRadiusMix(
      topLeft: other.topLeft ?? _$this.topLeft,
      topRight: other.topRight ?? _$this.topRight,
      bottomLeft: other.bottomLeft ?? _$this.bottomLeft,
      bottomRight: other.bottomRight ?? _$this.bottomRight,
    );
  }

  /// The list of properties that constitute the state of this [BorderRadiusMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BorderRadiusMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.topLeft,
        _$this.topRight,
        _$this.bottomLeft,
        _$this.bottomRight,
      ];

  /// Returns this instance as a [BorderRadiusMix].
  BorderRadiusMix get _$this => this as BorderRadiusMix;
}

/// Extension methods to convert [BorderRadius] to [BorderRadiusMix].
extension BorderRadiusMixExt on BorderRadius {
  /// Converts this [BorderRadius] to a [BorderRadiusMix].
  BorderRadiusMix toDto() {
    return BorderRadiusMix(
      topLeft: topLeft,
      topRight: topRight,
      bottomLeft: bottomLeft,
      bottomRight: bottomRight,
    );
  }
}

/// Extension methods to convert List<[BorderRadius]> to List<[BorderRadiusMix]>.
extension ListBorderRadiusMixExt on List<BorderRadius> {
  /// Converts this List<[BorderRadius]> to a List<[BorderRadiusMix]>.
  List<BorderRadiusMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

/// A mixin that provides DTO functionality for [BorderRadiusDirectionalMix].
mixin _$BorderRadiusDirectionalMix on Mixable<BorderRadiusDirectional> {
  /// Merges the properties of this [BorderRadiusDirectionalMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [BorderRadiusDirectionalMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  BorderRadiusDirectionalMix merge(BorderRadiusDirectionalMix? other) {
    if (other == null) return _$this;

    return BorderRadiusDirectionalMix(
      topStart: other.topStart ?? _$this.topStart,
      topEnd: other.topEnd ?? _$this.topEnd,
      bottomStart: other.bottomStart ?? _$this.bottomStart,
      bottomEnd: other.bottomEnd ?? _$this.bottomEnd,
    );
  }

  /// The list of properties that constitute the state of this [BorderRadiusDirectionalMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BorderRadiusDirectionalMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.topStart,
        _$this.topEnd,
        _$this.bottomStart,
        _$this.bottomEnd,
      ];

  /// Returns this instance as a [BorderRadiusDirectionalMix].
  BorderRadiusDirectionalMix get _$this => this as BorderRadiusDirectionalMix;
}

/// Extension methods to convert [BorderRadiusDirectional] to [BorderRadiusDirectionalMix].
extension BorderRadiusDirectionalMixExt on BorderRadiusDirectional {
  /// Converts this [BorderRadiusDirectional] to a [BorderRadiusDirectionalMix].
  BorderRadiusDirectionalMix toDto() {
    return BorderRadiusDirectionalMix(
      topStart: topStart,
      topEnd: topEnd,
      bottomStart: bottomStart,
      bottomEnd: bottomEnd,
    );
  }
}

/// Extension methods to convert List<[BorderRadiusDirectional]> to List<[BorderRadiusDirectionalMix]>.
extension ListBorderRadiusDirectionalMixExt on List<BorderRadiusDirectional> {
  /// Converts this List<[BorderRadiusDirectional]> to a List<[BorderRadiusDirectionalMix]>.
  List<BorderRadiusDirectionalMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
