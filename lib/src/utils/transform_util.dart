import 'package:flutter/widgets.dart';

import '../attributes/visual_attributes.dart';

const matrix4 = _matrix4;
const transform = _matrix4;

TransformAttribute _matrix4(Matrix4 matrix) {
  return TransformAttribute(matrix);
}
