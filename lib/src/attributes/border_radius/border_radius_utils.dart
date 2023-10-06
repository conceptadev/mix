// const BorderRadiusDirectional.all(Radius radius) : this.only(
//   topStart: radius,
//   topEnd: radius,
//   bottomStart: radius,
//   bottomEnd: radius,
// );

// /// Creates a border radius where all radii are [Radius.circular(radius)].
// BorderRadiusDirectional.circular(double radius) : this.all(
//   Radius.circular(radius),
// );

// /// Creates a vertically symmetric border radius where the top and bottom
// /// sides of the rectangle have the same radii.
// const BorderRadiusDirectional.vertical({
//   Radius top = Radius.zero,
//   Radius bottom = Radius.zero,
// }) : this.only(
//   topStart: top,
//   topEnd: top,
//   bottomStart: bottom,
//   bottomEnd: bottom,
// );

// /// Creates a horizontally symmetrical border radius where the start and end
// /// sides of the rectangle have the same radii.
// const BorderRadiusDirectional.horizontal({
//   Radius start = Radius.zero,
//   Radius end = Radius.zero,
// }) : this.only(
//   topStart: start,
//   topEnd: end,
//   bottomStart: start,
//   bottomEnd: end,
// );

// /// Creates a border radius with only the given non-zero values. The other
// /// corners will be right angles.
// const BorderRadiusDirectional.only({
//   this.topStart = Radius.zero,
//   this.topEnd = Radius.zero,
//   this.bottomStart = Radius.zero,
//   this.bottomEnd = Radius.zero,
// });

//   const BorderRadius.all(Radius radius) : this.only(
//   topLeft: radius,
//   topRight: radius,
//   bottomLeft: radius,
//   bottomRight: radius,
// );

// /// Creates a border radius where all radii are [Radius.circular(radius)].
// BorderRadius.circular(double radius) : this.all(
//   Radius.circular(radius),
// );

// /// Creates a vertically symmetric border radius where the top and bottom
// /// sides of the rectangle have the same radii.
// const BorderRadius.vertical({
//   Radius top = Radius.zero,
//   Radius bottom = Radius.zero,
// }) : this.only(
//   topLeft: top,
//   topRight: top,
//   bottomLeft: bottom,
//   bottomRight: bottom,
// );

// /// Creates a horizontally symmetrical border radius where the left and right
// /// sides of the rectangle have the same radii.
// const BorderRadius.horizontal({
//   Radius left = Radius.zero,
//   Radius right = Radius.zero,
// }) : this.only(
//   topLeft: left,
//   topRight: right,
//   bottomLeft: left,
//   bottomRight: right,
// );

// /// Creates a border radius with only the given non-zero values. The other
// /// corners will be right angles.
// const BorderRadius.only({
//   this.topLeft = Radius.zero,
//   this.topRight = Radius.zero,
//   this.bottomLeft = Radius.zero,
//   this.bottomRight = Radius.zero,
// // });

import 'package:flutter/material.dart';

import 'border_radius_attribute.dart';

const borderRadius = BorderRadiusAttribute.only;
const borderRadiusDirectional = BorderRadiusAttribute.directionalOnly;

StyledContainerAttributes rounded(double value) {
  return _borderRadius(BorderRadiusDto.all(RadiusDto.circular(value)));
}

StyledContainerAttributes squared() {
  return _borderRadius(BorderRadiusDto.zero);
}

StyledContainerAttributes roundedOnly({
  double? topLeft,
  double? topRight,
  double? bottomLeft,
  double? bottomRight,
}) {
  return _borderRadius(
    BorderRadiusDto.only(
      bottomLeft: bottomLeft != null ? RadiusDto.circular(bottomLeft) : null,
      bottomRight: bottomRight != null ? RadiusDto.circular(bottomRight) : null,
      topLeft: topLeft != null ? RadiusDto.circular(topLeft) : null,
      topRight: topRight != null ? RadiusDto.circular(topRight) : null,
    ),
  );
}

StyledContainerAttributes roundedDirectionalOnly({
  double? topStart,
  double? topEnd,
  double? bottomStart,
  double? bottomEnd,
}) {
  return _borderRadius(
    BorderRadiusDirectionalDto.only(
      bottomEnd: bottomEnd != null ? RadiusDto.circular(bottomEnd) : null,
      bottomStart: bottomStart != null ? RadiusDto.circular(bottomStart) : null,
      topEnd: topEnd != null ? RadiusDto.circular(topEnd) : null,
      topStart: topStart != null ? RadiusDto.circular(topStart) : null,
    ),
  );
}

StyledContainerAttributes roundedHorizontal({double? left, double? right}) {
  return _borderRadius(
    BorderRadiusDto.horizontal(
      left: left != null ? RadiusDto.circular(left) : null,
      right: right != null ? RadiusDto.circular(right) : null,
    ),
  );
}

StyledContainerAttributes roundedVertical({double? top, double? bottom}) {
  return _borderRadius(
    BorderRadiusDto.vertical(
      bottom: bottom != null ? RadiusDto.circular(bottom) : null,
      top: top != null ? RadiusDto.circular(top) : null,
    ),
  );
}

StyledContainerAttributes roundedDirectionalHorizontal({
  double? start,
  double? end,
}) {
  return _borderRadius(
    BorderRadiusDirectionalDto.horizontal(
      end: end != null ? RadiusDto.circular(end) : null,
      start: start != null ? RadiusDto.circular(start) : null,
    ),
  );
}

StyledContainerAttributes roundedDirectionalVertical({
  double? top,
  double? bottom,
}) {
  return _borderRadius(
    BorderRadiusDirectionalDto.vertical(
      bottom: bottom != null ? RadiusDto.circular(bottom) : null,
      top: top != null ? RadiusDto.circular(top) : null,
    ),
  );
}
