import '../../mix.dart';

final margin = WrapWithSpaceTokens(ContainerStyleUtilities().margin);
final marginTop = WrapWithSpaceTokens(ContainerStyleUtilities().marginTop);
final marginBottom =
    WrapWithSpaceTokens(ContainerStyleUtilities().marginBottom);
final marginRight = WrapWithSpaceTokens(ContainerStyleUtilities().marginRight);
final marginLeft = WrapWithSpaceTokens(ContainerStyleUtilities().marginLeft);
final marginDirectionalStart = WrapWithSpaceTokens(
  ContainerStyleUtilities().marginDirectionalStart,
);

final marginDirectionalEnd = WrapWithSpaceTokens(
  ContainerStyleUtilities().marginDirectionalEnd,
);

final marginSymmetric = ContainerStyleUtilities().marginSymmetric;
final marginHorizontal = ContainerStyleUtilities().marginHorizontal;
final marginVertical = ContainerStyleUtilities().marginVertical;

final marginInsets = ContainerStyleUtilities().marginInsets;

final padding = WrapWithSpaceTokens(ContainerStyleUtilities().padding);
final paddingTop = WrapWithSpaceTokens(ContainerStyleUtilities().paddingTop);
final paddingBottom =
    WrapWithSpaceTokens(ContainerStyleUtilities().paddingBottom);
final paddingRight =
    WrapWithSpaceTokens(ContainerStyleUtilities().paddingRight);
final paddingLeft = WrapWithSpaceTokens(ContainerStyleUtilities().paddingLeft);

final paddingSymmetric = ContainerStyleUtilities().paddingSymmetric;
final paddingHorizontal = ContainerStyleUtilities().paddingHorizontal;
final paddingVertical = ContainerStyleUtilities().paddingVertical;
final paddingInsets = ContainerStyleUtilities().paddingInsets;

final paddingDirectionalStart = WrapWithSpaceTokens(
  ContainerStyleUtilities().paddingDirectionalStart,
);
final paddingDirectionalEnd = WrapWithSpaceTokens(
  ContainerStyleUtilities().paddingDirectionalEnd,
);

final paddingDirectionalTop = WrapWithSpaceTokens(
  ContainerStyleUtilities().paddingDirectionalTop,
);

final paddingDirectionalBottom = WrapWithSpaceTokens(
  ContainerStyleUtilities().paddingDirectionalBottom,
);

// Transform
final transform = ContainerStyleUtilities().transform;

/// Background color attribute
final backgroundColor = ContainerStyleUtilities().backgroundColor;

/// Height
final height = ContainerStyleUtilities().height;

/// Width
final width = ContainerStyleUtilities().width;

/// Max height attribute
final maxHeight = ContainerStyleUtilities().maxHeight;

/// Max width attribute
final maxWidth = ContainerStyleUtilities().maxWidth;

/// Min height attribute
final minHeight = ContainerStyleUtilities().minHeight;

/// Min width attribute
final minWidth = ContainerStyleUtilities().minWidth;

/// Border
final border = ContainerStyleUtilities().border;
final borderTop = ContainerStyleUtilities().borderTop;
final borderBottom = ContainerStyleUtilities().borderBottom;
final borderLeft = ContainerStyleUtilities().borderLeft;
final borderRight = ContainerStyleUtilities().borderRight;

// Border Directional

final borderDirectionalTop = ContainerStyleUtilities().borderDirectionalTop;
final borderDirectionalBottom =
    ContainerStyleUtilities().borderDirectionalBottom;
final borderDirectionalStart = ContainerStyleUtilities().borderDirectionalStart;
final borderDirectionalEnd = ContainerStyleUtilities().borderDirectionalEnd;

/// Box shadow utility
final shadow = ContainerStyleUtilities().shadow;

final squared = ContainerStyleUtilities().squared;

final rounded = ContainerStyleUtilities().rounded;
final roundedOnly = ContainerStyleUtilities().roundedOnly;
final roundedHorizontal = ContainerStyleUtilities().roundedHorizontal;
final roundedVertical = ContainerStyleUtilities().roundedVertical;
final roundedDirectionalHorizontal =
    ContainerStyleUtilities().roundedDirectionalHorizontal;
final roundedDirectionalVertical =
    ContainerStyleUtilities().roundedDirectionalVertical;

final alignment = ContainerStyleUtilities().alignment;

/// Elevation
final elevation = ContainerStyleUtilities().elevation;

/// Gradient
final linearGradient = ContainerStyleUtilities().linearGradient;
final radialGradient = ContainerStyleUtilities().radialGradient;

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
final pi = ContainerStyleUtilities().paddingInsets;

@Deprecated(kShortAliasDeprecation)
final m = WrapWithSpaceTokens(ContainerStyleUtilities().margin);
@Deprecated(kShortAliasDeprecation)
final mt = WrapWithSpaceTokens(ContainerStyleUtilities().marginTop);
@Deprecated(kShortAliasDeprecation)
final mb = WrapWithSpaceTokens(ContainerStyleUtilities().marginBottom);
@Deprecated(kShortAliasDeprecation)
final mr = WrapWithSpaceTokens(ContainerStyleUtilities().marginRight);
@Deprecated(kShortAliasDeprecation)
final ml = WrapWithSpaceTokens(ContainerStyleUtilities().marginLeft);
@Deprecated(kShortAliasDeprecation)
final ms = WrapWithSpaceTokens(ContainerStyleUtilities().marginStart);
@Deprecated(kShortAliasDeprecation)
final me = WrapWithSpaceTokens(ContainerStyleUtilities().marginEnd);
@Deprecated(kShortAliasDeprecation)
final mx = WrapWithSpaceTokens(ContainerStyleUtilities().marginHorizontal);
@Deprecated(kShortAliasDeprecation)
final my = WrapWithSpaceTokens(ContainerStyleUtilities().marginVertical);
@Deprecated(kShortAliasDeprecation)
final mi = ContainerStyleUtilities().marginInsets;

@Deprecated(kShortAliasDeprecation)
final marginX = marginHorizontal;

@Deprecated(kShortAliasDeprecation)
final marginY = marginVertical;

@Deprecated(kShortAliasDeprecation)
final r = ContainerStyleUtilities().rounded;

@Deprecated(kShortAliasDeprecation)
final roundedH = ContainerStyleUtilities().roundedHorizontal;

@Deprecated(kShortAliasDeprecation)
final roundedV = ContainerStyleUtilities().roundedVertical;

@Deprecated(kShortAliasDeprecation)
final roundedDH = ContainerStyleUtilities().roundedDirectionalHorizontal;

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedTL(double value) {
  return ContainerStyleUtilities().roundedOnly(topLeft: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedTR(double value) {
  return ContainerStyleUtilities().roundedOnly(topRight: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedBL(double value) {
  return ContainerStyleUtilities().roundedOnly(bottomLeft: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedBR(double value) {
  return ContainerStyleUtilities().roundedOnly(bottomRight: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedTS(double value) {
  return ContainerStyleUtilities().roundedDirectionalOnly(topStart: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedTE(double value) {
  return ContainerStyleUtilities().roundedDirectionalOnly(topEnd: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedBS(double value) {
  return ContainerStyleUtilities().roundedDirectionalOnly(bottomStart: value);
}

@Deprecated(kShortAliasDeprecation)
StyledContainerAttributes roundedBE(double value) {
  return ContainerStyleUtilities().roundedDirectionalOnly(bottomEnd: value);
}

@Deprecated(kShortAliasDeprecation)
final bgColor = ContainerStyleUtilities().backgroundColor;

@Deprecated(kShortAliasDeprecation)
final h = ContainerStyleUtilities().height;

@Deprecated(kShortAliasDeprecation)
final w = ContainerStyleUtilities().width;

@Deprecated(kShortAliasDeprecation)
final maxH = ContainerStyleUtilities().maxHeight;

@Deprecated(kShortAliasDeprecation)
final maxW = ContainerStyleUtilities().maxWidth;

@Deprecated(kShortAliasDeprecation)
final minH = ContainerStyleUtilities().minHeight;

@Deprecated(kShortAliasDeprecation)
final minW = ContainerStyleUtilities().minWidth;

@Deprecated(kShortAliasDeprecation)
final bt = ContainerStyleUtilities().borderTop;

@Deprecated(kShortAliasDeprecation)
final bb = ContainerStyleUtilities().borderBottom;

@Deprecated(kShortAliasDeprecation)
final bl = ContainerStyleUtilities().borderLeft;

@Deprecated(kShortAliasDeprecation)
final br = ContainerStyleUtilities().borderRight;

@Deprecated(kShortAliasDeprecation)
final bs = ContainerStyleUtilities().borderStart;

@Deprecated(kShortAliasDeprecation)
final be = ContainerStyleUtilities().borderEnd;

@Deprecated('Use paddingDirectionalStart instead')
final paddingStart =
    WrapWithSpaceTokens(ContainerStyleUtilities().paddingStart);
@Deprecated('Use paddingDirectionalEnd instead')
final paddingEnd = WrapWithSpaceTokens(ContainerStyleUtilities().paddingEnd);

@Deprecated('Use borderDirectionalStart instead')
final borderStart = ContainerStyleUtilities().borderStart;

@Deprecated('Use borderDirectionalEnd instead')
final borderEnd = ContainerStyleUtilities().borderEnd;

@Deprecated('Use border(color:color) instead')
final borderColor = ContainerStyleUtilities().borderColor;

@Deprecated('Use border(width:width) instead')
final borderWidth = ContainerStyleUtilities().borderWidth;

@Deprecated('Use border(color:color) instead')
final borderStyle = ContainerStyleUtilities().borderStyle;

@Deprecated('Use alignment instead')
final align = alignment;

@Deprecated('Use marginDirectionalStart instead')
final marginStart = WrapWithSpaceTokens(ContainerStyleUtilities().marginStart);
@Deprecated('Use marginDirectionalEnd instead')
final marginEnd = WrapWithSpaceTokens(ContainerStyleUtilities().marginEnd);
