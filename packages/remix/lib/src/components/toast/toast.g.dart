// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toast.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$ToastSpec on Spec<ToastSpec> {
  static ToastSpec from(MixData mix) {
    return mix.attributeOf<ToastSpecAttribute>()?.resolve(mix) ??
        const ToastSpec();
  }

  /// {@template toast_spec_of}
  /// Retrieves the [ToastSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [ToastSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [ToastSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final toastSpec = ToastSpec.of(context);
  /// ```
  /// {@endtemplate}
  static ToastSpec of(BuildContext context) {
    return _$ToastSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [ToastSpec] but with the given fields
  /// replaced with the new values.
  @override
  ToastSpec copyWith({
    BoxSpec? container,
    FlexSpec? mainFlex,
    FlexSpec? textFlex,
    TextSpec? title,
    TextSpec? description,
    WidgetModifiersData? modifiers,
    AnimatedData? animated,
  }) {
    return ToastSpec(
      container: container ?? _$this.container,
      mainFlex: mainFlex ?? _$this.mainFlex,
      textFlex: textFlex ?? _$this.textFlex,
      title: title ?? _$this.title,
      description: description ?? _$this.description,
      modifiers: modifiers ?? _$this.modifiers,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [ToastSpec] and another [ToastSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [ToastSpec] is returned. When [t] is 1.0, the [other] [ToastSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [ToastSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [ToastSpec] instance.
  ///
  /// The interpolation is performed on each property of the [ToastSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [BoxSpec.lerp] for [container].
  /// - [FlexSpec.lerp] for [mainFlex] and [textFlex].
  /// - [TextSpec.lerp] for [title] and [description].

  /// For [modifiers] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [ToastSpec] is used. Otherwise, the value
  /// from the [other] [ToastSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [ToastSpec] configurations.
  @override
  ToastSpec lerp(ToastSpec? other, double t) {
    if (other == null) return _$this;

    return ToastSpec(
      container: _$this.container.lerp(other.container, t),
      mainFlex: _$this.mainFlex.lerp(other.mainFlex, t),
      textFlex: _$this.textFlex.lerp(other.textFlex, t),
      title: _$this.title.lerp(other.title, t),
      description: _$this.description.lerp(other.description, t),
      modifiers: other.modifiers,
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [ToastSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ToastSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.container,
        _$this.mainFlex,
        _$this.textFlex,
        _$this.title,
        _$this.description,
        _$this.modifiers,
        _$this.animated,
      ];

  ToastSpec get _$this => this as ToastSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(
        DiagnosticsProperty('container', _$this.container, defaultValue: null));
    properties.add(
        DiagnosticsProperty('mainFlex', _$this.mainFlex, defaultValue: null));
    properties.add(
        DiagnosticsProperty('textFlex', _$this.textFlex, defaultValue: null));
    properties
        .add(DiagnosticsProperty('title', _$this.title, defaultValue: null));
    properties.add(DiagnosticsProperty('description', _$this.description,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty('modifiers', _$this.modifiers, defaultValue: null));
    properties.add(
        DiagnosticsProperty('animated', _$this.animated, defaultValue: null));
  }
}

/// Represents the attributes of a [ToastSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [ToastSpec].
///
/// Use this class to configure the attributes of a [ToastSpec] and pass it to
/// the [ToastSpec] constructor.
base class ToastSpecAttribute extends SpecAttribute<ToastSpec>
    with Diagnosticable {
  final BoxSpecAttribute? container;
  final FlexSpecAttribute? mainFlex;
  final FlexSpecAttribute? textFlex;
  final TextSpecAttribute? title;
  final TextSpecAttribute? description;

  const ToastSpecAttribute({
    this.container,
    this.mainFlex,
    this.textFlex,
    this.title,
    this.description,
    super.modifiers,
    super.animated,
  });

  /// Resolves to [ToastSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final toastSpec = ToastSpecAttribute(...).resolve(mix);
  /// ```
  @override
  ToastSpec resolve(MixData mix) {
    return ToastSpec(
      container: container?.resolve(mix),
      mainFlex: mainFlex?.resolve(mix),
      textFlex: textFlex?.resolve(mix),
      title: title?.resolve(mix),
      description: description?.resolve(mix),
      modifiers: modifiers?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [ToastSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [ToastSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  ToastSpecAttribute merge(covariant ToastSpecAttribute? other) {
    if (other == null) return this;

    return ToastSpecAttribute(
      container: container?.merge(other.container) ?? other.container,
      mainFlex: mainFlex?.merge(other.mainFlex) ?? other.mainFlex,
      textFlex: textFlex?.merge(other.textFlex) ?? other.textFlex,
      title: title?.merge(other.title) ?? other.title,
      description: description?.merge(other.description) ?? other.description,
      modifiers: modifiers?.merge(other.modifiers) ?? other.modifiers,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [ToastSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ToastSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        container,
        mainFlex,
        textFlex,
        title,
        description,
        modifiers,
        animated,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('container', container, defaultValue: null));
    properties
        .add(DiagnosticsProperty('mainFlex', mainFlex, defaultValue: null));
    properties
        .add(DiagnosticsProperty('textFlex', textFlex, defaultValue: null));
    properties.add(DiagnosticsProperty('title', title, defaultValue: null));
    properties.add(
        DiagnosticsProperty('description', description, defaultValue: null));
    properties
        .add(DiagnosticsProperty('modifiers', modifiers, defaultValue: null));
    properties
        .add(DiagnosticsProperty('animated', animated, defaultValue: null));
  }
}

/// Utility class for configuring [ToastSpec] properties.
///
/// This class provides methods to set individual properties of a [ToastSpec].
/// Use the methods of this class to configure specific properties of a [ToastSpec].
class ToastSpecUtility<T extends Attribute>
    extends SpecUtility<T, ToastSpecAttribute> {
  /// Utility for defining [ToastSpecAttribute.container]
  late final container = BoxSpecUtility((v) => only(container: v));

  /// Utility for defining [ToastSpecAttribute.mainFlex]
  late final mainFlex = FlexSpecUtility((v) => only(mainFlex: v));

  /// Utility for defining [ToastSpecAttribute.textFlex]
  late final textFlex = FlexSpecUtility((v) => only(textFlex: v));

  /// Utility for defining [ToastSpecAttribute.title]
  late final title = TextSpecUtility((v) => only(title: v));

  /// Utility for defining [ToastSpecAttribute.description]
  late final description = TextSpecUtility((v) => only(description: v));

  /// Utility for defining [ToastSpecAttribute.modifiers]
  late final wrap = SpecModifierUtility((v) => only(modifiers: v));

  /// Utility for defining [ToastSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  ToastSpecUtility(super.builder, {super.mutable});

  ToastSpecUtility<T> get chain =>
      ToastSpecUtility(attributeBuilder, mutable: true);

  static ToastSpecUtility<ToastSpecAttribute> get self =>
      ToastSpecUtility((v) => v);

  /// Returns a new [ToastSpecAttribute] with the specified properties.
  @override
  T only({
    BoxSpecAttribute? container,
    FlexSpecAttribute? mainFlex,
    FlexSpecAttribute? textFlex,
    TextSpecAttribute? title,
    TextSpecAttribute? description,
    WidgetModifiersDataDto? modifiers,
    AnimatedDataDto? animated,
  }) {
    return builder(ToastSpecAttribute(
      container: container,
      mainFlex: mainFlex,
      textFlex: textFlex,
      title: title,
      description: description,
      modifiers: modifiers,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [ToastSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [ToastSpec] specifications.
class ToastSpecTween extends Tween<ToastSpec?> {
  ToastSpecTween({
    super.begin,
    super.end,
  });

  @override
  ToastSpec lerp(double t) {
    if (begin == null && end == null) {
      return const ToastSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
