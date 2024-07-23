// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opacity_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$OpacitySpec on Spec<OpacitySpec> {
  static OpacitySpec from(MixData mix) {
    return mix.attributeOf<OpacitySpecAttribute>()?.resolve(mix) ??
        const OpacitySpec();
  }

  /// {@template opacity_spec_of}
  /// Retrieves the [OpacitySpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [OpacitySpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [OpacitySpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final opacitySpec = OpacitySpec.of(context);
  /// ```
  /// {@endtemplate}
  static OpacitySpec of(BuildContext context) {
    return _$OpacitySpec.from(Mix.of(context));
  }

  /// Creates a copy of this [OpacitySpec] but with the given fields
  /// replaced with the new values.
  @override
  OpacitySpec copyWith({
    double? opacity,
  }) {
    return OpacitySpec(opacity: opacity ?? _$this.opacity);
  }

  /// Linearly interpolates between this [OpacitySpec] and another [OpacitySpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [OpacitySpec] is returned. When [t] is 1.0, the [other] [OpacitySpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [OpacitySpec] is returned.
  ///
  /// If [other] is null, this method returns the current [OpacitySpec] instance.
  ///
  /// The interpolation is performed on each property of the [OpacitySpec] using the appropriate
  /// interpolation method:
  ///
  /// - [MixHelpers.lerpDouble] for [opacity].

  /// For , the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [OpacitySpec] is used. Otherwise, the value
  /// from the [other] [OpacitySpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [OpacitySpec] configurations.
  @override
  OpacitySpec lerp(OpacitySpec? other, double t) {
    if (other == null) return _$this;

    return OpacitySpec(
        opacity: MixHelpers.lerpDouble(_$this.opacity, other.opacity, t));
  }

  /// The list of properties that constitute the state of this [OpacitySpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [OpacitySpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.opacity,
      ];

  OpacitySpec get _$this => this as OpacitySpec;
}

/// Represents the attributes of a [OpacitySpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [OpacitySpec].
///
/// Use this class to configure the attributes of a [OpacitySpec] and pass it to
/// the [OpacitySpec] constructor.
final class OpacitySpecAttribute extends SpecAttribute<OpacitySpec>
    with Diagnosticable {
  final double? opacity;

  const OpacitySpecAttribute({this.opacity});

  /// Resolves to [OpacitySpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final opacitySpec = OpacitySpecAttribute(...).resolve(mix);
  /// ```
  @override
  OpacitySpec resolve(MixData mix) {
    return OpacitySpec(opacity: opacity);
  }

  /// Merges the properties of this [OpacitySpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [OpacitySpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  OpacitySpecAttribute merge(OpacitySpecAttribute? other) {
    if (other == null) return this;

    return OpacitySpecAttribute(opacity: other.opacity ?? opacity);
  }

  /// The list of properties that constitute the state of this [OpacitySpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [OpacitySpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        opacity,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.addUsingDefault('opacity', opacity);
  }
}

/// Utility class for configuring [OpacitySpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [OpacitySpecAttribute].
/// Use the methods of this class to configure specific properties of a [OpacitySpecAttribute].
base class OpacitySpecUtility<T extends Attribute>
    extends SpecUtility<T, OpacitySpecAttribute> {
  /// Utility for defining [OpacitySpecAttribute.opacity]
  late final _opacity = DoubleUtility((v) => only(opacity: v));

  OpacitySpecUtility(super.builder);

  static final self = OpacitySpecUtility((v) => v);

  /// Returns a new [OpacitySpecAttribute] with the specified properties.
  @override
  T only({
    double? opacity,
  }) {
    return builder(OpacitySpecAttribute(
      opacity: opacity,
    ));
  }
}

/// A tween that interpolates between two [OpacitySpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [OpacitySpec] specifications.
class OpacitySpecTween extends Tween<OpacitySpec?> {
  OpacitySpecTween({
    super.begin,
    super.end,
  });

  @override
  OpacitySpec lerp(double t) {
    if (begin == null && end == null) return const OpacitySpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
