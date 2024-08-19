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
        'size': ButtonSize.values,
        'variant': ButtonVariant.values,
        'disabled': [true, false],
        'loading': [false],
        'iconLeft': [null, Icons.add],
        'iconRight': [null, Icons.arrow_forward],
      },
      builder: (params) => RxButton(
        onPressed: () {},
        label: params['label'],
        size: params['size'],
        variant: params['variant'],
        disabled: params['disabled'],
        loading: params['loading'],
        iconLeft: params['iconLeft'],
        iconRight: params['iconRight'],
      ),
    );
  });
}
