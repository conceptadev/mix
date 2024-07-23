// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intrinsic_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$IntrinsicHeightModifierSpec
    on WidgetModifierSpec<IntrinsicHeightModifierSpec> {
  static IntrinsicHeightModifierSpec from(MixData mix) {
    return mix.attributeOf<IntrinsicHeightModifierAttribute>()?.resolve(mix) ??
        const IntrinsicHeightModifierSpec();
  }

  /// {@template intrinsic_height_modifier_spec_of}
  /// Retrieves the [IntrinsicHeightModifierSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [IntrinsicHeightModifierSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [IntrinsicHeightModifierSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final intrinsicHeightModifierSpec = IntrinsicHeightModifierSpec.of(context);
  /// ```
  /// {@endtemplate}
  static IntrinsicHeightModifierSpec of(BuildContext context) {
    return _$IntrinsicHeightModifierSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [IntrinsicHeightModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  IntrinsicHeightModifierSpec copyWith() {
    return IntrinsicHeightModifierSpec();
  }

  /// Linearly interpolates between this [IntrinsicHeightModifierSpec] and another [IntrinsicHeightModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [IntrinsicHeightModifierSpec] is returned. When [t] is 1.0, the [other] [IntrinsicHeightModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [IntrinsicHeightModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [IntrinsicHeightModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [IntrinsicHeightModifierSpec] using the appropriate
  /// interpolation method:
  ///

  /// For , the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [IntrinsicHeightModifierSpec] is used. Otherwise, the value
  /// from the [other] [IntrinsicHeightModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [IntrinsicHeightModifierSpec] configurations.
  @override
  IntrinsicHeightModifierSpec lerp(
      IntrinsicHeightModifierSpec? other, double t) {
    if (other == null) return _$this;

    return IntrinsicHeightModifierSpec();
  }

  /// The list of properties that constitute the state of this [IntrinsicHeightModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [IntrinsicHeightModifierSpec] instances for equality.
  @override
  List<Object?> get props => [];

  IntrinsicHeightModifierSpec get _$this => this as IntrinsicHeightModifierSpec;
}

/// Represents the attributes of a [IntrinsicHeightModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [IntrinsicHeightModifierSpec].
///
/// Use this class to configure the attributes of a [IntrinsicHeightModifierSpec] and pass it to
/// the [IntrinsicHeightModifierSpec] constructor.
final class IntrinsicHeightModifierAttribute
    extends WidgetModifierSpecAttribute<IntrinsicHeightModifierSpec>
    with Diagnosticable {
  const IntrinsicHeightModifierAttribute();

  /// Resolves to [IntrinsicHeightModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final intrinsicHeightModifierSpec = IntrinsicHeightModifierAttribute(...).resolve(mix);
  /// ```
  @override
  IntrinsicHeightModifierSpec resolve(MixData mix) {
    return IntrinsicHeightModifierSpec();
  }

  /// Merges the properties of this [IntrinsicHeightModifierAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [IntrinsicHeightModifierAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  IntrinsicHeightModifierAttribute merge(
      IntrinsicHeightModifierAttribute? other) {
    if (other == null) return this;

    return other;
  }

  /// The list of properties that constitute the state of this [IntrinsicHeightModifierAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [IntrinsicHeightModifierAttribute] instances for equality.
  @override
  List<Object?> get props => [];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

/// A tween that interpolates between two [IntrinsicHeightModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [IntrinsicHeightModifierSpec] specifications.
class IntrinsicHeightModifierSpecTween
    extends Tween<IntrinsicHeightModifierSpec?> {
  IntrinsicHeightModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  IntrinsicHeightModifierSpec lerp(double t) {
    if (begin == null && end == null)
      return const IntrinsicHeightModifierSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$IntrinsicWidthModifierSpec
    on WidgetModifierSpec<IntrinsicWidthModifierSpec> {
  static IntrinsicWidthModifierSpec from(MixData mix) {
    return mix.attributeOf<IntrinsicWidthModifierAttribute>()?.resolve(mix) ??
        const IntrinsicWidthModifierSpec();
  }

  /// {@template intrinsic_width_modifier_spec_of}
  /// Retrieves the [IntrinsicWidthModifierSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [IntrinsicWidthModifierSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [IntrinsicWidthModifierSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final intrinsicWidthModifierSpec = IntrinsicWidthModifierSpec.of(context);
  /// ```
  /// {@endtemplate}
  static IntrinsicWidthModifierSpec of(BuildContext context) {
    return _$IntrinsicWidthModifierSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [IntrinsicWidthModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  IntrinsicWidthModifierSpec copyWith() {
    return IntrinsicWidthModifierSpec();
  }

  /// Linearly interpolates between this [IntrinsicWidthModifierSpec] and another [IntrinsicWidthModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [IntrinsicWidthModifierSpec] is returned. When [t] is 1.0, the [other] [IntrinsicWidthModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [IntrinsicWidthModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [IntrinsicWidthModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [IntrinsicWidthModifierSpec] using the appropriate
  /// interpolation method:
  ///

  /// For , the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [IntrinsicWidthModifierSpec] is used. Otherwise, the value
  /// from the [other] [IntrinsicWidthModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [IntrinsicWidthModifierSpec] configurations.
  @override
  IntrinsicWidthModifierSpec lerp(IntrinsicWidthModifierSpec? other, double t) {
    if (other == null) return _$this;

    return IntrinsicWidthModifierSpec();
  }

  /// The list of properties that constitute the state of this [IntrinsicWidthModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [IntrinsicWidthModifierSpec] instances for equality.
  @override
  List<Object?> get props => [];

  IntrinsicWidthModifierSpec get _$this => this as IntrinsicWidthModifierSpec;
}

/// Represents the attributes of a [IntrinsicWidthModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [IntrinsicWidthModifierSpec].
///
/// Use this class to configure the attributes of a [IntrinsicWidthModifierSpec] and pass it to
/// the [IntrinsicWidthModifierSpec] constructor.
final class IntrinsicWidthModifierAttribute
    extends WidgetModifierSpecAttribute<IntrinsicWidthModifierSpec>
    with Diagnosticable {
  const IntrinsicWidthModifierAttribute();

  /// Resolves to [IntrinsicWidthModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final intrinsicWidthModifierSpec = IntrinsicWidthModifierAttribute(...).resolve(mix);
  /// ```
  @override
  IntrinsicWidthModifierSpec resolve(MixData mix) {
    return IntrinsicWidthModifierSpec();
  }

  /// Merges the properties of this [IntrinsicWidthModifierAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [IntrinsicWidthModifierAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  IntrinsicWidthModifierAttribute merge(
      IntrinsicWidthModifierAttribute? other) {
    if (other == null) return this;

    return other;
  }

  /// The list of properties that constitute the state of this [IntrinsicWidthModifierAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [IntrinsicWidthModifierAttribute] instances for equality.
  @override
  List<Object?> get props => [];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

/// A tween that interpolates between two [IntrinsicWidthModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [IntrinsicWidthModifierSpec] specifications.
class IntrinsicWidthModifierSpecTween
    extends Tween<IntrinsicWidthModifierSpec?> {
  IntrinsicWidthModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  IntrinsicWidthModifierSpec lerp(double t) {
    if (begin == null && end == null) return const IntrinsicWidthModifierSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
