import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remix/components/callout/callout.dart';

import '../../utils/golden_tests/golden_test_utils.dart';

void main() {
  testWidgets('Callout renders correctly', (tester) async {
    goldenTest(
      tester,
      {
        'text': [
          'Lorem Ipsum',
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,'
        ],
        'variant': CalloutVariant.values,
        'icon': [null, Icons.info],
      },
      builder: (params) => RxCallout(
        text: params['text'],
        variant: params['variant'],
        icon: params['icon'],
      ),
    );
  });
}
