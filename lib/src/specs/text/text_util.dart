import 'package:flutter/material.dart';

import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/strut_style/strut_style_dto.dart';
import '../../attributes/strut_style/strut_style_util.dart';
import '../../attributes/text_directives_util.dart';
import '../../attributes/text_style/text_style_dto.dart';
import '../../attributes/text_style/text_style_util.dart';
import '../../core/directive.dart';
import 'text_attribute.dart';

const text = TextUtility();

class TextUtility extends SpecUtility<TextSpecAttribute> {
  const TextUtility();

  TextSpecAttribute _only({
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
  }) {
    return TextSpecAttribute(
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
    );
  }

  TextDataDirectiveUtility get directive => const TextDataDirectiveUtility();
  TextOverflowUtility<TextSpecAttribute> get overflow {
    return TextOverflowUtility((overflow) => _only(overflow: overflow));
  }

  StrutStyleUtility<TextSpecAttribute> get strutStyle {
    return StrutStyleUtility((strutStyle) => _only(strutStyle: strutStyle));
  }

  TextAlignUtility<TextSpecAttribute> get textAlign {
    return TextAlignUtility((textAlign) => _only(textAlign: textAlign));
  }

  IntUtility<TextSpecAttribute> get maxLines {
    return IntUtility((maxLines) => _only(maxLines: maxLines));
  }

  TextStyleUtility<TextSpecAttribute> get style {
    return TextStyleUtility((style) => _only(style: style));
  }

  TextWidthBasisUtility<TextSpecAttribute> get textWidthBasis {
    return TextWidthBasisUtility(
      (textWidthBasis) => _only(textWidthBasis: textWidthBasis),
    );
  }

  TextHeightBehaviorUtility<TextSpecAttribute> get textHeightBehavior {
    return TextHeightBehaviorUtility(
      (textHeightBehavior) => _only(textHeightBehavior: textHeightBehavior),
    );
  }

  TextDirectionUtility<TextSpecAttribute> get textDirection {
    return TextDirectionUtility(
      (textDirection) => _only(textDirection: textDirection),
    );
  }

  BoolUtility<TextSpecAttribute> get softWrap {
    return BoolUtility((softWrap) => _only(softWrap: softWrap));
  }

  DoubleUtility<TextSpecAttribute> get textScaleFactor {
    return DoubleUtility(
      (textScaleFactor) => _only(textScaleFactor: textScaleFactor),
    );
  }

  TextDataDirective capitalize() => directive.capitalize();
  TextDataDirective uppercase() => directive.uppercase();
  TextDataDirective lowercase() => directive.lowercase();
  TextDataDirective titleCase() => directive.titleCase();
  TextDataDirective sentenceCase() => directive.sentenceCase();
}