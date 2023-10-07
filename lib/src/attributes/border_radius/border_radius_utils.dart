// ignore_for_file: no-equal-arguments

import 'border_radius_attribute.dart';
import 'radius_attribute.dart';

const borderRadius = BorderRadiusAttribute.all;
const borderRadiusOnly = BorderRadiusAttribute.only;
const borderRadiusDirectional = BorderRadiusAttribute.directionalOnly;

BorderRadiusAttribute rounded(double value) {
  return BorderRadiusAttribute.circular(value);
}

BorderRadiusAttribute squared() {
  return borderRadius(const RadiusAttribute.zero());
}

BorderRadiusAttribute roundedOnly({
  double? topLeft,
  double? topRight,
  double? bottomLeft,
  double? bottomRight,
}) {
  return borderRadiusOnly(
    bottomLeft:
        bottomLeft == null ? null : RadiusAttribute.circular(bottomLeft),
    bottomRight:
        bottomRight == null ? null : RadiusAttribute.circular(bottomRight),
    topLeft: topLeft == null ? null : RadiusAttribute.circular(topLeft),
    topRight: topRight == null ? null : RadiusAttribute.circular(topRight),
  );
}

BorderRadiusAttribute roundedDirectionalOnly({
  double? topStart,
  double? topEnd,
  double? bottomStart,
  double? bottomEnd,
}) {
  return borderRadiusDirectional(
    bottomStart:
        bottomStart == null ? null : RadiusAttribute.circular(bottomStart),
    bottomEnd: bottomEnd == null ? null : RadiusAttribute.circular(bottomEnd),
    topStart: topStart == null ? null : RadiusAttribute.circular(topStart),
    topEnd: topEnd == null ? null : RadiusAttribute.circular(topEnd),
  );
}

BorderRadiusAttribute roundedHorizontal({double? left, double? right}) {
  return borderRadiusOnly(
    bottomLeft: left == null ? null : RadiusAttribute.circular(left),
    bottomRight: right == null ? null : RadiusAttribute.circular(right),
    topLeft: left == null ? null : RadiusAttribute.circular(left),
    topRight: right == null ? null : RadiusAttribute.circular(right),
  );
}

BorderRadiusAttribute roundedDirectionalHorizontal({
  double? start,
  double? end,
}) {
  return borderRadiusDirectional(
    bottomStart: start == null ? null : RadiusAttribute.circular(start),
    bottomEnd: end == null ? null : RadiusAttribute.circular(end),
    topStart: start == null ? null : RadiusAttribute.circular(start),
    topEnd: end == null ? null : RadiusAttribute.circular(end),
  );
}

BorderRadiusAttribute roundedVertical({double? top, double? bottom}) {
  return borderRadiusOnly(
    bottomLeft: bottom == null ? null : RadiusAttribute.circular(bottom),
    bottomRight: bottom == null ? null : RadiusAttribute.circular(bottom),
    topLeft: top == null ? null : RadiusAttribute.circular(top),
    topRight: top == null ? null : RadiusAttribute.circular(top),
  );
}

BorderRadiusAttribute roundedDirectionalVertical({
  double? top,
  double? bottom,
}) {
  return borderRadiusDirectional(
    bottomStart: bottom == null ? null : RadiusAttribute.circular(bottom),
    bottomEnd: bottom == null ? null : RadiusAttribute.circular(bottom),
    topStart: top == null ? null : RadiusAttribute.circular(top),
    topEnd: top == null ? null : RadiusAttribute.circular(top),
  );
}
