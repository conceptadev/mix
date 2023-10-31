import 'package:flutter/material.dart';

import '../attributes/text_style_attribute.dart';
import '../attributes/visual_attributes.dart';
import '../core/attribute.dart';
import '../core/directives/text_directive.dart';
import '../core/dto/strut_style_dto.dart';
import '../factory/exports.dart';

class TextSpec extends MixExtension<TextSpec> {
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

  final List<TextDirective> directives;
  const TextSpec({
    required this.overflow,
    this.strutStyle,
    this.textAlign,
    this.textScaleFactor,
    this.maxLines,
    this.style,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.textDirection,
    this.softWrap,
    this.directives = const [],
  });

  static TextSpec resolve(MixData mix) {
    return TextSpec(
      overflow: mix.get<TextOverflowAttribute, TextOverflow>(),
      strutStyle: mix.get<StrutStyleDto, StrutStyle>(),
      textAlign: mix.get<TextAlignAttribute, TextAlign>(),
      textScaleFactor: mix.get<TextScaleFactorAttribute, double>(),
      maxLines: mix.get<MaxLinesAttribute, int>(),
      style: mix.get<TextStyleAttribute, TextStyle>(),
      textWidthBasis: mix.get<TextWidthBasisAttribute, TextWidthBasis>(),
      textHeightBehavior:
          mix.get<TextHeightBehaviorAttribute, TextHeightBehavior>(),
      textDirection: mix.get<TextDirectionAttribute, TextDirection>(),
      softWrap: mix.get<SoftWrapAttribute, bool>(),
      directives: mix.attributeOfType<TextDirectiveAttribute>()?.value ?? [],
    );
  }

  String applyTextDirectives(String? text) {
    if (text == null) return '';

    String modifiedText = text;
    for (final directive in directives) {
      modifiedText = directive.modify(modifiedText);
    }

    return modifiedText;
  }

  @override
  TextSpec lerp(TextSpec other, double t) {
    // Define a helper method for snapping

    return TextSpec(
      overflow: snap(overflow, other.overflow, t),
      strutStyle: snap(strutStyle, other.strutStyle, t),
      textAlign: snap(textAlign, other.textAlign, t),
      textScaleFactor:
          genericNumLerp(textScaleFactor, other.textScaleFactor, t),
      maxLines: snap(maxLines, other.maxLines, t),
      style: TextStyle.lerp(style, other.style, t),
      textWidthBasis: snap(textWidthBasis, other.textWidthBasis, t),
      textHeightBehavior: snap(textHeightBehavior, other.textHeightBehavior, t),
      softWrap: snap(softWrap, other.softWrap, t),
      directives: snap(directives, other.directives, t),
    );
  }

  @override
  TextSpec copyWith({
    bool? softWrap,
    TextOverflow? overflow,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    double? textScaleFactor,
    int? maxLines,
    TextStyle? style,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    List<TextDirective>? directives,
    TextDirection? textDirection,
  }) {
    return TextSpec(
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
      directives: [...this.directives, ...directives ?? []],
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
        directives,
        textDirection,
      ];
}
