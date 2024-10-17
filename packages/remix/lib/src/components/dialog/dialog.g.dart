// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$DialogSpec on Spec<DialogSpec> {
  static DialogSpec from(MixData mix) {
    return mix.attributeOf<DialogSpecAttribute>()?.resolve(mix) ??
        const DialogSpec();
  }

  /// {@template dialog_spec_of}
  /// Retrieves the [DialogSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [DialogSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [DialogSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final dialogSpec = DialogSpec.of(context);
  /// ```
  /// {@endtemplate}
  static DialogSpec of(BuildContext context) {
    return _$DialogSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [DialogSpec] but with the given fields
  /// replaced with the new values.
  @override
  DialogSpec copyWith({
    BoxSpec? container,
    TextSpec? title,
    TextSpec? description,
    FlexSpec? mainFlex,
    FlexSpec? actionsFlex,
    WidgetModifiersData? modifiers,
    AnimatedData? animated,
  }) {
    return DialogSpec(
      container: container ?? _$this.container,
      title: title ?? _$this.title,
      description: description ?? _$this.description,
      mainFlex: mainFlex ?? _$this.mainFlex,
      actionsFlex: actionsFlex ?? _$this.actionsFlex,
      modifiers: modifiers ?? _$this.modifiers,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [DialogSpec] and another [DialogSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [DialogSpec] is returned. When [t] is 1.0, the [other] [DialogSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [DialogSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [DialogSpec] instance.
  ///
  /// The interpolation is performed on each property of the [DialogSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [BoxSpec.lerp] for [container].
  /// - [TextSpec.lerp] for [title] and [description].
  /// - [FlexSpec.lerp] for [mainFlex] and [actionsFlex].

  /// For [modifiers] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [DialogSpec] is used. Otherwise, the value
  /// from the [other] [DialogSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [DialogSpec] configurations.
  @override
  DialogSpec lerp(DialogSpec? other, double t) {
    if (other == null) return _$this;

    return DialogSpec(
      container: _$this.container.lerp(other.container, t),
      title: _$this.title.lerp(other.title, t),
      description: _$this.description.lerp(other.description, t),
      mainFlex: _$this.mainFlex.lerp(other.mainFlex, t),
      actionsFlex: _$this.actionsFlex.lerp(other.actionsFlex, t),
      modifiers: other.modifiers,
      animated: t < 0.5 ? _$this.animated : other.animated,
    );
  }

  /// The list of properties that constitute the state of this [DialogSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [DialogSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.container,
        _$this.title,
        _$this.description,
        _$this.mainFlex,
        _$this.actionsFlex,
        _$this.modifiers,
        _$this.animated,
      ];

  DialogSpec get _$this => this as DialogSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(
        DiagnosticsProperty('container', _$this.container, defaultValue: null));
    properties
        .add(DiagnosticsProperty('title', _$this.title, defaultValue: null));
    properties.add(DiagnosticsProperty('description', _$this.description,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty('mainFlex', _$this.mainFlex, defaultValue: null));
    properties.add(DiagnosticsProperty('actionsFlex', _$this.actionsFlex,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty('modifiers', _$this.modifiers, defaultValue: null));
    properties.add(
        DiagnosticsProperty('animated', _$this.animated, defaultValue: null));
  }
}

/// Represents the attributes of a [DialogSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [DialogSpec].
///
/// Use this class to configure the attributes of a [DialogSpec] and pass it to
/// the [DialogSpec] constructor.
class DialogSpecAttribute extends SpecAttribute<DialogSpec>
    with Diagnosticable {
  final BoxSpecAttribute? container;
  final TextSpecAttribute? title;
  final TextSpecAttribute? description;
  final FlexSpecAttribute? mainFlex;
  final FlexSpecAttribute? actionsFlex;

  const DialogSpecAttribute({
    this.container,
    this.title,
    this.description,
    this.mainFlex,
    this.actionsFlex,
    super.modifiers,
    super.animated,
  });

  /// Resolves to [DialogSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final dialogSpec = DialogSpecAttribute(...).resolve(mix);
  /// ```
  @override
  DialogSpec resolve(MixData mix) {
    return DialogSpec(
      container: container?.resolve(mix),
      title: title?.resolve(mix),
      description: description?.resolve(mix),
      mainFlex: mainFlex?.resolve(mix),
      actionsFlex: actionsFlex?.resolve(mix),
      modifiers: modifiers?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [DialogSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [DialogSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  DialogSpecAttribute merge(covariant DialogSpecAttribute? other) {
    if (other == null) return this;

    return DialogSpecAttribute(
      container: container?.merge(other.container) ?? other.container,
      title: title?.merge(other.title) ?? other.title,
      description: description?.merge(other.description) ?? other.description,
      mainFlex: mainFlex?.merge(other.mainFlex) ?? other.mainFlex,
      actionsFlex: actionsFlex?.merge(other.actionsFlex) ?? other.actionsFlex,
      modifiers: modifiers?.merge(other.modifiers) ?? other.modifiers,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [DialogSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [DialogSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        container,
        title,
        description,
        mainFlex,
        actionsFlex,
        modifiers,
        animated,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('container', container, defaultValue: null));
    properties.add(DiagnosticsProperty('title', title, defaultValue: null));
    properties.add(
        DiagnosticsProperty('description', description, defaultValue: null));
    properties
        .add(DiagnosticsProperty('mainFlex', mainFlex, defaultValue: null));
    properties.add(
        DiagnosticsProperty('actionsFlex', actionsFlex, defaultValue: null));
    properties
        .add(DiagnosticsProperty('modifiers', modifiers, defaultValue: null));
    properties
        .add(DiagnosticsProperty('animated', animated, defaultValue: null));
  }
}

/// Utility class for configuring [DialogSpec] properties.
///
/// This class provides methods to set individual properties of a [DialogSpec].
/// Use the methods of this class to configure specific properties of a [DialogSpec].
class DialogSpecUtility<T extends Attribute>
    extends SpecUtility<T, DialogSpecAttribute> {
  /// Utility for defining [DialogSpecAttribute.container]
  late final container = BoxSpecUtility((v) => only(container: v));

  /// Utility for defining [DialogSpecAttribute.title]
  late final title = TextSpecUtility((v) => only(title: v));

  /// Utility for defining [DialogSpecAttribute.description]
  late final description = TextSpecUtility((v) => only(description: v));

  /// Utility for defining [DialogSpecAttribute.mainFlex]
  late final mainFlex = FlexSpecUtility((v) => only(mainFlex: v));

  /// Utility for defining [DialogSpecAttribute.actionsFlex]
  late final actionsFlex = FlexSpecUtility((v) => only(actionsFlex: v));

  /// Utility for defining [DialogSpecAttribute.modifiers]
  late final wrap = SpecModifierUtility((v) => only(modifiers: v));

  /// Utility for defining [DialogSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  DialogSpecUtility(super.builder, {super.mutable});

  DialogSpecUtility<T> get chain =>
      DialogSpecUtility(attributeBuilder, mutable: true);

  static DialogSpecUtility<DialogSpecAttribute> get self =>
      DialogSpecUtility((v) => v);

  /// Returns a new [DialogSpecAttribute] with the specified properties.
  @override
  T only({
    BoxSpecAttribute? container,
    TextSpecAttribute? title,
    TextSpecAttribute? description,
    FlexSpecAttribute? mainFlex,
    FlexSpecAttribute? actionsFlex,
    WidgetModifiersDataDto? modifiers,
    AnimatedDataDto? animated,
  }) {
    return builder(DialogSpecAttribute(
      container: container,
      title: title,
      description: description,
      mainFlex: mainFlex,
      actionsFlex: actionsFlex,
      modifiers: modifiers,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [DialogSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [DialogSpec] specifications.
class DialogSpecTween extends Tween<DialogSpec?> {
  DialogSpecTween({
    super.begin,
    super.end,
  });

  @override
  DialogSpec lerp(double t) {
    if (begin == null && end == null) {
      return const DialogSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
