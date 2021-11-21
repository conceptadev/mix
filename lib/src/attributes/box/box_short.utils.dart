import 'package:mix/src/attributes/box/box.attributes.dart';
import 'package:mix/src/attributes/box/box.utils.dart';

const m = BoxUtility.margin;
const mt = BoxUtility.marginTop;
const mb = BoxUtility.marginBottom;
const mr = BoxUtility.marginRight;
const ml = BoxUtility.marginLeft;
const mx = BoxUtility.marginHorizontal;
const my = BoxUtility.marginVertical;
const mi = BoxUtility.marginInsets;
const margin = BoxUtility.margin;
const marginTop = BoxUtility.marginTop;
const marginBottom = BoxUtility.marginBottom;
const marginRight = BoxUtility.marginRight;
const marginLeft = BoxUtility.marginLeft;
const marginHorizontal = BoxUtility.marginHorizontal;
const marginVertical = BoxUtility.marginVertical;
const marginInsets = BoxUtility.marginInsets;

const p = BoxUtility.padding;
const pt = BoxUtility.paddingTop;
const pb = BoxUtility.paddingBottom;
const pr = BoxUtility.paddingRight;
const pl = BoxUtility.paddingLeft;
const px = BoxUtility.paddingHorizontal;
const py = BoxUtility.paddingVertical;
const pi = BoxUtility.paddingInsets;
const padding = BoxUtility.padding;
const paddingTop = BoxUtility.paddingTop;
const paddingBottom = BoxUtility.paddingBottom;
const paddingRight = BoxUtility.paddingRight;
const paddingLeft = BoxUtility.paddingLeft;
const paddingHorizontal = BoxUtility.paddingHorizontal;
const paddingVertical = BoxUtility.paddingVertical;
const paddingInsets = BoxUtility.paddingInsets;

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
