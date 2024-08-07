// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accordion.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$AccordionSpec on Spec<AccordionSpec> {
  static AccordionSpec from(MixData mix) {
    return mix.attributeOf<AccordionSpecAttribute>()?.resolve(mix) ??
        const AccordionSpec();
  }

  /// {@template accordion_spec_of}
  /// Retrieves the [AccordionSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [AccordionSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [AccordionSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final accordionSpec = AccordionSpec.of(context);
  /// ```
  /// {@endtemplate}
  static AccordionSpec of(BuildContext context) {
    return _$AccordionSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [AccordionSpec] but with the given fields
  /// replaced with the new values.
  @override
  AccordionSpec copyWith({
    BoxSpec? container,
    AccordionHeaderSpec? headerContainer,
    BoxSpec? contentContainer,
    FlexSpec? flex,
    IconSpec? icon,
    AnimatedData? animated,
  }) {
    return AccordionSpec(
      container: container ?? _$this.container,
      headerContainer: headerContainer ?? _$this.headerContainer,
      contentContainer: contentContainer ?? _$this.contentContainer,
      flex: flex ?? _$this.flex,
      icon: icon ?? _$this.icon,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [AccordionSpec] and another [AccordionSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [AccordionSpec] is returned. When [t] is 1.0, the [other] [AccordionSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [AccordionSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [AccordionSpec] instance.
  ///
  /// The interpolation is performed on each property of the [AccordionSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [BoxSpec.lerp] for [container] and [contentContainer].
  /// - [FlexSpec.lerp] for [flex].
  /// - [IconSpec.lerp] for [icon].

  /// For [headerContainer] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [AccordionSpec] is used. Otherwise, the value
  /// from the [other] [AccordionSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [AccordionSpec] configurations.
  @override
  AccordionSpec lerp(AccordionSpec? other, double t) {
    if (other == null) return _$this;

    return AccordionSpec(
      container: _$this.container.lerp(other.container, t),
      headerContainer: _$this.headerContainer.lerp(other.headerContainer, t),
      contentContainer: _$this.contentContainer.lerp(other.contentContainer, t),
      flex: _$this.flex.lerp(other.flex, t),
      icon: _$this.icon.lerp(other.icon, t),
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [AccordionSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [AccordionSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.container,
        _$this.headerContainer,
        _$this.contentContainer,
        _$this.flex,
        _$this.icon,
        _$this.animated,
      ];

  AccordionSpec get _$this => this as AccordionSpec;
}

/// Represents the attributes of a [AccordionSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [AccordionSpec].
///
/// Use this class to configure the attributes of a [AccordionSpec] and pass it to
/// the [AccordionSpec] constructor.
base class AccordionSpecAttribute extends SpecAttribute<AccordionSpec> {
  final BoxSpecAttribute? container;
  final AccordionHeaderSpecAttribute? headerContainer;
  final BoxSpecAttribute? contentContainer;
  final FlexSpecAttribute? flex;
  final IconSpecAttribute? icon;

  const AccordionSpecAttribute({
    this.container,
    this.headerContainer,
    this.contentContainer,
    this.flex,
    this.icon,
    super.animated,
  });

  /// Resolves to [AccordionSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final accordionSpec = AccordionSpecAttribute(...).resolve(mix);
  /// ```
  @override
  AccordionSpec resolve(MixData mix) {
    return AccordionSpec(
      container: container?.resolve(mix),
      headerContainer: headerContainer?.resolve(mix),
      contentContainer: contentContainer?.resolve(mix),
      flex: flex?.resolve(mix),
      icon: icon?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [AccordionSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [AccordionSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  AccordionSpecAttribute merge(covariant AccordionSpecAttribute? other) {
    if (other == null) return this;

    return AccordionSpecAttribute(
      container: container?.merge(other.container) ?? other.container,
      headerContainer: headerContainer?.merge(other.headerContainer) ??
          other.headerContainer,
      contentContainer: contentContainer?.merge(other.contentContainer) ??
          other.contentContainer,
      flex: flex?.merge(other.flex) ?? other.flex,
      icon: icon?.merge(other.icon) ?? other.icon,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [AccordionSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [AccordionSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        container,
        headerContainer,
        contentContainer,
        flex,
        icon,
        animated,
      ];
}

/// Utility class for configuring [AccordionSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [AccordionSpecAttribute].
/// Use the methods of this class to configure specific properties of a [AccordionSpecAttribute].
class AccordionSpecUtility<T extends Attribute>
    extends SpecUtility<T, AccordionSpecAttribute> {
  /// Utility for defining [AccordionSpecAttribute.container]
  late final container = BoxSpecUtility((v) => only(container: v));

  /// Utility for defining [AccordionSpecAttribute.headerContainer]
  late final headerContainer =
      AccordionHeaderSpecUtility((v) => only(headerContainer: v));

  /// Utility for defining [AccordionSpecAttribute.contentContainer]
  late final contentContainer =
      BoxSpecUtility((v) => only(contentContainer: v));

  /// Utility for defining [AccordionSpecAttribute.flex]
  late final flex = FlexSpecUtility((v) => only(flex: v));

  /// Utility for defining [AccordionSpecAttribute.icon]
  late final icon = IconSpecUtility((v) => only(icon: v));

  /// Utility for defining [AccordionSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  AccordionSpecUtility(super.builder);

  static final self = AccordionSpecUtility((v) => v);

  /// Returns a new [AccordionSpecAttribute] with the specified properties.
  @override
  T only({
    BoxSpecAttribute? container,
    AccordionHeaderSpecAttribute? headerContainer,
    BoxSpecAttribute? contentContainer,
    FlexSpecAttribute? flex,
    IconSpecAttribute? icon,
    AnimatedDataDto? animated,
  }) {
    return builder(AccordionSpecAttribute(
      container: container,
      headerContainer: headerContainer,
      contentContainer: contentContainer,
      flex: flex,
      icon: icon,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [AccordionSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [AccordionSpec] specifications.
class AccordionSpecTween extends Tween<AccordionSpec?> {
  AccordionSpecTween({
    super.begin,
    super.end,
  });

  @override
  AccordionSpec lerp(double t) {
    if (begin == null && end == null) {
      return const AccordionSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
