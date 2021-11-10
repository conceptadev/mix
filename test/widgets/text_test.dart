import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/text/text.props.dart';
import 'package:mix/src/attributes/text/text.widget.dart';

import '../test_utils.dart';

void main() {
  group("Mix Text widget", () {
    const widgetText = 'Mix Text Widget';
    testWidgets('Adds text on widget', (tester) async {
      await tester.pumpWidget(
        DirectionalTestWidget(
          child: Mix().text(widgetText),
        ),
      );

      expect(
        tester.widget<TextMixerWidget>(find.byType(TextMixerWidget)).text,
        widgetText,
      );
    });

    testWidgets('Adds Text properties on widget', (tester) async {
      const _textUtil = TextUtility();
      await tester.pumpWidget(
        DirectionalTestWidget(
          child: Mix(
            _textUtil.overflow(TextOverflow.ellipsis),
            _textUtil.softWrap(true),
            _textUtil.textScaleFactor(2.2),
            _textUtil.textWidthBasis(TextWidthBasis.longestLine),
            _textUtil.maxLines(3),
            _textUtil.textAlign(TextAlign.justify),
            _textUtil.textDirection(TextDirection.rtl),
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
      const _styleUtil = TextStyleUtility();
      await tester.pumpWidget(
        DirectionalTestWidget(
          child: Mix(
            _styleUtil.fontSize(20),
            _styleUtil.wordSpacing(2),
            _styleUtil.letterSpacing(3),
            _styleUtil.textBaseline(TextBaseline.ideographic),
            _styleUtil.fontFamily('Roboto'),
            _styleUtil.fontWeight(FontWeight.bold),
            _styleUtil.color(Colors.amber),
            _styleUtil.fontStyle(FontStyle.italic),
            _styleUtil.locale(Locale('es', 'US')),
            _styleUtil.height(10),
            _styleUtil.backgroundColor(Colors.blue),
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
  });
}
