import '../attributes/space_attribute.dart';

const margin = MarginAttribute.all;
MarginAttribute marginTop(double value) {
  return MarginAttribute.only(top: value);
}

MarginAttribute marginBottom(double value) {
  return MarginAttribute.only(bottom: value);
}

MarginAttribute marginLeft(double value) {
  return MarginAttribute.only(left: value);
}

MarginAttribute marginRight(double value) {
  return MarginAttribute.only(right: value);
}

MarginAttribute marginSymmetric({double? horizontal, double? vertical}) {
  return MarginAttribute.symmetric(horizontal: horizontal, vertical: vertical);
}

MarginAttribute marginHorizontal(double value) {
  return MarginAttribute.symmetric(horizontal: value);
}

MarginAttribute marginVertical(double value) {
  /// Margin vertical.
  return MarginAttribute.symmetric(vertical: value);
}

const marginInsets = MarginAttribute.from;

MarginAttribute marginStart(double value) {
  return MarginAttribute.directionalOnly(start: value);
}

MarginAttribute marginEnd(double value) {
  return MarginAttribute.directionalOnly(end: value);
}
