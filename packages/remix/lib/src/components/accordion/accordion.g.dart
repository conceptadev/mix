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
    FlexBoxSpec? flexContainer,
    AccordionHeaderSpec? header,
    BoxSpec? contentContainer,
    TextSpec? textContent,
    AnimatedData? animated,
  }) {
    return AccordionSpec(
      flexContainer: flexContainer ?? _$this.flexContainer,
      header: header ?? _$this.header,
      contentContainer: contentContainer ?? _$this.contentContainer,
      textContent: textContent ?? _$this.textContent,
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
  /// - [FlexBoxSpec.lerp] for [flexContainer].
  /// - [BoxSpec.lerp] for [contentContainer].
  /// - [TextSpec.lerp] for [textContent].

  /// For [header] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [AccordionSpec] is used. Otherwise, the value
  /// from the [other] [AccordionSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [AccordionSpec] configurations.
  @override
  AccordionSpec lerp(AccordionSpec? other, double t) {
    if (other == null) return _$this;

    return AccordionSpec(
      flexContainer: _$this.flexContainer.lerp(other.flexContainer, t),
      header: _$this.header.lerp(other.header, t),
      contentContainer: _$this.contentContainer.lerp(other.contentContainer, t),
      textContent: _$this.textContent.lerp(other.textContent, t),
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [AccordionSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [AccordionSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.flexContainer,
        _$this.header,
        _$this.contentContainer,
        _$this.textContent,
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
  final FlexBoxSpecAttribute? flexContainer;
  final AccordionHeaderSpecAttribute? header;
  final BoxSpecAttribute? contentContainer;
  final TextSpecAttribute? textContent;

  const AccordionSpecAttribute({
    this.flexContainer,
    this.header,
    this.contentContainer,
    this.textContent,
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
      flexContainer: flexContainer?.resolve(mix),
      header: header?.resolve(mix),
      contentContainer: contentContainer?.resolve(mix),
      textContent: textContent?.resolve(mix),
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
      flexContainer:
          flexContainer?.merge(other.flexContainer) ?? other.flexContainer,
      header: header?.merge(other.header) ?? other.header,
      contentContainer: contentContainer?.merge(other.contentContainer) ??
          other.contentContainer,
      textContent: textContent?.merge(other.textContent) ?? other.textContent,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [AccordionSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [AccordionSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        flexContainer,
        header,
        contentContainer,
        textContent,
        animated,
      ];
}

/// Utility class for configuring [AccordionSpec] properties.
///
/// This class provides methods to set individual properties of a [AccordionSpec].
/// Use the methods of this class to configure specific properties of a [AccordionSpec].
class AccordionSpecUtility<T extends Attribute>
    extends SpecUtility<T, AccordionSpecAttribute> {
  /// Utility for defining [AccordionSpecAttribute.flexContainer]
  late final flexContainer = FlexBoxSpecUtility((v) => only(flexContainer: v));

  /// Utility for defining [AccordionSpecAttribute.header]
  late final header = AccordionHeaderSpecUtility((v) => only(header: v));

  /// Utility for defining [AccordionSpecAttribute.contentContainer]
  late final contentContainer =
      BoxSpecUtility((v) => only(contentContainer: v));

  /// Utility for defining [AccordionSpecAttribute.textContent]
  late final textContent = TextSpecUtility((v) => only(textContent: v));

  /// Utility for defining [AccordionSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  AccordionSpecUtility(super.builder, {super.mutable});

  AccordionSpecUtility<T> get chain =>
      AccordionSpecUtility(attributeBuilder, mutable: true);

  static AccordionSpecUtility<AccordionSpecAttribute> get self =>
      AccordionSpecUtility((v) => v);

  /// Returns a new [AccordionSpecAttribute] with the specified properties.
  @override
  T only({
    FlexBoxSpecAttribute? flexContainer,
    AccordionHeaderSpecAttribute? header,
    BoxSpecAttribute? contentContainer,
    TextSpecAttribute? textContent,
    AnimatedDataDto? animated,
  }) {
    return builder(AccordionSpecAttribute(
      flexContainer: flexContainer,
      header: header,
      contentContainer: contentContainer,
      textContent: textContent,
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

mixin _$AccordionHeaderSpec on Spec<AccordionHeaderSpec> {
  static AccordionHeaderSpec from(MixData mix) {
    return mix.attributeOf<AccordionHeaderSpecAttribute>()?.resolve(mix) ??
        const AccordionHeaderSpec();
  }

  /// {@template accordion_header_spec_of}
  /// Retrieves the [AccordionHeaderSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [AccordionHeaderSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [AccordionHeaderSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final accordionHeaderSpec = AccordionHeaderSpec.of(context);
  /// ```
  /// {@endtemplate}
  static AccordionHeaderSpec of(BuildContext context) {
    return _$AccordionHeaderSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [AccordionHeaderSpec] but with the given fields
  /// replaced with the new values.
  @override
  AccordionHeaderSpec copyWith({
    FlexBoxSpec? flexContainer,
    IconSpec? leadingIcon,
    TextSpec? text,
    IconSpec? trailingIcon,
    AnimatedData? animated,
  }) {
    return AccordionHeaderSpec(
      flexContainer: flexContainer ?? _$this.flexContainer,
      leadingIcon: leadingIcon ?? _$this.leadingIcon,
      text: text ?? _$this.text,
      trailingIcon: trailingIcon ?? _$this.trailingIcon,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [AccordionHeaderSpec] and another [AccordionHeaderSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [AccordionHeaderSpec] is returned. When [t] is 1.0, the [other] [AccordionHeaderSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [AccordionHeaderSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [AccordionHeaderSpec] instance.
  ///
  /// The interpolation is performed on each property of the [AccordionHeaderSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [FlexBoxSpec.lerp] for [flexContainer].
  /// - [IconSpec.lerp] for [leadingIcon] and [trailingIcon].
  /// - [TextSpec.lerp] for [text].

  /// For [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [AccordionHeaderSpec] is used. Otherwise, the value
  /// from the [other] [AccordionHeaderSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [AccordionHeaderSpec] configurations.
  @override
  AccordionHeaderSpec lerp(AccordionHeaderSpec? other, double t) {
    if (other == null) return _$this;

    return AccordionHeaderSpec(
      flexContainer: _$this.flexContainer.lerp(other.flexContainer, t),
      leadingIcon: _$this.leadingIcon.lerp(other.leadingIcon, t),
      text: _$this.text.lerp(other.text, t),
      trailingIcon: _$this.trailingIcon.lerp(other.trailingIcon, t),
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [AccordionHeaderSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [AccordionHeaderSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.flexContainer,
        _$this.leadingIcon,
        _$this.text,
        _$this.trailingIcon,
        _$this.animated,
      ];

  AccordionHeaderSpec get _$this => this as AccordionHeaderSpec;
}

/// Represents the attributes of a [AccordionHeaderSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [AccordionHeaderSpec].
///
/// Use this class to configure the attributes of a [AccordionHeaderSpec] and pass it to
/// the [AccordionHeaderSpec] constructor.
base class AccordionHeaderSpecAttribute
    extends SpecAttribute<AccordionHeaderSpec> {
  final FlexBoxSpecAttribute? flexContainer;
  final IconSpecAttribute? leadingIcon;
  final TextSpecAttribute? text;
  final IconSpecAttribute? trailingIcon;

  const AccordionHeaderSpecAttribute({
    this.flexContainer,
    this.leadingIcon,
    this.text,
    this.trailingIcon,
    super.animated,
  });

  /// Resolves to [AccordionHeaderSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final accordionHeaderSpec = AccordionHeaderSpecAttribute(...).resolve(mix);
  /// ```
  @override
  AccordionHeaderSpec resolve(MixData mix) {
    return AccordionHeaderSpec(
      flexContainer: flexContainer?.resolve(mix),
      leadingIcon: leadingIcon?.resolve(mix),
      text: text?.resolve(mix),
      trailingIcon: trailingIcon?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [AccordionHeaderSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [AccordionHeaderSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  AccordionHeaderSpecAttribute merge(
      covariant AccordionHeaderSpecAttribute? other) {
    if (other == null) return this;

    return AccordionHeaderSpecAttribute(
      flexContainer:
          flexContainer?.merge(other.flexContainer) ?? other.flexContainer,
      leadingIcon: leadingIcon?.merge(other.leadingIcon) ?? other.leadingIcon,
      text: text?.merge(other.text) ?? other.text,
      trailingIcon:
          trailingIcon?.merge(other.trailingIcon) ?? other.trailingIcon,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [AccordionHeaderSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [AccordionHeaderSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        flexContainer,
        leadingIcon,
        text,
        trailingIcon,
        animated,
      ];
}

/// Utility class for configuring [AccordionHeaderSpec] properties.
///
/// This class provides methods to set individual properties of a [AccordionHeaderSpec].
/// Use the methods of this class to configure specific properties of a [AccordionHeaderSpec].
class AccordionHeaderSpecUtility<T extends Attribute>
    extends SpecUtility<T, AccordionHeaderSpecAttribute> {
  /// Utility for defining [AccordionHeaderSpecAttribute.flexContainer]
  late final flexContainer = FlexBoxSpecUtility((v) => only(flexContainer: v));

  /// Utility for defining [AccordionHeaderSpecAttribute.leadingIcon]
  late final leadingIcon = IconSpecUtility((v) => only(leadingIcon: v));

  /// Utility for defining [AccordionHeaderSpecAttribute.text]
  late final text = TextSpecUtility((v) => only(text: v));

  /// Utility for defining [AccordionHeaderSpecAttribute.trailingIcon]
  late final trailingIcon = IconSpecUtility((v) => only(trailingIcon: v));

  /// Utility for defining [AccordionHeaderSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  AccordionHeaderSpecUtility(super.builder, {super.mutable});

  AccordionHeaderSpecUtility<T> get chain =>
      AccordionHeaderSpecUtility(attributeBuilder, mutable: true);

  static AccordionHeaderSpecUtility<AccordionHeaderSpecAttribute> get self =>
      AccordionHeaderSpecUtility((v) => v);

  /// Returns a new [AccordionHeaderSpecAttribute] with the specified properties.
  @override
  T only({
    FlexBoxSpecAttribute? flexContainer,
    IconSpecAttribute? leadingIcon,
    TextSpecAttribute? text,
    IconSpecAttribute? trailingIcon,
    AnimatedDataDto? animated,
  }) {
    return builder(AccordionHeaderSpecAttribute(
      flexContainer: flexContainer,
      leadingIcon: leadingIcon,
      text: text,
      trailingIcon: trailingIcon,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [AccordionHeaderSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [AccordionHeaderSpec] specifications.
class AccordionHeaderSpecTween extends Tween<AccordionHeaderSpec?> {
  AccordionHeaderSpecTween({
    super.begin,
    super.end,
  });

  @override
  AccordionHeaderSpec lerp(double t) {
    if (begin == null && end == null) {
      return const AccordionHeaderSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
