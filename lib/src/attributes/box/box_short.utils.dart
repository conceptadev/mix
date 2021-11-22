import 'package:mix/src/attributes/box/box.attributes.dart';
import 'package:mix/src/attributes/box/box.utils.dart';
import 'package:mix/src/theme/spacing.dart';

const m = WithSpaceUtils(BoxUtility.margin);
const mt = WithSpaceUtils(BoxUtility.marginTop);
const mb = WithSpaceUtils(BoxUtility.marginBottom);
const mr = WithSpaceUtils(BoxUtility.marginRight);
const ml = WithSpaceUtils(BoxUtility.marginLeft);
const mx = WithSpaceUtils(BoxUtility.marginHorizontal);
const my = WithSpaceUtils(BoxUtility.marginVertical);
const mi = BoxUtility.marginInsets;
const margin = WithSpaceUtils(BoxUtility.margin);
const marginTop = WithSpaceUtils(BoxUtility.marginTop);
const marginBottom = WithSpaceUtils(BoxUtility.marginBottom);
const marginRight = WithSpaceUtils(BoxUtility.marginRight);
const marginLeft = WithSpaceUtils(BoxUtility.marginLeft);
const marginHorizontal = WithSpaceUtils(BoxUtility.marginHorizontal);
const marginVertical = WithSpaceUtils(BoxUtility.marginVertical);
const marginInsets = BoxUtility.marginInsets;

const p = WithSpaceUtils(BoxUtility.padding);
const pt = WithSpaceUtils(BoxUtility.paddingTop);
const pb = WithSpaceUtils(BoxUtility.paddingBottom);
const pr = WithSpaceUtils(BoxUtility.paddingRight);
const pl = WithSpaceUtils(BoxUtility.paddingLeft);
const px = WithSpaceUtils(BoxUtility.paddingHorizontal);
const py = WithSpaceUtils(BoxUtility.paddingVertical);
const pi = BoxUtility.paddingInsets;
const padding = WithSpaceUtils(BoxUtility.padding);
const paddingTop = WithSpaceUtils(BoxUtility.paddingTop);
const paddingBottom = WithSpaceUtils(BoxUtility.paddingBottom);
const paddingRight = WithSpaceUtils(BoxUtility.paddingRight);
const paddingLeft = WithSpaceUtils(BoxUtility.paddingLeft);
const paddingHorizontal = WithSpaceUtils(BoxUtility.paddingHorizontal);
const paddingVertical = WithSpaceUtils(BoxUtility.paddingVertical);
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
