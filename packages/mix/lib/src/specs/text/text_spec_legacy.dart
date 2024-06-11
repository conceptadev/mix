import 'package:flutter/material.dart';

import '../../attributes/animated/animated_data_dto.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/strut_style/strut_style_dto.dart';
import '../../attributes/strut_style/strut_style_util.dart';
import '../../attributes/text_style/text_style_dto.dart';
import '../../attributes/text_style/text_style_util.dart';
import '../../core/attribute.dart';
import '../../core/directive.dart';
import '../../core/models/animated_data.dart';
import '../../core/models/mix_data.dart';
import '../../core/spec.dart';
import '../../factory/mix_provider.dart';
import '../../internal/lerp_helpers.dart';
import 'text_directives_util.dart';

class TextSpecLegacy extends Spec<TextSpecLegacy> {
  final TextOverflow? overflow;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final int? maxLines;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final TextStyle? style;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextDirective? directive;

  const TextSpecLegacy({
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

  const TextSpecLegacy.exhaustive({
    required this.overflow,
    required this.strutStyle,
    required this.textAlign,
    required this.textScaleFactor,
    required this.maxLines,
    required this.style,
    required this.textWidthBasis,
    required this.textHeightBehavior,
    required this.textDirection,
    required this.softWrap,
    required this.directive,
    required super.animated,
  });

  static TextSpecLegacy of(BuildContext context) {
    final mix = Mix.of(context);

    return TextSpecLegacy.from(mix);
  }

  static TextSpecLegacy from(MixData mix) =>
      mix.attributeOf<TextSpecLegacyAttribute>()?.resolve(mix) ??
      const TextSpecLegacy();

  @override
  TextSpecLegacy lerp(TextSpecLegacy? other, double t) {
    if (other == null) return this;
    // Define a helper method for snapping

    return TextSpecLegacy(
      overflow: lerpSnap(overflow, other.overflow, t),
      strutStyle: lerpStrutStyle(strutStyle, other.strutStyle, t),
      textAlign: lerpSnap(textAlign, other.textAlign, t),
      textScaleFactor: lerpDouble(textScaleFactor, other.textScaleFactor, t),
      maxLines: lerpSnap(maxLines, other.maxLines, t),
      style: lerpTextStyle(style, other.style, t),
      textWidthBasis: lerpSnap(textWidthBasis, other.textWidthBasis, t),
      textHeightBehavior:
          lerpSnap(textHeightBehavior, other.textHeightBehavior, t),
      textDirection: lerpSnap(textDirection, other.textDirection, t),
      softWrap: lerpSnap(softWrap, other.softWrap, t),
      directive: lerpSnap(directive, other.directive, t),
      animated: other.animated ?? animated,
    );
  }

  @override
  TextSpecLegacy copyWith({
    bool? softWrap,
    TextOverflow? overflow,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    double? textScaleFactor,
    int? maxLines,
    TextStyle? style,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    TextDirection? textDirection,
    TextDirective? directive,
    AnimatedData? animated,
  }) {
    return TextSpecLegacy(
      overflow: overflow ?? this.overflow,
      strutStyle: strutStyle ?? this.strutStyle,
      textAlign: textAlign ?? this.textAlign,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
      style: style ?? this.style,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
      textDirection: textDirection ?? this.textDirection,
      softWrap: softWrap ?? this.softWrap,
      directive: directive ?? this.directive,
      animated: animated ?? this.animated,
    );
  }

  @override
  List<Object?> get props => [
        softWrap,
        overflow,
        strutStyle,
        textAlign,
        textScaleFactor,
        maxLines,
        textWidthBasis,
        textHeightBehavior,
        style,
        textDirection,
        directive,
        animated,
      ];
}

class TextSpecLegacyTween extends Tween<TextSpecLegacy> {
  TextSpecLegacyTween({TextSpecLegacy? begin, TextSpecLegacy? end})
      : super(begin: begin, end: end);

  @override
  TextSpecLegacy lerp(double t) => begin!.lerp(end, t);
}

class TextSpecLegacyAttribute extends SpecAttribute<TextSpecLegacy> {
  const TextSpecLegacyAttribute({
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

  final TextDirectiveDto? directive;

  @override
  TextSpecLegacy resolve(MixData mix) {
    return TextSpecLegacy(
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
      animated: animated?.resolve(mix),
    );
  }

  @override
  TextSpecLegacyAttribute merge(TextSpecLegacyAttribute? other) {
    if (other == null) return this;

    return TextSpecLegacyAttribute(
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

  /// The list of properties that constitute the state of this [TextSpecLegacyAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextSpecLegacyAttribute] instances for equality.
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

class TextSpecLegacyUtility<T extends Attribute>
    extends SpecUtility<T, TextSpecLegacyAttribute> {
  late final directive = TextDirectiveUtility((v) => only(directive: v));
  late final overflow = TextOverflowUtility((v) => only(overflow: v));
  late final strutStyle = StrutStyleUtility((v) => only(strutStyle: v));
  late final textAlign = TextAlignUtility((v) => only(textAlign: v));
  late final maxLines = IntUtility((v) => only(maxLines: v));
  late final style = TextStyleUtility((v) => only(style: v));
  late final textWidthBasis =
      TextWidthBasisUtility((v) => only(textWidthBasis: v));
  late final textHeightBehavior =
      TextHeightBehaviorUtility((v) => only(textHeightBehavior: v));
  late final textDirection =
      TextDirectionUtility((v) => only(textDirection: v));
  late final softWrap = BoolUtility((v) => only(softWrap: v));
  late final textScaleFactor = DoubleUtility((v) => only(textScaleFactor: v));

  late final capitalize = directive.capitalize;
  late final uppercase = directive.uppercase;
  late final lowercase = directive.lowercase;
  late final titleCase = directive.titleCase;
  late final sentenceCase = directive.sentenceCase;

  TextSpecLegacyUtility(super.builder);

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
    return builder(
      TextSpecLegacyAttribute(
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
