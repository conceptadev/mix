import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/src/utilities/naked_portal.dart';

void main() {
  group('NakedPortal', () {
    testWidgets('renders its child in the overlay',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Text('Parent Content'),
                  NakedPortal(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.blue,
                      child: const Text('Portal Content'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Initial pump to build widget tree
      await tester.pump();

      // Second pump to allow overlay to be added
      await tester.pump();

      // Verify parent content exists
      expect(find.text('Parent Content'), findsOneWidget);

      // Verify portal content is rendered in the overlay
      expect(find.text('Portal Content'), findsOneWidget);
    });

    testWidgets('removes overlay entry when disposed',
        (WidgetTester tester) async {
      // Define a key for the portal
      final portalKey = GlobalKey();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Text('Parent Content'),
                  NakedPortal(
                    key: portalKey,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.blue,
                      child: const Text('Portal Content'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Initial pump to build widget tree
      await tester.pump();

      // Second pump to allow overlay to be added
      await tester.pump();

      // Verify portal content exists
      expect(find.text('Portal Content'), findsOneWidget);

      // Rebuild without the portal
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Parent Content'),
                ],
              ),
            ),
          ),
        ),
      );

      // Pump to allow overlay to be removed
      await tester.pump();

      // Verify portal content is removed
      expect(find.text('Portal Content'), findsNothing);
    });
  });
}
