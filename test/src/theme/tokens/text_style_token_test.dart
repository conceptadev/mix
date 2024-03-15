import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

extension on RadiusTokenUtil {
  RadiusToken get medium => const RadiusToken('radius-token-medium');
  RadiusToken get large => const RadiusToken('radius-token-large');
}

extension on SpaceTokenUtil {
  SpaceToken get medium => const SpaceToken('space-token-medium');
  SpaceToken get large => const SpaceToken('space-token-large');
}

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

      expect(
        mixData.tokens.textStyleToken(redtextStyleToken),
        const TextStyle(color: Colors.red),
      );
      expect(
        mixData.tokens.textStyleToken(greentextStyleToken),
        const TextStyle(color: Colors.green),
      );
      expect(
        mixData.tokens.textStyleToken(bluetextStyleToken),
        const TextStyle(color: Colors.blue),
      );
    });
  });

  testWidgets('Combined Test', (tester) async {
    final themeData = MixThemeData(
      colors: {
        $md.colorScheme.error: Colors.blue,
        $md.colorScheme.background: Colors.red,
      },
      space: {
        $spaces.large: 100,
        $spaces.medium: 50,
      },
      textStyles: {
        $md.textTheme.bodyText1:
            const TextStyle(color: Colors.red, fontSize: 10),
        $md.textTheme.bodyText2:
            const TextStyle(color: Colors.blue, fontSize: 20),
      },
      radii: {
        $radii.medium: const Radius.elliptical(10, 50),
        $radii.large: const Radius.elliptical(50, 50),
      },
    );

    const key = Key('box');

    await tester.pumpWithMixTheme(
      Box(
        style: Style(
          text.style.of($md.textTheme.bodyText1),
          text.style.of($md.textTheme.bodyText2),
          box.color.of($md.colorScheme.background),
          box.color.of($md.colorScheme.error),
          box.borderRadius.all.of($radii.medium),
          box.borderRadius.all.of($radii.large),
          box.padding.horizontal.of($spaces.medium),
          box.padding.horizontal.of($spaces.large),
        ),
        key: key,
        child: const StyledText('Hello'),
      ),
      theme: themeData,
    );

    final textWidget = tester.widget<Text>(
      find.descendant(of: find.byKey(key), matching: find.byType(Text)),
    );

    final containerWidget = tester.widget<Container>(
      find.descendant(of: find.byKey(key), matching: find.byType(Container)),
    );

    expect(
      textWidget.style!.color,
      themeData.textStyles[$md.textTheme.bodyText2]!.color,
    );

    expect(
      textWidget.style!.fontSize,
      themeData.textStyles[$md.textTheme.bodyText2]!.fontSize,
    );

    expect(
      (containerWidget.decoration as BoxDecoration).color,
      themeData.colors[$md.colorScheme.error],
    );

    expect(
      (containerWidget.decoration as BoxDecoration).borderRadius,
      BorderRadius.all(themeData.radii[$radii.large]!),
    );

    expect(
      containerWidget.padding!.horizontal / 2,
      themeData.space[$spaces.large],
    );
  });
}
