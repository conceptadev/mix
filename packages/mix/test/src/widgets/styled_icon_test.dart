import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('StyledIcon', () {
    testWidgets(
      'should receive a style from its ancestor widget',
      (tester) async {
        const color = Color(0xffff1744);
        const size = 20.0;

        await tester.pumpMaterialApp(
          Box(
            style: Style(
              $icon.color(color),
              $icon.size(size),
            ),
            child: const StyledIcon(
              Icons.access_time_filled_outlined,
            ),
          ),
        );
        await tester.pumpAndSettle();

        final iconWidget = tester.widget<Icon>(find.byType(Icon));
        expect(iconWidget.color, color);
        expect(iconWidget.size, size);
      },
    );

    testWidgets(
      'should apply modifiers when they are defined in the style',
      (tester) async {
        const key = Key('box');

        await tester.pumpMaterialApp(
          StyledIcon(
            Icons.access_time_filled_outlined,
            style: Style(
              $box.height(100),
              $box.width(50),
              $with.scale(1),
              $with.opacity(0.5),
              $with.rotate(1),
              $with.visibility(true),
              $with.aspectRatio(1),
            ),
            key: key,
          ),
        );

        expect(
          find.descendant(
            of: find.byKey(key),
            matching: find.byType(RenderModifiers),
          ),
          findsNWidgets(2),
        );

        expect(
          find.descendant(
            of: find.byKey(key),
            matching: find.byType(Transform),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byKey(key),
            matching: find.byType(Opacity),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byKey(key),
            matching: find.byType(RotatedBox),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byKey(key),
            matching: find.byType(Visibility),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byKey(key),
            matching: find.byType(AspectRatio),
          ),
          findsOneWidget,
        );
      },
    );
  });
}
