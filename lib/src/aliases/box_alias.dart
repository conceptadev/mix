import '../theme/tokens/size.dart';
import '../widgets/box/box.attributes.dart';
import '../widgets/box/box.utils.dart';

const margin = WithSizeTokens(BoxUtility.margin);
const marginInsets = BoxUtility.marginInsets;
const marginOnly = BoxUtility.marginOnly;
const marginX = WithSizeTokens(BoxUtility.marginX);
const marginY = WithSizeTokens(BoxUtility.marginY);

const padding = WithSizeTokens(BoxUtility.padding);
const paddingInsets = BoxUtility.paddingInsets;
const paddingOnly = BoxUtility.paddingOnly;
const paddingX = BoxUtility.paddingInsets;
const paddingY = BoxUtility.paddingInsets;

// Transform
const transform = BoxUtility.transform;

/// Background color attribute
const bgColor = BoxUtility.backgroundColor;

/// Height attributes
const height = BoxUtility.height;
const maxHeight = BoxUtility.maxHeight;
const minHeight = BoxUtility.minHeight;

/// Width attributes
const width = BoxUtility.width;
const maxWidth = BoxUtility.maxWidth;
const minWidth = BoxUtility.minWidth;

/// Border utility
const border = BoxUtility.border;
const borderTop = BoxUtility.borderTop;
const borderBottom = BoxUtility.borderBottom;
const borderLeft = BoxUtility.borderLeft;
const borderRight = BoxUtility.borderRight;
const borderStart = BoxUtility.borderStart;
const borderEnd = BoxUtility.borderEnd;

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

const roundedHorizontal = BoxUtility.roundedHorizontal;
const roundedVertical = BoxUtility.roundedVertical;
const roundedDirectionalHorizontal = BoxUtility.roundedDirectionalHorizontal;
const roundedH = BoxUtility.roundedHorizontal;
const roundedV = BoxUtility.roundedVertical;
const roundedDH = BoxUtility.roundedDirectionalHorizontal;

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

BoxAttributes roundedTS(double value) {
  return BoxUtility.roundedDirectionalOnly(topStart: value);
}

BoxAttributes roundedTE(double value) {
  return BoxUtility.roundedDirectionalOnly(topEnd: value);
}

BoxAttributes roundedBS(double value) {
  return BoxUtility.roundedDirectionalOnly(bottomStart: value);
}

BoxAttributes roundedBE(double value) {
  return BoxUtility.roundedDirectionalOnly(bottomEnd: value);
}

const align = BoxUtility.align;

/// Elevation
const elevation = BoxUtility.elevation;

/// Gradient
const linearGradient = BoxUtility.linearGradient;
const radialGradient = BoxUtility.radialGradient;
