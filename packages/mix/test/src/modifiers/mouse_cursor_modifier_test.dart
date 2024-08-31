import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  testWidgets('uses custom mouseCursor when provided',
      (WidgetTester tester) async {
    const cursor = SystemMouseCursors.resizeUpRight;
    await tester.pumpWidget(
      Box(
        style: Style(
          $box.wrap.cursor(cursor),
        ),
      ),
    );

    final finder = find.byType(MouseRegion);
    expect(finder, findsOneWidget);

    final mouseRegion = tester.widget<MouseRegion>(finder);
    expect(mouseRegion.cursor, equals(cursor));
  });
}
