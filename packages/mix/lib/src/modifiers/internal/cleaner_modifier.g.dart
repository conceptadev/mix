// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cleaner_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$CleanerModifierSpec on WidgetModifierSpec<CleanerModifierSpec> {
  /// Creates a copy of this [CleanerModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  CleanerModifierSpec copyWith() {
    return const CleanerModifierSpec();
  }

  /// Linearly interpolates between this [CleanerModifierSpec] and another [CleanerModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [CleanerModifierSpec] is returned. When [t] is 1.0, the [other] [CleanerModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [CleanerModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [CleanerModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [CleanerModifierSpec] using the appropriate
  /// interpolation method:
  ///

  /// For , the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [CleanerModifierSpec] is used. Otherwise, the value
  /// from the [other] [CleanerModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [CleanerModifierSpec] configurations.
  @override
  CleanerModifierSpec lerp(CleanerModifierSpec? other, double t) {
    if (other == null) return _$this;

    return const CleanerModifierSpec();
  }

  /// The list of properties that constitute the state of this [CleanerModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [CleanerModifierSpec] instances for equality.
  @override
  List<Object?> get props => [];

  CleanerModifierSpec get _$this => this as CleanerModifierSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {}
}

/// Represents the attributes of a [CleanerModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [CleanerModifierSpec].
///
/// Use this class to configure the attributes of a [CleanerModifierSpec] and pass it to
/// the [CleanerModifierSpec] constructor.
final class CleanerModifierSpecAttribute
    extends WidgetModifierSpecAttribute<CleanerModifierSpec>
    with Diagnosticable {
  const CleanerModifierSpecAttribute();

  /// Resolves to [CleanerModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final cleanerModifierSpec = CleanerModifierSpecAttribute(...).resolve(mix);
  /// ```
  @override
  CleanerModifierSpec resolve(MixData mix) {
    // ignore: prefer_const_constructors
    return CleanerModifierSpec();
  }

  /// Merges the properties of this [CleanerModifierSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [CleanerModifierSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  CleanerModifierSpecAttribute merge(CleanerModifierSpecAttribute? other) {
    if (other == null) return this;

    return other;
  }

  /// The list of properties that constitute the state of this [CleanerModifierSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [CleanerModifierSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

/// A tween that interpolates between two [CleanerModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [CleanerModifierSpec] specifications.
class CleanerModifierSpecTween extends Tween<CleanerModifierSpec?> {
  CleanerModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  CleanerModifierSpec lerp(double t) {
    if (begin == null && end == null) {
      return const CleanerModifierSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
