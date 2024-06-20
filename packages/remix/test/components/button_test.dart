import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/button/button.dart';

void main() {
  group('RemixButton', () {
    testWidgets('renders with correct label', (WidgetTester tester) async {
      const label = 'Test Button';
      await tester.pumpWidget(
        MaterialApp(
          home: RemixButton(label: label, onPressed: () {}),
        ),
      );

      expect(
        find.byWidgetPredicate(
          (widget) => widget is Text && widget.data == label,
        ),
        findsOneWidget,
      );
    });

    testWidgets('shows loading indicator and label when isLoading is true',
        (WidgetTester tester) async {
      const loadingLabel = 'Loading...';

      await tester.pumpWidget(
        MaterialApp(
          home: RemixButton(
            loading: true,
            loadingLabel: loadingLabel,
            onPressed: () {},
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text(loadingLabel), findsOneWidget);
    });

    testWidgets('displays correct icons when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RemixButton(
          iconLeft: Icons.arrow_back,
          iconRight: Icons.arrow_forward,
          onPressed: () {},
        ),
      ));

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);

      final HBox iconRow = tester.widget(find.byType(HBox));
      expect(iconRow.children.first, isInstanceOf<StyledIcon>());
      expect((iconRow.children.first as StyledIcon).icon, Icons.arrow_back);
      expect(iconRow.children.last, isInstanceOf<StyledIcon>());
      expect((iconRow.children.last as StyledIcon).icon, Icons.arrow_forward);
    });
  });

  testWidgets('when disabled must not call onPressed',
      (WidgetTester tester) async {
    bool didCallOnPressed = false;

    await tester.pumpWidget(MaterialApp(
      home: RemixButton(
        label: 'Disabled Button',
        onPressed: () {
          didCallOnPressed = true;
        },
        disabled: true,
      ),
    ));

    await tester.tap(find.byType(RemixButton));
    await tester.pumpAndSettle(const Duration(milliseconds: 200));

    expect(didCallOnPressed, false);
  });

  testWidgets('when enabled must call onPressed', (WidgetTester tester) async {
    bool didCallOnPressed = false;

    await tester.pumpWidget(MaterialApp(
      home: RemixButton(
        label: 'Disabled Button',
        onPressed: () {
          didCallOnPressed = true;
        },
      ),
    ));

    await tester.tap(find.byType(RemixButton));
    await tester.pumpAndSettle(const Duration(milliseconds: 200));

    expect(didCallOnPressed, isTrue);
  });
}
