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

@Deprecated(r'use $text instead')
final text = TextSpecUtility(selfBuilder);

final $text = TextSpecUtility(selfBuilder);

class TextSpecUtility<T extends SpecAttribute>
    extends SpecUtility<T, TextSpecAttribute> {
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

  TextSpecUtility(super.builder);

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
