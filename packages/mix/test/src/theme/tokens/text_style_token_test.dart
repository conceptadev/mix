import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

const _tokens = MixTokensTest();
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
        $material.colorScheme.error: Colors.blue,
        $material.colorScheme.background: Colors.red,
      },
      spaces: {
        _tokens.space.large: 100,
        _tokens.space.medium: 50,
      },
      textStyles: {
        $material.textTheme.bodyText1:
            const TextStyle(color: Colors.red, fontSize: 10),
        $material.textTheme.bodyText2:
            const TextStyle(color: Colors.blue, fontSize: 20),
      },
      radii: {
        _tokens.radius.medium: const Radius.elliptical(10, 50),
        _tokens.radius.large: const Radius.elliptical(50, 50),
      },
    );

    const key = Key('box');

    await tester.pumpWithMixTheme(
      Box(
        style: Style(
          $text.style.ref($material.textTheme.bodyText1),
          $text.style.ref($material.textTheme.bodyText2),
          $box.color.ref($material.colorScheme.background),
          $box.color.ref($material.colorScheme.error),
          $box.borderRadius.all.ref(_tokens.radius.medium),
          $box.borderRadius.all.ref(_tokens.radius.large),
          $box.padding.horizontal.ref(_tokens.space.medium),
          $box.padding.horizontal.ref(_tokens.space.large),
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
      themeData.textStyles[$material.textTheme.bodyText2]!.color,
    );

    expect(
      textWidget.style!.fontSize,
      themeData.textStyles[$material.textTheme.bodyText2]!.fontSize,
    );

    expect(
      (containerWidget.decoration as BoxDecoration).color,
      themeData.colors[$material.colorScheme.error],
    );

    expect(
      (containerWidget.decoration as BoxDecoration).borderRadius,
      BorderRadius.all(themeData.radii[_tokens.radius.large]!),
    );

    expect(
      containerWidget.padding!.horizontal / 2,
      themeData.spaces[_tokens.space.large],
    );
  });

  group('TextStyleResolver', () {
    testWidgets('resolve method is called correctly', (tester) async {
      var resolverCalled = false;
      final resolver = TextStyleResolver((_) {
        resolverCalled = true;
        return const TextStyle();
      });

      await tester.pumpWidget(
        MixTheme(
          data: MixThemeData(
              textStyles: {const TextStyleToken('test'): resolver}),
          child: Container(),
        ),
      );

      final context = tester.element(find.byType(Container));
      resolver.resolve(context);

      expect(resolverCalled, isTrue);
    });
  });

  group('TextStyleRef', () {
    test('copyWith throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.copyWith(),
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('fontFamily throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.fontFamily,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('inherit throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.inherit,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('color throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.color,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('backgroundColor throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.backgroundColor,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('fontSize throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.fontSize,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('fontWeight throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.fontWeight,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('fontStyle throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.fontStyle,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('letterSpacing throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.letterSpacing,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('wordSpacing throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.wordSpacing,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('textBaseline throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.textBaseline,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('height throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.height,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('leadingDistribution throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.leadingDistribution,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('locale throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.locale,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('foreground throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.foreground,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('background throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.background,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('shadows throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.shadows,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('fontFeatures throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.fontFeatures,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('fontVariations throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.fontVariations,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('decoration throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.decoration,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('decorationColor throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.decorationColor,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('decorationStyle throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.decorationStyle,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('decorationThickness throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.decorationThickness,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });

    test('debugLabel throws TokenFieldAccessError', () {
      const ref = TextStyleRef(TextStyleToken('test'));
      expect(
        () => ref.debugLabel,
        throwsA(isA<TokenFieldAccessError>()),
      );
    });
  });
}
