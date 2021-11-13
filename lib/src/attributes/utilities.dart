import 'package:flutter/material.dart';
import 'package:mix/src/attributes/directives/directive.attributes.dart';
import 'package:mix/src/attributes/helpers/helper.utils.dart';
import 'package:mix/src/attributes/widgets/box/box.attributes.dart';
import 'package:mix/src/attributes/widgets/box/box.utils.dart';
import 'package:mix/src/attributes/widgets/common/common.utils.dart';
import 'package:mix/src/attributes/widgets/pressable/pressable.utils.dart';
import 'package:mix/src/attributes/widgets/text/text.utils.dart';

import 'context/context.utils.dart';

/// Margin all
BoxAttributes m(double value) => BoxUtility.margin(EdgeInsets.all(value));

/// Margin top
BoxAttributes mt(double value) =>
    BoxUtility.margin(EdgeInsets.only(top: value));

/// Margin bottom
BoxAttributes mb(double value) =>
    BoxUtility.margin(EdgeInsets.only(bottom: value));

/// Margin right
BoxAttributes mr(double value) =>
    BoxUtility.margin(EdgeInsets.only(right: value));

/// Margin left
BoxAttributes ml(double value) =>
    BoxUtility.margin(EdgeInsets.only(left: value));

/// Margin verttical
BoxAttributes my(double value) =>
    BoxUtility.margin(EdgeInsets.symmetric(vertical: value));

/// Margin horizontal
BoxAttributes mx(double value) =>
    BoxUtility.margin(EdgeInsets.symmetric(horizontal: value));

/// Padding all
BoxAttributes p(double value) => BoxUtility.padding(EdgeInsets.all(value));

/// Padding top
BoxAttributes pt(double value) =>
    BoxUtility.padding(EdgeInsets.only(top: value));

/// Padding bottom
BoxAttributes pb(double value) =>
    BoxUtility.padding(EdgeInsets.only(bottom: value));

/// Padding right
BoxAttributes pr(double value) =>
    BoxUtility.padding(EdgeInsets.only(right: value));

/// Padding left
BoxAttributes pl(double value) =>
    BoxUtility.padding(EdgeInsets.only(left: value));

/// Padding verttical
BoxAttributes py(double value) =>
    BoxUtility.padding(EdgeInsets.symmetric(vertical: value));

/// Padding horizontal
BoxAttributes px(double value) =>
    BoxUtility.padding(EdgeInsets.symmetric(horizontal: value));

/// Rotate widget
const rotate = BoxUtility.rotate;

/// Rotate 90
BoxAttributes rotate90() => rotate(1);

/// Rotate 180
BoxAttributes rotate180() => rotate(2);

/// Rotate 270
BoxAttributes rotate270() => rotate(3);

/// Rotate 360
BoxAttributes rotate360() => rotate(4);

/// Opacity
BoxAttributes opacity(double value) => BoxUtility.opacity(value);

/// Aspect Ratio
BoxAttributes aspectRatio(double value) => BoxUtility.aspectRatio(value);

BoxAttributes rounded(double value) => BoxUtility.rounded(value);

BoxAttributes roundedTL(double value) {
  return BoxUtility.roundedOnly(topLeft: value);
}

BoxAttributes roundedTR(double value) {
  return BoxUtility.roundedOnly(topRight: value);
}

BoxAttributes roundedBL(double value) {
  return BoxUtility.roundedOnly(bottomLeft: value);
}

BoxAttributes roundedBR(double value) {
  return BoxUtility.roundedOnly(bottomRight: value);
}

/// Background color attribute
const bgColor = BoxUtility.backgroundColor;

/// Height
const h = BoxUtility.height;

/// Width
const w = BoxUtility.width;

/// Max height attribute
const maxH = BoxUtility.maxHeight;

/// Max width attribute
const maxW = BoxUtility.maxWidth;

/// Min height attribute
const minH = BoxUtility.minHeight;

/// Min width attribute
const minW = BoxUtility.minWidth;

/// Hide attribute
const hide = CommonUtility.hidden;

const animated = CommonUtility.animated;
const animationDuration = CommonUtility.animationDuration;
const animationCurve = CommonUtility.animationCurve;
const textDirection = CommonUtility.textDirection;

/// Border color for all borde sides
const borderColor = BoxUtility.borderColor;

/// Border width for all border sides
const borderWidth = BoxUtility.borderWidth;

/// Border style for all border sides
const borderStyle = BoxUtility.borderStyle;

/// Box shadow utility
const shadow = BoxUtility.shadow;

/// Text align
const textAlign = TextUtility.textAlign;

const textWidthBasis = TextUtility.textWidthBasis;
const locale = TextUtility.locale;
const maxLines = TextUtility.maxLines;
const textOverflow = TextUtility.overflow;
const textStyle = TextUtility.style;
const softWrap = TextUtility.softWrap;
const textScaleFactor = TextUtility.textScaleFactor;
const strutStyle = TextUtility.strutStyle;
const semanticsLabel = TextUtility.semanticsLabel;

const fontWeight = TextStyleUtility.fontWeight;
const textBaseline = TextStyleUtility.textBaseline;
const letterSpacing = TextStyleUtility.letterSpacing;
const debugLabel = TextStyleUtility.debugLabel;
const textHeight = TextStyleUtility.height;
const wordSpacing = TextStyleUtility.wordSpacing;
const fontStyle = TextStyleUtility.fontStyle;

const fontSize = TextStyleUtility.fontSize;
const inherit = TextStyleUtility.inherit;
const textColor = TextStyleUtility.color;
const textBgColor = TextStyleUtility.backgroundColor;

const textForeground = TextStyleUtility.foreground;
const textBackground = TextStyleUtility.background;
const textShadows = TextStyleUtility.shadows;
const fontFeatures = TextStyleUtility.fontFeatures;
const textDecoration = TextStyleUtility.decoration;
const textDecorationColor = TextStyleUtility.decorationColor;
const textDecorationStyle = TextStyleUtility.decorationStyle;
const textDecorationThickness = TextStyleUtility.decorationThickness;
const fontFamilyFallback = TextStyleUtility.fontFamilyFallback;

/// Context utilities
const xsmall = ContextUtility.xsmall;
const small = ContextUtility.small;
const medium = ContextUtility.medium;
const large = ContextUtility.large;

const portrait = ContextUtility.portrait;
const landscape = ContextUtility.landscape;

const dark = ContextUtility.dark;

// Modifiers
const capitalize = TextDirectiveAttribute(TextModifier.capitalize);
const upperCase = TextDirectiveAttribute(TextModifier.upperCase);
const lowerCase = TextDirectiveAttribute(TextModifier.lowerCase);
const titleCase = TextDirectiveAttribute(TextModifier.titleCase);
const sentenceCase = TextDirectiveAttribute(TextModifier.sentenceCase);

const apply = HelpersUtility.apply;

// Gestures

final disabled =
    const PositionalParameterFunc(PressableUtility.disabled).spreadDynamic;
final focus =
    const PositionalParameterFunc(PressableUtility.focus).spreadDynamic;
final hovering =
    const PositionalParameterFunc(PressableUtility.hover).spreadDynamic;
final pressing =
    const PositionalParameterFunc(PressableUtility.pressing).spreadDynamic;
