import 'package:flutter/material.dart';
import 'package:mix/src/attributes/apply_mix.dart';
import 'package:mix/src/attributes/base_attribute.dart';
import 'package:mix/src/attributes/dynamic/dark_mode.dart';
import 'package:mix/src/attributes/dynamic/media_query.dart';
import 'package:mix/src/attributes/dynamic/pressable_attributes.dart';
import 'package:mix/src/attributes/primitives/box/box_attributes.dart';
import 'package:mix/src/attributes/primitives/box/box_attributes_props.dart';
import 'package:mix/src/attributes/primitives/icon/icon_color.dart';
import 'package:mix/src/attributes/primitives/text/text_attributes.dart';
import 'package:mix/src/directives/text_directive.dart';

import 'primitives/icon/icon_size.dart';

_marginUtil(EdgeInsets insets) => BoxAttribute(margin: insets);

/// Margin all
m(double value) => _marginUtil(EdgeInsets.all(value));

/// Margin top
mt(double value) => _marginUtil(EdgeInsets.only(top: value));

/// Margin bottom
mb(double value) => _marginUtil(EdgeInsets.only(bottom: value));

/// Margin right
mr(double value) => _marginUtil(EdgeInsets.only(right: value));

/// Margin left
ml(double value) => _marginUtil(EdgeInsets.only(left: value));

/// Margin verttical
my(double value) => _marginUtil(EdgeInsets.symmetric(vertical: value));

/// Margin horizontal
mx(double value) => _marginUtil(EdgeInsets.symmetric(horizontal: value));

_paddingUtil(EdgeInsets insets) => BoxAttribute(padding: insets);

/// Margin all
p(double value) => _paddingUtil(EdgeInsets.all(value));

/// Margin top
pt(double value) => _paddingUtil(EdgeInsets.only(top: value));

/// Margin bottom
pb(double value) => _paddingUtil(EdgeInsets.only(bottom: value));

/// Margin right
pr(double value) => _paddingUtil(EdgeInsets.only(right: value));

/// Margin left
pl(double value) => _paddingUtil(EdgeInsets.only(left: value));

/// Margin verttical
py(double value) => _paddingUtil(EdgeInsets.symmetric(vertical: value));

/// Margin horizontal
px(double value) => _paddingUtil(EdgeInsets.symmetric(horizontal: value));

/// Rotate widget
rotate(int value) => BoxAttribute(rotate: value);

/// Rotate 90
rotate90() => const BoxAttribute(rotate: 1);

/// Rotate 180
rotate180() => const BoxAttribute(rotate: 2);

/// Rotate 270
rotate270() => const BoxAttribute(rotate: 3);

/// Rotate 360
rotate360() => const BoxAttribute(rotate: 4);

/// Opacity
opacity(double value) => BoxAttribute(opacity: value);

/// Aspect Ratio
aspectRatio(double value) => BoxAttribute(aspectRatio: value);

_radii(double? value) => Radius.circular(value ?? 0.0);
_borderRadius(BorderRadius radius) => BoxAttribute(borderRadius: radius);
_borderRadiusOnly({
  double? topLeft,
  double? topRight,
  double? bottomLeft,
  double? bottomRight,
}) =>
    _borderRadius(BorderRadius.only(
      topLeft: _radii(topLeft),
      topRight: _radii(topRight),
      bottomLeft: _radii(bottomLeft),
      bottomRight: _radii(bottomRight),
    ));

/// Border radius
rounded(double value) => _borderRadius(BorderRadius.all(_radii(value)));

roundedTL(double value) {
  return _borderRadiusOnly(topLeft: value);
}

roundedTR(double value) {
  return _borderRadiusOnly(topRight: value);
}

roundedBL(double value) {
  return _borderRadiusOnly(bottomLeft: value);
}

roundedBR(double value) {
  return _borderRadiusOnly(bottomRight: value);
}

/// Background color attribute
bgColor(Color color) => BoxAttribute(backgroundColor: color);

/// Height
h(double height) => BoxAttribute(height: height);

/// Width
w(double width) => BoxAttribute(width: width);

/// Max height attribute
maxH(double maxHeight) => BoxAttribute(maxHeight: maxHeight);

/// Max width attribute
maxW(double maxWidth) => BoxAttribute(maxWidth: maxWidth);

/// Min height attribute
minH(double minHeight) => BoxAttribute(minHeight: minHeight);

/// Min width attribute
minW(double minWidth) => BoxAttribute(minWidth: minWidth);

/// Hide attribute
hide(bool condition) => BoxAttribute(hidden: condition);

/// Border color for all borde sides
borderColor(Color color) => BoxAttribute(border: Border.all(color: color));

/// Border width for all border sides
borderWidth(double width) => BoxAttribute(border: Border.all(width: width));

/// Border style for all border sides
borderStyle(BorderStyle style) {
  return BoxAttribute(border: Border.all(style: style));
}

_shadowUtil({
  Color? color,
  Offset? offset,
  double? blurRadius,
  double? spreadRadius,
}) {
  return BoxAttribute(
    boxShadow: BoxShadowProperties(
      color: color,
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    ),
  );
}

/// Box shadow utility
shadow({
  Color? color,
  Offset? offset,
  double? blurRadius,
  double? spreadRadius,
}) {
  return _shadowUtil(
    color: color,
    offset: offset,
    blurRadius: blurRadius,
    spreadRadius: spreadRadius,
  );
}

const _textUtil = TextUtility();

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

/// Icon Size
const iconSize = IconSizeUtility();

/// Icon color attribute
const iconColor = IconColorUtility();
// TODO: DO gap widget
/// Dynamic Attributes
const dark = DarkModeUtility();

/// Media query utility
const mq = MediaQueryUtility();

// Modifiers
/// Capitalizes text
const capitalize = TextDirectiveAttribute(CapitalizeDirective());
const upperCase = TextDirectiveAttribute(UpperCaseDirective());
const lowerCase = TextDirectiveAttribute(LowerCaseDirective());
const titleCase = TextDirectiveAttribute(TitleCaseDirective());
const sentenceCase = TextDirectiveAttribute(SentenceCaseDirective());

const apply = ApplyMixUtility();

// Gestures

disabled(Attribute attribute) => DisabledAttribute(attribute);
focused(Attribute attribute) => FocusedAttribute(attribute);
hovering(Attribute attribute) => HoveringAttribute(attribute);
pressing(Attribute attribute) => PressingAttribute(attribute);
