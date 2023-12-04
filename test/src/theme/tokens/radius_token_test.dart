import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('RadiusToken', () {
    test('Constructor assigns name correctly', () {
      const radiusRef = RadiusToken.name('testName');
      expect(radiusRef.name, 'testName');
    });

    test('Equality operator works correctly', () {
      const radiusRef1 = RadiusToken.name('testName');
      const radiusRef2 = RadiusToken.name('testName');
      const radiusRef3 = RadiusToken.name('differentName');

      expect(radiusRef1 == radiusRef2, isTrue);
      expect(radiusRef1 == radiusRef3, isFalse);
      expect(radiusRef1 == Object(), isFalse);
    });

    test('hashCode is consistent with name', () {
      const radiusRef1 = RadiusToken.name('testName');
      const radiusRef2 = RadiusToken.name('testName');
      const radiusRef3 = RadiusToken.name('differentName');

      expect(radiusRef1.hashCode, radiusRef2.hashCode);
      expect(radiusRef1.hashCode, isNot(radiusRef3.hashCode));
    });

    testWidgets('Test it resolves correctly', (tester) async {
      const redRadiusRef = RadiusToken.name('red');
      const greenRadiusRef = RadiusToken.name('green');
      const blueRadiusRef = RadiusToken.name('blue');
      final theme = MixThemeData.tokenMap(
        radii: {
          redRadiusRef: (_) => const Radius.circular(1),
          greenRadiusRef: (_) => const Radius.circular(2),
          blueRadiusRef: (_) => const Radius.circular(3),
        },
      );

      await tester.pumpWidget(createWithMixTheme(theme));

      final context = tester.element(find.byType(Container));

      final mixData = MixData.create(context, StyleMix.empty);

      expect(mixData.tokens.radiiToken(redRadiusRef), const Radius.circular(1));
      expect(
          mixData.tokens.radiiToken(greenRadiusRef), const Radius.circular(2));
      expect(
          mixData.tokens.radiiToken(blueRadiusRef), const Radius.circular(3));
    });
  });

  group('RadiusToken.resolvable', () {
    test('Constructor assigns name correctly', () {
      final radiusRef = RadiusToken.resolvable('testName', (_) => Radius.zero);
      expect(radiusRef.name, 'testName');
    });

    test('Equality operator works correctly', () {
      final radiusRef1 =
          RadiusToken.resolvable('testName', (_) => const Radius.circular(1));
      final radiusRef2 =
          RadiusToken.resolvable('testName', (_) => const Radius.circular(1));
      final radiusRef3 = RadiusToken.resolvable(
          'differentName', (_) => const Radius.circular(1));

      expect(radiusRef1 == radiusRef2, isTrue);
      expect(radiusRef1 == radiusRef3, isFalse);
      expect(radiusRef1 == Object(), isFalse);
    });

    test('hashCode is consistent with name', () {
      final radiusRef1 =
          RadiusToken.resolvable('testName', (_) => const Radius.circular(1));
      final radiusRef2 =
          RadiusToken.resolvable('testName', (_) => const Radius.circular(1));
      final radiusRef3 = RadiusToken.resolvable(
          'differentName', (_) => const Radius.circular(1));

      expect(radiusRef1.hashCode, radiusRef2.hashCode);
      expect(radiusRef1.hashCode, isNot(radiusRef3.hashCode));
    });

    testWidgets('Test it resolves correctly', (tester) async {
      final redRadiusRef =
          RadiusToken.resolvable('red', (_) => const Radius.circular(1));
      final greenRadiusRef =
          RadiusToken.resolvable('green', (_) => const Radius.circular(2));
      final blueRadiusRef =
          RadiusToken.resolvable('blue', (_) => const Radius.circular(3));

      await tester.pumpMaterialApp(Container());

      final context = tester.element(find.byType(Container));

      final mixData = MixData.create(context, StyleMix.empty);

      expect(mixData.tokens.radiiToken(redRadiusRef), const Radius.circular(1));
      expect(
          mixData.tokens.radiiToken(greenRadiusRef), const Radius.circular(2));
      expect(
          mixData.tokens.radiiToken(blueRadiusRef), const Radius.circular(3));
    });
  });

  group('RadiiTokenUtil', () {
    test('small returns correct value', () {
      expect(RadiiTokenUtil().small, RadiusToken.small());
    });

    test('medium returns correct value', () {
      expect(RadiiTokenUtil().medium, RadiusToken.medium());
    });

    test('large returns correct value', () {
      expect(RadiiTokenUtil().large, RadiusToken.large());
    });
  });

  group(
    'UtilityWithRadiusTokens',
    () {
      test(
        'tokens resolve',
        () {
          final radiiTokenUtil = UtilityWithRadiusTokens((value) => value);

          expect(radiiTokenUtil.small(), RadiusToken.small());
          expect(radiiTokenUtil.medium(), RadiusToken.medium());
          expect(radiiTokenUtil.large(), RadiusToken.large());
        },
      );
    },
  );
}
