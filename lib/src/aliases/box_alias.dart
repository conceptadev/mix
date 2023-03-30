import '../../mix.dart';

const margin = WrapWithSpaceTokens(BoxUtilities.margin);
const marginTop = WrapWithSpaceTokens(BoxUtilities.marginTop);
const marginBottom = WrapWithSpaceTokens(BoxUtilities.marginBottom);
const marginRight = WrapWithSpaceTokens(BoxUtilities.marginRight);
const marginLeft = WrapWithSpaceTokens(BoxUtilities.marginLeft);
const marginStart = WrapWithSpaceTokens(BoxUtilities.marginStart);
const marginEnd = WrapWithSpaceTokens(BoxUtilities.marginEnd);
const marginHorizontal = WrapWithSpaceTokens(BoxUtilities.marginHorizontal);

const marginVertical = WrapWithSpaceTokens(BoxUtilities.marginVertical);

const marginInsets = BoxUtilities.marginInsets;

const padding = WrapWithSpaceTokens(BoxUtilities.padding);
const paddingTop = WrapWithSpaceTokens(BoxUtilities.paddingTop);
const paddingBottom = WrapWithSpaceTokens(BoxUtilities.paddingBottom);
const paddingRight = WrapWithSpaceTokens(BoxUtilities.paddingRight);
const paddingLeft = WrapWithSpaceTokens(BoxUtilities.paddingLeft);
const paddingStart = WrapWithSpaceTokens(BoxUtilities.paddingStart);
const paddingEnd = WrapWithSpaceTokens(BoxUtilities.paddingEnd);
const paddingHorizontal = WrapWithSpaceTokens(BoxUtilities.paddingHorizontal);
const paddingVertical = WrapWithSpaceTokens(BoxUtilities.paddingVertical);
const paddingInsets = BoxUtilities.paddingInsets;
// Transform
const transform = BoxUtilities.transform;

/// Background color attribute
const backgroundColor = BoxUtilities.backgroundColor;

/// Height
const height = BoxUtilities.height;

/// Width
const width = BoxUtilities.width;

/// Max height attribute
const maxHeight = BoxUtilities.maxHeight;

/// Max width attribute
const maxWidth = BoxUtilities.maxWidth;

/// Min height attribute
const minHeight = BoxUtilities.minHeight;

/// Min width attribute
const minWidth = BoxUtilities.minWidth;

/// Border utility
const border = BoxUtilities.border;
const borderTop = BoxUtilities.borderTop;
const borderBottom = BoxUtilities.borderBottom;
const borderLeft = BoxUtilities.borderLeft;
const borderRight = BoxUtilities.borderRight;
const borderStart = BoxUtilities.borderStart;
const borderEnd = BoxUtilities.borderEnd;

@Deprecated(kShortAliasDeprecation)
const bt = BoxUtilities.borderTop;

@Deprecated(kShortAliasDeprecation)
const bb = BoxUtilities.borderBottom;

@Deprecated(kShortAliasDeprecation)
const bl = BoxUtilities.borderLeft;

@Deprecated(kShortAliasDeprecation)
const br = BoxUtilities.borderRight;

@Deprecated(kShortAliasDeprecation)
const bs = BoxUtilities.borderStart;

@Deprecated(kShortAliasDeprecation)
const be = BoxUtilities.borderEnd;

/// Border color for all borde sides
const borderColor = BoxUtilities.borderColor;

/// Border width for all border sides
const borderWidth = BoxUtilities.borderWidth;

/// Border style for all border sides
const borderStyle = BoxUtilities.borderStyle;

/// Box shadow utility
const shadow = BoxUtilities.shadow;

const squared = BoxUtilities.squared;

const rounded = BoxUtilities.rounded;
const roundedOnly = BoxUtilities.roundedOnly;
const roundedHorizontal = BoxUtilities.roundedHorizontal;
const roundedVertical = BoxUtilities.roundedVertical;
const roundedDirectionalHorizontal = BoxUtilities.roundedDirectionalHorizontal;
const roundedDirectionalVertical = BoxUtilities.roundedDirectionalVertical;

const align = BoxUtilities.align;

/// Elevation
const elevation = BoxUtilities.elevation;

/// Gradient
const linearGradient = BoxUtilities.linearGradient;
const radialGradient = BoxUtilities.radialGradient;

const kShortAliasDeprecation =
    'Short aliases will be deprecated, you can create your own. Example: const p = padding;';

@Deprecated(kShortAliasDeprecation)
const p = padding;

@Deprecated(kShortAliasDeprecation)
const pt = paddingTop;

@Deprecated(kShortAliasDeprecation)
const pb = paddingBottom;

@Deprecated(kShortAliasDeprecation)
const pr = paddingRight;

@Deprecated(kShortAliasDeprecation)
const pl = paddingLeft;

@Deprecated(kShortAliasDeprecation)
const ps = paddingStart;

@Deprecated(kShortAliasDeprecation)
const pe = paddingEnd;

@Deprecated(kShortAliasDeprecation)
const px = paddingHorizontal;

@Deprecated(kShortAliasDeprecation)
const py = paddingVertical;

@Deprecated(kShortAliasDeprecation)
const pi = BoxUtilities.paddingInsets;

@Deprecated(kShortAliasDeprecation)
const m = WrapWithSpaceTokens(BoxUtilities.margin);
@Deprecated(kShortAliasDeprecation)
const mt = WrapWithSpaceTokens(BoxUtilities.marginTop);
@Deprecated(kShortAliasDeprecation)
const mb = WrapWithSpaceTokens(BoxUtilities.marginBottom);
@Deprecated(kShortAliasDeprecation)
const mr = WrapWithSpaceTokens(BoxUtilities.marginRight);
@Deprecated(kShortAliasDeprecation)
const ml = WrapWithSpaceTokens(BoxUtilities.marginLeft);
@Deprecated(kShortAliasDeprecation)
const ms = WrapWithSpaceTokens(BoxUtilities.marginStart);
@Deprecated(kShortAliasDeprecation)
const me = WrapWithSpaceTokens(BoxUtilities.marginEnd);
@Deprecated(kShortAliasDeprecation)
const mx = WrapWithSpaceTokens(BoxUtilities.marginHorizontal);
@Deprecated(kShortAliasDeprecation)
const my = WrapWithSpaceTokens(BoxUtilities.marginVertical);
@Deprecated(kShortAliasDeprecation)
const mi = BoxUtilities.marginInsets;

@Deprecated(kShortAliasDeprecation)
const marginX = marginHorizontal;

@Deprecated(kShortAliasDeprecation)
const marginY = marginVertical;

@Deprecated(kShortAliasDeprecation)
const r = BoxUtilities.rounded;

@Deprecated(kShortAliasDeprecation)
const roundedH = BoxUtilities.roundedHorizontal;

@Deprecated(kShortAliasDeprecation)
const roundedV = BoxUtilities.roundedVertical;

@Deprecated(kShortAliasDeprecation)
const roundedDH = BoxUtilities.roundedDirectionalHorizontal;

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedTL(double value) {
  return BoxUtilities.roundedOnly(topLeft: value);
}

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedTR(double value) {
  return BoxUtilities.roundedOnly(topRight: value);
}

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedBL(double value) {
  return BoxUtilities.roundedOnly(bottomLeft: value);
}

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedBR(double value) {
  return BoxUtilities.roundedOnly(bottomRight: value);
}

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedTS(double value) {
  return BoxUtilities.roundedDirectionalOnly(topStart: value);
}

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedTE(double value) {
  return BoxUtilities.roundedDirectionalOnly(topEnd: value);
}

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedBS(double value) {
  return BoxUtilities.roundedDirectionalOnly(bottomStart: value);
}

@Deprecated(kShortAliasDeprecation)
BoxAttributes roundedBE(double value) {
  return BoxUtilities.roundedDirectionalOnly(bottomEnd: value);
}

@Deprecated(kShortAliasDeprecation)
const bgColor = BoxUtilities.backgroundColor;

@Deprecated(kShortAliasDeprecation)
const h = BoxUtilities.height;

@Deprecated(kShortAliasDeprecation)
const w = BoxUtilities.width;

@Deprecated(kShortAliasDeprecation)
const maxH = BoxUtilities.maxHeight;

@Deprecated(kShortAliasDeprecation)
const maxW = BoxUtilities.maxWidth;

@Deprecated(kShortAliasDeprecation)
const minH = BoxUtilities.minHeight;

@Deprecated(kShortAliasDeprecation)
const minW = BoxUtilities.minWidth;
