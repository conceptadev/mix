// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkbox.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$CheckboxSpec on Spec<CheckboxSpec> {
  static CheckboxSpec from(MixData mix) {
    return mix.attributeOf<CheckboxSpecAttribute>()?.resolve(mix) ??
        const CheckboxSpec();
  }

  /// {@template checkbox_spec_of}
  /// Retrieves the [CheckboxSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [CheckboxSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [CheckboxSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final checkboxSpec = CheckboxSpec.of(context);
  /// ```
  /// {@endtemplate}
  static CheckboxSpec of(BuildContext context) {
    return _$CheckboxSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [CheckboxSpec] but with the given fields
  /// replaced with the new values.
  @override
  CheckboxSpec copyWith({
    BoxSpec? indicatorContainer,
    IconSpec? indicatorIcon,
    FlexSpec? layout,
    TextSpec? label,
    WidgetModifiersData? modifiers,
    AnimatedData? animated,
  }) {
    return CheckboxSpec(
      indicatorContainer: indicatorContainer ?? _$this.indicatorContainer,
      indicatorIcon: indicatorIcon ?? _$this.indicatorIcon,
      layout: layout ?? _$this.layout,
      label: label ?? _$this.label,
      modifiers: modifiers ?? _$this.modifiers,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [CheckboxSpec] and another [CheckboxSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [CheckboxSpec] is returned. When [t] is 1.0, the [other] [CheckboxSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [CheckboxSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [CheckboxSpec] instance.
  ///
  /// The interpolation is performed on each property of the [CheckboxSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [BoxSpec.lerp] for [indicatorContainer].
  /// - [IconSpec.lerp] for [indicatorIcon].
  /// - [FlexSpec.lerp] for [layout].
  /// - [TextSpec.lerp] for [label].

  /// For [modifiers] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [CheckboxSpec] is used. Otherwise, the value
  /// from the [other] [CheckboxSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [CheckboxSpec] configurations.
  @override
  CheckboxSpec lerp(CheckboxSpec? other, double t) {
    if (other == null) return _$this;

    return CheckboxSpec(
      indicatorContainer:
          _$this.indicatorContainer.lerp(other.indicatorContainer, t),
      indicatorIcon: _$this.indicatorIcon.lerp(other.indicatorIcon, t),
      layout: _$this.layout.lerp(other.layout, t),
      label: _$this.label.lerp(other.label, t),
      modifiers: other.modifiers,
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [CheckboxSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [CheckboxSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.indicatorContainer,
        _$this.indicatorIcon,
        _$this.layout,
        _$this.label,
        _$this.modifiers,
        _$this.animated,
      ];

  CheckboxSpec get _$this => this as CheckboxSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(DiagnosticsProperty(
        'indicatorContainer', _$this.indicatorContainer,
        defaultValue: null));
    properties.add(DiagnosticsProperty('indicatorIcon', _$this.indicatorIcon,
        defaultValue: null));
    properties
        .add(DiagnosticsProperty('layout', _$this.layout, defaultValue: null));
    properties
        .add(DiagnosticsProperty('label', _$this.label, defaultValue: null));
    properties.add(
        DiagnosticsProperty('modifiers', _$this.modifiers, defaultValue: null));
    properties.add(
        DiagnosticsProperty('animated', _$this.animated, defaultValue: null));
  }
}

/// Represents the attributes of a [CheckboxSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [CheckboxSpec].
///
/// Use this class to configure the attributes of a [CheckboxSpec] and pass it to
/// the [CheckboxSpec] constructor.
base class CheckboxSpecAttribute extends SpecAttribute<CheckboxSpec>
    with Diagnosticable {
  final BoxSpecAttribute? indicatorContainer;
  final IconSpecAttribute? indicatorIcon;
  final FlexSpecAttribute? layout;
  final TextSpecAttribute? label;

  const CheckboxSpecAttribute({
    this.indicatorContainer,
    this.indicatorIcon,
    this.layout,
    this.label,
    super.modifiers,
    super.animated,
  });

  /// Resolves to [CheckboxSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final checkboxSpec = CheckboxSpecAttribute(...).resolve(mix);
  /// ```
  @override
  CheckboxSpec resolve(MixData mix) {
    return CheckboxSpec(
      indicatorContainer: indicatorContainer?.resolve(mix),
      indicatorIcon: indicatorIcon?.resolve(mix),
      layout: layout?.resolve(mix),
      label: label?.resolve(mix),
      modifiers: modifiers?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [CheckboxSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [CheckboxSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  CheckboxSpecAttribute merge(covariant CheckboxSpecAttribute? other) {
    if (other == null) return this;

    return CheckboxSpecAttribute(
      indicatorContainer: indicatorContainer?.merge(other.indicatorContainer) ??
          other.indicatorContainer,
      indicatorIcon:
          indicatorIcon?.merge(other.indicatorIcon) ?? other.indicatorIcon,
      layout: layout?.merge(other.layout) ?? other.layout,
      label: label?.merge(other.label) ?? other.label,
      modifiers: modifiers?.merge(other.modifiers) ?? other.modifiers,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [CheckboxSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [CheckboxSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        indicatorContainer,
        indicatorIcon,
        layout,
        label,
        modifiers,
        animated,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('indicatorContainer', indicatorContainer,
        defaultValue: null));
    properties.add(DiagnosticsProperty('indicatorIcon', indicatorIcon,
        defaultValue: null));
    properties.add(DiagnosticsProperty('layout', layout, defaultValue: null));
    properties.add(DiagnosticsProperty('label', label, defaultValue: null));
    properties
        .add(DiagnosticsProperty('modifiers', modifiers, defaultValue: null));
    properties
        .add(DiagnosticsProperty('animated', animated, defaultValue: null));
  }
}

/// Utility class for configuring [CheckboxSpec] properties.
///
/// This class provides methods to set individual properties of a [CheckboxSpec].
/// Use the methods of this class to configure specific properties of a [CheckboxSpec].
class CheckboxSpecUtility<T extends Attribute>
    extends SpecUtility<T, CheckboxSpecAttribute> {
  /// Utility for defining [CheckboxSpecAttribute.indicatorContainer]
  late final indicatorContainer =
      BoxSpecUtility((v) => only(indicatorContainer: v));

  /// Utility for defining [CheckboxSpecAttribute.indicatorIcon]
  late final indicatorIcon = IconSpecUtility((v) => only(indicatorIcon: v));

  /// Utility for defining [CheckboxSpecAttribute.layout]
  late final layout = FlexSpecUtility((v) => only(layout: v));

  /// Utility for defining [CheckboxSpecAttribute.label]
  late final label = TextSpecUtility((v) => only(label: v));

  /// Utility for defining [CheckboxSpecAttribute.modifiers]
  late final wrap = SpecModifierUtility((v) => only(modifiers: v));

  /// Utility for defining [CheckboxSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  CheckboxSpecUtility(super.builder, {super.mutable});

  CheckboxSpecUtility<T> get chain =>
      CheckboxSpecUtility(attributeBuilder, mutable: true);

  static CheckboxSpecUtility<CheckboxSpecAttribute> get self =>
      CheckboxSpecUtility((v) => v);

  /// Returns a new [CheckboxSpecAttribute] with the specified properties.
  @override
  T only({
    BoxSpecAttribute? indicatorContainer,
    IconSpecAttribute? indicatorIcon,
    FlexSpecAttribute? layout,
    TextSpecAttribute? label,
    WidgetModifiersDataDto? modifiers,
    AnimatedDataDto? animated,
  }) {
    return builder(CheckboxSpecAttribute(
      indicatorContainer: indicatorContainer,
      indicatorIcon: indicatorIcon,
      layout: layout,
      label: label,
      modifiers: modifiers,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [CheckboxSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [CheckboxSpec] specifications.
class CheckboxSpecTween extends Tween<CheckboxSpec?> {
  CheckboxSpecTween({
    super.begin,
    super.end,
  });

  @override
  CheckboxSpec lerp(double t) {
    if (begin == null && end == null) {
      return const CheckboxSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
