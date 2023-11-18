import 'package:flutter/material.dart';
import 'package:mix/src/attributes/color_attribute.dart';

import '../../helpers/testing_utils.dart';

void main() {
  const colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.black,
    Colors.white,
    Colors.grey,
  ];
  testScalarAttribute<ScalarColorAttribute, Color>(
    'ColorAttribute',
    (value) => ScalarColorAttribute(value),
    colorList,
  );

  testScalarAttribute<ScalarColorAttribute, Color>(
    'ImageColorAttribute',
    (value) => ImageColorAttribute(value),
    colorList,
  );

  testScalarAttribute<ScalarColorAttribute, Color>(
    'IconColorAttribute',
    (value) => IconColorAttribute(value),
    colorList,
  );
}
