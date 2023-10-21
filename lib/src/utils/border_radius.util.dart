// ignore_for_file: no-equal-arguments

import '../attributes/border_radius.attribute.dart';
import '../attributes/border_radius_directional.attribute.dart';
import '../core/dto/radius.dto.dart';

const borderRadius = BorderRadiusAttribute.all;
const borderRadiusOnly = BorderRadiusAttribute.only;
const borderRadiusDirectional = BorderRadiusDirectionalAttribute.only;

BorderRadiusAttribute rounded(double value) {
  return BorderRadiusAttribute.circular(value);
}

BorderRadiusAttribute squared() {
  return borderRadius(RadiusDto.zero);
}

BorderRadiusAttribute roundedOnly({
  double? topLeft,
  double? topRight,
  double? bottomLeft,
  double? bottomRight,
}) {
  return borderRadiusOnly(
    topLeft: topLeft == null ? null : RadiusDto.circular(topLeft),
    topRight: topRight == null ? null : RadiusDto.circular(topRight),
    bottomLeft: bottomLeft == null ? null : RadiusDto.circular(bottomLeft),
    bottomRight: bottomRight == null ? null : RadiusDto.circular(bottomRight),
  );
}

BorderRadiusDirectionalAttribute roundedDirectionalOnly({
  double? topStart,
  double? topEnd,
  double? bottomStart,
  double? bottomEnd,
}) {
  return borderRadiusDirectional(
    topStart: topStart == null ? null : RadiusDto.circular(topStart),
    topEnd: topEnd == null ? null : RadiusDto.circular(topEnd),
    bottomStart: bottomStart == null ? null : RadiusDto.circular(bottomStart),
    bottomEnd: bottomEnd == null ? null : RadiusDto.circular(bottomEnd),
  );
}

BorderRadiusAttribute roundedHorizontal({double? left, double? right}) {
  return borderRadiusOnly(
    topLeft: left == null ? null : RadiusDto.circular(left),
    topRight: right == null ? null : RadiusDto.circular(right),
    bottomLeft: left == null ? null : RadiusDto.circular(left),
    bottomRight: right == null ? null : RadiusDto.circular(right),
  );
}

BorderRadiusDirectionalAttribute roundedDirectionalHorizontal({
  double? start,
  double? end,
}) {
  return borderRadiusDirectional(
    topStart: start == null ? null : RadiusDto.circular(start),
    topEnd: end == null ? null : RadiusDto.circular(end),
    bottomStart: start == null ? null : RadiusDto.circular(start),
    bottomEnd: end == null ? null : RadiusDto.circular(end),
  );
}

BorderRadiusAttribute roundedVertical({double? top, double? bottom}) {
  return borderRadiusOnly(
    topLeft: top == null ? null : RadiusDto.circular(top),
    topRight: top == null ? null : RadiusDto.circular(top),
    bottomLeft: bottom == null ? null : RadiusDto.circular(bottom),
    bottomRight: bottom == null ? null : RadiusDto.circular(bottom),
  );
}

BorderRadiusDirectionalAttribute roundedDirectionalVertical({
  double? top,
  double? bottom,
}) {
  return borderRadiusDirectional(
    topStart: top == null ? null : RadiusDto.circular(top),
    topEnd: top == null ? null : RadiusDto.circular(top),
    bottomStart: bottom == null ? null : RadiusDto.circular(bottom),
    bottomEnd: bottom == null ? null : RadiusDto.circular(bottom),
  );
}
