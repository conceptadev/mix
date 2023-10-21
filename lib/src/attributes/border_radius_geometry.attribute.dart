import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'border_radius.attribute.dart';
import 'border_radius/radius.dto.dart';
import 'border_radius_directional.attribute.dart';
import 'style_attribute.dart';

abstract class BorderRadiusGeometryAttribute<T extends BorderRadiusGeometry>
    extends StyleAttribute<T> {
  const BorderRadiusGeometryAttribute();

  static BorderRadiusGeometryAttribute from(
    BorderRadiusGeometry borderRadius,
  ) {
    if (borderRadius is BorderRadius) {
      return BorderRadiusAttribute.only(
        topLeft: RadiusDto.from(borderRadius.topLeft),
        topRight: RadiusDto.from(borderRadius.topRight),
        bottomLeft: RadiusDto.from(borderRadius.bottomLeft),
        bottomRight: RadiusDto.from(borderRadius.bottomRight),
      );
    }

    if (borderRadius is BorderRadiusDirectional) {
      return BorderRadiusDirectionalAttribute.only(
        topStart: RadiusDto.from(borderRadius.topStart),
        topEnd: RadiusDto.from(borderRadius.topEnd),
        bottomStart: RadiusDto.from(borderRadius.bottomStart),
        bottomEnd: RadiusDto.from(borderRadius.bottomEnd),
      );
    }

    throw UnsupportedError(
      'Cannot create a border radius attribute from a border radius of type ${borderRadius.runtimeType}',
    );
  }

  @override
  BorderRadiusGeometryAttribute<T> merge(
    covariant BorderRadiusGeometryAttribute<T>? other,
  );

  @override
  T resolve(MixData mix);
}
