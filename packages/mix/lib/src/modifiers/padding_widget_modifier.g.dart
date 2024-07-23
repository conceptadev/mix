// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padding_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

// ignore_for_file: deprecated_member_use_from_same_package

mixin _$PaddingModifierSpec on WidgetModifierSpec<PaddingModifierSpec> {
  static PaddingModifierSpec from(MixData mix) {
    return mix.attributeOf<PaddingModifierAttribute>()?.resolve(mix) ??
        const PaddingModifierSpec();
  }

  /// {@template padding_modifier_spec_of}
  /// Retrieves the [PaddingModifierSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [PaddingModifierSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [PaddingModifierSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final paddingModifierSpec = PaddingModifierSpec.of(context);
  /// ```
  /// {@endtemplate}
  static PaddingModifierSpec of(BuildContext context) {
    return _$PaddingModifierSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [PaddingModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  PaddingModifierSpec copyWith({
    EdgeInsetsGeometry? padding,
  }) {
    return PaddingModifierSpec(
      padding ?? _$this.padding,
    );
  }

  /// Linearly interpolates between this [PaddingModifierSpec] and another [PaddingModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [PaddingModifierSpec] is returned. When [t] is 1.0, the [other] [PaddingModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [PaddingModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [PaddingModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [PaddingModifierSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [EdgeInsetsGeometry.lerp] for [padding].

  /// For , the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [PaddingModifierSpec] is used. Otherwise, the value
  /// from the [other] [PaddingModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [PaddingModifierSpec] configurations.
  @override
  PaddingModifierSpec lerp(PaddingModifierSpec? other, double t) {
    if (other == null) return _$this;

    return PaddingModifierSpec(
      EdgeInsetsGeometry.lerp(_$this.padding, other.padding, t)!,
    );
  }

  /// The list of properties that constitute the state of this [PaddingModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [PaddingModifierSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.padding,
      ];

  PaddingModifierSpec get _$this => this as PaddingModifierSpec;
}

/// Represents the attributes of a [PaddingModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [PaddingModifierSpec].
///
/// Use this class to configure the attributes of a [PaddingModifierSpec] and pass it to
/// the [PaddingModifierSpec] constructor.
final class PaddingModifierAttribute
    extends WidgetModifierSpecAttribute<PaddingModifierSpec>
    with Diagnosticable {
  final SpacingDto? padding;

  const PaddingModifierAttribute({
    this.padding,
  });

  /// Resolves to [PaddingModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final paddingModifierSpec = PaddingModifierAttribute(...).resolve(mix);
  /// ```
  @override
  PaddingModifierSpec resolve(MixData mix) {
    return PaddingModifierSpec(
      padding?.resolve(mix),
    );
  }

  /// Merges the properties of this [PaddingModifierAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [PaddingModifierAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  PaddingModifierAttribute merge(PaddingModifierAttribute? other) {
    if (other == null) return this;

    return PaddingModifierAttribute(
      padding: padding?.merge(other.padding) ?? other.padding,
    );
  }

  /// The list of properties that constitute the state of this [PaddingModifierAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [PaddingModifierAttribute] instances for equality.
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

/// Utility class for configuring [PaddingModifierAttribute] properties.
///
/// This class provides methods to set individual properties of a [PaddingModifierAttribute].
/// Use the methods of this class to configure specific properties of a [PaddingModifierAttribute].
class PaddingModifierUtility<T extends Attribute>
    extends SpecUtility<T, PaddingModifierAttribute> {
  /// Utility for defining [PaddingModifierAttribute.padding]
  late final padding = SpacingUtility((v) => only(padding: v));

  PaddingModifierUtility(super.builder);

  static final self = PaddingModifierUtility((v) => v);

  /// Returns a new [PaddingModifierAttribute] with the specified properties.
  @override
  T only({
    SpacingDto? padding,
  }) {
    return builder(PaddingModifierAttribute(
      padding: padding,
    ));
  }
}

/// A tween that interpolates between two [PaddingModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [PaddingModifierSpec] specifications.
class PaddingModifierSpecTween extends Tween<PaddingModifierSpec?> {
  PaddingModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  PaddingModifierSpec lerp(double t) {
    if (begin == null && end == null) return const PaddingModifierSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
