import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix_example/micro/examples/squish_switch/main.dart' as example;

import 'helpers/micro_test_harness.dart' show paintedBounds;

void main() {
  testWidgets('keyboard activation and rapid reversal settle correctly', (
    tester,
  ) async {
    example.main();
    await tester.pumpAndSettle();
    final control = find.byKey(const Key('squish-switch'));
    final thumb = find
        .descendant(of: control, matching: find.byType(DecoratedBox))
        .last;
    final rest = paintedBounds(tester, thumb);
    Focus.of(tester.element(thumb)).requestFocus();
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.space);
    await tester.pumpAndSettle();
    expect(
      paintedBounds(tester, thumb).center.dx - rest.center.dx,
      closeTo(38, 0.1),
    );
    for (var i = 0; i < 3; i++) {
      await tester.tap(control);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 60));
    }
    await tester.pumpAndSettle();
    expect(
      paintedBounds(tester, thumb).center.dx,
      closeTo(rest.center.dx, 0.1),
    );
    expect(paintedBounds(tester, thumb).width, closeTo(rest.width, 0.1));
    expect(tester.takeException(), isNull);
  });
  testWidgets('standalone WidgetsApp renders and toggles the switch', (
    tester,
  ) async {
    example.main();
    await tester.pumpAndSettle();
    expect(find.byType(WidgetsApp), findsOneWidget);
    expect(tester.takeException(), isNull);

    final semantics = find.byWidgetPredicate(
      (widget) =>
          widget is Semantics && widget.properties.label == 'Squish switch',
    );
    expect(tester.widget<Semantics>(semantics).properties.toggled, isFalse);
    await tester.tap(find.byKey(const Key('squish-switch')));
    await tester.pumpAndSettle();
    expect(tester.widget<Semantics>(semantics).properties.toggled, isTrue);
    expect(tester.takeException(), isNull);
  });

  testWidgets('press compresses, cancellation restores, tap changes color', (
    tester,
  ) async {
    example.main();
    await tester.pumpAndSettle();
    final control = find.byKey(const Key('squish-switch'));
    final track = find
        .descendant(of: control, matching: find.byType(DecoratedBox))
        .first;
    final rest = paintedBounds(tester, track);
    final thumb = find
        .descendant(of: control, matching: find.byType(DecoratedBox))
        .last;
    final thumbRest = paintedBounds(tester, thumb);
    final offColor =
        (tester.widget<DecoratedBox>(track).decoration as BoxDecoration).color;
    final gesture = await tester.startGesture(tester.getCenter(control));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 150));
    expect(paintedBounds(tester, track).width, lessThan(rest.width));
    expect(paintedBounds(tester, thumb).width, lessThan(thumbRest.width));
    expect(
      paintedBounds(tester, thumb).height,
      closeTo(paintedBounds(tester, thumb).width, 0.1),
    );
    expect(tester.getSize(control), rest.size);
    await gesture.cancel();
    await tester.pumpAndSettle();
    expect(paintedBounds(tester, track).width, closeTo(rest.width, 0.1));
    expect(paintedBounds(tester, thumb).width, closeTo(thumbRest.width, 0.1));
    expect(paintedBounds(tester, thumb).height, closeTo(thumbRest.height, 0.1));
    expect(
      (tester.widget<DecoratedBox>(track).decoration as BoxDecoration).color,
      offColor,
    );
    await tester.tap(control);
    await tester.pump();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 90));
    expect(
      paintedBounds(tester, thumb).width,
      greaterThan(thumbRest.width * 1.1),
    );
    expect(paintedBounds(tester, thumb).height, lessThan(thumbRest.height));
    await tester.pump(const Duration(milliseconds: 150));
    expect(paintedBounds(tester, thumb).width, lessThan(thumbRest.width));
    await tester.pumpAndSettle();
    expect(
      (tester.widget<DecoratedBox>(track).decoration as BoxDecoration).color!
          .toARGB32(),
      0xFF7C3AED,
    );
    expect(paintedBounds(tester, track).width, closeTo(rest.width, 0.1));
    expect(tester.takeException(), isNull);
  });

  testWidgets('reduced motion changes state without decorative animation', (
    tester,
  ) async {
    await tester.pumpWidget(
      WidgetsApp(
        color: const Color(0xFF07070B),
        builder: (_, _) => const MediaQuery(
          data: MediaQueryData(disableAnimations: true),
          child: Center(child: example.SquishSwitch()),
        ),
      ),
    );
    final control = find.byKey(const Key('squish-switch'));
    final thumb = find
        .descendant(of: control, matching: find.byType(DecoratedBox))
        .last;
    final rest = paintedBounds(tester, thumb);
    await tester.tap(control);
    await tester.pump();
    await tester.pump();
    expect(paintedBounds(tester, thumb).width, closeTo(rest.width, 0.1));
    expect(
      paintedBounds(tester, thumb).center.dx - rest.center.dx,
      closeTo(38, 0.1),
    );
    expect(tester.hasRunningAnimations, isFalse);
    expect(tester.takeException(), isNull);
  });
}
