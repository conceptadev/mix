import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix_example/micro/examples/squish_switch/main.dart' as example;

void main() {
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
}
