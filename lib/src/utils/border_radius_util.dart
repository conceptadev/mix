import '../attributes/value_attributes.dart';

const borderRadius = BorderRadiusGeometryAttribute.all;
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
    bottomLeft: bottomLeft == null ? null : RadiusDto.circular(bottomLeft),
    bottomRight: bottomRight == null ? null : RadiusDto.circular(bottomRight),
    topLeft: topLeft == null ? null : RadiusDto.circular(topLeft),
    topRight: topRight == null ? null : RadiusDto.circular(topRight),
  );
}

BorderRadiusDirectionalAttribute roundedDirectionalOnly({
  double? topStart,
  double? topEnd,
  double? bottomStart,
  double? bottomEnd,
}) {
  return borderRadiusDirectional(
    bottomEnd: bottomEnd == null ? null : RadiusDto.circular(bottomEnd),
    bottomStart: bottomStart == null ? null : RadiusDto.circular(bottomStart),
    topEnd: topEnd == null ? null : RadiusDto.circular(topEnd),
    topStart: topStart == null ? null : RadiusDto.circular(topStart),
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

BorderRadiusDirectionalAttribute roundedDirectionalHorizontal({
  double? start,
  double? end,
}) {
  return borderRadiusDirectional(
    bottomEnd: end == null ? null : RadiusDto.circular(end),
    bottomStart: start == null ? null : RadiusDto.circular(start),
    topEnd: end == null ? null : RadiusDto.circular(end),
    topStart: start == null ? null : RadiusDto.circular(start),
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

BorderRadiusDirectionalAttribute roundedDirectionalVertical({
  double? top,
  double? bottom,
}) {
  return borderRadiusDirectional(
    bottomEnd: bottom == null ? null : RadiusDto.circular(bottom),
    bottomStart: bottom == null ? null : RadiusDto.circular(bottom),
    topEnd: top == null ? null : RadiusDto.circular(top),
    topStart: top == null ? null : RadiusDto.circular(top),
  );
}
