import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('OnPlatformVariant', () {
    testWidgets('returns true when platform matches and false otherwise',
        (WidgetTester tester) async {
      final allPlatforms = [
        TargetPlatform.android,
        TargetPlatform.iOS,
        TargetPlatform.linux,
        TargetPlatform.macOS,
        TargetPlatform.windows,
      ];

      for (final platform in allPlatforms) {
        debugDefaultTargetPlatformOverride = platform;
        final context = await tester.pumpAndGetContext(Container());
        for (final targetPlatform in allPlatforms) {
          final variant = OnPlatformVariant(targetPlatform);
          expect(
            variant.when(context),
            equals(platform == targetPlatform),
            reason: 'platform: $platform, targetPlatform: $targetPlatform',
          );
        }
        debugDefaultTargetPlatformOverride = null;
      }
    });

    test('mergeKey for Android platform', () {
      const variant = OnPlatformVariant(TargetPlatform.android);
      expect(variant.mergeKey, equals('OnPlatformVariant.android'));
    });

    test('mergeKey for iOS platform', () {
      const variant = OnPlatformVariant(TargetPlatform.iOS);
      expect(variant.mergeKey, equals('OnPlatformVariant.iOS'));
    });

    test('mergeKey for Fuchsia platform', () {
      const variant = OnPlatformVariant(TargetPlatform.fuchsia);
      expect(variant.mergeKey, equals('OnPlatformVariant.fuchsia'));
    });

    test('mergeKey for Linux platform', () {
      const variant = OnPlatformVariant(TargetPlatform.linux);
      expect(variant.mergeKey, equals('OnPlatformVariant.linux'));
    });

    test('mergeKey for macOS platform', () {
      const variant = OnPlatformVariant(TargetPlatform.macOS);
      expect(variant.mergeKey, equals('OnPlatformVariant.macOS'));
    });

    test('mergeKey for Windows platform', () {
      const variant = OnPlatformVariant(TargetPlatform.windows);
      expect(variant.mergeKey, equals('OnPlatformVariant.windows'));
    });

    //  Create now a variant for macos , windows and linux
    testWidgets(
      'Check if the platform is macOS',
      (WidgetTester tester) async {
        final context = await tester.pumpAndGetContext(Container());

        const variant = OnPlatformVariant(TargetPlatform.macOS);

        expect(variant.when(context), isTrue);
      },
      variant: TargetPlatformVariant.only(TargetPlatform.macOS),
    );

    testWidgets(
      'Check if the platform is Windows',
      (WidgetTester tester) async {
        final context = await tester.pumpAndGetContext(Container());

        const variant = OnPlatformVariant(TargetPlatform.windows);

        expect(variant.when(context), isTrue);
      },
      variant: TargetPlatformVariant.only(TargetPlatform.windows),
    );

    testWidgets(
      'Check if the platform is Linux',
      (WidgetTester tester) async {
        final context = await tester.pumpAndGetContext(Container());

        const variant = OnPlatformVariant(TargetPlatform.linux);

        expect(variant.when(context), isTrue);
      },
      variant: TargetPlatformVariant.only(TargetPlatform.linux),
    );
  });

  // OnWebVariant
  group('OnWebVariant', () {
    testWidgets('returns true when platform is web and false otherwise',
        (WidgetTester tester) async {
      MixHelpers.isWebOverride = true;
      final context = await tester.pumpAndGetContext(Container());

      const variant = OnWebVariant();

      expect(variant.when(context), isTrue);
      MixHelpers.isWebOverride = null;
    });
  });
}
