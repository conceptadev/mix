// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_spec.dart';

// **************************************************************************
// Generator: SpecDefinitionBuilder
// **************************************************************************

/// Utility class for configuring [TextDefAttribute] properties.
///
/// This class provides methods to set individual properties of a [TextDefAttribute].
///
/// Use the methods of this class to configure specific properties of a [TextDefAttribute].
class TextDefUtility<T extends Attribute>
    extends SpecUtility<T, TextDefAttribute> {
  TextDefUtility(super.builder);

  /// Utility for defining [TextDefAttribute.overflow]
  late final overflow = TextOverflowUtility((v) => only(overflow: v));

  /// Utility for defining [TextDefAttribute.strutStyle]
  late final strutStyle = StrutStyleUtility((v) => only(strutStyle: v));

  /// Utility for defining [TextDefAttribute.textAlign]
  late final textAlign = TextAlignUtility((v) => only(textAlign: v));

  /// Utility for defining [TextDefAttribute.textScaleFactor]
  late final textScaleFactor = DoubleUtility((v) => only(textScaleFactor: v));

  /// Utility for defining [TextDefAttribute.maxLines]
  late final maxLines = IntUtility((v) => only(maxLines: v));

  /// Utility for defining [TextDefAttribute.style]
  late final style = TextStyleUtility((v) => only(style: v));

  /// Utility for defining [TextDefAttribute.textWidthBasis]
  late final textWidthBasis =
      TextWidthBasisUtility((v) => only(textWidthBasis: v));

  /// Utility for defining [TextDefAttribute.textHeightBehavior]
  late final textHeightBehavior =
      TextHeightBehaviorUtility((v) => only(textHeightBehavior: v));

  /// Utility for defining [TextDefAttribute.textDirection]
  late final textDirection =
      TextDirectionUtility((v) => only(textDirection: v));

  /// Utility for defining [TextDefAttribute.softWrap]
  late final softWrap = BoolUtility((v) => only(softWrap: v));

  /// Utility for defining [TextDefAttribute.directive]
  late final directive = TextDirectiveUtility((v) => only(directive: v));

  /// Utility for defining [TextDefAttribute.animated]
  late final animated = AnimatedUtility((v) => only(animated: v));

  /// Returns a new [TextDefAttribute] with the specified properties.
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
    TextDirective? directive,
    AnimatedDataDto? animated,
  }) {
    return builder(
      TextDefAttribute(
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
      ),
    );
  }
}

mixin TextDefMixable on Spec<TextDef> {
  /// Retrieves the [TextDef] from a MixData.
  static TextDef from(MixData mix) {
    return mix.attributeOf<TextDefAttribute>()?.resolve(mix) ?? const TextDef();
  }

  /// Retrieves the [TextDef] from the nearest [Mix] ancestor.
  ///
  /// If no ancestor is found, returns [TextDef].
  static TextDef of(BuildContext context) {
    return TextDefMixable.from(Mix.of(context));
  }

  /// Creates a copy of this [TextDef] but with the given fields
  /// replaced with the new values.
  @override
  TextDef copyWith({
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
    return TextDef(
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

  @override
  TextDef lerp(
    TextDef? other,
    double t,
  ) {
    if (other == null) return _$this;

    return TextDef(
      overflow: t < 0.5 ? _$this.overflow : other._$this.overflow,
      strutStyle: t < 0.5 ? _$this.strutStyle : other._$this.strutStyle,
      textAlign: t < 0.5 ? _$this.textAlign : other._$this.textAlign,
      textScaleFactor: _lerpDouble(
        _$this.textScaleFactor,
        other._$this.textScaleFactor,
        t,
      ),
      maxLines: _lerpInt(
        _$this.maxLines,
        other._$this.maxLines,
        t,
      ),
      style: t < 0.5 ? _$this.style : other._$this.style,
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

  /// The list of properties that constitute the state of this [TextDef].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextDef] instances for equality.
  @override
  List<Object?> get props {
    return [
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
  }

  TextDef get _$this => this as TextDef;
  double? _lerpDouble(
    num? a,
    num? b,
    double t,
  ) {
    return ((1 - t) * (a ?? 0) + t * (b ?? 0));
  }

  int? _lerpInt(
    int? a,
    int? b,
    double t,
  ) {
    a ??= 0;
    b ??= 0;

    return (a + (b - a) * t).round();
  }
}

/// Represents the attributes of a [TextDef].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [TextDef].
///
/// Use this class to configure the attributes of a [TextDef] and pass it to
/// the [TextDef] constructor.
class TextDefAttribute extends SpecAttribute<TextDef> {
  const TextDefAttribute({
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

  final TextDirective? directive;

  @override
  TextDef resolve(MixData mix) {
    return TextDef(
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
      directive: directive,
      animated: animated?.resolve(mix),
    );
  }

  @override
  TextDefAttribute merge(TextDefAttribute? other) {
    if (other == null) return this;

    return TextDefAttribute(
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
      directive: other.directive ?? directive,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [TextDefAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextDefAttribute] instances for equality.
  @override
  List<Object?> get props {
    return [
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
}

/// A tween that interpolates between two [TextDef] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [TextDef] specifications.
class TextDefTween extends Tween<TextDef?> {
  TextDefTween({
    super.begin,
    super.end,
  });

  @override
  TextDef lerp(double t) {
    if (begin == null && end == null) return const TextDef();
    if (begin == null) return end!;

    return begin!.lerp(end!, t);
  }
}
