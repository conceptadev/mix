import '../../theme/tokens/space_token.dart';
import 'box.attributes.dart';
import 'box.utils.dart';

const m = WithSpaceTokens(BoxUtility.margin);
const mt = WithSpaceTokens(BoxUtility.marginTop);
const mb = WithSpaceTokens(BoxUtility.marginBottom);
const mr = WithSpaceTokens(BoxUtility.marginRight);
const ml = WithSpaceTokens(BoxUtility.marginLeft);
const mx = WithSpaceTokens(BoxUtility.marginHorizontal);
const my = WithSpaceTokens(BoxUtility.marginVertical);
const mi = BoxUtility.marginInsets;
const margin = WithSpaceTokens(BoxUtility.margin);
const marginTop = WithSpaceTokens(BoxUtility.marginTop);
const marginBottom = WithSpaceTokens(BoxUtility.marginBottom);
const marginRight = WithSpaceTokens(BoxUtility.marginRight);
const marginLeft = WithSpaceTokens(BoxUtility.marginLeft);
const marginHorizontal = WithSpaceTokens(BoxUtility.marginHorizontal);
const marginX = marginHorizontal;
const marginVertical = WithSpaceTokens(BoxUtility.marginVertical);
const marginY = marginVertical;
const marginInsets = BoxUtility.marginInsets;

const p = WithSpaceTokens(BoxUtility.padding);
const pt = WithSpaceTokens(BoxUtility.paddingTop);
const pb = WithSpaceTokens(BoxUtility.paddingBottom);
const pr = WithSpaceTokens(BoxUtility.paddingRight);
const pl = WithSpaceTokens(BoxUtility.paddingLeft);
const px = WithSpaceTokens(BoxUtility.paddingHorizontal);
const py = WithSpaceTokens(BoxUtility.paddingVertical);
const pi = BoxUtility.paddingInsets;
const padding = WithSpaceTokens(BoxUtility.padding);
const paddingTop = WithSpaceTokens(BoxUtility.paddingTop);
const paddingBottom = WithSpaceTokens(BoxUtility.paddingBottom);
const paddingRight = WithSpaceTokens(BoxUtility.paddingRight);
const paddingLeft = WithSpaceTokens(BoxUtility.paddingLeft);
const paddingHorizontal = WithSpaceTokens(BoxUtility.paddingHorizontal);
const paddingVertical = WithSpaceTokens(BoxUtility.paddingVertical);
const paddingInsets = BoxUtility.paddingInsets;

// const scale = BoxUtility.scale;

/// Background color attribute
const bgColor = BoxUtility.backgroundColor;

/// Height
const h = BoxUtility.height;
const height = BoxUtility.height;

/// Width
const w = BoxUtility.width;
const width = BoxUtility.width;

/// Max height attribute
const maxH = BoxUtility.maxHeight;
const maxHeight = BoxUtility.maxHeight;

/// Max width attribute
const maxW = BoxUtility.maxWidth;
const maxWidth = BoxUtility.maxWidth;

/// Min height attribute
const minH = BoxUtility.minHeight;
const minHeight = BoxUtility.minHeight;

/// Min width attribute
const minW = BoxUtility.minWidth;
const minWidth = BoxUtility.minWidth;

/// Border utility
const border = BoxUtility.border;

/// Border color for all borde sides
const borderColor = BoxUtility.borderColor;

/// Border width for all border sides
const borderWidth = BoxUtility.borderWidth;

/// Border style for all border sides
const borderStyle = BoxUtility.borderStyle;

/// Box shadow utility
const shadow = BoxUtility.shadow;

const squared = BoxUtility.squared;
const rounded = BoxUtility.rounded;
const r = BoxUtility.rounded;

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

const align = BoxUtility.align;

/// Elevation
const elevation = BoxUtility.elevation;

/// Gradient
const linearGradient = BoxUtility.linearGradient;
const radialGradient = BoxUtility.radialGradient;
