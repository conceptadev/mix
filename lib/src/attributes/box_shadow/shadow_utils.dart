import 'package:flutter/material.dart';

import '../color/color_dto.dart';
import '../decoration/box_decoration_attribute.dart';
import 'box_shadow.dto.dart';

DecorationAttribute boxShadow({
  Color? color,
  Offset? offset,
  double? blurRadius,
  double? spreadRadius,
}) {
  final boxShadow = BoxShadowDto(
    color: color == null ? null : ColorDto(color),
    offset: offset,
    blurRadius: blurRadius,
    spreadRadius: spreadRadius,
  );

  return DecorationAttribute(boxShadow: [boxShadow]);
}

@Deprecated('Use boxShadow() instead')
DecorationAttribute shadow({
  Color? color,
  Offset? offset,
  double? blurRadius,
  double? spreadRadius,
}) {
  return boxShadow(
    color: color,
    offset: offset,
    blurRadius: blurRadius,
    spreadRadius: spreadRadius,
  );
}

DecorationAttribute elevation(int elevation) {
  const elevationOptions = [0, 1, 2, 3, 4, 6, 8, 9, 12, 16, 24];
  assert(
    elevationOptions.contains(elevation),
    'Elevation must be one of the following: ${elevationOptions.join(', ')}',
  );

  final elevations = kElevationToShadow[elevation]!;

  if (elevation == 0) {
    const boxShadow = BoxShadowDto(
      color: ColorDto(Colors.transparent),
      offset: Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 0,
    );

    return const DecorationAttribute(
      boxShadow: [boxShadow, boxShadow, boxShadow, boxShadow],
    );
  }

  return DecorationAttribute(
    boxShadow: elevations.map(BoxShadowDto.fromBoxShadow).toList(),
  );
}
