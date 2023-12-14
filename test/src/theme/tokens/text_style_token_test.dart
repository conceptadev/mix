import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/factory/mix_provider_data.dart';
import 'package:mix/src/factory/style_mix.dart';
import 'package:mix/src/theme/mix_theme.dart';
import 'package:mix/src/theme/tokens/text_style_token.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('TextStyleToken', () {
    test('Constructor assigns name correctly', () {
      const textStyleToken = TextStyleToken('testName');
      expect(textStyleToken.name, 'testName');
    });

    test('Equality operator works correctly', () {
      const textStyleToken1 = TextStyleToken('testName');
      const textStyleToken2 = TextStyleToken('testName');
      const textStyleToken3 = TextStyleToken('differentName');

      expect(textStyleToken1 == textStyleToken2, isTrue);
      expect(textStyleToken1 == textStyleToken3, isFalse);
      expect(textStyleToken1 == Object(), isFalse);
    });

    test('hashCode is consistent with name', () {
      const textStyleToken1 = TextStyleToken('testName');
      const textStyleToken2 = TextStyleToken('testName');
      const textStyleToken3 = TextStyleToken('differentName');

      expect(textStyleToken1.hashCode, textStyleToken2.hashCode);
      expect(textStyleToken1.hashCode, isNot(textStyleToken3.hashCode));
    });

    testWidgets('Test it resolves correctly', (tester) async {
      const redtextStyleToken = TextStyleToken('red');
      const greentextStyleToken = TextStyleToken('green');
      const bluetextStyleToken = TextStyleToken('blue');
      final theme = MixThemeData(
        textStyles: {
          redtextStyleToken: const TextStyle(color: Colors.red),
          greentextStyleToken: const TextStyle(color: Colors.green),
          bluetextStyleToken: const TextStyle(color: Colors.blue),
        },
      );

      await tester.pumpWidget(createWithMixTheme(theme));

      final context = tester.element(find.byType(Container));

      final mixData = MixData.create(context, const Style.empty());

      expect(mixData.tokens.textStyleToken(redtextStyleToken),
          const TextStyle(color: Colors.red));
      expect(mixData.tokens.textStyleToken(greentextStyleToken),
          const TextStyle(color: Colors.green));
      expect(mixData.tokens.textStyleToken(bluetextStyleToken),
          const TextStyle(color: Colors.blue));
    });
  });
}
