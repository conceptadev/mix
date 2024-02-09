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
      final thirdKey = UniqueKey();
      await tester.pumpWidget(Column(
        children: [
          Pressable(onPress: null, child: Container(key: firstKey)),
          Pressable(
            disabled: true,
            onPress: null,
            child: Container(key: secondKey),
          ),
          // Test with a onpress function
          Pressable(onPress: () {}, child: Container(key: thirdKey)),
        ],
      ));

      final onEnabledAttr = onEnabled(attribute1, attribute2, attribute3);

      final firstContext = tester.element(find.byKey(firstKey));
      final secondContext = tester.element(find.byKey(secondKey));
      final thirdContext = tester.element(find.byKey(thirdKey));

      final firstNotifier = PressableDataNotifier.of(firstContext);
      final secondNotifier = PressableDataNotifier.of(secondContext);
      final thirdNotifier = PressableDataNotifier.of(thirdContext);

      expect(onEnabledAttr.when(firstContext), false);
      expect(firstNotifier.disabled, true);
      expect(onEnabledAttr.when(secondContext), false);
      expect(secondNotifier.disabled, true);

      expect(onEnabledAttr.when(thirdContext), true);
      expect(thirdNotifier.disabled, false);
    });

    testWidgets(
      'must be clickable when isDisabled is setted to false',
      (tester) async {
        int counter = 0;

        await tester.pumpWidget(
          Pressable(
            disabled: false,
            onPress: () {
              counter++;
            },
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
            disabled: true,
            onPress: () {
              counter++;
            },
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
            unpressDelay: Duration.zero,
            onPress: () {
              counter++;
            },
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
            unpressDelay: Duration.zero,
            onPress: () {
              counter++;
            },
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
