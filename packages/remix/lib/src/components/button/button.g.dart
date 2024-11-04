// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$ButtonSpec on Spec<ButtonSpec> {
  static ButtonSpec from(MixData mix) {
    return mix.attributeOf<ButtonSpecAttribute>()?.resolve(mix) ??
        const ButtonSpec();
  }

  /// {@template button_spec_of}
  /// Retrieves the [ButtonSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [ButtonSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [ButtonSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final buttonSpec = ButtonSpec.of(context);
  /// ```
  /// {@endtemplate}
  static ButtonSpec of(BuildContext context) {
    return _$ButtonSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [ButtonSpec] but with the given fields
  /// replaced with the new values.
  @override
  ButtonSpec copyWith({
    BoxSpec? container,
    FlexSpec? layout,
    IconSpec? icon,
    TextSpec? label,
    WidgetModifiersData? modifiers,
    SpinnerSpec? spinner,
    AnimatedData? animated,
  }) {
    return ButtonSpec(
      container: container ?? _$this.container,
      layout: layout ?? _$this.layout,
      icon: icon ?? _$this.icon,
      label: label ?? _$this.label,
      modifiers: modifiers ?? _$this.modifiers,
      spinner: spinner ?? _$this.spinner,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [ButtonSpec] and another [ButtonSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [ButtonSpec] is returned. When [t] is 1.0, the [other] [ButtonSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [ButtonSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [ButtonSpec] instance.
  ///
  /// The interpolation is performed on each property of the [ButtonSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [BoxSpec.lerp] for [container].
  /// - [FlexSpec.lerp] for [layout].
  /// - [IconSpec.lerp] for [icon].
  /// - [TextSpec.lerp] for [label].

  /// For [modifiers] and [spinner] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [ButtonSpec] is used. Otherwise, the value
  /// from the [other] [ButtonSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [ButtonSpec] configurations.
  @override
  ButtonSpec lerp(ButtonSpec? other, double t) {
    if (other == null) return _$this;

    return ButtonSpec(
      container: _$this.container.lerp(other.container, t),
      layout: _$this.layout.lerp(other.layout, t),
      icon: _$this.icon.lerp(other.icon, t),
      label: _$this.label.lerp(other.label, t),
      modifiers: other.modifiers,
      spinner: _$this.spinner.lerp(other.spinner, t),
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [ButtonSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ButtonSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.container,
        _$this.layout,
        _$this.icon,
        _$this.label,
        _$this.modifiers,
        _$this.spinner,
        _$this.animated,
      ];

  ButtonSpec get _$this => this as ButtonSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(
        DiagnosticsProperty('container', _$this.container, defaultValue: null));
    properties
        .add(DiagnosticsProperty('layout', _$this.layout, defaultValue: null));
    properties
        .add(DiagnosticsProperty('icon', _$this.icon, defaultValue: null));
    properties
        .add(DiagnosticsProperty('label', _$this.label, defaultValue: null));
    properties.add(
        DiagnosticsProperty('modifiers', _$this.modifiers, defaultValue: null));
    properties.add(
        DiagnosticsProperty('spinner', _$this.spinner, defaultValue: null));
    properties.add(
        DiagnosticsProperty('animated', _$this.animated, defaultValue: null));
  }
}

/// Represents the attributes of a [ButtonSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [ButtonSpec].
///
/// Use this class to configure the attributes of a [ButtonSpec] and pass it to
/// the [ButtonSpec] constructor.
class ButtonSpecAttribute extends SpecAttribute<ButtonSpec>
    with Diagnosticable {
  final BoxSpecAttribute? container;
  final FlexSpecAttribute? layout;
  final IconSpecAttribute? icon;
  final TextSpecAttribute? label;
  final SpinnerSpecAttribute? spinner;

  const ButtonSpecAttribute({
    this.container,
    this.layout,
    this.icon,
    this.label,
    super.modifiers,
    this.spinner,
    super.animated,
  });

  /// Resolves to [ButtonSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final buttonSpec = ButtonSpecAttribute(...).resolve(mix);
  /// ```
  @override
  ButtonSpec resolve(MixData mix) {
    return ButtonSpec(
      container: container?.resolve(mix),
      layout: layout?.resolve(mix),
      icon: icon?.resolve(mix),
      label: label?.resolve(mix),
      modifiers: modifiers?.resolve(mix),
      spinner: spinner?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [ButtonSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [ButtonSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  ButtonSpecAttribute merge(covariant ButtonSpecAttribute? other) {
    if (other == null) return this;

    return ButtonSpecAttribute(
      container: container?.merge(other.container) ?? other.container,
      layout: layout?.merge(other.layout) ?? other.layout,
      icon: icon?.merge(other.icon) ?? other.icon,
      label: label?.merge(other.label) ?? other.label,
      modifiers: modifiers?.merge(other.modifiers) ?? other.modifiers,
      spinner: spinner?.merge(other.spinner) ?? other.spinner,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [ButtonSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ButtonSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        container,
        layout,
        icon,
        label,
        modifiers,
        spinner,
        animated,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('container', container, defaultValue: null));
    properties.add(DiagnosticsProperty('layout', layout, defaultValue: null));
    properties.add(DiagnosticsProperty('icon', icon, defaultValue: null));
    properties.add(DiagnosticsProperty('label', label, defaultValue: null));
    properties
        .add(DiagnosticsProperty('modifiers', modifiers, defaultValue: null));
    properties.add(DiagnosticsProperty('spinner', spinner, defaultValue: null));
    properties
        .add(DiagnosticsProperty('animated', animated, defaultValue: null));
  }
}

/// Utility class for configuring [ButtonSpec] properties.
///
/// This class provides methods to set individual properties of a [ButtonSpec].
/// Use the methods of this class to configure specific properties of a [ButtonSpec].
class ButtonSpecUtility<T extends Attribute>
    extends SpecUtility<T, ButtonSpecAttribute> {
  /// Utility for defining [ButtonSpecAttribute.container]
  late final container = BoxSpecUtility((v) => only(container: v));

  /// Utility for defining [ButtonSpecAttribute.layout]
  late final layout = FlexSpecUtility((v) => only(layout: v));

  /// Utility for defining [ButtonSpecAttribute.icon]
  late final icon = IconSpecUtility((v) => only(icon: v));

  /// Utility for defining [ButtonSpecAttribute.label]
  late final label = TextSpecUtility((v) => only(label: v));

  /// Utility for defining [ButtonSpecAttribute.modifiers]
  late final wrap = SpecModifierUtility((v) => only(modifiers: v));

  /// Utility for defining [ButtonSpecAttribute.spinner]
  late final spinner = SpinnerSpecUtility((v) => only(spinner: v));

  /// Utility for defining [ButtonSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  ButtonSpecUtility(super.builder, {super.mutable});

  ButtonSpecUtility<T> get chain =>
      ButtonSpecUtility(attributeBuilder, mutable: true);

  static ButtonSpecUtility<ButtonSpecAttribute> get self =>
      ButtonSpecUtility((v) => v);

  /// Returns a new [ButtonSpecAttribute] with the specified properties.
  @override
  T only({
    BoxSpecAttribute? container,
    FlexSpecAttribute? layout,
    IconSpecAttribute? icon,
    TextSpecAttribute? label,
    WidgetModifiersDataDto? modifiers,
    SpinnerSpecAttribute? spinner,
    AnimatedDataDto? animated,
  }) {
    return builder(ButtonSpecAttribute(
      container: container,
      layout: layout,
      icon: icon,
      label: label,
      modifiers: modifiers,
      spinner: spinner,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [ButtonSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [ButtonSpec] specifications.
class ButtonSpecTween extends Tween<ButtonSpec?> {
  ButtonSpecTween({
    super.begin,
    super.end,
  });

  @override
  ButtonSpec lerp(double t) {
    if (begin == null && end == null) {
      return const ButtonSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
