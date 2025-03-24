// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space_dto.dart';

// **************************************************************************
// MixGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

/// A mixin that provides DTO functionality for [SpaceMix].
mixin _$SpaceMix on Mixable<double> {
  /// Merges the properties of this [SpaceMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [SpaceMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  SpaceMix merge(SpaceMix? other) {
    if (other == null) return _$this;

    return SpaceMix._(
      value: other.value ?? _$this.value,
    );
  }

  /// The list of properties that constitute the state of this [SpaceMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SpaceMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.value,
      ];

  /// Returns this instance as a [SpaceMix].
  SpaceMix get _$this => this as SpaceMix;
}
