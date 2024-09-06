// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segmented_control.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$SegmentedControlSpec on Spec<SegmentedControlSpec> {
  static SegmentedControlSpec from(MixData mix) {
    return mix.attributeOf<SegmentedControlSpecAttribute>()?.resolve(mix) ??
        const SegmentedControlSpec();
  }

  /// {@template segmented_control_spec_of}
  /// Retrieves the [SegmentedControlSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [SegmentedControlSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [SegmentedControlSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final segmentedControlSpec = SegmentedControlSpec.of(context);
  /// ```
  /// {@endtemplate}
  static SegmentedControlSpec of(BuildContext context) {
    return _$SegmentedControlSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [SegmentedControlSpec] but with the given fields
  /// replaced with the new values.
  @override
  SegmentedControlSpec copyWith({
    BoxSpec? container,
    FlexSpec? flex,
    SegmentedControlButtonSpec? item,
    WidgetModifiersData? modifiers,
    AnimatedData? animated,
  }) {
    return SegmentedControlSpec(
      container: container ?? _$this.container,
      flex: flex ?? _$this.flex,
      item: item ?? _$this.item,
      modifiers: modifiers ?? _$this.modifiers,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [SegmentedControlSpec] and another [SegmentedControlSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [SegmentedControlSpec] is returned. When [t] is 1.0, the [other] [SegmentedControlSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [SegmentedControlSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [SegmentedControlSpec] instance.
  ///
  /// The interpolation is performed on each property of the [SegmentedControlSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [BoxSpec.lerp] for [container].
  /// - [FlexSpec.lerp] for [flex].

  /// For [item] and [modifiers] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [SegmentedControlSpec] is used. Otherwise, the value
  /// from the [other] [SegmentedControlSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [SegmentedControlSpec] configurations.
  @override
  SegmentedControlSpec lerp(SegmentedControlSpec? other, double t) {
    if (other == null) return _$this;

    return SegmentedControlSpec(
      container: _$this.container.lerp(other.container, t),
      flex: _$this.flex.lerp(other.flex, t),
      item: _$this.item.lerp(other.item, t),
      modifiers: other.modifiers,
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [SegmentedControlSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SegmentedControlSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.container,
        _$this.flex,
        _$this.item,
        _$this.modifiers,
        _$this.animated,
      ];

  SegmentedControlSpec get _$this => this as SegmentedControlSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(
        DiagnosticsProperty('container', _$this.container, defaultValue: null));
    properties
        .add(DiagnosticsProperty('flex', _$this.flex, defaultValue: null));
    properties
        .add(DiagnosticsProperty('item', _$this.item, defaultValue: null));
    properties.add(
        DiagnosticsProperty('modifiers', _$this.modifiers, defaultValue: null));
    properties.add(
        DiagnosticsProperty('animated', _$this.animated, defaultValue: null));
  }
}

/// Represents the attributes of a [SegmentedControlSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [SegmentedControlSpec].
///
/// Use this class to configure the attributes of a [SegmentedControlSpec] and pass it to
/// the [SegmentedControlSpec] constructor.
class SegmentedControlSpecAttribute extends SpecAttribute<SegmentedControlSpec>
    with Diagnosticable {
  final BoxSpecAttribute? container;
  final FlexSpecAttribute? flex;
  final SegmentedControlButtonSpecAttribute? item;

  const SegmentedControlSpecAttribute({
    this.container,
    this.flex,
    this.item,
    super.modifiers,
    super.animated,
  });

  /// Resolves to [SegmentedControlSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final segmentedControlSpec = SegmentedControlSpecAttribute(...).resolve(mix);
  /// ```
  @override
  SegmentedControlSpec resolve(MixData mix) {
    return SegmentedControlSpec(
      container: container?.resolve(mix),
      flex: flex?.resolve(mix),
      item: item?.resolve(mix),
      modifiers: modifiers?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [SegmentedControlSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [SegmentedControlSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  SegmentedControlSpecAttribute merge(
      covariant SegmentedControlSpecAttribute? other) {
    if (other == null) return this;

    return SegmentedControlSpecAttribute(
      container: container?.merge(other.container) ?? other.container,
      flex: flex?.merge(other.flex) ?? other.flex,
      item: item?.merge(other.item) ?? other.item,
      modifiers: modifiers?.merge(other.modifiers) ?? other.modifiers,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [SegmentedControlSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SegmentedControlSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        container,
        flex,
        item,
        modifiers,
        animated,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('container', container, defaultValue: null));
    properties.add(DiagnosticsProperty('flex', flex, defaultValue: null));
    properties.add(DiagnosticsProperty('item', item, defaultValue: null));
    properties
        .add(DiagnosticsProperty('modifiers', modifiers, defaultValue: null));
    properties
        .add(DiagnosticsProperty('animated', animated, defaultValue: null));
  }
}

/// Utility class for configuring [SegmentedControlSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [SegmentedControlSpecAttribute].
/// Use the methods of this class to configure specific properties of a [SegmentedControlSpecAttribute].
class SegmentedControlSpecUtility<T extends Attribute>
    extends SpecUtility<T, SegmentedControlSpecAttribute> {
  /// Utility for defining [SegmentedControlSpecAttribute.container]
  late final container = BoxSpecUtility((v) => only(container: v));

  /// Utility for defining [SegmentedControlSpecAttribute.flex]
  late final flex = FlexSpecUtility((v) => only(flex: v));

  /// Utility for defining [SegmentedControlSpecAttribute.item]
  late final item = SegmentedControlButtonSpecUtility((v) => only(item: v));

  /// Utility for defining [SegmentedControlSpecAttribute.modifiers]
  late final wrap = SpecModifierUtility((v) => only(modifiers: v));

  /// Utility for defining [SegmentedControlSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  SegmentedControlSpecUtility(super.builder, {super.mutable});

  SegmentedControlSpecUtility<T> get chain =>
      SegmentedControlSpecUtility(attributeBuilder, mutable: true);

  static SegmentedControlSpecUtility<SegmentedControlSpecAttribute> get self =>
      SegmentedControlSpecUtility((v) => v);

  /// Returns a new [SegmentedControlSpecAttribute] with the specified properties.
  @override
  T only({
    BoxSpecAttribute? container,
    FlexSpecAttribute? flex,
    SegmentedControlButtonSpecAttribute? item,
    WidgetModifiersDataDto? modifiers,
    AnimatedDataDto? animated,
  }) {
    return builder(SegmentedControlSpecAttribute(
      container: container,
      flex: flex,
      item: item,
      modifiers: modifiers,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [SegmentedControlSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [SegmentedControlSpec] specifications.
class SegmentedControlSpecTween extends Tween<SegmentedControlSpec?> {
  SegmentedControlSpecTween({
    super.begin,
    super.end,
  });

  @override
  SegmentedControlSpec lerp(double t) {
    if (begin == null && end == null) {
      return const SegmentedControlSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}

mixin _$SegmentedControlButtonSpec on Spec<SegmentedControlButtonSpec> {
  static SegmentedControlButtonSpec from(MixData mix) {
    return mix
            .attributeOf<SegmentedControlButtonSpecAttribute>()
            ?.resolve(mix) ??
        const SegmentedControlButtonSpec();
  }

  /// {@template segmented_control_button_spec_of}
  /// Retrieves the [SegmentedControlButtonSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [SegmentedControlButtonSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [SegmentedControlButtonSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final segmentedControlButtonSpec = SegmentedControlButtonSpec.of(context);
  /// ```
  /// {@endtemplate}
  static SegmentedControlButtonSpec of(BuildContext context) {
    return _$SegmentedControlButtonSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [SegmentedControlButtonSpec] but with the given fields
  /// replaced with the new values.
  @override
  SegmentedControlButtonSpec copyWith({
    BoxSpec? container,
    FlexSpec? flex,
    IconSpec? icon,
    TextSpec? label,
    WidgetModifiersData? modifiers,
    AnimatedData? animated,
  }) {
    return SegmentedControlButtonSpec(
      container: container ?? _$this.container,
      flex: flex ?? _$this.flex,
      icon: icon ?? _$this.icon,
      label: label ?? _$this.label,
      modifiers: modifiers ?? _$this.modifiers,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [SegmentedControlButtonSpec] and another [SegmentedControlButtonSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [SegmentedControlButtonSpec] is returned. When [t] is 1.0, the [other] [SegmentedControlButtonSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [SegmentedControlButtonSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [SegmentedControlButtonSpec] instance.
  ///
  /// The interpolation is performed on each property of the [SegmentedControlButtonSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [BoxSpec.lerp] for [container].
  /// - [FlexSpec.lerp] for [flex].
  /// - [IconSpec.lerp] for [icon].
  /// - [TextSpec.lerp] for [label].

  /// For [modifiers] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [SegmentedControlButtonSpec] is used. Otherwise, the value
  /// from the [other] [SegmentedControlButtonSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [SegmentedControlButtonSpec] configurations.
  @override
  SegmentedControlButtonSpec lerp(SegmentedControlButtonSpec? other, double t) {
    if (other == null) return _$this;

    return SegmentedControlButtonSpec(
      container: _$this.container.lerp(other.container, t),
      flex: _$this.flex.lerp(other.flex, t),
      icon: _$this.icon.lerp(other.icon, t),
      label: _$this.label.lerp(other.label, t),
      modifiers: other.modifiers,
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [SegmentedControlButtonSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SegmentedControlButtonSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.container,
        _$this.flex,
        _$this.icon,
        _$this.label,
        _$this.modifiers,
        _$this.animated,
      ];

  SegmentedControlButtonSpec get _$this => this as SegmentedControlButtonSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(
        DiagnosticsProperty('container', _$this.container, defaultValue: null));
    properties
        .add(DiagnosticsProperty('flex', _$this.flex, defaultValue: null));
    properties
        .add(DiagnosticsProperty('icon', _$this.icon, defaultValue: null));
    properties
        .add(DiagnosticsProperty('label', _$this.label, defaultValue: null));
    properties.add(
        DiagnosticsProperty('modifiers', _$this.modifiers, defaultValue: null));
    properties.add(
        DiagnosticsProperty('animated', _$this.animated, defaultValue: null));
  }
}

/// Represents the attributes of a [SegmentedControlButtonSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [SegmentedControlButtonSpec].
///
/// Use this class to configure the attributes of a [SegmentedControlButtonSpec] and pass it to
/// the [SegmentedControlButtonSpec] constructor.
class SegmentedControlButtonSpecAttribute
    extends SpecAttribute<SegmentedControlButtonSpec> with Diagnosticable {
  final BoxSpecAttribute? container;
  final FlexSpecAttribute? flex;
  final IconSpecAttribute? icon;
  final TextSpecAttribute? label;

  const SegmentedControlButtonSpecAttribute({
    this.container,
    this.flex,
    this.icon,
    this.label,
    super.modifiers,
    super.animated,
  });

  /// Resolves to [SegmentedControlButtonSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final segmentedControlButtonSpec = SegmentedControlButtonSpecAttribute(...).resolve(mix);
  /// ```
  @override
  SegmentedControlButtonSpec resolve(MixData mix) {
    return SegmentedControlButtonSpec(
      container: container?.resolve(mix),
      flex: flex?.resolve(mix),
      icon: icon?.resolve(mix),
      label: label?.resolve(mix),
      modifiers: modifiers?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [SegmentedControlButtonSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [SegmentedControlButtonSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  SegmentedControlButtonSpecAttribute merge(
      covariant SegmentedControlButtonSpecAttribute? other) {
    if (other == null) return this;

    return SegmentedControlButtonSpecAttribute(
      container: container?.merge(other.container) ?? other.container,
      flex: flex?.merge(other.flex) ?? other.flex,
      icon: icon?.merge(other.icon) ?? other.icon,
      label: label?.merge(other.label) ?? other.label,
      modifiers: modifiers?.merge(other.modifiers) ?? other.modifiers,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [SegmentedControlButtonSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [SegmentedControlButtonSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        container,
        flex,
        icon,
        label,
        modifiers,
        animated,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('container', container, defaultValue: null));
    properties.add(DiagnosticsProperty('flex', flex, defaultValue: null));
    properties.add(DiagnosticsProperty('icon', icon, defaultValue: null));
    properties.add(DiagnosticsProperty('label', label, defaultValue: null));
    properties
        .add(DiagnosticsProperty('modifiers', modifiers, defaultValue: null));
    properties
        .add(DiagnosticsProperty('animated', animated, defaultValue: null));
  }
}

/// Utility class for configuring [SegmentedControlButtonSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [SegmentedControlButtonSpecAttribute].
/// Use the methods of this class to configure specific properties of a [SegmentedControlButtonSpecAttribute].
class SegmentedControlButtonSpecUtility<T extends Attribute>
    extends SpecUtility<T, SegmentedControlButtonSpecAttribute> {
  /// Utility for defining [SegmentedControlButtonSpecAttribute.container]
  late final container = BoxSpecUtility((v) => only(container: v));

  /// Utility for defining [SegmentedControlButtonSpecAttribute.flex]
  late final flex = FlexSpecUtility((v) => only(flex: v));

  /// Utility for defining [SegmentedControlButtonSpecAttribute.icon]
  late final icon = IconSpecUtility((v) => only(icon: v));

  /// Utility for defining [SegmentedControlButtonSpecAttribute.label]
  late final label = TextSpecUtility((v) => only(label: v));

  /// Utility for defining [SegmentedControlButtonSpecAttribute.modifiers]
  late final wrap = SpecModifierUtility((v) => only(modifiers: v));

  /// Utility for defining [SegmentedControlButtonSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  SegmentedControlButtonSpecUtility(super.builder, {super.mutable});

  SegmentedControlButtonSpecUtility<T> get chain =>
      SegmentedControlButtonSpecUtility(attributeBuilder, mutable: true);

  static SegmentedControlButtonSpecUtility<SegmentedControlButtonSpecAttribute>
      get self => SegmentedControlButtonSpecUtility((v) => v);

  /// Returns a new [SegmentedControlButtonSpecAttribute] with the specified properties.
  @override
  T only({
    BoxSpecAttribute? container,
    FlexSpecAttribute? flex,
    IconSpecAttribute? icon,
    TextSpecAttribute? label,
    WidgetModifiersDataDto? modifiers,
    AnimatedDataDto? animated,
  }) {
    return builder(SegmentedControlButtonSpecAttribute(
      container: container,
      flex: flex,
      icon: icon,
      label: label,
      modifiers: modifiers,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [SegmentedControlButtonSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [SegmentedControlButtonSpec] specifications.
class SegmentedControlButtonSpecTween
    extends Tween<SegmentedControlButtonSpec?> {
  SegmentedControlButtonSpecTween({
    super.begin,
    super.end,
  });

  @override
  SegmentedControlButtonSpec lerp(double t) {
    if (begin == null && end == null) {
      return const SegmentedControlButtonSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
