import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/widgets/text/text_directives/text_directives.dart';

import '../helpers/testing_utils.dart';

void main() {
  group("Mix Text widget", () {
    const widgetText = 'Mix Text Widget';
    testWidgets('Adds text on widget', (tester) async {
      await tester.pumpWidget(
        TestMixWidget(child: StyleMix().text(widgetText)),
      );

      expect(tester.widget<Text>(find.byType(Text)).data, widgetText);
    });

    testWidgets('Adds Text properties on widget', (tester) async {
      await tester.pumpWidget(
        TestMixWidget(
          child: StyleMix(
            TextUtility.overflow(TextOverflow.ellipsis),
            TextUtility.softWrap(true),
            TextUtility.textScaleFactor(2.2),
            TextUtility.textWidthBasis(TextWidthBasis.longestLine),
            TextUtility.maxLines(3),
            TextUtility.textAlign(TextAlign.justify),
            CommonUtility.textDirection(TextDirection.rtl),
          ).text(widgetText),
        ),
      );

      final textProp = tester.widget<Text>(find.byType(Text));

      expect(textProp.overflow, TextOverflow.ellipsis);
      expect(textProp.softWrap, true);
      expect(textProp.textScaleFactor, 2.2);
      expect(textProp.textWidthBasis, TextWidthBasis.longestLine);
      expect(textProp.maxLines, 3);
      expect(textProp.textAlign, TextAlign.justify);
      expect(textProp.textDirection, TextDirection.rtl);
    });

    testWidgets('Adds Text Style on widget', (tester) async {
      await tester.pumpWidget(
        TestMixWidget(
          child: StyleMix(
            TextUtility.textStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 20,
              letterSpacing: 3,
              wordSpacing: 2,
              textBaseline: TextBaseline.ideographic,
              color: Colors.amber,
              backgroundColor: Colors.blue,
              locale: const Locale('es', 'US'),
              height: 10,
            ),
          ).text(widgetText),
        ),
      );

      final textStyle = tester.widget<Text>(find.byType(Text)).style!;

      expect(textStyle.fontSize, 20);
      expect(textStyle.wordSpacing, 2);
      expect(textStyle.letterSpacing, 3);
      expect(textStyle.textBaseline, TextBaseline.ideographic);
      expect(textStyle.fontFamily, 'Roboto');
      expect(textStyle.fontWeight, FontWeight.bold);
      expect(textStyle.color, Colors.amber);
      expect(textStyle.fontStyle, FontStyle.italic);
      expect(textStyle.locale!.languageCode, 'es');
      expect(textStyle.locale!.countryCode, 'US');
      expect(textStyle.height, 10);
      expect(textStyle.backgroundColor, Colors.blue);
    });

    testWidgets('Text Directives', (tester) async {
      await tester.pumpWidget(
        TestMixWidget(
          child: StyleMix(
            TextUtility.directives([
              const UppercaseDirective(),
              const SentenceCaseDirective(),
              const CapitalizeDirective(),
            ]),
          ).text(widgetText),
        ),
      );

      final textWidget = tester.widget<Text>(find.byType(Text));

      expect(textWidget.data, isNot(equals(widgetText)));

      expect(textWidget.data, equals(widgetText.toUpperCase()));
    });

    testWidgets('Resolves text styles', (tester) async {
      final ts1 = StyleMix(
        textStyle(
          backgroundColor: Colors.blue,
          color: Colors.amber,
          fontFamily: 'Roboto',
          fontSize: 20,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          height: 10,
          letterSpacing: 3,
          locale: const Locale('es', 'US'),
          textBaseline: TextBaseline.ideographic,
          wordSpacing: 2,
        ),
      );

      final ts2 = StyleMix(
        textStyle(fontSize: 30, letterSpacing: 4, wordSpacing: 3),
      );

      final ts3 = StyleMix(
        textStyle(fontSize: 40, letterSpacing: 5, wordSpacing: 4),
      );

      final merged = StyleMix.combine([ts1, ts2, ts3]);

      await tester.pumpWidget(TestMixWidget(child: merged.text(widgetText)));

      final textProp = tester.widget<Text>(find.byType(Text));

      final textAttributes = merged.values.stylesOfType<TextAttributes>();

      expect(textAttributes?.styles.length, 3);

      expect(textProp.style!.fontSize, 40);
      expect(textProp.style!.wordSpacing, 4);
      expect(textProp.style!.letterSpacing, 5);

      expect(textProp.style!.textBaseline, TextBaseline.ideographic);
      expect(textProp.style!.fontFamily, 'Roboto');
      expect(textProp.style!.fontWeight, FontWeight.bold);
      expect(textProp.style!.color, Colors.amber);
      expect(textProp.style!.fontStyle, FontStyle.italic);
      expect(textProp.style!.locale!.languageCode, 'es');
      expect(textProp.style!.locale!.countryCode, 'US');
      expect(textProp.style!.height, 10);
      expect(textProp.style!.backgroundColor, Colors.blue);

      expect(textProp.data, widgetText);
    });

    testWidgets('Resolves TextStyleToken', (tester) async {
      final ts1 = StyleMix(
        textStyle(
          backgroundColor: Colors.blue,
          fontSize: 20,
          letterSpacing: 3,
          wordSpacing: 2,
        ),
      );

      const contextStyle = TextStyle(
        fontSize: 30,
        letterSpacing: 4,
        wordSpacing: 3,
      );

      const textStyleToken = TextStyleToken('_test_text_style_token_');

      final ts2 = StyleMix(textStyle(as: textStyleToken));

      final ts3 = StyleMix(textStyle(letterSpacing: 5));

      final merged = StyleMix.combine([ts1, ts2, ts3]);

      await tester.pumpWidget(
        MaterialApp(
          home: MixTheme(
            data: MixThemeData(
              textStyles: {
                textStyleToken: (context) =>
                    Theme.of(context).textTheme.displaySmall,
              },
            ),
            child: TestMixWidget(child: merged.text(widgetText)),
          ),
          theme: ThemeData(
            textTheme: const TextTheme(displaySmall: contextStyle),
          ),
        ),
      );

      final textProp = tester.widget<Text>(find.byType(Text));

      expect(textProp.style!.fontSize, 30);
      expect(textProp.style!.wordSpacing, 3);
      expect(textProp.style!.letterSpacing, 5);

      expect(textProp.style!.backgroundColor, Colors.blue);
    });
  });
}
