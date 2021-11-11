import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/attributes/box/box.attributes.dart';
import 'package:mix/src/attributes/box/box.util.dart';
import 'package:mix/src/attributes/common/common.utility.dart';
import 'package:mix/src/attributes/context/media_query.dart';
import 'package:mix/src/attributes/context/pressable_attributes.dart';
import 'package:mix/src/attributes/directives/text_directive.dart';
import 'package:mix/src/attributes/helpers/apply_mix.dart';
import 'package:mix/src/attributes/text/text.util.dart';

const _boxUtils = BoxUtility();
const _animationUtil = AnimationUtility();
const _textUtil = TextUtility();

/// Margin all
BoxAttributes m(double value) => _boxUtils.margin(EdgeInsets.all(value));

/// Margin top
BoxAttributes mt(double value) => _boxUtils.margin(EdgeInsets.only(top: value));

/// Margin bottom
BoxAttributes mb(double value) =>
    _boxUtils.margin(EdgeInsets.only(bottom: value));

/// Margin right
BoxAttributes mr(double value) =>
    _boxUtils.margin(EdgeInsets.only(right: value));

/// Margin left
BoxAttributes ml(double value) =>
    _boxUtils.margin(EdgeInsets.only(left: value));

/// Margin verttical
BoxAttributes my(double value) =>
    _boxUtils.margin(EdgeInsets.symmetric(vertical: value));

/// Margin horizontal
BoxAttributes mx(double value) =>
    _boxUtils.margin(EdgeInsets.symmetric(horizontal: value));

/// Padding all
BoxAttributes p(double value) => _boxUtils.padding(EdgeInsets.all(value));

/// Padding top
BoxAttributes pt(double value) =>
    _boxUtils.padding(EdgeInsets.only(top: value));

/// Padding bottom
BoxAttributes pb(double value) =>
    _boxUtils.padding(EdgeInsets.only(bottom: value));

/// Padding right
BoxAttributes pr(double value) =>
    _boxUtils.padding(EdgeInsets.only(right: value));

/// Padding left
BoxAttributes pl(double value) =>
    _boxUtils.padding(EdgeInsets.only(left: value));

/// Padding verttical
BoxAttributes py(double value) =>
    _boxUtils.padding(EdgeInsets.symmetric(vertical: value));

/// Padding horizontal
BoxAttributes px(double value) =>
    _boxUtils.padding(EdgeInsets.symmetric(horizontal: value));

/// Rotate widget
final rotate = _boxUtils.rotate;

/// Rotate 90
BoxAttributes rotate90() => rotate(1);

/// Rotate 180
BoxAttributes rotate180() => rotate(2);

/// Rotate 270
BoxAttributes rotate270() => rotate(3);

/// Rotate 360
BoxAttributes rotate360() => rotate(4);

/// Opacity
BoxAttributes opacity(double value) => _boxUtils.opacity(value);

/// Aspect Ratio
BoxAttributes aspectRatio(double value) => _boxUtils.aspectRatio(value);

BoxAttributes rounded(double value) => _boxUtils.rounded(value);

BoxAttributes roundedTL(double value) {
  return _boxUtils.roundedOnly(topLeft: value);
}

BoxAttributes roundedTR(double value) {
  return _boxUtils.roundedOnly(topRight: value);
}

BoxAttributes roundedBL(double value) {
  return _boxUtils.roundedOnly(bottomLeft: value);
}

BoxAttributes roundedBR(double value) {
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
final hide = _boxUtils.hidden;

final animated = _animationUtil.animated;

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
