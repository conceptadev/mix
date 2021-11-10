import 'package:flutter/material.dart';
import 'package:mix/src/attributes/base_attribute.dart';
import 'package:mix/src/attributes/dynamic/media_query.dart';
import 'package:mix/src/attributes/dynamic/pressable_attributes.dart';
import 'package:mix/src/attributes/primitives/box/box.properties.dart';
import 'package:mix/src/attributes/primitives/box/box.utilities.dart';
import 'package:mix/src/attributes/primitives/functions/apply_mix.dart';
import 'package:mix/src/attributes/primitives/text/text.utilities.dart';
import 'package:mix/src/attributes/primitives/widget_attributes.dart';
import 'package:mix/src/directives/text_directive.dart';

const _boxUtils = BoxUtility();
const _widgetUtils = WidgetUtility();
const _textUtil = TextUtility();

/// Margin all
BoxProperties m(double value) => _boxUtils.margin(EdgeInsets.all(value));

/// Margin top
BoxProperties mt(double value) => _boxUtils.margin(EdgeInsets.only(top: value));

/// Margin bottom
BoxProperties mb(double value) =>
    _boxUtils.margin(EdgeInsets.only(bottom: value));

/// Margin right
BoxProperties mr(double value) =>
    _boxUtils.margin(EdgeInsets.only(right: value));

/// Margin left
BoxProperties ml(double value) =>
    _boxUtils.margin(EdgeInsets.only(left: value));

/// Margin verttical
BoxProperties my(double value) =>
    _boxUtils.margin(EdgeInsets.symmetric(vertical: value));

/// Margin horizontal
BoxProperties mx(double value) =>
    _boxUtils.margin(EdgeInsets.symmetric(horizontal: value));

/// Padding all
BoxProperties p(double value) => _boxUtils.padding(EdgeInsets.all(value));

/// Padding top
BoxProperties pt(double value) =>
    _boxUtils.padding(EdgeInsets.only(top: value));

/// Padding bottom
BoxProperties pb(double value) =>
    _boxUtils.padding(EdgeInsets.only(bottom: value));

/// Padding right
BoxProperties pr(double value) =>
    _boxUtils.padding(EdgeInsets.only(right: value));

/// Padding left
BoxProperties pl(double value) =>
    _boxUtils.padding(EdgeInsets.only(left: value));

/// Padding verttical
BoxProperties py(double value) =>
    _boxUtils.padding(EdgeInsets.symmetric(vertical: value));

/// Padding horizontal
BoxProperties px(double value) =>
    _boxUtils.padding(EdgeInsets.symmetric(horizontal: value));

/// Rotate widget
final rotate = _boxUtils.rotate;

/// Rotate 90
BoxProperties rotate90() => rotate(1);

/// Rotate 180
BoxProperties rotate180() => rotate(2);

/// Rotate 270
BoxProperties rotate270() => rotate(3);

/// Rotate 360
BoxProperties rotate360() => rotate(4);

/// Opacity
BoxProperties opacity(double value) => _boxUtils.opacity(value);

/// Aspect Ratio
BoxProperties aspectRatio(double value) => _boxUtils.aspectRatio(value);

BoxProperties rounded(double value) => _boxUtils.rounded(value);

BoxProperties roundedTL(double value) {
  return _boxUtils.roundedOnly(topLeft: value);
}

BoxProperties roundedTR(double value) {
  return _boxUtils.roundedOnly(topRight: value);
}

BoxProperties roundedBL(double value) {
  return _boxUtils.roundedOnly(bottomLeft: value);
}

BoxProperties roundedBR(double value) {
  return _boxUtils.roundedOnly(bottomRight: value);
}

/// Background color attribute
final bgColor = _boxUtils.backgroundColor;

/// Height
final h = _boxUtils.height;

/// Width
final w = _boxUtils.width;

/// Max height attribute
final maxH = _boxUtils.maxHeight;

/// Max width attribute
final maxW = _boxUtils.maxWidth;

/// Min height attribute
final minH = _boxUtils.minHeight;

/// Min width attribute
final minW = _boxUtils.minWidth;

/// Hide attribute
final hide = _widgetUtils.hidden;

final animated = _widgetUtils.animated;

/// Border color for all borde sides
final borderColor = _boxUtils.borderColor;

/// Border width for all border sides
final borderWidth = _boxUtils.borderWidth;

/// Border style for all border sides
final borderStyle = _boxUtils.borderStyle;

/// Box shadow utility
final shadow = _boxUtils.shadow;

/// Text align
final textAlign = _textUtil.textAlign;
final textDirection = _textUtil.textDirection;
final textWidthBasis = _textUtil.textWidthBasis;
final locale = _textUtil.locale;
final maxLines = _textUtil.maxLines;
final textOverflow = _textUtil.overflow;
final textStyle = _textUtil.style;
final softWrap = _textUtil.softWrap;
final textScaleFactor = _textUtil.textScaleFactor;
final strutStyle = _textUtil.strutStyle;
final semanticsLabel = _textUtil.semanticsLabel;

const _textStyleUtil = TextStyleUtility();
final fontWeight = _textStyleUtil.fontWeight;
final textBaseline = _textStyleUtil.textBaseline;
final letterSpacing = _textStyleUtil.letterSpacing;
final debugLabel = _textStyleUtil.debugLabel;
final textHeight = _textStyleUtil.height;
final wordSpacing = _textStyleUtil.wordSpacing;
final fontStyle = _textStyleUtil.fontStyle;

final fontSize = _textStyleUtil.fontSize;
final inherit = _textStyleUtil.inherit;

final textBgColor = _textStyleUtil.backgroundColor;

final textForeground = _textStyleUtil.foreground;
final textBackground = _textStyleUtil.background;
final textShadows = _textStyleUtil.shadows;
final fontFeatures = _textStyleUtil.fontFeatures;
final textDecoration = _textStyleUtil.decoration;
final textDecorationColor = _textStyleUtil.decorationColor;
final textDecorationStyle = _textStyleUtil.decorationStyle;
final textDecorationThickness = _textStyleUtil.decorationThickness;
final fontFamilyFallback = _textStyleUtil.fontFamilyFallback;

/// Media query utility
const mq = MediaQueryUtility();

// Modifiers

const capitalize = TextDirectiveAttribute(TextDirectiveModifier.capitalize);
const upperCase = TextDirectiveAttribute(TextDirectiveModifier.upperCase);
const lowerCase = TextDirectiveAttribute(TextDirectiveModifier.lowerCase);
const titleCase = TextDirectiveAttribute(TextDirectiveModifier.titleCase);
const sentenceCase = TextDirectiveAttribute(TextDirectiveModifier.sentenceCase);

const apply = ApplyUtility.fromMixes;

// Gestures

disabled(Attribute property) => DisabledAttribute(property);
focused(Attribute property) => FocusedAttribute(property);
hovering(Attribute property) => HoverAttribute(property);
pressing(Attribute property) => PressingAttribute(property);
