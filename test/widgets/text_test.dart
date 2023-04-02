import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/shared/shared.utilities.dart';
import 'package:mix/src/extensions/mix_extensions.dart';
import 'package:mix/src/factory/mix_factory.dart';
import 'package:mix/src/widgets/text/text.utilities.dart';
import 'package:mix/src/widgets/text/text_directives/text_directives.dart';

import '../helpers/testing_utils.dart';

void main() {
  group("Mix Text widget", () {
    const widgetText = 'Mix Text Widget';
    testWidgets('Adds text on widget', (tester) async {
      await tester.pumpWidget(
        TestMixWidget(
          child: Mix().text(widgetText),
        ),
      );

      expect(
        tester.widget<Text>(find.byType(Text)).data,
        widgetText,
      );
    });

    testWidgets('Adds Text properties on widget', (tester) async {
      await tester.pumpWidget(
        TestMixWidget(
          child: Mix(
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
          child: Mix(
            TextUtility.textStyle(
              fontSize: 20,
              wordSpacing: 2,
              letterSpacing: 3,
              textBaseline: TextBaseline.ideographic,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.amber,
              fontStyle: FontStyle.italic,
              locale: const Locale('es', 'US'),
              height: 10,
              backgroundColor: Colors.blue,
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
          child: Mix(
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
  });
}
