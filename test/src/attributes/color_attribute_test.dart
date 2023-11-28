import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/color_attribute.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ColorAttribute', () {
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

    // ignore: avoid_function_literals_in_foreach_calls
    return colorList.forEach((color) {
      test('ColorAttribute.from resolves correctly', () {
        final colorAttribute = ColorDto(color);
        final resolvedValue = colorAttribute.resolve(EmptyMixData);
        expect(resolvedValue, color);
      });
    });
  });
}
