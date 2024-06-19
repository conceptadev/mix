// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constraints_dto.dart';

// **************************************************************************
// MixableDtoGenerator
// **************************************************************************

base mixin _$BoxConstraintsDto on Dto<BoxConstraints> {
  /// Resolves to [BoxConstraints] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final boxConstraints = BoxConstraintsDto(...).resolve(mix);
  /// ```
  @override
  BoxConstraints resolve(MixData mix) {
    return BoxConstraints(
      minWidth: _$this.minWidth ?? defaultValue.minWidth,
      maxWidth: _$this.maxWidth ?? defaultValue.maxWidth,
      minHeight: _$this.minHeight ?? defaultValue.minHeight,
      maxHeight: _$this.maxHeight ?? defaultValue.maxHeight,
    );
  }

  /// Merges the properties of this [BoxConstraintsDto] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [BoxConstraintsDto] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  BoxConstraintsDto merge(BoxConstraintsDto? other) {
    if (other == null) return _$this;

    return BoxConstraintsDto(
      minWidth: other.minWidth ?? _$this.minWidth,
      maxWidth: other.maxWidth ?? _$this.maxWidth,
      minHeight: other.minHeight ?? _$this.minHeight,
      maxHeight: other.maxHeight ?? _$this.maxHeight,
    );
  }

  /// The list of properties that constitute the state of this [BoxConstraintsDto].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BoxConstraintsDto] instances for equality.
  @override
  List<Object?> get props => [
        _$this.minWidth,
        _$this.maxWidth,
        _$this.minHeight,
        _$this.maxHeight,
      ];

  BoxConstraintsDto get _$this => this as BoxConstraintsDto;
}

/// Utility class for configuring [BoxConstraintsDto] properties.
///
/// This class provides methods to set individual properties of a [BoxConstraintsDto].
/// Use the methods of this class to configure specific properties of a [BoxConstraintsDto].
final class BoxConstraintsUtility<T extends Attribute>
    extends DtoUtility<T, BoxConstraintsDto, BoxConstraints> {
  /// Utility for defining [BoxConstraintsDto.minWidth]
  late final minWidth = DoubleUtility((v) => only(minWidth: v));

  /// Utility for defining [BoxConstraintsDto.maxWidth]
  late final maxWidth = DoubleUtility((v) => only(maxWidth: v));

  /// Utility for defining [BoxConstraintsDto.minHeight]
  late final minHeight = DoubleUtility((v) => only(minHeight: v));

  /// Utility for defining [BoxConstraintsDto.maxHeight]
  late final maxHeight = DoubleUtility((v) => only(maxHeight: v));

  BoxConstraintsUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [BoxConstraintsDto] with the specified properties.
  @override
  T only({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    return builder(BoxConstraintsDto(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    ));
  }

  T call({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    return only(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
  }
}

extension BoxConstraintsMixExt on BoxConstraints {
  BoxConstraintsDto toDto() {
    return BoxConstraintsDto(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
  }
}
