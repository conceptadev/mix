import '../attributes/space_attribute.dart';

const padding = PaddingAttribute.all;
PaddingAttribute paddingTop(double value) {
  return PaddingAttribute.only(top: value);
}

PaddingAttribute paddingBottom(double value) {
  return PaddingAttribute.only(bottom: value);
}

PaddingAttribute paddingLeft(double value) {
  return PaddingAttribute.only(left: value);
}

PaddingAttribute paddingRight(double value) {
  return PaddingAttribute.only(right: value);
}

PaddingAttribute paddingSymmetric({double? horizontal, double? vertical}) {
  return PaddingAttribute.symmetric(horizontal: horizontal, vertical: vertical);
}

PaddingAttribute paddingHorizontal(double value) {
  return PaddingAttribute.symmetric(horizontal: value);
}

PaddingAttribute paddingVertical(double value) {
  /// padding vertical.
  return PaddingAttribute.symmetric(vertical: value);
}

const paddingInsets = PaddingAttribute.from;

PaddingAttribute paddingStart(double value) {
  return PaddingAttribute.directionalOnly(start: value);
}

PaddingAttribute paddingEnd(double value) {
  return PaddingAttribute.directionalOnly(end: value);
}
