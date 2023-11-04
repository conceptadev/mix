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
  testScalarAttribute<ColorAttribute, Color>(
      'ColorAttribute', (value) => ColorAttribute(value), colorList);

  testScalarAttribute<ColorAttribute, Color>(
    'ImageColorAttribute',
    (value) => ImageColorAttribute(value),
    colorList,
  );

  testScalarAttribute<ColorAttribute, Color>(
    'IconColorAttribute',
    (value) => IconColorAttribute(value),
    colorList,
  );
}
