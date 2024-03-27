import 'package:flutter/material.dart';

import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/strut_style/strut_style_dto.dart';
import '../../attributes/strut_style/strut_style_util.dart';
import '../../attributes/text_directives_util.dart';
import '../../attributes/text_style/text_style_dto.dart';
import '../../attributes/text_style/text_style_util.dart';
import '../../core/attribute.dart';
import '../../core/directive.dart';
import '../../decorators/widget_decorators_util.dart';
import 'text_attribute.dart';

const text = TextUtility(selfBuilder);

class TextUtility<T extends SpecAttribute>
    extends SpecUtility<T, TextSpecAttribute> {
  const TextUtility(super.builder);

  TextDirectiveUtility<T> get directive =>
      TextDirectiveUtility((directive) => only(directive: directive));
  TextOverflowUtility<T> get overflow {
    return TextOverflowUtility((overflow) => only(overflow: overflow));
  }

  StrutStyleUtility<T> get strutStyle {
    return StrutStyleUtility((strutStyle) => only(strutStyle: strutStyle));
  }

  TextAlignUtility<T> get textAlign {
    return TextAlignUtility((textAlign) => only(textAlign: textAlign));
  }

  IntUtility<T> get maxLines {
    return IntUtility((maxLines) => only(maxLines: maxLines));
  }

  TextStyleUtility<T> get style {
    return TextStyleUtility((style) => only(style: style));
  }

  TextWidthBasisUtility<T> get textWidthBasis {
    return TextWidthBasisUtility(
      (textWidthBasis) => only(textWidthBasis: textWidthBasis),
    );
  }

  TextHeightBehaviorUtility<T> get textHeightBehavior {
    return TextHeightBehaviorUtility(
      (textHeightBehavior) => only(textHeightBehavior: textHeightBehavior),
    );
  }

  TextDirectionUtility<T> get textDirection {
    return TextDirectionUtility(
      (textDirection) => only(textDirection: textDirection),
    );
  }

  BoolUtility<T> get softWrap {
    return BoolUtility((softWrap) => only(softWrap: softWrap));
  }

  DoubleUtility<T> get textScaleFactor {
    return DoubleUtility(
      (textScaleFactor) => only(textScaleFactor: textScaleFactor),
    );
  }

  T capitalize() => directive.capitalize();
  T uppercase() => directive.uppercase();
  T lowercase() => directive.lowercase();
  T titleCase() => directive.titleCase();
  T sentenceCase() => directive.sentenceCase();

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
  }) {
    return builder(
      TextSpecAttribute(
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
      ),
    );
  }
}
