// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$RadioSpec on Spec<RadioSpec> {
  static RadioSpec from(MixData mix) {
    return mix.attributeOf<RadioSpecAttribute>()?.resolve(mix) ??
        const RadioSpec();
  }

  /// {@template radio_spec_of}
  /// Retrieves the [RadioSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [RadioSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [RadioSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final radioSpec = RadioSpec.of(context);
  /// ```
  /// {@endtemplate}
  static RadioSpec of(BuildContext context) {
    return _$RadioSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [RadioSpec] but with the given fields
  /// replaced with the new values.
  @override
  RadioSpec copyWith({
    BoxSpec? container,
    BoxSpec? indicator,
    FlexSpec? layout,
    TextSpec? text,
    WidgetModifiersData? modifiers,
    AnimatedData? animated,
  }) {
    return RadioSpec(
      container: container ?? _$this.container,
      indicator: indicator ?? _$this.indicator,
      layout: layout ?? _$this.layout,
      text: text ?? _$this.text,
      modifiers: modifiers ?? _$this.modifiers,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [RadioSpec] and another [RadioSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [RadioSpec] is returned. When [t] is 1.0, the [other] [RadioSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [RadioSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [RadioSpec] instance.
  ///
  /// The interpolation is performed on each property of the [RadioSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [BoxSpec.lerp] for [container] and [indicator].
  /// - [FlexSpec.lerp] for [layout].
  /// - [TextSpec.lerp] for [text].

  /// For [modifiers] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [RadioSpec] is used. Otherwise, the value
  /// from the [other] [RadioSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [RadioSpec] configurations.
  @override
  RadioSpec lerp(RadioSpec? other, double t) {
    if (other == null) return _$this;

    return RadioSpec(
      container: _$this.container.lerp(other.container, t),
      indicator: _$this.indicator.lerp(other.indicator, t),
      layout: _$this.layout.lerp(other.layout, t),
      text: _$this.text.lerp(other.text, t),
      modifiers: other.modifiers,
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [RadioSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [RadioSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.container,
        _$this.indicator,
        _$this.layout,
        _$this.text,
        _$this.modifiers,
        _$this.animated,
      ];

  RadioSpec get _$this => this as RadioSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(
        DiagnosticsProperty('container', _$this.container, defaultValue: null));
    properties.add(
        DiagnosticsProperty('indicator', _$this.indicator, defaultValue: null));
    properties
        .add(DiagnosticsProperty('layout', _$this.layout, defaultValue: null));
    properties
        .add(DiagnosticsProperty('text', _$this.text, defaultValue: null));
    properties.add(
        DiagnosticsProperty('modifiers', _$this.modifiers, defaultValue: null));
    properties.add(
        DiagnosticsProperty('animated', _$this.animated, defaultValue: null));
  }
}

/// Represents the attributes of a [RadioSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [RadioSpec].
///
/// Use this class to configure the attributes of a [RadioSpec] and pass it to
/// the [RadioSpec] constructor.
base class RadioSpecAttribute extends SpecAttribute<RadioSpec>
    with Diagnosticable {
  final BoxSpecAttribute? container;
  final BoxSpecAttribute? indicator;
  final FlexSpecAttribute? layout;
  final TextSpecAttribute? text;

  const RadioSpecAttribute({
    this.container,
    this.indicator,
    this.layout,
    this.text,
    super.modifiers,
    super.animated,
  });

  /// Resolves to [RadioSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final radioSpec = RadioSpecAttribute(...).resolve(mix);
  /// ```
  @override
  RadioSpec resolve(MixData mix) {
    return RadioSpec(
      container: container?.resolve(mix),
      indicator: indicator?.resolve(mix),
      layout: layout?.resolve(mix),
      text: text?.resolve(mix),
      modifiers: modifiers?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [RadioSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [RadioSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  RadioSpecAttribute merge(covariant RadioSpecAttribute? other) {
    if (other == null) return this;

    return RadioSpecAttribute(
      container: container?.merge(other.container) ?? other.container,
      indicator: indicator?.merge(other.indicator) ?? other.indicator,
      layout: layout?.merge(other.layout) ?? other.layout,
      text: text?.merge(other.text) ?? other.text,
      modifiers: modifiers?.merge(other.modifiers) ?? other.modifiers,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [RadioSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [RadioSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        container,
        indicator,
        layout,
        text,
        modifiers,
        animated,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('container', container, defaultValue: null));
    properties
        .add(DiagnosticsProperty('indicator', indicator, defaultValue: null));
    properties.add(DiagnosticsProperty('layout', layout, defaultValue: null));
    properties.add(DiagnosticsProperty('text', text, defaultValue: null));
    properties
        .add(DiagnosticsProperty('modifiers', modifiers, defaultValue: null));
    properties
        .add(DiagnosticsProperty('animated', animated, defaultValue: null));
  }
}

/// Utility class for configuring [RadioSpec] properties.
///
/// This class provides methods to set individual properties of a [RadioSpec].
/// Use the methods of this class to configure specific properties of a [RadioSpec].
class RadioSpecUtility<T extends Attribute>
    extends SpecUtility<T, RadioSpecAttribute> {
  /// Utility for defining [RadioSpecAttribute.container]
  late final container = BoxSpecUtility((v) => only(container: v));

  /// Utility for defining [RadioSpecAttribute.indicator]
  late final indicator = BoxSpecUtility((v) => only(indicator: v));

  /// Utility for defining [RadioSpecAttribute.layout]
  late final layout = FlexSpecUtility((v) => only(layout: v));

  /// Utility for defining [RadioSpecAttribute.text]
  late final text = TextSpecUtility((v) => only(text: v));

  /// Utility for defining [RadioSpecAttribute.modifiers]
  late final wrap = SpecModifierUtility((v) => only(modifiers: v));

  /// Utility for defining [RadioSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  RadioSpecUtility(super.builder, {super.mutable});

  RadioSpecUtility<T> get chain =>
      RadioSpecUtility(attributeBuilder, mutable: true);

  static RadioSpecUtility<RadioSpecAttribute> get self =>
      RadioSpecUtility((v) => v);

  /// Returns a new [RadioSpecAttribute] with the specified properties.
  @override
  T only({
    BoxSpecAttribute? container,
    BoxSpecAttribute? indicator,
    FlexSpecAttribute? layout,
    TextSpecAttribute? text,
    WidgetModifiersDataDto? modifiers,
    AnimatedDataDto? animated,
  }) {
    return builder(RadioSpecAttribute(
      container: container,
      indicator: indicator,
      layout: layout,
      text: text,
      modifiers: modifiers,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [RadioSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [RadioSpec] specifications.
class RadioSpecTween extends Tween<RadioSpec?> {
  RadioSpecTween({
    super.begin,
    super.end,
  });

  @override
  RadioSpec lerp(double t) {
    if (begin == null && end == null) {
      return const RadioSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
