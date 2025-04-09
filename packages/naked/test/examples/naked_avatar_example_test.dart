import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naked/naked.dart';

import '../../example/lib/examples/naked_avatar_example.dart';

void main() {
  const refreshButtonKey = ValueKey('refresh_avatar_button');

  testWidgets('NakedAvatarExample renders initial state correctly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NakedAvatarExample())));

    // Verify initial elements are present
    expect(find.text('Basic Avatar'), findsOneWidget);
    expect(
        find.byType(NakedAvatar), findsWidgets); // Should find multiple avatars

    // Updated Finder: Use the key
    expect(find.byKey(refreshButtonKey), findsOneWidget);
    // Optional: Still verify text and icon are present within the found button
    expect(
        find.descendant(
            of: find.byKey(refreshButtonKey),
            matching: find.text('Load New Avatar')),
        findsOneWidget);
    expect(
        find.descendant(
            of: find.byKey(refreshButtonKey),
            matching: find.byIcon(Icons.refresh)),
        findsOneWidget);

    expect(find.text('Load New Avatar'), findsOneWidget);
    expect(find.text('Avatar with Fallback'), findsOneWidget);
    expect(find.text('Avatar Group'), findsOneWidget);
    expect(find.text('Different Sizes'), findsOneWidget);

    // Verify the size labels are present
    expect(find.text('40px'), findsOneWidget);
    expect(find.text('60px'), findsOneWidget);
    expect(find.text('80px'), findsOneWidget);

    // Pump and settle to allow network images (including the erroring one) to resolve
    await tester.pumpAndSettle();

    // Now verify the fallback text 'AB' is shown AFTER settling
    expect(find.text('AB'), findsOneWidget);
  });

  testWidgets('NakedAvatarExample refreshes avatar on button tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: NakedAvatarExample())));

    // Find the first NakedAvatar (basic one)
    final initialBasicAvatarFinder = find
        .descendant(
          of: find.ancestor(
              of: find.text('Basic Avatar'), matching: find.byType(Column)),
          matching: find.byType(NakedAvatar),
        )
        .first;

    // Find the image *after* settling initially to get a stable starting point
    await tester.pumpAndSettle();
    final initialImage = tester.widget<Image>(find.descendant(
      of: initialBasicAvatarFinder,
      matching: find.byType(Image),
    ));
    final initialImageUrl = (initialImage.image as NetworkImage).url;

    // Updated Finder for tapping: Use the key
    expect(find.byKey(refreshButtonKey), findsOneWidget);
    await tester.tap(find.byKey(refreshButtonKey));

    // Pump and Settle to allow state change and rebuild/mocked network response
    await tester.pumpAndSettle();

    // Verify the outcome: image URL has changed
    final newImage = tester.widget<Image>(find.descendant(
      of: initialBasicAvatarFinder,
      matching: find.byType(Image),
    ));
    final newImageUrl = (newImage.image as NetworkImage).url;

    expect(newImageUrl, isNot(initialImageUrl));
    // Check for a different img parameter, index might vary depending on settles
    expect(newImageUrl.contains('img='), isTrue);
    expect(
        initialImageUrl.split('=').last != newImageUrl.split('=').last, isTrue);
  });
}
