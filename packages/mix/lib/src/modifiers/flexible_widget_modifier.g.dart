// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flexible_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$FlexibleSpec on Spec<FlexibleSpec> {
  static FlexibleSpec from(MixData mix) {
    return mix.attributeOf<FlexibleSpecAttribute>()?.resolve(mix) ??
        const FlexibleSpec();
  }

  /// {@template flexible_spec_of}
  /// Retrieves the [FlexibleSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [FlexibleSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [FlexibleSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final flexibleSpec = FlexibleSpec.of(context);
  /// ```
  /// {@endtemplate}
  static FlexibleSpec of(BuildContext context) {
    return _$FlexibleSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [FlexibleSpec] but with the given fields
  /// replaced with the new values.
  @override
  FlexibleSpec copyWith({
    int? flex,
    FlexFit? fit,
  }) {
    return FlexibleSpec(flex: flex ?? _$this.flex, fit: fit ?? _$this.fit);
  }

  /// Linearly interpolates between this [FlexibleSpec] and another [FlexibleSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [FlexibleSpec] is returned. When [t] is 1.0, the [other] [FlexibleSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [FlexibleSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [FlexibleSpec] instance.
  ///
  /// The interpolation is performed on each property of the [FlexibleSpec] using the appropriate
  /// interpolation method:
  ///

  /// For [flex] and [fit], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [FlexibleSpec] is used. Otherwise, the value
  /// from the [other] [FlexibleSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [FlexibleSpec] configurations.
  @override
  FlexibleSpec lerp(FlexibleSpec? other, double t) {
    if (other == null) return _$this;

    return FlexibleSpec(
        flex: t < 0.5 ? _$this.flex : other.flex,
        fit: t < 0.5 ? _$this.fit : other.fit);
  }

  /// The list of properties that constitute the state of this [FlexibleSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [FlexibleSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.flex,
        _$this.fit,
      ];

  FlexibleSpec get _$this => this as FlexibleSpec;
}

/// Represents the attributes of a [FlexibleSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [FlexibleSpec].
///
/// Use this class to configure the attributes of a [FlexibleSpec] and pass it to
/// the [FlexibleSpec] constructor.
final class FlexibleSpecAttribute extends SpecAttribute<FlexibleSpec>
    with Diagnosticable {
  final int? flex;
  final FlexFit? fit;

  const FlexibleSpecAttribute({this.flex, this.fit});

  /// Resolves to [FlexibleSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final flexibleSpec = FlexibleSpecAttribute(...).resolve(mix);
  /// ```
  @override
  FlexibleSpec resolve(MixData mix) {
    return FlexibleSpec(flex: flex, fit: fit);
  }

  /// Merges the properties of this [FlexibleSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [FlexibleSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  FlexibleSpecAttribute merge(FlexibleSpecAttribute? other) {
    if (other == null) return this;

    return FlexibleSpecAttribute(
        flex: other.flex ?? flex, fit: other.fit ?? fit);
  }

  /// The list of properties that constitute the state of this [FlexibleSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [FlexibleSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        flex,
        fit,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.addUsingDefault('flex', flex);
    properties.addUsingDefault('fit', fit);
  }
}

/// Utility class for configuring [FlexibleSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [FlexibleSpecAttribute].
/// Use the methods of this class to configure specific properties of a [FlexibleSpecAttribute].
base class FlexibleSpecUtility<T extends Attribute>
    extends SpecUtility<T, FlexibleSpecAttribute> {
  /// Utility for defining [FlexibleSpecAttribute.flex]
  late final flex = IntUtility((v) => only(flex: v));

  /// Utility for defining [FlexibleSpecAttribute.fit]
  late final fit = FlexFitUtility((v) => only(fit: v));

  FlexibleSpecUtility(super.builder);

  static final self = FlexibleSpecUtility((v) => v);

  /// Returns a new [FlexibleSpecAttribute] with the specified properties.
  @override
  T only({
    int? flex,
    FlexFit? fit,
  }) {
    return builder(FlexibleSpecAttribute(
      flex: flex,
      fit: fit,
    ));
  }
}

/// A tween that interpolates between two [FlexibleSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [FlexibleSpec] specifications.
class FlexibleSpecTween extends Tween<FlexibleSpec?> {
  FlexibleSpecTween({
    super.begin,
    super.end,
  });

  @override
  FlexibleSpec lerp(double t) {
    if (begin == null && end == null) return const FlexibleSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
