import 'package:flutter/material.dart';

import '../attributes/data_attributes.dart';
import '../core/dto/border_dto.dart';

BorderRadiusGeometryAttribute borderRadius(Radius radius) {
  return BorderRadiusGeometryData.all(radius).toAttribute();
}

BorderRadiusGeometryAttribute rounded(double radius) {
  return borderRadius(Radius.circular(radius));
}

BorderRadiusGeometryAttribute squared() {
  return borderRadius(Radius.zero);
}
