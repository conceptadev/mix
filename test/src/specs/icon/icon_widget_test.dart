import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  testWidgets(
    'Icon should apply decorators only once',
    (tester) async {
      await tester.pumpMaterialApp(
        StyledIcon(
          Icons.ac_unit,
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

  testWidgets(
    'AnimatedStyledIcon should apply decorators only once',
    (tester) async {
      await tester.pumpMaterialApp(
        AnimatedStyledIcon(
          AnimatedIcons.add_event,
          style: Style(
            height(100),
            width(100),
            align(),
          ),
          progress: const AlwaysStoppedAnimation(0.0),
        ),
      );

      expect(find.byType(Align), findsOneWidget);
    },
  );
}
