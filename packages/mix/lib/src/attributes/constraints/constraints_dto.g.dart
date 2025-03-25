// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constraints_dto.dart';

// **************************************************************************
// MixGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

/// A mixin that provides DTO functionality for [BoxConstraintsMix].
mixin _$BoxConstraintsMix on Mixable<BoxConstraints> {
  /// Resolves to [BoxConstraints] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final boxConstraints = BoxConstraintsMix(...).resolve(mix);
  /// ```
  @override
  BoxConstraints resolve(MixData mix) {
    return BoxConstraints(
      minWidth: _$this.minWidth ?? 0.0,
      maxWidth: _$this.maxWidth ?? double.infinity,
      minHeight: _$this.minHeight ?? 0.0,
      maxHeight: _$this.maxHeight ?? double.infinity,
    );
  }

  /// Merges the properties of this [BoxConstraintsMix] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [BoxConstraintsMix] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  BoxConstraintsMix merge(BoxConstraintsMix? other) {
    if (other == null) return _$this;

    return BoxConstraintsMix(
      minWidth: other.minWidth ?? _$this.minWidth,
      maxWidth: other.maxWidth ?? _$this.maxWidth,
      minHeight: other.minHeight ?? _$this.minHeight,
      maxHeight: other.maxHeight ?? _$this.maxHeight,
    );
  }

  /// The list of properties that constitute the state of this [BoxConstraintsMix].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [BoxConstraintsMix] instances for equality.
  @override
  List<Object?> get props => [
        _$this.minWidth,
        _$this.maxWidth,
        _$this.minHeight,
        _$this.maxHeight,
      ];

  /// Returns this instance as a [BoxConstraintsMix].
  BoxConstraintsMix get _$this => this as BoxConstraintsMix;
}

/// Utility class for configuring [BoxConstraints] properties.
///
/// This class provides methods to set individual properties of a [BoxConstraints].
/// Use the methods of this class to configure specific properties of a [BoxConstraints].
class BoxConstraintsMixUtility<T extends Attribute>
    extends DtoUtility<T, BoxConstraintsMix, BoxConstraints> {
  /// Utility for defining [BoxConstraintsMix.minWidth]
  late final minWidth = DoubleUtility((v) => only(minWidth: v));

  /// Utility for defining [BoxConstraintsMix.maxWidth]
  late final maxWidth = DoubleUtility((v) => only(maxWidth: v));

  /// Utility for defining [BoxConstraintsMix.minHeight]
  late final minHeight = DoubleUtility((v) => only(minHeight: v));

  /// Utility for defining [BoxConstraintsMix.maxHeight]
  late final maxHeight = DoubleUtility((v) => only(maxHeight: v));

  BoxConstraintsMixUtility(super.builder) : super(valueToDto: (v) => v.toDto());

  /// Returns a new [BoxConstraintsMix] with the specified properties.
  @override
  T only({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    return builder(BoxConstraintsMix(
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

/// Extension methods to convert [BoxConstraints] to [BoxConstraintsMix].
extension BoxConstraintsMixExt on BoxConstraints {
  /// Converts this [BoxConstraints] to a [BoxConstraintsMix].
  BoxConstraintsMix toDto() {
    return BoxConstraintsMix(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
  }
}

/// Extension methods to convert List<[BoxConstraints]> to List<[BoxConstraintsMix]>.
extension ListBoxConstraintsMixExt on List<BoxConstraints> {
  /// Converts this List<[BoxConstraints]> to a List<[BoxConstraintsMix]>.
  List<BoxConstraintsMix> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
