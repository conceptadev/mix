import 'package:flutter/material.dart';

import '../base/color.dto.dart';
import 'box_shadow.attribute.dart';
import 'shadow.attribute.dart';

BoxShadowAttribute boxShadow({
  Color? color,
  Offset? offset,
  double? blurRadius,
  double? spreadRadius,
}) {
  return BoxShadowAttribute(
    color: ColorDto.maybeFrom(color),
    offset: offset,
    blurRadius: blurRadius,
    spreadRadius: spreadRadius,
  );
}

ShadowAttribute shadow({Color? color, Offset? offset, double? blurRadius}) {
  return ShadowAttribute(
    blurRadius: blurRadius,
    color: ColorDto.maybeFrom(color),
    offset: offset,
  );
}

List<BoxShadowAttribute> elevation(int elevation) {
  const elevationOptions = [0, 1, 2, 3, 4, 6, 8, 9, 12, 16, 24];
  assert(
    elevationOptions.contains(elevation),
    'Elevation must be one of the following: ${elevationOptions.join(', ')}',
  );

  final elevations = kElevationToShadow[elevation]!;

  if (elevation == 0) {
    const boxShadow = BoxShadowAttribute(
      color: ColorDto(Colors.transparent),
      offset: Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 0,
    );

    return [boxShadow];
  }

  return elevations.map(BoxShadowAttribute.fromBoxShadow).toList();
}
