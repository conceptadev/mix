import 'package:mix/src/attributes/box/box.attributes.dart';
import 'package:mix/src/attributes/box/box.utils.dart';

const m = BoxUtility.margin;
const mt = BoxUtility.marginTop;
const mb = BoxUtility.marginBottom;
const mr = BoxUtility.marginRight;
const ml = BoxUtility.marginLeft;
const mx = BoxUtility.marginHorizontal;
const my = BoxUtility.marginVertical;
const mInsets = BoxUtility.marginInsets;

const p = BoxUtility.padding;
const pt = BoxUtility.paddingTop;
const pb = BoxUtility.paddingBottom;
const pr = BoxUtility.paddingRight;
const pl = BoxUtility.paddingLeft;
const px = BoxUtility.paddingHorizontal;
const py = BoxUtility.paddingVertical;
const pInsets = BoxUtility.paddingInsets;

/// Rotate widget
const rotate = BoxUtility.rotate;

/// Rotate 90
BoxAttributes rotate90() => rotate(1);

/// Rotate 180
BoxAttributes rotate180() => rotate(2);

/// Rotate 270
BoxAttributes rotate270() => rotate(3);

/// Rotate 360
BoxAttributes rotate360() => rotate(4);

const opacity = BoxUtility.opacity;
const aspectRatio = BoxUtility.aspectRatio;

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
