import 'package:flutter/material.dart';

import '../helpers/list.attribute.dart';
import 'box_shadow.attribute.dart';
import 'shadow.attribute.dart';
import 'shadow_color.attribute.dart';

BoxShadowAttribute boxShadow({
  Color? color,
  Offset? offset,
  double? blurRadius,
  double? spreadRadius,
}) {
  return BoxShadowAttribute(
    color: color == null ? null : ShadowColorAttribute(color),
    offset: offset,
    blurRadius: blurRadius,
    spreadRadius: spreadRadius,
  );
}

ShadowAttribute shadow({Color? color, Offset? offset, double? blurRadius}) {
  return ShadowAttribute(
    blurRadius: blurRadius,
    color: color == null ? null : ShadowColorAttribute(color),
    offset: offset,
  );
}

ListAtttribute<BoxShadowAttribute> elevation(int elevation) {
  const elevationOptions = [0, 1, 2, 3, 4, 6, 8, 9, 12, 16, 24];
  assert(
    elevationOptions.contains(elevation),
    'Elevation must be one of the following: ${elevationOptions.join(', ')}',
  );

  final elevations = kElevationToShadow[elevation]!;

  if (elevation == 0) {
    const boxShadow = BoxShadowAttribute(
      color: ShadowColorAttribute(Colors.transparent),
      offset: Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 0,
    );

    return const ListAtttribute([boxShadow]);
  }
  // can you merge into 1 shadow?

  final shadows = elevations.map(BoxShadowAttribute.fromBoxShadow).toList();

  return ListAtttribute(shadows);
}
