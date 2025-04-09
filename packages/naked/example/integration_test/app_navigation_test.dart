import 'package:example/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Example App Integration Tests', () {
    testWidgets('Navigation rail shows and responds to interaction',
        (WidgetTester tester) async {
      // Launch the *real* app
      app.main();
      // Allow the app to finish loading
      await tester.pumpAndSettle();

      // Check for exceptions immediately after launch
      final dynamic initialException = tester.takeException();
      expect(initialException, isNull,
          reason:
              'An unexpected exception occurred during app startup: $initialException');

      // Initial pump to start the app - Removed as pumpAndSettle above handles it
      // await tester.pump();

      // Find the navigation rail
      final navRail = find.byType(NavigationRail);
      expect(navRail, findsOneWidget);

      // Find the expand/collapse button
      final expandButton = find.byType(FloatingActionButton);
      expect(expandButton, findsOneWidget);

      // Find some navigation items by their icons *within the NavigationRail*
      expect(
          find.descendant(
              of: navRail, matching: find.byIcon(Icons.expand_more)),
          findsOneWidget); // Accordion
      expect(
          find.descendant(of: navRail, matching: find.byIcon(Icons.touch_app)),
          findsOneWidget); // Button
      expect(
          find.descendant(of: navRail, matching: find.byIcon(Icons.check_box)),
          findsOneWidget); // Checkbox

      // Test expanding the navigation rail
      await tester.tap(expandButton);
      await tester.pump();

      // Verify labels are visible when expanded
      expect(find.text('Accordion'), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);
      expect(find.text('Checkbox'), findsOneWidget);

      // Test tapping each destination
      for (int i = 0; i < app.destinations.length; i++) {
        // Skip Avatar example (index 1) as it makes network calls
        if (i == 1) continue;

        final destination = app.destinations[i];

        // Skip examples causing layout issues in tests
        if (destination.label.contains('Focus')) {
          debugPrint('Skipping focus example: ${destination.label}');
          continue;
        }

        // Find the Text label for the destination within the NavigationRail
        final destinationTextFinder = find.descendant(
          of: find.byType(NavigationRail),
          matching: find.text(destination.label),
        );

        // Ensure the text label is visible before tapping
        expect(destinationTextFinder, findsOneWidget,
            reason: 'Text label for ${destination.label} should be found');
        await tester
            .ensureVisible(destinationTextFinder); // Scroll the item into view
        await tester.pumpAndSettle(); // Wait for scroll animation

        // Tap the destination text label
        await tester.tap(destinationTextFinder);
        await tester.pumpAndSettle(); // Wait for animations and state changes

        // Add extra pumps to ensure the UI has fully updated
        await tester.pump(const Duration(milliseconds: 500));
        await tester.pumpAndSettle();

        // Explicitly check for exceptions after navigation and settling
        final dynamic navigationException = tester.takeException();
        expect(navigationException, isNull,
            reason:
                'An unexpected exception occurred during/after navigating to ${destination.label}: $navigationException');

        // Verify the selected index updated correctly
        final updatedNavRail = tester.widget<NavigationRail>(navRail);
        expect(updatedNavRail.selectedIndex, i,
            reason:
                'Selected index should be $i after tapping ${destination.label}');
      }
    });
  });
}
