import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remix/components/button/button.dart';

import '../../utils/golden_tests/golden_test_utils.dart';

void main() {
  testWidgets('Button renders correctly', (tester) async {
    goldenTest(
      tester,
      {
        'label': ['click'],
        'disabled': [true, false],
        'loading': [false],
        'iconLeft': [null, Icons.add],
        'iconRight': [null, Icons.arrow_forward],
      },
      builder: (params) => XButton(
        onPressed: () {},
        label: params['label'],
        disabled: params['disabled'],
        loading: params['loading'],
        iconLeft: params['iconLeft'],
        iconRight: params['iconRight'],
      ),
    );
  });
}
