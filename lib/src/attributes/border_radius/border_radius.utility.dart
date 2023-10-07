// ignore_for_file: no-equal-arguments

import 'border_radius.attribute.dart';
import 'radius.dto.dart';

const borderRadius = BorderRadiusAttribute.all;
const borderRadiusOnly = BorderRadiusAttribute.only;
const borderRadiusDirectional = BorderRadiusAttribute.directionalOnly;

BorderRadiusAttribute rounded(double value) {
  return BorderRadiusAttribute.circular(value);
}

BorderRadiusAttribute squared() {
  return borderRadius(const RadiusDto.zero());
}

BorderRadiusAttribute roundedOnly({
  double? topLeft,
  double? topRight,
  double? bottomLeft,
  double? bottomRight,
}) {
  return borderRadiusOnly(
    bottomLeft: bottomLeft == null ? null : RadiusDto.circular(bottomLeft),
    bottomRight: bottomRight == null ? null : RadiusDto.circular(bottomRight),
    topLeft: topLeft == null ? null : RadiusDto.circular(topLeft),
    topRight: topRight == null ? null : RadiusDto.circular(topRight),
  );
}

BorderRadiusAttribute roundedDirectionalOnly({
  double? topStart,
  double? topEnd,
  double? bottomStart,
  double? bottomEnd,
}) {
  return borderRadiusDirectional(
    bottomStart: bottomStart == null ? null : RadiusDto.circular(bottomStart),
    bottomEnd: bottomEnd == null ? null : RadiusDto.circular(bottomEnd),
    topStart: topStart == null ? null : RadiusDto.circular(topStart),
    topEnd: topEnd == null ? null : RadiusDto.circular(topEnd),
  );
}

BorderRadiusAttribute roundedHorizontal({double? left, double? right}) {
  return borderRadiusOnly(
    bottomLeft: left == null ? null : RadiusDto.circular(left),
    bottomRight: right == null ? null : RadiusDto.circular(right),
    topLeft: left == null ? null : RadiusDto.circular(left),
    topRight: right == null ? null : RadiusDto.circular(right),
  );
}

BorderRadiusAttribute roundedDirectionalHorizontal({
  double? start,
  double? end,
}) {
  return borderRadiusDirectional(
    bottomStart: start == null ? null : RadiusDto.circular(start),
    bottomEnd: end == null ? null : RadiusDto.circular(end),
    topStart: start == null ? null : RadiusDto.circular(start),
    topEnd: end == null ? null : RadiusDto.circular(end),
  );
}

BorderRadiusAttribute roundedVertical({double? top, double? bottom}) {
  return borderRadiusOnly(
    bottomLeft: bottom == null ? null : RadiusDto.circular(bottom),
    bottomRight: bottom == null ? null : RadiusDto.circular(bottom),
    topLeft: top == null ? null : RadiusDto.circular(top),
    topRight: top == null ? null : RadiusDto.circular(top),
  );
}

BorderRadiusAttribute roundedDirectionalVertical({
  double? top,
  double? bottom,
}) {
  return borderRadiusDirectional(
    bottomStart: bottom == null ? null : RadiusDto.circular(bottom),
    bottomEnd: bottom == null ? null : RadiusDto.circular(bottom),
    topStart: top == null ? null : RadiusDto.circular(top),
    topEnd: top == null ? null : RadiusDto.circular(top),
  );
}
