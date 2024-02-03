import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Pressable', () {
    const attribute1 = MockIntScalarAttribute(1);
    const attribute2 = MockStringScalarAttribute('attribute2');
    const attribute3 = MockBooleanScalarAttribute(true);

    testWidgets('Pressable', (tester) async {
      final firstKey = UniqueKey();
      final secondKey = UniqueKey();
      await tester.pumpWidget(Column(
        children: [
          Pressable(onPressed: null, child: Container(key: firstKey)),
          Pressable(
            onPressed: null,
            disabled: true,
            child: Container(key: secondKey),
          ),
        ],
      ));

      final onEnabledAttr = onEnabled(attribute1, attribute2, attribute3);

      final firstContext = tester.element(find.byKey(firstKey));
      final secondContext = tester.element(find.byKey(secondKey));

      final firstNotifier = WidgetStateNotifier.of(firstContext);
      final secondNotifier = WidgetStateNotifier.of(secondContext);

      expect(onEnabledAttr.when(firstContext), true);
      expect(firstNotifier!.status, WidgetStatus.enabled);
      expect(onEnabledAttr.when(secondContext), false);
      expect(secondNotifier!.status, WidgetStatus.disabled);
    });

    testWidgets(
      'must be clickable when isDisabled is setted to false',
      (tester) async {
        int counter = 0;

        await tester.pumpWidget(
          Pressable(
            onPressed: () {
              counter++;
            },
            disabled: false,
            child: Container(),
          ),
        );

        final pressableFinder = find.byType(Pressable);
        expect(pressableFinder, findsOneWidget);

        await tester.tap(pressableFinder);
        await tester.pumpAndSettle();

        expect(counter, 1);
      },
    );

    testWidgets(
      'must be unclickable when isDisabled is setted to true',
      (tester) async {
        int counter = 0;

        await tester.pumpWidget(
          Pressable(
            onPressed: () {
              counter++;
            },
            disabled: true,
            child: Container(),
          ),
        );

        final pressableFinder = find.byType(Pressable);
        expect(pressableFinder, findsOneWidget);

        await tester.tap(pressableFinder);
        await tester.pumpAndSettle();

        expect(counter, 0);
      },
    );
  });

  group('PressableBox', () {
    testWidgets(
      'must be clickable when isDisabled is setted to false',
      (tester) async {
        int counter = 0;

        await tester.pumpWidget(
          PressableBox(
            onPressed: () {
              counter++;
            },
            unpressDelay: Duration.zero,
            animationDuration: Duration.zero,
            disabled: false,
            child: Container(),
          ),
        );

        final pressableFinder = find.byType(PressableBox);
        expect(pressableFinder, findsOneWidget);

        await tester.tap(pressableFinder);
        await tester.pumpAndSettle();

        expect(counter, 1);
      },
    );

    testWidgets(
      'must be unclickable when isDisabled is setted to true',
      (tester) async {
        int counter = 0;

        await tester.pumpWidget(
          PressableBox(
            onPressed: () {
              counter++;
            },
            unpressDelay: Duration.zero,
            animationDuration: Duration.zero,
            disabled: true,
            child: Container(),
          ),
        );

        final pressableFinder = find.byType(PressableBox);
        expect(pressableFinder, findsOneWidget);

        await tester.tap(pressableFinder);
        await tester.pumpAndSettle();

        expect(counter, 0);
      },
    );
  });
}
