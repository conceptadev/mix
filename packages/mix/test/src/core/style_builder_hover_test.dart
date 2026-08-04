import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('StyleBuilder hover functionality', () {
    Future<void> expectHoverColors(
      WidgetTester tester, {
      required BoxStyler style,
      required Color initial,
      required Color hovered,
      Brightness platformBrightness = Brightness.light,
    }) async {
      Color? currentColor;

      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(
              size: const Size(800, 600),
              platformBrightness: platformBrightness,
            ),
            child: Center(
              child: StyleBuilder<BoxSpec>(
                style: style,
                builder: (context, spec) {
                  currentColor = (spec.decoration as BoxDecoration?)?.color;

                  return Container(
                    key: const Key('nested-hover-target'),
                    constraints: spec.constraints,
                    decoration: spec.decoration,
                  );
                },
              ),
            ),
          ),
        ),
      );

      expect(currentColor, initial);

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      await gesture.moveTo(
        tester.getCenter(find.byKey(const Key('nested-hover-target'))),
      );
      await tester.pump();

      expect(currentColor, hovered);

      await gesture.removePointer();
    }

    testWidgets('hover variant changes style when mouse enters and exits', (
      tester,
    ) async {
      // Create a style with blue background that changes to red on hover
      final style = BoxStyler()
          .color(Colors.blue)
          .width(100)
          .height(100)
          .onHovered(
            BoxStyler()
                .color(Colors.red)
                .width(100)
                .height(100)
                .alignment(Alignment.center),
          );

      Color? currentColor;

      // Verify the style has widget states
      expect(
        style.widgetStates.isNotEmpty,
        isTrue,
        reason: 'Style should have widget states for hover',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: StyleBuilder<BoxSpec>(
                style: style,
                builder: (context, spec) {
                  currentColor = (spec.decoration as BoxDecoration?)?.color;
                  return Container(
                    key: const Key('test_container'),
                    width: spec.constraints?.minWidth,
                    height: spec.constraints?.minHeight,
                    decoration: spec.decoration,
                  );
                },
              ),
            ),
          ),
        ),
      );

      // Initially should be blue (not hovered)
      expect(currentColor, Colors.blue);

      // Create a mouse pointer and hover over the widget
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      await gesture.moveTo(
        tester.getCenter(find.byKey(const Key('test_container'))),
      );
      await tester.pump();

      // Should now be red (hovered)
      expect(currentColor, Colors.red);

      // Move mouse away
      await gesture.moveTo(const Offset(-100, -100));
      await tester.pump();

      // Should be back to blue (not hovered)
      expect(currentColor, Colors.blue);

      await gesture.removePointer();
    });

    testWidgets('Box widget with onHover changes style correctly', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Box(
                key: const Key('test_box'),
                style: BoxStyler()
                    .color(Colors.green)
                    .width(150)
                    .height(150)
                    .onHovered(BoxStyler().color(Colors.orange)),
                child: const Text('Hover me'),
              ),
            ),
          ),
        ),
      );

      // Find the container inside the Box widget
      final containerFinder = find.descendant(
        of: find.byKey(const Key('test_box')),
        matching: find.byType(Container),
      );

      // Get initial color
      Container container = tester.widget<Container>(containerFinder.first);
      BoxDecoration? decoration = container.decoration as BoxDecoration?;
      expect(decoration?.color, Colors.green);

      // Create a mouse pointer and hover
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      await gesture.moveTo(tester.getCenter(find.byKey(const Key('test_box'))));
      await tester.pump();
      await tester.pump();

      // Check color after hover
      container = tester.widget<Container>(containerFinder.first);
      decoration = container.decoration as BoxDecoration?;
      expect(decoration?.color, Colors.orange);

      // Move mouse away
      await gesture.moveTo(const Offset(-100, -100));
      await tester.pump();
      await tester.pump();

      // Check color after mouse leaves
      container = tester.widget<Container>(containerFinder.first);
      decoration = container.decoration as BoxDecoration?;
      expect(decoration?.color, Colors.green);

      await gesture.removePointer();
    });

    testWidgets(
      'homepage hover card example animates scale without a base transform',
      (tester) async {
        // Mirrors the homepage showcase pattern:
        // BoxStyler().animate(...).onHovered(BoxStyler().scale(1.02))
        final style = BoxStyler()
            .width(260)
            .height(120)
            .paddingAll(20)
            .borderRounded(18)
            .color(Colors.indigo.shade400)
            .animate(.easeInOut(220.ms))
            .onHovered(BoxStyler().color(Colors.indigo.shade500).scale(1.02));

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: Box(key: const Key('hover_card'), style: style),
              ),
            ),
          ),
        );

        final gesture = await tester.createGesture(
          kind: PointerDeviceKind.mouse,
        );
        await gesture.addPointer(location: Offset.zero);

        await gesture.moveTo(
          tester.getCenter(find.byKey(const Key('hover_card'))),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 110));

        expect(tester.takeException(), isNull);

        await gesture.moveTo(const Offset(-100, -100));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 110));

        expect(tester.takeException(), isNull);

        await gesture.removePointer();
      },
    );

    group('nested widget-state dependency discovery', () {
      testWidgets('tracks a negated hover variant', (tester) async {
        final style = BoxStyler()
            .size(100, 100)
            .color(Colors.blue)
            .onNot(
              ContextVariant.widgetState(WidgetState.hovered),
              BoxStyler().color(Colors.red),
            );

        await expectHoverColors(
          tester,
          style: style,
          initial: Colors.red,
          hovered: Colors.blue,
        );
      });

      testWidgets('tracks hover nested under a breakpoint', (tester) async {
        final style = BoxStyler()
            .size(100, 100)
            .color(Colors.blue)
            .onBreakpoint(
              const Breakpoint.minWidth(0),
              BoxStyler().onHovered(BoxStyler().color(Colors.red)),
            );

        await expectHoverColors(
          tester,
          style: style,
          initial: Colors.blue,
          hovered: Colors.red,
        );
      });

      testWidgets('tracks hover nested under dark mode', (tester) async {
        final style = BoxStyler()
            .size(100, 100)
            .color(Colors.blue)
            .onDark(BoxStyler().onHovered(BoxStyler().color(Colors.red)));

        await expectHoverColors(
          tester,
          style: style,
          initial: Colors.blue,
          hovered: Colors.red,
          platformBrightness: Brightness.dark,
        );
      });

      testWidgets('tracks hover when breakpoint nesting is reversed', (
        tester,
      ) async {
        final style = BoxStyler()
            .size(100, 100)
            .color(Colors.blue)
            .onHovered(
              BoxStyler().onBreakpoint(
                const Breakpoint.minWidth(0),
                BoxStyler().color(Colors.red),
              ),
            );

        await expectHoverColors(
          tester,
          style: style,
          initial: Colors.blue,
          hovered: Colors.red,
        );
      });

      test('handles cyclic nested variant styles by identity', () {
        final variants = <VariantStyle<BoxSpec>>[];
        final cyclicStyle = BoxStyler(variants: variants);
        variants.add(VariantStyle(const NamedVariant('cycle'), cyclicStyle));
        variants.add(
          VariantStyle(
            ContextVariant.widgetState(WidgetState.hovered),
            BoxStyler(),
          ),
        );
        final rootStyle = BoxStyler().variant(
          const NamedVariant('root'),
          cyclicStyle,
        );

        expect(rootStyle.widgetStates, {WidgetState.hovered});
      });
    });
  });
}
