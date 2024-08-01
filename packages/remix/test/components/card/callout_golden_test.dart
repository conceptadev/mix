import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remix/remix.dart';

import '../../utils/golden_tests/golden_test_utils.dart';

void main() {
  testWidgets('Card renders correctly', (tester) async {
    Widget container() => Container(
          height: 50,
          width: 100,
          color: Colors.redAccent,
        );

    goldenTest(
      tester,
      {
        'variant': CardVariant.values,
        'children': [
          <Widget>[],
          [container(), container()],
        ],
        'size': CardSize.values,
      },
      builder: (params) => RxCard(
        variant: params['variant'],
        children: params['children'],
        size: params['size'],
      ),
    );
  });
}
