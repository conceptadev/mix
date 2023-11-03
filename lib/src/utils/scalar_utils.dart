import 'package:flutter/material.dart';

import '../attributes/scalar_attribute.dart';

const visible = VisibleAttribute.new;

VisibleAttribute show([bool condition = true]) {
  return VisibleAttribute(condition);
}

VisibleAttribute hide([bool condition = true]) => show(!condition);

StackFitAttribute stackFit(StackFit fit) => StackFitAttribute(fit);

TransformAttribute transform(Matrix4 matrix) {
  return TransformAttribute(matrix);
}

VerticalDirectionAttribute verticalDirection(VerticalDirection direction) {
  return VerticalDirectionAttribute(direction);
}

TextDirectionAttribute textDirection(TextDirection direction) {
  return TextDirectionAttribute(direction);
}
