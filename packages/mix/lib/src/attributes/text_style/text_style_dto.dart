// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports

import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'text_style_dto.g.dart';

final class TextStyleDataRef extends TextStyleData {
  final TextStyleRef ref;
  const TextStyleDataRef({required this.ref});

  @override
  TextStyleDataRef merge(covariant TextStyleDataRef? other) {
    if (other == null) return this;
    throw UnsupportedError(
      'Cannot merge $this with $other, most likely there is an error on Mix',
    );
  }

  @override
  TextStyle resolve(MixData mix) => mix.tokens.textStyleRef(ref);
  @override
  get props => [ref];
}

@MixableDto(generateUtility: false, generateValueExtension: false)
base class TextStyleData extends Dto<TextStyle> with _$TextStyleData {
  final String? fontFamily;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final ColorDto? color;
  final ColorDto? backgroundColor;
  final List<ShadowDto>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final ColorDto? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final Locale? locale;
  final String? debugLabel;
  final double? height;
  final Paint? foreground;
  final Paint? background;
  final double? decorationThickness;
  final List<String>? fontFamilyFallback;

  const TextStyleData({
    this.background,
    this.backgroundColor,
    this.color,
    this.debugLabel,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.fontFamily,
    this.fontFamilyFallback,
    this.fontFeatures,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.foreground,
    this.height,
    this.letterSpacing,
    this.locale,
    this.shadows,
    this.textBaseline,
    this.wordSpacing,
  });

  @override
  TextStyle get defaultValue => const TextStyle();
}

@MixableDto(
  generateUtility: false,
  generateValueExtension: false,
  mergeLists: false,
)
final class TextStyleDto extends Dto<TextStyle> with _$TextStyleDto {
  final List<TextStyleData> value;
  const TextStyleDto._({this.value = const []});

  factory TextStyleDto({
    ColorDto? color,
    ColorDto? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    String? debugLabel,
    double? wordSpacing,
    TextBaseline? textBaseline,
    List<ShadowDto>? shadows,
    List<FontFeature>? fontFeatures,
    TextDecoration? decoration,
    ColorDto? decorationColor,
    TextDecorationStyle? decorationStyle,
    Locale? locale,
    double? height,
    Paint? foreground,
    Paint? background,
    double? decorationThickness,
    String? fontFamily,
    List<String>? fontFamilyFallback,
  }) {
    return TextStyleDto._(value: [
      TextStyleData(
        background: background,
        backgroundColor: backgroundColor,
        color: color,
        debugLabel: debugLabel,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontFeatures: fontFeatures,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        foreground: foreground,
        height: height,
        letterSpacing: letterSpacing,
        locale: locale,
        shadows: shadows,
        textBaseline: textBaseline,
        wordSpacing: wordSpacing,
      ),
    ]);
  }

  factory TextStyleDto.ref(TextStyleToken token) {
    return TextStyleDto._(value: [TextStyleDataRef(ref: token())]);
  }

  /// This method resolves the [TextStyleDto] to a TextStyle.
  /// It maps over the values list and checks if each TextStyleDto is a token reference.
  /// If it is, it resolves the token reference and converts it to a [TextStyleData].
  /// If it's not a token reference, it leaves the [TextStyleData] as is.
  /// Then it reduces the list of [TextStyleData] objects to a single [TextStyleData] by merging them.
  /// Finally, it resolves the resulting [TextStyleData] to a TextStyle.
  @override
  TextStyle resolve(MixData mix) {
    final result = value
        .map((e) => e is TextStyleDataRef ? e.resolve(mix)._toData() : e)
        .reduce((value, element) {
      final singleresult = value.merge(element);

      return singleresult;
    }).resolve(mix);

    return result;
  }

  @override
  TextStyle get defaultValue => const TextStyle();
}

extension TextStyleExt on TextStyle {
  TextStyleDto toDto() {
    if (this is TextStyleRef) {
      return TextStyleDto.ref((this as TextStyleRef).token);
    }

    return TextStyleDto._(value: [_toData()]);
  }

  TextStyleData _toData() => TextStyleData(
        background: background,
        backgroundColor: backgroundColor?.toDto(),
        color: color?.toDto(),
        debugLabel: debugLabel,
        decoration: decoration,
        decorationColor: decorationColor?.toDto(),
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        fontFeatures: fontFeatures,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        foreground: foreground,
        height: height,
        letterSpacing: letterSpacing,
        locale: locale,
        shadows: shadows?.map((e) => e.toDto()).toList(),
        textBaseline: textBaseline,
        wordSpacing: wordSpacing,
      );
}
