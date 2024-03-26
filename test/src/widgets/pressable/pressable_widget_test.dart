import 'package:flutter/gestures.dart';
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

      final firstNotifier = PressableState.of(firstContext);
      final secondNotifier = PressableState.of(secondContext);
      final thirdNotifier = PressableState.of(thirdContext);

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
        await tester.pumpAndSettle(const Duration(milliseconds: 200));

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

    testWidgets('must change to attributes in onHover variant when hovered',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        condition: onHover,
        action: () => tester.hover(find.byType(PressableBox)),
      );
    });

    testWidgets(
        'must change to attributes inside onLongPressed variant when long pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        condition: onLongPressed,
        action: () => tester.longPress(find.byType(PressableBox)),
      );
    });

    testWidgets('must restyle using attributes inside onPressed when pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: onPressed,
        action: () async {
          await tester.tap(find.byType(PressableBox));
          await tester.pump();
        },
      );
    });

    testWidgets(
        'must restyle using attributes inside (onLongPressed | onHover) when hovered',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        condition: (onLongPressed | onHover),
        action: () => tester.hover(find.byType(PressableBox)),
      );
    });

    testWidgets(
        'must restyle using attributes inside (onLongPressed | onHover) when long pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        condition: (onLongPressed | onHover),
        action: () => tester.longPress(find.byType(PressableBox)),
      );
    });

    testWidgets(
        'must NOT restyle using attributes inside (onLongPressed | onHover) when Pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: (onLongPressed | onHover),
        action: () async {
          await tester.tap(find.byType(PressableBox));
          await tester.pump();
        },
        finalExpectedOpacity: 0.5,
      );
    });

    testWidgets(
        'must restyle using attributes inside (onHover | onPressed) when pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: (onHover | onPressed),
        action: () async {
          await tester.tap(find.byType(PressableBox));
          await tester.pump();
        },
      );
    });

    testWidgets(
        'must restyle using attributes inside (onHover | onPressed) when hovered',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: (onHover | onPressed),
        action: () async {
          await tester.hover(find.byType(PressableBox));
        },
      );
    });

    testWidgets(
        'must NOT restyle using attributes inside (onHover | onPressed) when long pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: (onHover | onPressed),
        action: () async {
          await tester.longPress(find.byType(PressableBox));
        },
        finalExpectedOpacity: 0.5,
      );
    });

    testWidgets(
        'must restyle using attributes inside (onLongPressed | onPressed) when pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: (onLongPressed | onPressed),
        action: () async {
          await tester.tap(find.byType(PressableBox));
          await tester.pump();
        },
      );
    });

    testWidgets(
        'must restyle using attributes inside (onLongPressed | onPressed) when long pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        condition: (onLongPressed | onPressed),
        action: () async {
          await tester.longPress(find.byType(PressableBox));
        },
      );
    });

    testWidgets(
        'must NOT restyle using attributes inside (onLongPressed | onPressed) when hovered',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        condition: (onLongPressed | onPressed),
        action: () async {
          await tester.hover(find.byType(PressableBox));
        },
        finalExpectedOpacity: 0.5,
      );
    });

    testWidgets(
        'must restyle using attributes inside (onHover & onPressed) when hovered & pressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        duration: const Duration(milliseconds: 250),
        condition: (onHover & onPressed),
        action: () async {
          await tester.hover(find.byType(PressableBox));
          await tester.pump();
          await tester.tap(find.byType(PressableBox));
          await tester.pump();
        },
      );
    });

    testWidgets(
        'must restyle using attributes inside (onHover & onLongPress) when hovered & longPressed',
        (WidgetTester tester) async {
      await pumpTestCase(
        tester: tester,
        condition: (onHover & onLongPressed),
        action: () async {
          await tester.hover(find.byType(PressableBox));
          await tester.pump();

          // Custom way to long press
          final gesture = await tester.createGesture();
          await gesture.addPointer(
            location: tester.getCenter(find.byType(PressableBox)),
          );

          await gesture.down(
            tester.getCenter(find.byType(PressableBox)),
          );
          addTearDown(gesture.removePointer);

          await tester.pump(kLongPressTimeout);
        },
      );
    });
  });
}

extension WidgetTesterExt on WidgetTester {
  Future<void> hover(FinderBase<Element> finder) async {
    FocusManager.instance.highlightStrategy =
        FocusHighlightStrategy.alwaysTraditional;

    final gesture = await createGesture(kind: PointerDeviceKind.mouse);

    await gesture.addPointer(location: Offset.zero);
    await pump();
    await gesture.moveTo(getCenter(finder));

    await pumpAndSettle();

    addTearDown(gesture.removePointer);
  }
}

Future<void> pumpTestCase({
  required WidgetTester tester,
  Duration duration = Duration.zero,
  required condition,
  required Future<void> Function() action,
  double finalExpectedOpacity = 1,
}) async {
  await tester.pumpWidget(
    PressableBox(
      unpressDelay: duration,
      onPress: () {},
      disabled: false,
      style: Style(
        opacity(0.5),
        height(50),
        width(50),
        condition(
          opacity(1),
        ),
      ),
      child: const SizedBox(),
    ),
  );

  final opacityFinder = find.byType(Opacity);
  expect(opacityFinder, findsOneWidget);

  final oldValue = tester.widget<Opacity>(opacityFinder).opacity;
  expect(oldValue, 0.5);

  await action();
  final newValue = tester.widget<Opacity>(opacityFinder).opacity;

  expect(opacityFinder, findsOneWidget);
  expect(newValue, finalExpectedOpacity);

  await tester.pumpAndSettle(const Duration(milliseconds: 250));
}
