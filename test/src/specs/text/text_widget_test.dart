import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  testWidgets(
    'StyledText should apply decorators only once',
    (tester) async {
      await tester.pumpMaterialApp(
        StyledText(
          'test',
          style: Style(
            height(100),
            width(100),
            align(),
          ),
        ),
      );

      expect(find.byType(Align), findsOneWidget);
    },
  );
}
