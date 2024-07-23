// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padding_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$PaddingSpec on Spec<PaddingSpec> {
  static PaddingSpec from(MixData mix) {
    return mix.attributeOf<PaddingSpecAttribute>()?.resolve(mix) ??
        const PaddingSpec._();
  }

  /// {@template padding_spec_of}
  /// Retrieves the [PaddingSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [PaddingSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [PaddingSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final paddingSpec = PaddingSpec.of(context);
  /// ```
  /// {@endtemplate}
  static PaddingSpec of(BuildContext context) {
    return _$PaddingSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [PaddingSpec] but with the given fields
  /// replaced with the new values.
  @override
  PaddingSpec copyWith({
    EdgeInsetsGeometry? padding,
  }) {
    return PaddingSpec._(padding: padding ?? _$this.padding);
  }

  /// Linearly interpolates between this [PaddingSpec] and another [PaddingSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [PaddingSpec] is returned. When [t] is 1.0, the [other] [PaddingSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [PaddingSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [PaddingSpec] instance.
  ///
  /// The interpolation is performed on each property of the [PaddingSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [EdgeInsetsGeometry.lerp] for [padding].

  /// For , the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [PaddingSpec] is used. Otherwise, the value
  /// from the [other] [PaddingSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [PaddingSpec] configurations.
  @override
  PaddingSpec lerp(PaddingSpec? other, double t) {
    if (other == null) return _$this;

    return PaddingSpec._(
        padding: EdgeInsetsGeometry.lerp(_$this.padding, other.padding, t));
  }

  /// The list of properties that constitute the state of this [PaddingSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [PaddingSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.padding,
      ];

  PaddingSpec get _$this => this as PaddingSpec;
}

/// Represents the attributes of a [PaddingSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [PaddingSpec].
///
/// Use this class to configure the attributes of a [PaddingSpec] and pass it to
/// the [PaddingSpec] constructor.
final class PaddingSpecAttribute extends SpecAttribute<PaddingSpec>
    with Diagnosticable {
  final EdgeInsetsGeometryDto? padding;

  const PaddingSpecAttribute({this.padding});

  /// Resolves to [PaddingSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final paddingSpec = PaddingSpecAttribute(...).resolve(mix);
  /// ```
  @override
  PaddingSpec resolve(MixData mix) {
    return PaddingSpec._(padding: padding?.resolve(mix));
  }

  /// Merges the properties of this [PaddingSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [PaddingSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  PaddingSpecAttribute merge(PaddingSpecAttribute? other) {
    if (other == null) return this;

    return PaddingSpecAttribute._(
        padding: padding?.merge(other.padding) ?? other.padding);
  }

  /// The list of properties that constitute the state of this [PaddingSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [PaddingSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        padding,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.addUsingDefault('padding', padding);
  }
}

/// Utility class for configuring [PaddingSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [PaddingSpecAttribute].
/// Use the methods of this class to configure specific properties of a [PaddingSpecAttribute].
base class PaddingSpecUtility<T extends Attribute>
    extends SpecUtility<T, PaddingSpecAttribute> {
  /// Utility for defining [PaddingSpecAttribute.padding]
  late final padding = SpacingUtility((v) => only(padding: v));

  PaddingSpecUtility(super.builder);

  static final self = PaddingSpecUtility((v) => v);

  /// Returns a new [PaddingSpecAttribute] with the specified properties.
  @override
  T only({
    EdgeInsetsGeometryDto? padding,
  }) {
    return builder(PaddingSpecAttribute(
      padding: padding,
    ));
  }
}

/// A tween that interpolates between two [PaddingSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [PaddingSpec] specifications.
class PaddingSpecTween extends Tween<PaddingSpec?> {
  PaddingSpecTween({
    super.begin,
    super.end,
  });

  @override
  PaddingSpec lerp(double t) {
    if (begin == null && end == null) return PaddingSpec._();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
