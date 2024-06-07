import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  testWidgets(
    'Icon should apply modifiers only once',
    (tester) async {
      await tester.pumpMaterialApp(
        StyledIcon(
          Icons.ac_unit,
          style: Style(
            $box.height(100),
            $box.width(100),
            $with.align(),
          ),
        ),
      );

      expect(find.byType(Align), findsOneWidget);
    },
  );

  testWidgets(
    'AnimatedStyledIcon should apply modifiers only once',
    (tester) async {
      await tester.pumpMaterialApp(
        AnimatedStyledIcon(
          AnimatedIcons.add_event,
          style: Style(
            $box.height(100),
            $box.width(100),
            $with.align(),
          ),
          progress: const AlwaysStoppedAnimation(0.0),
        ),
      );

      expect(find.byType(Align), findsOneWidget);
    },
  );

  testWidgets('StyledIcon should apply IconSpec properties', (tester) async {
    await tester.pumpMaterialApp(
      StyledIcon(
        Icons.ac_unit,
        style: Style(
          $icon.color(Colors.red),
          $icon.size(24.0),
        ),
      ),
    );

    final iconFinder = find.byType(Icon);
    expect(iconFinder, findsOneWidget);

    final icon = tester.widget<Icon>(iconFinder);
    expect(icon.color, Colors.red);
    expect(icon.size, 24.0);
  });

  testWidgets('StyledIcon should handle inherit property', (tester) async {
    await tester.pumpMaterialApp(
      StyledIcon(
        Icons.ac_unit,
        style: Style($icon.color(Colors.red)),
        inherit: false,
      ),
    );

    final iconFinder = find.byType(Icon);
    expect(iconFinder, findsOneWidget);

    final icon = tester.widget<Icon>(iconFinder);
    expect(icon.color, Colors.red);
  });

  testWidgets('IconSpecWidget should apply IconSpec properties',
      (tester) async {
    const spec = IconSpec(color: Colors.blue, size: 32.0);

    await tester.pumpMaterialApp(
      const IconSpecWidget(Icons.ac_unit, spec: spec),
    );

    final iconFinder = find.byType(Icon);
    expect(iconFinder, findsOneWidget);

    final icon = tester.widget<Icon>(iconFinder);
    expect(icon.color, Colors.blue);
    expect(icon.size, 32.0);
  });

  testWidgets('IconSpecWidget should handle semanticLabel and textDirection',
      (tester) async {
    const spec = IconSpec(color: Colors.blue, size: 32.0);

    await tester.pumpMaterialApp(
      const IconSpecWidget(
        Icons.ac_unit,
        spec: spec,
        semanticLabel: 'Custom Icon',
        textDirection: TextDirection.rtl,
      ),
    );

    final iconFinder = find.byType(Icon);
    expect(iconFinder, findsOneWidget);

    final icon = tester.widget<Icon>(iconFinder);
    expect(icon.semanticLabel, 'Custom Icon');
    expect(icon.textDirection, TextDirection.rtl);
  });

  testWidgets('AnimatedStyledIcon should apply IconSpec properties',
      (tester) async {
    await tester.pumpMaterialApp(
      AnimatedStyledIcon(
        AnimatedIcons.add_event,
        style: Style(
          $icon.color(Colors.green),
          $icon.size(36.0),
        ),
        progress: const AlwaysStoppedAnimation(0.0),
      ),
    );

    final animatedIconFinder = find.byType(AnimatedIcon);
    expect(animatedIconFinder, findsOneWidget);

    final animatedIcon = tester.widget<AnimatedIcon>(animatedIconFinder);
    expect(animatedIcon.color, Colors.green);
    expect(animatedIcon.size, 36.0);
  });

  testWidgets('AnimatedStyledIcon should handle inherit property',
      (tester) async {
    await tester.pumpMaterialApp(
      AnimatedStyledIcon(
        AnimatedIcons.add_event,
        style: Style($icon.color(Colors.green)),
        progress: const AlwaysStoppedAnimation(0.0),
        inherit: false,
      ),
    );

    final animatedIconFinder = find.byType(AnimatedIcon);
    expect(animatedIconFinder, findsOneWidget);

    final animatedIcon = tester.widget<AnimatedIcon>(animatedIconFinder);
    expect(animatedIcon.color, Colors.green);
  });

  testWidgets('AnimatedIconSpecWidget should animate IconSpec properties',
      (tester) async {
    const spec1 = IconSpec(color: Colors.red, size: 24.0);
    const spec2 = IconSpec(color: Colors.blue, size: 36.0);

    await tester.pumpMaterialApp(
      const AnimatedIconSpecWidget(
        Icons.ac_unit,
        spec: spec1,
        duration: Duration(milliseconds: 500),
      ),
    );

    expect(find.byType(IconSpecWidget), findsOneWidget);
    Icon icon = tester.widget<Icon>(find.byType(Icon));
    expect(icon.color, Colors.red);
    expect(icon.size, 24.0);

    await tester.pumpMaterialApp(
      const AnimatedIconSpecWidget(
        Icons.ac_unit,
        spec: spec2,
        duration: Duration(milliseconds: 500),
      ),
    );
    await tester.pump(const Duration(milliseconds: 250));

    expect(find.byType(IconSpecWidget), findsOneWidget);
    icon = tester.widget<Icon>(find.byType(Icon));
    expect(icon.color, Color.lerp(Colors.red, Colors.blue, 0.5));
    expect(icon.size, 30.0);

    await tester.pump(const Duration(milliseconds: 250));

    expect(find.byType(IconSpecWidget), findsOneWidget);
    icon = tester.widget<Icon>(find.byType(Icon));
    expect(icon.color, Colors.blue);
    expect(icon.size, 36.0);
  });

  testWidgets(
      'AnimatedIconSpecWidget should handle semanticLabel and textDirection',
      (tester) async {
    const spec = IconSpec(color: Colors.blue, size: 32.0);

    await tester.pumpMaterialApp(
      const AnimatedIconSpecWidget(
        Icons.ac_unit,
        spec: spec,
        duration: Duration(milliseconds: 500),
        semanticLabel: 'Custom Animated Icon',
        textDirection: TextDirection.rtl,
      ),
    );

    expect(find.byType(IconSpecWidget), findsOneWidget);
    final iconSpecWidget =
        tester.widget<IconSpecWidget>(find.byType(IconSpecWidget));
    expect(iconSpecWidget.semanticLabel, 'Custom Animated Icon');
    expect(iconSpecWidget.textDirection, TextDirection.rtl);
  });
}
