import '../theme/tokens/size.dart';
import '../widgets/box/box.attributes.dart';
import '../widgets/box/box.utils.dart';

const m = WithSizeTokens(BoxUtility.margin);
const mt = WithSizeTokens(BoxUtility.marginTop);
const mb = WithSizeTokens(BoxUtility.marginBottom);
const mr = WithSizeTokens(BoxUtility.marginRight);
const ml = WithSizeTokens(BoxUtility.marginLeft);
const mx = WithSizeTokens(BoxUtility.marginHorizontal);
const my = WithSizeTokens(BoxUtility.marginVertical);
const mi = BoxUtility.marginInsets;
const margin = WithSizeTokens(BoxUtility.margin);
const marginTop = WithSizeTokens(BoxUtility.marginTop);
const marginBottom = WithSizeTokens(BoxUtility.marginBottom);
const marginRight = WithSizeTokens(BoxUtility.marginRight);
const marginLeft = WithSizeTokens(BoxUtility.marginLeft);
const marginHorizontal = WithSizeTokens(BoxUtility.marginHorizontal);
const marginX = marginHorizontal;
const marginVertical = WithSizeTokens(BoxUtility.marginVertical);
const marginY = marginVertical;
const marginInsets = BoxUtility.marginInsets;

const p = WithSizeTokens(BoxUtility.padding);
const pt = WithSizeTokens(BoxUtility.paddingTop);
const pb = WithSizeTokens(BoxUtility.paddingBottom);
const pr = WithSizeTokens(BoxUtility.paddingRight);
const pl = WithSizeTokens(BoxUtility.paddingLeft);
const px = WithSizeTokens(BoxUtility.paddingHorizontal);
const py = WithSizeTokens(BoxUtility.paddingVertical);
const pi = BoxUtility.paddingInsets;
const padding = WithSizeTokens(BoxUtility.padding);
const paddingTop = WithSizeTokens(BoxUtility.paddingTop);
const paddingBottom = WithSizeTokens(BoxUtility.paddingBottom);
const paddingRight = WithSizeTokens(BoxUtility.paddingRight);
const paddingLeft = WithSizeTokens(BoxUtility.paddingLeft);
const paddingHorizontal = WithSizeTokens(BoxUtility.paddingHorizontal);
const paddingVertical = WithSizeTokens(BoxUtility.paddingVertical);
const paddingInsets = BoxUtility.paddingInsets;
// Transform
const transform = BoxUtility.transform;

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
const shadowFromBox = BoxUtility.shadowFromBox;

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
