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

const text = TextSpecUtility(selfBuilder);

class TextSpecUtility<T extends SpecAttribute>
    extends SpecUtility<T, TextSpecAttribute> {
  const TextSpecUtility(super.builder);

  TextDirectiveUtility<T> get directive =>
      TextDirectiveUtility((directive) => call(directive: directive));
  TextOverflowUtility<T> get overflow {
    return TextOverflowUtility((overflow) => call(overflow: overflow));
  }

  StrutStyleUtility<T> get strutStyle {
    return StrutStyleUtility((strutStyle) => call(strutStyle: strutStyle));
  }

  TextAlignUtility<T> get textAlign {
    return TextAlignUtility((textAlign) => call(textAlign: textAlign));
  }

  IntUtility<T> get maxLines {
    return IntUtility((maxLines) => call(maxLines: maxLines));
  }

  TextStyleUtility<T> get style {
    return TextStyleUtility((style) => call(style: style));
  }

  TextWidthBasisUtility<T> get textWidthBasis {
    return TextWidthBasisUtility(
      (textWidthBasis) => call(textWidthBasis: textWidthBasis),
    );
  }

  TextHeightBehaviorUtility<T> get textHeightBehavior {
    return TextHeightBehaviorUtility(
      (textHeightBehavior) => call(textHeightBehavior: textHeightBehavior),
    );
  }

  TextDirectionUtility<T> get textDirection {
    return TextDirectionUtility(
      (textDirection) => call(textDirection: textDirection),
    );
  }

  BoolUtility<T> get softWrap {
    return BoolUtility((softWrap) => call(softWrap: softWrap));
  }

  DoubleUtility<T> get textScaleFactor {
    return DoubleUtility(
      (textScaleFactor) => call(textScaleFactor: textScaleFactor),
    );
  }

  T capitalize() => directive.capitalize();
  T uppercase() => directive.uppercase();
  T lowercase() => directive.lowercase();
  T titleCase() => directive.titleCase();
  T sentenceCase() => directive.sentenceCase();

  @override
  T call({
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
