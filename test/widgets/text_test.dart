import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/primitives/painting/background_color.dart';
import 'package:mix/src/attributes/primitives/text/debug_label.dart';
import 'package:mix/src/attributes/primitives/text/font_family.dart';
import 'package:mix/src/attributes/primitives/text/font_size.dart';
import 'package:mix/src/attributes/primitives/text/font_style.dart';
import 'package:mix/src/attributes/primitives/text/font_weight.dart';
import 'package:mix/src/attributes/primitives/text/letter_spacing.dart';
import 'package:mix/src/attributes/primitives/text/locale.dart';
import 'package:mix/src/attributes/primitives/text/max_lines.dart';
import 'package:mix/src/attributes/primitives/text/soft_wrap.dart';
import 'package:mix/src/attributes/primitives/text/text_align.dart';
import 'package:mix/src/attributes/primitives/text/text_baseline.dart';
import 'package:mix/src/attributes/primitives/text/text_color.dart';
import 'package:mix/src/attributes/primitives/text/text_direction.dart';
import 'package:mix/src/attributes/primitives/text/text_height.dart';
import 'package:mix/src/attributes/primitives/text/text_overflow.dart';
import 'package:mix/src/attributes/primitives/text/text_scale_factor.dart';
import 'package:mix/src/attributes/primitives/text/text_width_basis.dart';
import 'package:mix/src/attributes/primitives/text/word_spacing.dart';
import 'package:mix/src/widgets/primitives/text.dart';

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
      await tester.pumpWidget(
        DirectionalTestWidget(
          child: Mix(
            const TextOverflowAttribute(TextOverflow.ellipsis),
            const SoftWrapAttribute(true),
            const TextScaleFactorAttribute(2.2),
            const TextWidthBasisAttribute(TextWidthBasis.longestLine),
            const MaxLinesAttribute(3),
            const TextAlignAttribute(TextAlign.justify),
            const TextDirectionAttribute(TextDirection.rtl),
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
            const FontSizeAttribute(20),
            const WordSpacingAttribute(2),
            const LetterSpacingAttribute(3),
            const TextBaselineAttribute(TextBaseline.ideographic),
            const FontFamilyAttribute('Roboto'),
            const FontWeightAttribute(FontWeight.bold),
            const TextColorAttribute(Colors.amber),
            const FontStyleAttribute(FontStyle.italic),
            const LocaleAttribute(Locale('es', 'US')),
            const DebugLabelAttribute('debug_label'),
            const TextHeightAttribute(10),
            const BackgroundColorAttribute(Colors.blue),
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
