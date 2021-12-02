import 'package:mix/src/attributes/box/box.attributes.dart';
import 'package:mix/src/attributes/box/box.utils.dart';
import 'package:mix/src/theme/refs/refs.dart';

const m = WithSizeRefs(BoxUtility.margin);
const mt = WithSizeRefs(BoxUtility.marginTop);
const mb = WithSizeRefs(BoxUtility.marginBottom);
const mr = WithSizeRefs(BoxUtility.marginRight);
const ml = WithSizeRefs(BoxUtility.marginLeft);
const mx = WithSizeRefs(BoxUtility.marginHorizontal);
const my = WithSizeRefs(BoxUtility.marginVertical);
const mi = BoxUtility.marginInsets;
const margin = WithSizeRefs(BoxUtility.margin);
const marginTop = WithSizeRefs(BoxUtility.marginTop);
const marginBottom = WithSizeRefs(BoxUtility.marginBottom);
const marginRight = WithSizeRefs(BoxUtility.marginRight);
const marginLeft = WithSizeRefs(BoxUtility.marginLeft);
const marginHorizontal = WithSizeRefs(BoxUtility.marginHorizontal);
const marginVertical = WithSizeRefs(BoxUtility.marginVertical);
const marginInsets = BoxUtility.marginInsets;

const p = WithSizeRefs(BoxUtility.padding);
const pt = WithSizeRefs(BoxUtility.paddingTop);
const pb = WithSizeRefs(BoxUtility.paddingBottom);
const pr = WithSizeRefs(BoxUtility.paddingRight);
const pl = WithSizeRefs(BoxUtility.paddingLeft);
const px = WithSizeRefs(BoxUtility.paddingHorizontal);
const py = WithSizeRefs(BoxUtility.paddingVertical);
const pi = BoxUtility.paddingInsets;
const padding = WithSizeRefs(BoxUtility.padding);
const paddingTop = WithSizeRefs(BoxUtility.paddingTop);
const paddingBottom = WithSizeRefs(BoxUtility.paddingBottom);
const paddingRight = WithSizeRefs(BoxUtility.paddingRight);
const paddingLeft = WithSizeRefs(BoxUtility.paddingLeft);
const paddingHorizontal = WithSizeRefs(BoxUtility.paddingHorizontal);
const paddingVertical = WithSizeRefs(BoxUtility.paddingVertical);
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
