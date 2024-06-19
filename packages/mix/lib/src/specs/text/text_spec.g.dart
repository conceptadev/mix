// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_spec.dart';

// **************************************************************************
// Generator: SpecDefinitionBuilder
// **************************************************************************

base mixin _$TextSpec on Spec<TextSpec> {
  static TextSpec from(MixData mix) {
    return mix.attributeOf<TextSpecAttribute>()?.resolve(mix) ??
        const TextSpec();
  }

  /// {@template text_spec_of}
  /// Retrieves the [TextSpec] from the nearest [Mix] ancestor in the widget tree.
  ///
  /// This method uses [Mix.of] to obtain the [Mix] instance associated with the
  /// given [BuildContext], and then retrieves the [TextSpec] from that [Mix].
  /// If no ancestor [Mix] is found, this method returns an empty [TextSpec].
  ///
  /// Example:
  ///
  /// ```dart
  /// final textSpec = TextSpec.of(context);
  /// ```
  /// {@endtemplate}
  static TextSpec of(BuildContext context) {
    return _$TextSpec.from(Mix.of(context));
  }

  /// Creates a copy of this [TextSpec] but with the given fields
  /// replaced with the new values.
  @override
  TextSpec copyWith({
    TextOverflow? overflow,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    double? textScaleFactor,
    int? maxLines,
    TextStyle? style,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    TextDirection? textDirection,
    bool? softWrap,
    TextDirective? directive,
    AnimatedData? animated,
  }) {
    return TextSpec(
      overflow: overflow ?? _$this.overflow,
      strutStyle: strutStyle ?? _$this.strutStyle,
      textAlign: textAlign ?? _$this.textAlign,
      textScaleFactor: textScaleFactor ?? _$this.textScaleFactor,
      maxLines: maxLines ?? _$this.maxLines,
      style: style ?? _$this.style,
      textWidthBasis: textWidthBasis ?? _$this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? _$this.textHeightBehavior,
      textDirection: textDirection ?? _$this.textDirection,
      softWrap: softWrap ?? _$this.softWrap,
      directive: directive ?? _$this.directive,
      animated: animated ?? _$this.animated,
    );
  }

  /// Linearly interpolates between this [TextSpec] and another [TextSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [TextSpec] is returned. When [t] is 1.0, the [other] [TextSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [TextSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [TextSpec] instance.
  ///
  /// The interpolation is performed on each property of the [TextSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [MixHelpers.lerpStrutStyle] for [strutStyle].
  /// - [MixHelpers.lerpDouble] for [textScaleFactor].
  /// - [MixHelpers.lerpTextStyle] for [style].

  /// For [overflow] and [textAlign] and [maxLines] and [textWidthBasis] and [textHeightBehavior] and [textDirection] and [softWrap] and [directive] and [animated], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [TextSpec] is used. Otherwise, the value
  /// from the [other] [TextSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [TextSpec] configurations.
  @override
  TextSpec lerp(TextSpec? other, double t) {
    if (other == null) return _$this;

    return TextSpec(
      overflow: t < 0.5 ? _$this.overflow : other._$this.overflow,
      strutStyle: MixHelpers.lerpStrutStyle(
          _$this.strutStyle, other._$this.strutStyle, t),
      textAlign: t < 0.5 ? _$this.textAlign : other._$this.textAlign,
      textScaleFactor: MixHelpers.lerpDouble(
          _$this.textScaleFactor, other._$this.textScaleFactor, t),
      maxLines: t < 0.5 ? _$this.maxLines : other._$this.maxLines,
      style: MixHelpers.lerpTextStyle(_$this.style, other._$this.style, t),
      textWidthBasis:
          t < 0.5 ? _$this.textWidthBasis : other._$this.textWidthBasis,
      textHeightBehavior:
          t < 0.5 ? _$this.textHeightBehavior : other._$this.textHeightBehavior,
      textDirection:
          t < 0.5 ? _$this.textDirection : other._$this.textDirection,
      softWrap: t < 0.5 ? _$this.softWrap : other._$this.softWrap,
      directive: t < 0.5 ? _$this.directive : other._$this.directive,
      animated: t < 0.5 ? _$this.animated : other._$this.animated,
    );
  }

  /// The list of properties that constitute the state of this [TextSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.overflow,
        _$this.strutStyle,
        _$this.textAlign,
        _$this.textScaleFactor,
        _$this.maxLines,
        _$this.style,
        _$this.textWidthBasis,
        _$this.textHeightBehavior,
        _$this.textDirection,
        _$this.softWrap,
        _$this.directive,
        _$this.animated,
      ];

  TextSpec get _$this => this as TextSpec;
}

/// Represents the attributes of a [TextSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [TextSpec].
///
/// Use this class to configure the attributes of a [TextSpec] and pass it to
/// the [TextSpec] constructor.
final class TextSpecAttribute extends SpecAttribute<TextSpec> {
  final TextOverflow? overflow;
  final StrutStyleDto? strutStyle;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final int? maxLines;
  final TextStyleDto? style;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextDirectiveDto? directive;

  const TextSpecAttribute({
    this.overflow,
    this.strutStyle,
    this.textAlign,
    this.textScaleFactor,
    this.maxLines,
    this.style,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.textDirection,
    this.softWrap,
    this.directive,
    super.animated,
  });

  /// Resolves to [TextSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final textSpec = TextSpecAttribute(...).resolve(mix);
  /// ```
  @override
  TextSpec resolve(MixData mix) {
    return TextSpec(
      overflow: overflow,
      strutStyle: strutStyle?.resolve(mix),
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      style: style?.resolve(mix),
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      textDirection: textDirection,
      softWrap: softWrap,
      directive: directive?.resolve(mix),
      animated: animated?.resolve(mix) ?? mix.animation,
    );
  }

  /// Merges the properties of this [TextSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [TextSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  TextSpecAttribute merge(TextSpecAttribute? other) {
    if (other == null) return this;

    return TextSpecAttribute(
      overflow: other.overflow ?? overflow,
      strutStyle: strutStyle?.merge(other.strutStyle) ?? other.strutStyle,
      textAlign: other.textAlign ?? textAlign,
      textScaleFactor: other.textScaleFactor ?? textScaleFactor,
      maxLines: other.maxLines ?? maxLines,
      style: style?.merge(other.style) ?? other.style,
      textWidthBasis: other.textWidthBasis ?? textWidthBasis,
      textHeightBehavior: other.textHeightBehavior ?? textHeightBehavior,
      textDirection: other.textDirection ?? textDirection,
      softWrap: other.softWrap ?? softWrap,
      directive: directive?.merge(other.directive) ?? other.directive,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [TextSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        overflow,
        strutStyle,
        textAlign,
        textScaleFactor,
        maxLines,
        style,
        textWidthBasis,
        textHeightBehavior,
        textDirection,
        softWrap,
        directive,
        animated,
      ];
}

/// Utility class for configuring [TextSpecAttribute] properties.
///
/// This class provides methods to set individual properties of a [TextSpecAttribute].
/// Use the methods of this class to configure specific properties of a [TextSpecAttribute].
base class TextSpecUtility<T extends Attribute>
    extends SpecUtility<T, TextSpecAttribute> {
  /// Utility for defining [TextSpecAttribute.overflow]
  late final overflow = TextOverflowUtility((v) => only(overflow: v));

  /// Utility for defining [TextSpecAttribute.strutStyle]
  late final strutStyle = StrutStyleUtility((v) => only(strutStyle: v));

  /// Utility for defining [TextSpecAttribute.textAlign]
  late final textAlign = TextAlignUtility((v) => only(textAlign: v));

  /// Utility for defining [TextSpecAttribute.textScaleFactor]
  late final textScaleFactor = DoubleUtility((v) => only(textScaleFactor: v));

  /// Utility for defining [TextSpecAttribute.maxLines]
  late final maxLines = IntUtility((v) => only(maxLines: v));

  /// Utility for defining [TextSpecAttribute.style]
  late final style = TextStyleUtility((v) => only(style: v));

  /// Utility for defining [TextSpecAttribute.textWidthBasis]
  late final textWidthBasis =
      TextWidthBasisUtility((v) => only(textWidthBasis: v));

  /// Utility for defining [TextSpecAttribute.textHeightBehavior]
  late final textHeightBehavior =
      TextHeightBehaviorUtility((v) => only(textHeightBehavior: v));

  /// Utility for defining [TextSpecAttribute.textDirection]
  late final textDirection =
      TextDirectionUtility((v) => only(textDirection: v));

  /// Utility for defining [TextSpecAttribute.softWrap]
  late final softWrap = BoolUtility((v) => only(softWrap: v));

  /// Utility for defining [TextSpecAttribute.directive]
  late final directive = TextDirectiveUtility((v) => only(directive: v));

  /// Utility for defining [TextSpecAttribute.directive.uppercase]
  late final uppercase = directive.uppercase;

  /// Utility for defining [TextSpecAttribute.directive.lowercase]
  late final lowercase = directive.lowercase;

  /// Utility for defining [TextSpecAttribute.directive.capitalize]
  late final capitalize = directive.capitalize;

  /// Utility for defining [TextSpecAttribute.directive.titleCase]
  late final titleCase = directive.titleCase;

  /// Utility for defining [TextSpecAttribute.directive.sentenceCase]
  late final sentenceCase = directive.sentenceCase;

  /// Utility for defining [TextSpecAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  TextSpecUtility(super.builder);

  static final self = TextSpecUtility((v) => v);

  /// Returns a new [TextSpecAttribute] with the specified properties.
  @override
  T only({
    TextOverflow? overflow,
    StrutStyleDto? strutStyle,
    TextAlign? textAlign,
    double? textScaleFactor,
    int? maxLines,
    TextStyleDto? style,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    TextDirection? textDirection,
    bool? softWrap,
    TextDirectiveDto? directive,
    AnimatedDataDto? animated,
  }) {
    return builder(TextSpecAttribute(
      overflow: overflow,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      style: style,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      textDirection: textDirection,
      softWrap: softWrap,
      directive: directive,
      animated: animated,
    ));
  }
}

/// A tween that interpolates between two [TextSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [TextSpec] specifications.
class TextSpecTween extends Tween<TextSpec?> {
  TextSpecTween({
    super.begin,
    super.end,
  });

  @override
  TextSpec lerp(double t) {
    if (begin == null && end == null) return const TextSpec();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
