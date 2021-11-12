import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/widgets/common/common.utils.dart';
import 'package:mix/src/attributes/widgets/text/text.utils.dart';
import 'package:mix/src/mixer/mix_factory.dart';

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
        tester.widget<Text>(find.byType(Text)).data,
        widgetText,
      );
    });

    testWidgets('Adds Text properties on widget', (tester) async {
      await tester.pumpWidget(
        DirectionalTestWidget(
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
        DirectionalTestWidget(
          child: Mix(
            TextStyleUtility.fontSize(20),
            TextStyleUtility.wordSpacing(2),
            TextStyleUtility.letterSpacing(3),
            TextStyleUtility.textBaseline(TextBaseline.ideographic),
            TextStyleUtility.fontFamily('Roboto'),
            TextStyleUtility.fontWeight(FontWeight.bold),
            TextStyleUtility.color(Colors.amber),
            TextStyleUtility.fontStyle(FontStyle.italic),
            TextStyleUtility.locale(const Locale('es', 'US')),
            TextStyleUtility.height(10),
            TextStyleUtility.backgroundColor(Colors.blue),
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
