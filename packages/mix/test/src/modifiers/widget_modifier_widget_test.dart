import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  final style = Style(
    $with.scale(2.0),
    $with.opacity(0.5),
    $with.visibility.on(),
    $with.clipOval(),
    $with.aspectRatio(2.0),
    const CustomModifierAttribute(),
  );

  final mixData = MixData.create(MockBuildContext(), style);

  group('RenderModifiers', () {
    testWidgets('Renders modifiers in the correct order', (tester) async {
      await tester.pumpMaterialApp(
        RenderModifiers(
          modifiers: mixData.modifiers,
          orderOfModifiers: const [],
          child: const Text('child'),
        ),
      );

      expect(find.byType(RenderModifiers), findsOneWidget);

      expect(
        find.descendant(
          of: find.byType(RenderModifiers),
          matching: find.byType(Visibility),
        ),
        findsOneWidget,
      );

      // Similarly, check for AspectRatio, Scale, Clip, and Opacity
      // Ensure each widget is a descendant of the previous one in the correct order
      final aspectRatioFinder = find.descendant(
        of: find.byType(Visibility),
        matching: find.byType(AspectRatio),
      );
      expect(aspectRatioFinder, findsOneWidget);

      final scaleFinder = find.descendant(
        of: aspectRatioFinder,
        matching: find.byType(Transform), // Assuming Scale uses Transform
      );
      expect(scaleFinder, findsOneWidget);

      final clipFinder = find.descendant(
        of: scaleFinder,
        matching: find.byType(ClipOval), // Assuming Clip uses ClipOval
      );
      expect(clipFinder, findsOneWidget);

      final opacityFinder = find.descendant(
        of: clipFinder,
        matching: find.byType(Opacity),
      );
      expect(opacityFinder, findsOneWidget);

      final customWidgetFinder = find.descendant(
        of: opacityFinder,
        matching: find.byType(Padding),
      );

      expect(customWidgetFinder, findsOneWidget);

      expect(
        find.descendant(
          of: customWidgetFinder,
          matching: find.text('child'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Renders child when no modifiers are provided', (tester) async {
      final mixData = MixData.create(MockBuildContext(), Style());

      await tester.pumpMaterialApp(
        RenderModifiers(
          modifiers: mixData.modifiers,
          orderOfModifiers: const [],
          child: const Text('child'),
        ),
      );

      expect(find.text('child'), findsOneWidget);
      expect(find.byType(RenderModifiers), findsOneWidget);
    });

    testWidgets('Renders child when orderOfModifiers is empty', (tester) async {
      final mixData = MixData.create(MockBuildContext(), style);

      await tester.pumpMaterialApp(
        RenderModifiers(
          modifiers: mixData.modifiers,
          orderOfModifiers: const [],
          child: const Text('child'),
        ),
      );

      expect(find.text('child'), findsOneWidget);
      expect(find.byType(RenderModifiers), findsOneWidget);
    });

    testWidgets(
      'Renders modifiers in the correct order with many overrides',
      (tester) async {
        await tester.pumpMaterialApp(
          RenderModifiers(
            modifiers: mixData.modifiers,
            orderOfModifiers: const [
              ClipOvalModifierAttribute,
              AspectRatioModifierAttribute,
              TransformModifierAttribute,
              OpacityModifierAttribute,
              VisibilityModifierAttribute,
            ],
            mix: mixData,
            child: const Text('child'),
          ),
        );

        expect(find.byType(RenderModifiers), findsOneWidget);

        expect(
          find.descendant(
            of: find.byType(RenderModifiers),
            matching: find.byType(ClipOval),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byType(ClipOval),
            matching: find.byType(AspectRatio),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byType(AspectRatio),
            matching: find.byType(Transform),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byType(Transform),
            matching: find.byType(Opacity),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byType(Opacity),
            matching: find.byType(Padding),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byType(Padding),
            matching: find.text('child'),
          ),
          findsOneWidget,
        );
      },
    );

    //  Allow for only a few overrides
    testWidgets(
      'Renders modifiers in the correct order with a few overrides',
      (tester) async {
        await tester.pumpMaterialApp(
          RenderModifiers(
            mix: mixData,
            modifiers: mixData.modifiers,
            orderOfModifiers: const [
              ClipOvalModifierAttribute,
              AspectRatioModifierAttribute
            ],
            child: const Text('child'),
          ),
        );

        expect(find.byType(RenderModifiers), findsOneWidget);

        expect(
          find.descendant(
            of: find.byType(RenderModifiers),
            matching: find.byType(ClipOval),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byType(ClipOval),
            matching: find.byType(AspectRatio),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byType(AspectRatio),
            matching: find.byType(Visibility),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byType(Visibility),
            matching: find.byType(Transform),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byType(Transform),
            matching: find.byType(Opacity),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byType(Opacity),
            matching: find.byType(Padding),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byType(Padding),
            matching: find.text('child'),
          ),
          findsOneWidget,
        );
      },
    );
  });

  group('RenderAnimatedModifiers', () {
    testWidgets('Renders animated modifiers', (tester) async {
      final mixData = MixData.create(MockBuildContext(), style);

      await tester.pumpMaterialApp(
        RenderAnimatedModifiers(
          modifiers: mixData.modifiers,
          orderOfModifiers: const [],
          duration: const Duration(milliseconds: 300),
          child: const Text('child'),
        ),
      );

      expect(find.text('child'), findsOneWidget);
      expect(find.byType(RenderAnimatedModifiers), findsOneWidget);

      // Trigger animation and pump frames
      await tester.pump(const Duration(milliseconds: 150));
      await tester.pump(const Duration(milliseconds: 150));
    });
  });

  group('Modifiers attributes', () {
    testWidgets(
      'should be applied to the first one. The children wont inherit even though the second one is set to inherit',
      (tester) async {
        const key = Key('box');

        await tester.pumpWidget(
          Box(
            style: Style(
              $with.scale(2.0),
              $with.opacity(0.5),
              $with.visibility.on(),
              $with.clipOval(),
              $with.aspectRatio(2.0),
            ),
            child: Box(
              key: key,
              inherit: true,
              child: Builder(builder: (context) {
                final inheritedMix = Mix.maybeOf(context)!;

                expect(inheritedMix.attributes.length, 0);

                return const SizedBox();
              }),
            ),
          ),
        );

        expect(
          find.descendant(
            of: find.byKey(key),
            matching: find.byType(Transform),
          ),
          findsNothing,
        );

        expect(
          find.descendant(
            of: find.byKey(key),
            matching: find.byType(Opacity),
          ),
          findsNothing,
        );

        expect(
          find.descendant(
            of: find.byKey(key),
            matching: find.byType(RotatedBox),
          ),
          findsNothing,
        );

        expect(
          find.descendant(
            of: find.byKey(key),
            matching: find.byType(Visibility),
          ),
          findsNothing,
        );

        expect(
          find.descendant(
            of: find.byKey(key),
            matching: find.byType(AspectRatio),
          ),
          findsNothing,
        );
      },
    );

    testWidgets(
      'If there are no modifier attributes in Style, RenderModifierAttributes shouldnt exist in the widget tree',
      (tester) async {
        const key = Key('box');

        await tester.pumpWidget(
          Box(
            style: Style($box.color.red(), $box.height(100), $box.width(100)),
            key: key,
          ),
        );

        expect(
          find.ancestor(
            of: find.byKey(key),
            matching: find.byType(RenderModifiers),
          ),
          findsNothing,
        );
      },
    );
  });

  group('resolveModifierSpecs', () {
    test('Returns empty set when no modifiers are provided', () {
      final result = resolveModifierSpecs(const [], EmptyMixData);
      expect(result, isEmpty);
    });

    test('Returns resolved modifier specs in the correct order', () {
      final style = Style(
        $with.scale(2.0),
        $with.opacity(0.5),
        $with.visibility.on(),
        $with.clipOval(),
        $with.aspectRatio(2.0),
      );

      final mix = style.of(MockBuildContext());
      final result = resolveModifierSpecs(
        [
          ClipOvalModifierAttribute,
          AspectRatioModifierAttribute,
          TransformModifierAttribute,
          OpacityModifierAttribute,
          VisibilityModifierAttribute,
        ],
        mix,
      );

      expect(result, {
        const VisibilityModifierSpec(true),
        const OpacityModifierSpec(0.5),
        TransformModifierSpec(
          transform: Matrix4.diagonal3Values(2.0, 2.0, 1.0),
          alignment: Alignment.center,
        ),
        const AspectRatioModifierSpec(2.0),
        const ClipOvalModifierSpec(),
      });
    });
  });
}
