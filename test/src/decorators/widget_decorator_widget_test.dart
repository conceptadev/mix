import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  final style = StyleMix(
    scale(2.0),
    opacity(0.5),
    visibility.on(),
    clip.oval(),
    aspectRatio(2.0),
    const CustomWidgetDecorator(),
  );

  final mixData = MixData.create(MockBuildContext(), style);
  group('RenderWidgetDecorators', () {
    testWidgets('Renders decorators in the correct order', (tester) async {
      await tester.pumpMaterialApp(
        RenderWidgetDecorators(
          mix: mixData,
          child: const Text('child'),
        ),
      );

      expect(
        find.byType(RenderWidgetDecorators),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(RenderWidgetDecorators),
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

    testWidgets('Renders decorators in the correct order', (tester) async {
      await tester.pumpMaterialApp(
        RenderWidgetDecorators(
          mix: mixData,
          orderOfDecorators: const [
            ClipDecorator,
            AspectRatioDecorator,
            ScaleDecorator,
            OpacityDecorator,
            VisibilityDecorator,
          ],
          child: const Text('child'),
        ),
      );

      expect(
        find.byType(RenderWidgetDecorators),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(RenderWidgetDecorators),
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
    });

    //  Allow for only a few overrides
    testWidgets('Renders decorators in the correct order', (tester) async {
      await tester.pumpMaterialApp(
        RenderWidgetDecorators(
          mix: mixData,
          orderOfDecorators: const [
            ClipDecorator,
            AspectRatioDecorator,
          ],
          child: const Text('child'),
        ),
      );

      expect(
        find.byType(RenderWidgetDecorators),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(RenderWidgetDecorators),
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
    });
  });
}
