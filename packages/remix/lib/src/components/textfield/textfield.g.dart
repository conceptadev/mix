// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textfield.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$TextFieldSpec on Spec<TextFieldSpec> {
  static TextFieldSpec from(MixData mix) {
    return mix.attributeOf<TextFieldSpecAttribute>()?.resolve(mix) ??
        const TextFieldSpec();
  }

  /// {@template text_field_spec_of}
  /// Retrieves the [TextFieldSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [TextFieldSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [TextFieldSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final textFieldSpec = TextFieldSpec.of(context);
  /// ```
  /// {@endtemplate}
  static TextFieldSpec of(BuildContext context) {
    return _$TextFieldSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [TextFieldSpec] but with the given fields
  /// replaced with the new values.
  @override
  TextFieldSpec copyWith({
    TextStyle? style,
    AnimatedData? animated,
    WidgetModifiersData? modifiers,
  }) {
    return TextFieldSpec(
      style: style ?? _$this.style,
      animated: animated ?? _$this.animated,
      modifiers: modifiers ?? _$this.modifiers,
    );
  }

  /// Linearly interpolates between this [TextFieldSpec] and another [TextFieldSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [TextFieldSpec] is returned. When [t] is 1.0, the [other] [TextFieldSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [TextFieldSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [TextFieldSpec] instance.
  ///
  /// The interpolation is performed on each property of the [TextFieldSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [MixHelpers.lerpTextStyle] for [style].

  /// For [animated] and [modifiers], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [TextFieldSpec] is used. Otherwise, the value
  /// from the [other] [TextFieldSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [TextFieldSpec] configurations.
  @override
  TextFieldSpec lerp(TextFieldSpec? other, double t) {
    if (other == null) return _$this;

    return TextFieldSpec(
      style: MixHelpers.lerpTextStyle(_$this.style, other.style, t)!,
      animated: t < 0.5 ? _$this.animated : other.animated,
      modifiers: other.modifiers,
    );
  }

  /// The list of properties that constitute the state of this [TextFieldSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextFieldSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.style,
        _$this.animated,
        _$this.modifiers,
      ];

  TextFieldSpec get _$this => this as TextFieldSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
        .add(DiagnosticsProperty('style', _$this.style, defaultValue: null));
    properties.add(
        DiagnosticsProperty('animated', _$this.animated, defaultValue: null));
    properties.add(
        DiagnosticsProperty('modifiers', _$this.modifiers, defaultValue: null));
  }
}

/// Represents the attributes of a [TextFieldSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [TextFieldSpec].
///
/// Use this class to configure the attributes of a [TextFieldSpec] and pass it to
/// the [TextFieldSpec] constructor.
class TextFieldSpecAttribute extends SpecAttribute<TextFieldSpec>
    with Diagnosticable {
  final TextStyleDto? style;

  const TextFieldSpecAttribute({
    this.style,
    super.animated,
    super.modifiers,
  });

  /// Resolves to [TextFieldSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final textFieldSpec = TextFieldSpecAttribute(...).resolve(mix);
  /// ```
  @override
  TextFieldSpec resolve(MixData mix) {
    return TextFieldSpec(
      style: style?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
      modifiers: modifiers?.resolve(mix),
    );
  }

  /// Merges the properties of this [TextFieldSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [TextFieldSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  TextFieldSpecAttribute merge(covariant TextFieldSpecAttribute? other) {
    if (other == null) return this;

    return TextFieldSpecAttribute(
      style: style?.merge(other.style) ?? other.style,
      animated: animated?.merge(other.animated) ?? other.animated,
      modifiers: modifiers?.merge(other.modifiers) ?? other.modifiers,
    );
  }

  /// The list of properties that constitute the state of this [TextFieldSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextFieldSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        style,
        animated,
        modifiers,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('style', style,
        expandableValue: true, defaultValue: null));
    properties
        .add(DiagnosticsProperty('animated', animated, defaultValue: null));
    properties
        .add(DiagnosticsProperty('modifiers', modifiers, defaultValue: null));
  }
}

/// Utility class for configuring [TextFieldSpec] properties.
///
/// This class provides methods to set individual properties of a [TextFieldSpec].
/// Use the methods of this class to configure specific properties of a [TextFieldSpec].
class TextFieldSpecUtility<T extends Attribute>
    extends SpecUtility<T, TextFieldSpecAttribute> {
  /// Utility for defining [TextFieldSpecAttribute.style]
  late final style = TextStyleUtility((v) => only(style: v));

  /// Utility for defining [TextFieldSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  /// Utility for defining [TextFieldSpecAttribute.modifiers]
  late final wrap = SpecModifierUtility((v) => only(modifiers: v));

  TextFieldSpecUtility(super.builder, {super.mutable});

  TextFieldSpecUtility<T> get chain =>
      TextFieldSpecUtility(attributeBuilder, mutable: true);

  static TextFieldSpecUtility<TextFieldSpecAttribute> get self =>
      TextFieldSpecUtility((v) => v);

  /// Returns a new [TextFieldSpecAttribute] with the specified properties.
  @override
  T only({
    TextStyleDto? style,
    AnimatedDataDto? animated,
    WidgetModifiersDataDto? modifiers,
  }) {
    return builder(TextFieldSpecAttribute(
      style: style,
      animated: animated,
      modifiers: modifiers,
    ));
  }
}

/// A tween that interpolates between two [TextFieldSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [TextFieldSpec] specifications.
class TextFieldSpecTween extends Tween<TextFieldSpec?> {
  TextFieldSpecTween({
    super.begin,
    super.end,
  });

  @override
  TextFieldSpec lerp(double t) {
    if (begin == null && end == null) {
      return const TextFieldSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
