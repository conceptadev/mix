import '../../mix.dart';

final margin = WrapWithSpaceTokens(BoxUtilities().margin);
final marginTop = WrapWithSpaceTokens(BoxUtilities().marginTop);
final marginBottom = WrapWithSpaceTokens(BoxUtilities().marginBottom);
final marginRight = WrapWithSpaceTokens(BoxUtilities().marginRight);
final marginLeft = WrapWithSpaceTokens(BoxUtilities().marginLeft);
final marginDirectionalStart = WrapWithSpaceTokens(
  BoxUtilities().marginDirectionalStart,
);

final marginDirectionalEnd = WrapWithSpaceTokens(
  BoxUtilities().marginDirectionalEnd,
);

final marginSymmetric = BoxUtilities().marginSymmetric;
final marginHorizontal = BoxUtilities().marginHorizontal;
final marginVertical = BoxUtilities().marginVertical;

final marginInsets = BoxUtilities().marginInsets;

final padding = WrapWithSpaceTokens(BoxUtilities().padding);
final paddingTop = WrapWithSpaceTokens(BoxUtilities().paddingTop);
final paddingBottom = WrapWithSpaceTokens(BoxUtilities().paddingBottom);
final paddingRight = WrapWithSpaceTokens(BoxUtilities().paddingRight);
final paddingLeft = WrapWithSpaceTokens(BoxUtilities().paddingLeft);

final paddingSymmetric = BoxUtilities().paddingSymmetric;
final paddingHorizontal = BoxUtilities().paddingHorizontal;
final paddingVertical = BoxUtilities().paddingVertical;
final paddingInsets = BoxUtilities().paddingInsets;

final paddingDirectionalStart = WrapWithSpaceTokens(
  BoxUtilities().paddingDirectionalStart,
);
final paddingDirectionalEnd = WrapWithSpaceTokens(
  BoxUtilities().paddingDirectionalEnd,
);

final paddingDirectionalTop = WrapWithSpaceTokens(
  BoxUtilities().paddingDirectionalTop,
);

final paddingDirectionalBottom = WrapWithSpaceTokens(
  BoxUtilities().paddingDirectionalBottom,
);

// Transform
final transform = BoxUtilities().transform;

/// Background color attribute
final backgroundColor = BoxUtilities().backgroundColor;

/// Height
final height = BoxUtilities().height;

/// Width
final width = BoxUtilities().width;

/// Max height attribute
final maxHeight = BoxUtilities().maxHeight;

/// Max width attribute
final maxWidth = BoxUtilities().maxWidth;

/// Min height attribute
final minHeight = BoxUtilities().minHeight;

/// Min width attribute
final minWidth = BoxUtilities().minWidth;

/// Border
final border = BoxUtilities().border;
final borderTop = BoxUtilities().borderTop;
final borderBottom = BoxUtilities().borderBottom;
final borderLeft = BoxUtilities().borderLeft;
final borderRight = BoxUtilities().borderRight;

// Border Directional

final borderDirectionalTop = BoxUtilities().borderDirectionalTop;
final borderDirectionalBottom = BoxUtilities().borderDirectionalBottom;
final borderDirectionalStart = BoxUtilities().borderDirectionalStart;
final borderDirectionalEnd = BoxUtilities().borderDirectionalEnd;

/// Box shadow utility
final shadow = BoxUtilities().shadow;

final squared = BoxUtilities().squared;

final rounded = BoxUtilities().rounded;
final roundedOnly = BoxUtilities().roundedOnly;
final roundedHorizontal = BoxUtilities().roundedHorizontal;
final roundedVertical = BoxUtilities().roundedVertical;
final roundedDirectionalHorizontal =
    BoxUtilities().roundedDirectionalHorizontal;
final roundedDirectionalVertical = BoxUtilities().roundedDirectionalVertical;

final alignment = BoxUtilities().alignment;

/// Elevation
final elevation = BoxUtilities().elevation;

/// Gradient
final linearGradient = BoxUtilities().linearGradient;
final radialGradient = BoxUtilities().radialGradient;

const kShortAliasDeprecation =
    'Short aliases will be deprecated, you can create your own. Example: final p = padding;';

@Deprecated(kShortAliasDeprecation)
final p = padding;

@Deprecated(kShortAliasDeprecation)
final pt = paddingTop;

@Deprecated(kShortAliasDeprecation)
final pb = paddingBottom;

@Deprecated(kShortAliasDeprecation)
final pr = paddingRight;

@Deprecated(kShortAliasDeprecation)
final pl = paddingLeft;

@Deprecated(kShortAliasDeprecation)
final ps = paddingStart;

@Deprecated(kShortAliasDeprecation)
final pe = paddingEnd;

@Deprecated(kShortAliasDeprecation)
final px = paddingHorizontal;

@Deprecated(kShortAliasDeprecation)
final py = paddingVertical;

@Deprecated(kShortAliasDeprecation)
final pi = BoxUtilities().paddingInsets;

@Deprecated(kShortAliasDeprecation)
final m = WrapWithSpaceTokens(BoxUtilities().margin);
@Deprecated(kShortAliasDeprecation)
final mt = WrapWithSpaceTokens(BoxUtilities().marginTop);
@Deprecated(kShortAliasDeprecation)
final mb = WrapWithSpaceTokens(BoxUtilities().marginBottom);
@Deprecated(kShortAliasDeprecation)
final mr = WrapWithSpaceTokens(BoxUtilities().marginRight);
@Deprecated(kShortAliasDeprecation)
final ml = WrapWithSpaceTokens(BoxUtilities().marginLeft);
@Deprecated(kShortAliasDeprecation)
final ms = WrapWithSpaceTokens(BoxUtilities().marginStart);
@Deprecated(kShortAliasDeprecation)
final me = WrapWithSpaceTokens(BoxUtilities().marginEnd);
@Deprecated(kShortAliasDeprecation)
final mx = WrapWithSpaceTokens(BoxUtilities().marginHorizontal);
@Deprecated(kShortAliasDeprecation)
final my = WrapWithSpaceTokens(BoxUtilities().marginVertical);
@Deprecated(kShortAliasDeprecation)
final mi = BoxUtilities().marginInsets;

@Deprecated(kShortAliasDeprecation)
final marginX = marginHorizontal;

@Deprecated(kShortAliasDeprecation)
final marginY = marginVertical;

@Deprecated(kShortAliasDeprecation)
final r = BoxUtilities().rounded;

@Deprecated(kShortAliasDeprecation)
final roundedH = BoxUtilities().roundedHorizontal;

@Deprecated(kShortAliasDeprecation)
final roundedV = BoxUtilities().roundedVertical;

@Deprecated(kShortAliasDeprecation)
final roundedDH = BoxUtilities().roundedDirectionalHorizontal;

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedTL(double value) {
  return BoxUtilities().roundedOnly(topLeft: value);
}

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedTR(double value) {
  return BoxUtilities().roundedOnly(topRight: value);
}

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedBL(double value) {
  return BoxUtilities().roundedOnly(bottomLeft: value);
}

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedBR(double value) {
  return BoxUtilities().roundedOnly(bottomRight: value);
}

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedTS(double value) {
  return BoxUtilities().roundedDirectionalOnly(topStart: value);
}

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedTE(double value) {
  return BoxUtilities().roundedDirectionalOnly(topEnd: value);
}

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedBS(double value) {
  return BoxUtilities().roundedDirectionalOnly(bottomStart: value);
}

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedBE(double value) {
  return BoxUtilities().roundedDirectionalOnly(bottomEnd: value);
}

@Deprecated(kShortAliasDeprecation)
final bgColor = BoxUtilities().backgroundColor;

@Deprecated(kShortAliasDeprecation)
final h = BoxUtilities().height;

@Deprecated(kShortAliasDeprecation)
final w = BoxUtilities().width;

@Deprecated(kShortAliasDeprecation)
final maxH = BoxUtilities().maxHeight;

@Deprecated(kShortAliasDeprecation)
final maxW = BoxUtilities().maxWidth;

@Deprecated(kShortAliasDeprecation)
final minH = BoxUtilities().minHeight;

@Deprecated(kShortAliasDeprecation)
final minW = BoxUtilities().minWidth;

@Deprecated(kShortAliasDeprecation)
final bt = BoxUtilities().borderTop;

@Deprecated(kShortAliasDeprecation)
final bb = BoxUtilities().borderBottom;

@Deprecated(kShortAliasDeprecation)
final bl = BoxUtilities().borderLeft;

@Deprecated(kShortAliasDeprecation)
final br = BoxUtilities().borderRight;

@Deprecated(kShortAliasDeprecation)
final bs = BoxUtilities().borderStart;

@Deprecated(kShortAliasDeprecation)
final be = BoxUtilities().borderEnd;

@Deprecated('Use paddingDirectionalStart instead')
final paddingStart = WrapWithSpaceTokens(BoxUtilities().paddingStart);
@Deprecated('Use paddingDirectionalEnd instead')
final paddingEnd = WrapWithSpaceTokens(BoxUtilities().paddingEnd);

@Deprecated('Use borderDirectionalStart instead')
final borderStart = BoxUtilities().borderStart;

@Deprecated('Use borderDirectionalEnd instead')
final borderEnd = BoxUtilities().borderEnd;

@Deprecated('Use border(color:color) instead')
final borderColor = BoxUtilities().borderColor;

@Deprecated('Use border(width:width) instead')
final borderWidth = BoxUtilities().borderWidth;

@Deprecated('Use border(color:color) instead')
final borderStyle = BoxUtilities().borderStyle;

@Deprecated('Use alignment instead')
final align = alignment;

@Deprecated('Use marginDirectionalStart instead')
final marginStart = WrapWithSpaceTokens(BoxUtilities().marginStart);
@Deprecated('Use marginDirectionalEnd instead')
final marginEnd = WrapWithSpaceTokens(BoxUtilities().marginEnd);
