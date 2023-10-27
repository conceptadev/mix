import 'package:flutter/material.dart';

import '../attributes/value_attributes.dart';
import '../core/dto/border_dto.dart';
import '../helpers/extensions/helper_ext.dart';

BorderRadiusGeometryAttribute borderRadius(Radius radius) {
  return BorderRadiusGeometryDto.all(radius.dto).asAttribute;
}

BorderRadiusGeometryAttribute rounded(double radius) {
  return borderRadius(Radius.circular(radius));
}

BorderRadiusGeometryAttribute squared() {
  return borderRadius(Radius.zero);
}
