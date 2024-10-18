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
    TextAlign? textAlign,
    StrutStyle? strutStyle,
    TextHeightBehavior? textHeightBehavior,
    TextScaler? textScaler,
    TextWidthBasis? textWidthBasis,
    double? cursorWidth,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    Offset? cursorOffset,
    bool? paintCursorAboveText,
    Color? backgroundCursorColor,
    Color? selectionColor,
    EdgeInsets? scrollPadding,
    Clip? clipBehavior,
    Color? autocorrectionTextRectColor,
    BoxSpec? container,
    AnimatedData? animated,
    WidgetModifiersData? modifiers,
  }) {
    return TextFieldSpec(
      style: style ?? _$this.style,
      textAlign: textAlign ?? _$this.textAlign,
      strutStyle: strutStyle ?? _$this.strutStyle,
      textHeightBehavior: textHeightBehavior ?? _$this.textHeightBehavior,
      textScaler: textScaler ?? _$this.textScaler,
      textWidthBasis: textWidthBasis ?? _$this.textWidthBasis,
      cursorWidth: cursorWidth ?? _$this.cursorWidth,
      cursorHeight: cursorHeight ?? _$this.cursorHeight,
      cursorRadius: cursorRadius ?? _$this.cursorRadius,
      cursorColor: cursorColor ?? _$this.cursorColor,
      cursorOffset: cursorOffset ?? _$this.cursorOffset,
      paintCursorAboveText: paintCursorAboveText ?? _$this.paintCursorAboveText,
      backgroundCursorColor:
          backgroundCursorColor ?? _$this.backgroundCursorColor,
      selectionColor: selectionColor ?? _$this.selectionColor,
      scrollPadding: scrollPadding ?? _$this.scrollPadding,
      clipBehavior: clipBehavior ?? _$this.clipBehavior,
      autocorrectionTextRectColor:
          autocorrectionTextRectColor ?? _$this.autocorrectionTextRectColor,
      container: container ?? _$this.container,
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
  /// - [MixHelpers.lerpStrutStyle] for [strutStyle].
  /// - [MixHelpers.lerpDouble] for [cursorWidth] and [cursorHeight].
  /// - [Radius.lerp] for [cursorRadius].
  /// - [Color.lerp] for [cursorColor] and [backgroundCursorColor] and [selectionColor] and [autocorrectionTextRectColor].
  /// - [Offset.lerp] for [cursorOffset].
  /// - [EdgeInsets.lerp] for [scrollPadding].
  /// - [BoxSpec.lerp] for [container].

  /// For [textAlign] and [textHeightBehavior] and [textScaler] and [textWidthBasis] and [paintCursorAboveText] and [clipBehavior] and [animated] and [modifiers], the interpolation is performed using a step function.
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
      textAlign: t < 0.5 ? _$this.textAlign : other.textAlign,
      strutStyle:
          MixHelpers.lerpStrutStyle(_$this.strutStyle, other.strutStyle, t),
      textHeightBehavior:
          t < 0.5 ? _$this.textHeightBehavior : other.textHeightBehavior,
      textScaler: t < 0.5 ? _$this.textScaler : other.textScaler,
      textWidthBasis: t < 0.5 ? _$this.textWidthBasis : other.textWidthBasis,
      cursorWidth:
          MixHelpers.lerpDouble(_$this.cursorWidth, other.cursorWidth, t)!,
      cursorHeight:
          MixHelpers.lerpDouble(_$this.cursorHeight, other.cursorHeight, t),
      cursorRadius: Radius.lerp(_$this.cursorRadius, other.cursorRadius, t),
      cursorColor: Color.lerp(_$this.cursorColor, other.cursorColor, t)!,
      cursorOffset: Offset.lerp(_$this.cursorOffset, other.cursorOffset, t)!,
      paintCursorAboveText:
          t < 0.5 ? _$this.paintCursorAboveText : other.paintCursorAboveText,
      backgroundCursorColor: Color.lerp(
          _$this.backgroundCursorColor, other.backgroundCursorColor, t)!,
      selectionColor:
          Color.lerp(_$this.selectionColor, other.selectionColor, t),
      scrollPadding:
          EdgeInsets.lerp(_$this.scrollPadding, other.scrollPadding, t)!,
      clipBehavior: t < 0.5 ? _$this.clipBehavior : other.clipBehavior,
      autocorrectionTextRectColor: Color.lerp(
          _$this.autocorrectionTextRectColor,
          other.autocorrectionTextRectColor,
          t),
      container: _$this.container?.lerp(other.container, t) ?? other.container,
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
        _$this.textAlign,
        _$this.strutStyle,
        _$this.textHeightBehavior,
        _$this.textScaler,
        _$this.textWidthBasis,
        _$this.cursorWidth,
        _$this.cursorHeight,
        _$this.cursorRadius,
        _$this.cursorColor,
        _$this.cursorOffset,
        _$this.paintCursorAboveText,
        _$this.backgroundCursorColor,
        _$this.selectionColor,
        _$this.scrollPadding,
        _$this.clipBehavior,
        _$this.autocorrectionTextRectColor,
        _$this.container,
        _$this.animated,
        _$this.modifiers,
      ];

  TextFieldSpec get _$this => this as TextFieldSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
        .add(DiagnosticsProperty('style', _$this.style, defaultValue: null));
    properties.add(
        DiagnosticsProperty('textAlign', _$this.textAlign, defaultValue: null));
    properties.add(DiagnosticsProperty('strutStyle', _$this.strutStyle,
        defaultValue: null));
    properties.add(DiagnosticsProperty(
        'textHeightBehavior', _$this.textHeightBehavior,
        defaultValue: null));
    properties.add(DiagnosticsProperty('textScaler', _$this.textScaler,
        defaultValue: null));
    properties.add(DiagnosticsProperty('textWidthBasis', _$this.textWidthBasis,
        defaultValue: null));
    properties.add(DiagnosticsProperty('cursorWidth', _$this.cursorWidth,
        defaultValue: null));
    properties.add(DiagnosticsProperty('cursorHeight', _$this.cursorHeight,
        defaultValue: null));
    properties.add(DiagnosticsProperty('cursorRadius', _$this.cursorRadius,
        defaultValue: null));
    properties.add(DiagnosticsProperty('cursorColor', _$this.cursorColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty('cursorOffset', _$this.cursorOffset,
        defaultValue: null));
    properties.add(DiagnosticsProperty(
        'paintCursorAboveText', _$this.paintCursorAboveText,
        defaultValue: null));
    properties.add(DiagnosticsProperty(
        'backgroundCursorColor', _$this.backgroundCursorColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty('selectionColor', _$this.selectionColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty('scrollPadding', _$this.scrollPadding,
        defaultValue: null));
    properties.add(DiagnosticsProperty('clipBehavior', _$this.clipBehavior,
        defaultValue: null));
    properties.add(DiagnosticsProperty(
        'autocorrectionTextRectColor', _$this.autocorrectionTextRectColor,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty('container', _$this.container, defaultValue: null));
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
  final TextAlign? textAlign;
  final StrutStyleDto? strutStyle;
  final TextHeightBehaviorDto? textHeightBehavior;
  final TextScaler? textScaler;
  final TextWidthBasis? textWidthBasis;
  final double? cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final ColorDto? cursorColor;
  final Offset? cursorOffset;
  final bool? paintCursorAboveText;
  final ColorDto? backgroundCursorColor;
  final ColorDto? selectionColor;
  final EdgeInsetsDto? scrollPadding;
  final Clip? clipBehavior;
  final ColorDto? autocorrectionTextRectColor;
  final BoxSpecAttribute? container;

  const TextFieldSpecAttribute({
    this.style,
    this.textAlign,
    this.strutStyle,
    this.textHeightBehavior,
    this.textScaler,
    this.textWidthBasis,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.cursorOffset,
    this.paintCursorAboveText,
    this.backgroundCursorColor,
    this.selectionColor,
    this.scrollPadding,
    this.clipBehavior,
    this.autocorrectionTextRectColor,
    this.container,
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
      textAlign: textAlign,
      strutStyle: strutStyle?.resolve(mix),
      textHeightBehavior: textHeightBehavior?.resolve(mix),
      textScaler: textScaler,
      textWidthBasis: textWidthBasis,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorColor: cursorColor?.resolve(mix),
      cursorOffset: cursorOffset,
      paintCursorAboveText: paintCursorAboveText,
      backgroundCursorColor: backgroundCursorColor?.resolve(mix),
      selectionColor: selectionColor?.resolve(mix),
      scrollPadding: scrollPadding?.resolve(mix),
      clipBehavior: clipBehavior,
      autocorrectionTextRectColor: autocorrectionTextRectColor?.resolve(mix),
      container: container?.resolve(mix),
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
      textAlign: other.textAlign ?? textAlign,
      strutStyle: strutStyle?.merge(other.strutStyle) ?? other.strutStyle,
      textHeightBehavior: textHeightBehavior?.merge(other.textHeightBehavior) ??
          other.textHeightBehavior,
      textScaler: other.textScaler ?? textScaler,
      textWidthBasis: other.textWidthBasis ?? textWidthBasis,
      cursorWidth: other.cursorWidth ?? cursorWidth,
      cursorHeight: other.cursorHeight ?? cursorHeight,
      cursorRadius: other.cursorRadius ?? cursorRadius,
      cursorColor: cursorColor?.merge(other.cursorColor) ?? other.cursorColor,
      cursorOffset: other.cursorOffset ?? cursorOffset,
      paintCursorAboveText: other.paintCursorAboveText ?? paintCursorAboveText,
      backgroundCursorColor:
          backgroundCursorColor?.merge(other.backgroundCursorColor) ??
              other.backgroundCursorColor,
      selectionColor:
          selectionColor?.merge(other.selectionColor) ?? other.selectionColor,
      scrollPadding:
          scrollPadding?.merge(other.scrollPadding) ?? other.scrollPadding,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      autocorrectionTextRectColor: autocorrectionTextRectColor
              ?.merge(other.autocorrectionTextRectColor) ??
          other.autocorrectionTextRectColor,
      container: container?.merge(other.container) ?? other.container,
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
        textAlign,
        strutStyle,
        textHeightBehavior,
        textScaler,
        textWidthBasis,
        cursorWidth,
        cursorHeight,
        cursorRadius,
        cursorColor,
        cursorOffset,
        paintCursorAboveText,
        backgroundCursorColor,
        selectionColor,
        scrollPadding,
        clipBehavior,
        autocorrectionTextRectColor,
        container,
        animated,
        modifiers,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('style', style,
        expandableValue: true, defaultValue: null));
    properties
        .add(DiagnosticsProperty('textAlign', textAlign, defaultValue: null));
    properties
        .add(DiagnosticsProperty('strutStyle', strutStyle, defaultValue: null));
    properties.add(DiagnosticsProperty('textHeightBehavior', textHeightBehavior,
        defaultValue: null));
    properties
        .add(DiagnosticsProperty('textScaler', textScaler, defaultValue: null));
    properties.add(DiagnosticsProperty('textWidthBasis', textWidthBasis,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty('cursorWidth', cursorWidth, defaultValue: null));
    properties.add(
        DiagnosticsProperty('cursorHeight', cursorHeight, defaultValue: null));
    properties.add(
        DiagnosticsProperty('cursorRadius', cursorRadius, defaultValue: null));
    properties.add(
        DiagnosticsProperty('cursorColor', cursorColor, defaultValue: null));
    properties.add(
        DiagnosticsProperty('cursorOffset', cursorOffset, defaultValue: null));
    properties.add(DiagnosticsProperty(
        'paintCursorAboveText', paintCursorAboveText,
        defaultValue: null));
    properties.add(DiagnosticsProperty(
        'backgroundCursorColor', backgroundCursorColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty('selectionColor', selectionColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty('scrollPadding', scrollPadding,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty('clipBehavior', clipBehavior, defaultValue: null));
    properties.add(DiagnosticsProperty(
        'autocorrectionTextRectColor', autocorrectionTextRectColor,
        defaultValue: null));
    properties
        .add(DiagnosticsProperty('container', container, defaultValue: null));
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

  /// Utility for defining [TextFieldSpecAttribute.textAlign]
  late final textAlign = TextAlignUtility((v) => only(textAlign: v));

  /// Utility for defining [TextFieldSpecAttribute.strutStyle]
  late final strutStyle = StrutStyleUtility((v) => only(strutStyle: v));

  /// Utility for defining [TextFieldSpecAttribute.textHeightBehavior]
  late final textHeightBehavior =
      TextHeightBehaviorUtility((v) => only(textHeightBehavior: v));

  /// Utility for defining [TextFieldSpecAttribute.textScaler]
  late final textScaler = TextScalerUtility((v) => only(textScaler: v));

  /// Utility for defining [TextFieldSpecAttribute.textWidthBasis]
  late final textWidthBasis =
      TextWidthBasisUtility((v) => only(textWidthBasis: v));

  /// Utility for defining [TextFieldSpecAttribute.cursorWidth]
  late final cursorWidth = DoubleUtility((v) => only(cursorWidth: v));

  /// Utility for defining [TextFieldSpecAttribute.cursorHeight]
  late final cursorHeight = DoubleUtility((v) => only(cursorHeight: v));

  /// Utility for defining [TextFieldSpecAttribute.cursorRadius]
  late final cursorRadius = RadiusUtility((v) => only(cursorRadius: v));

  /// Utility for defining [TextFieldSpecAttribute.cursorColor]
  late final cursorColor = ColorUtility((v) => only(cursorColor: v));

  /// Utility for defining [TextFieldSpecAttribute.cursorOffset]
  late final cursorOffset = OffsetUtility((v) => only(cursorOffset: v));

  /// Utility for defining [TextFieldSpecAttribute.paintCursorAboveText]
  late final paintCursorAboveText =
      BoolUtility((v) => only(paintCursorAboveText: v));

  /// Utility for defining [TextFieldSpecAttribute.backgroundCursorColor]
  late final backgroundCursorColor =
      ColorUtility((v) => only(backgroundCursorColor: v));

  /// Utility for defining [TextFieldSpecAttribute.selectionColor]
  late final selectionColor = ColorUtility((v) => only(selectionColor: v));

  /// Utility for defining [TextFieldSpecAttribute.scrollPadding]
  late final scrollPadding = EdgeInsetsUtility((v) => only(scrollPadding: v));

  /// Utility for defining [TextFieldSpecAttribute.clipBehavior]
  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));

  /// Utility for defining [TextFieldSpecAttribute.autocorrectionTextRectColor]
  late final autocorrectionTextRectColor =
      ColorUtility((v) => only(autocorrectionTextRectColor: v));

  /// Utility for defining [TextFieldSpecAttribute.container]
  late final container = BoxSpecUtility((v) => only(container: v));

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
    TextAlign? textAlign,
    StrutStyleDto? strutStyle,
    TextHeightBehaviorDto? textHeightBehavior,
    TextScaler? textScaler,
    TextWidthBasis? textWidthBasis,
    double? cursorWidth,
    double? cursorHeight,
    Radius? cursorRadius,
    ColorDto? cursorColor,
    Offset? cursorOffset,
    bool? paintCursorAboveText,
    ColorDto? backgroundCursorColor,
    ColorDto? selectionColor,
    EdgeInsetsDto? scrollPadding,
    Clip? clipBehavior,
    ColorDto? autocorrectionTextRectColor,
    BoxSpecAttribute? container,
    AnimatedDataDto? animated,
    WidgetModifiersDataDto? modifiers,
  }) {
    return builder(TextFieldSpecAttribute(
      style: style,
      textAlign: textAlign,
      strutStyle: strutStyle,
      textHeightBehavior: textHeightBehavior,
      textScaler: textScaler,
      textWidthBasis: textWidthBasis,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorColor: cursorColor,
      cursorOffset: cursorOffset,
      paintCursorAboveText: paintCursorAboveText,
      backgroundCursorColor: backgroundCursorColor,
      selectionColor: selectionColor,
      scrollPadding: scrollPadding,
      clipBehavior: clipBehavior,
      autocorrectionTextRectColor: autocorrectionTextRectColor,
      container: container,
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
