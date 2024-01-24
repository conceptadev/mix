import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('RadiusToken', () {
    test('Constructor assigns name correctly', () {
      const radiusRef = RadiusToken('testName');
      expect(radiusRef.name, 'testName');
    });

    test('Equality operator works correctly', () {
      const radiusRef1 = RadiusToken('testName');
      const radiusRef2 = RadiusToken('testName');
      const radiusRef3 = RadiusToken('differentName');

      expect(radiusRef1 == radiusRef2, isTrue);
      expect(radiusRef1 == radiusRef3, isFalse);
      expect(radiusRef1 == Object(), isFalse);
    });

    test('hashCode is consistent with name', () {
      const radiusRef1 = RadiusToken('testName');
      const radiusRef2 = RadiusToken('testName');
      const radiusRef3 = RadiusToken('differentName');

      expect(radiusRef1.hashCode, radiusRef2.hashCode);
      expect(radiusRef1.hashCode, isNot(radiusRef3.hashCode));
    });

    testWidgets('Test it resolves correctly', (tester) async {
      const redRadiusRef = RadiusToken('red');
      const greenRadiusRef = RadiusToken('green');
      const blueRadiusRef = RadiusToken('blue');
      final theme = MixThemeData(
        radii: {
          redRadiusRef: const Radius.circular(1),
          greenRadiusRef: const Radius.circular(2),
          blueRadiusRef: const Radius.circular(3),
        },
      );

      await tester.pumpWidget(createWithMixTheme(theme));

      final context = tester.element(find.byType(Container));

      final mixData = MixData.create(context, const Style.empty());

      expect(mixData.tokens.radiiToken(redRadiusRef), const Radius.circular(1));
      expect(
          mixData.tokens.radiiToken(greenRadiusRef), const Radius.circular(2));
      expect(
          mixData.tokens.radiiToken(blueRadiusRef), const Radius.circular(3));
    });
  });

  group('RadiiTokenUtil', () {
    const radii = RadiiTokenUtil();
    test('small returns correct value', () {
      expect(radii.small(), RadiusToken.small());
    });

    test('medium returns correct value', () {
      expect(radii.medium(), RadiusToken.medium());
    });

    test('large returns correct value', () {
      expect(radii.large(), RadiusToken.large());
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
