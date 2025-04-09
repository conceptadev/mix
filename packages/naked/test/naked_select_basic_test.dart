import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

void main() {
  group('NakedSelect basic tests', () {
    testWidgets('renders trigger correctly when closed',
        (WidgetTester tester) async {
      const triggerKey = Key('select-trigger');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NakedSelect<String>(
              isOpen: false,
              child: NakedSelectTrigger(
                key: triggerKey,
                child: Text('Select trigger'),
              ),
            ),
          ),
        ),
      );

      expect(find.byKey(triggerKey), findsOneWidget);
      expect(find.text('Select trigger'), findsOneWidget);
      // No menu should be visible when closed
      expect(find.byType(NakedSelectMenu), findsNothing);
    });

    testWidgets('NakedSelectItem can be created with isSelected property',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NakedSelectItem<String>(
              value: 'test',
              isSelected: true,
              child: Text('Selected Item'),
            ),
          ),
        ),
      );

      final itemWidget = tester.widget<NakedSelectItem<String>>(
          find.byType(NakedSelectItem<String>));
      expect(itemWidget.isSelected, isTrue);
      expect(itemWidget.value, equals('test'));
      expect(find.text('Selected Item'), findsOneWidget);
    });

    testWidgets('menu renders its child content', (WidgetTester tester) async {
      const menuKey = Key('select-menu');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NakedSelectMenu(
              key: menuKey,
              child: Text('Menu Content'),
            ),
          ),
        ),
      );

      expect(find.byKey(menuKey), findsOneWidget);
      expect(find.text('Menu Content'), findsOneWidget);
    });
  });
}
