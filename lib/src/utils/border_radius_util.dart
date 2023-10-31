import 'package:flutter/material.dart';

import '../attributes/visual_attributes.dart';
import '../core/dto/border_dto.dart';

BorderRadiusGeometryAttribute borderRadius(Radius radius) {
  return BorderRadiusGeometryDto.all(radius).asAttribute;
}

BorderRadiusGeometryAttribute rounded(double radius) {
  return borderRadius(Radius.circular(radius));
}

BorderRadiusGeometryAttribute squared() {
  return borderRadius(Radius.zero);
}
