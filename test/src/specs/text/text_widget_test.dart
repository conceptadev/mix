import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  testWidgets(
    'StyledText should apply decorators only once',
    (tester) async {
      await tester.pumpMaterialApp(
        StyledText(
          'test',
          style: Style(
            height(100),
            width(100),
            align(),
          ),
        ),
      );

      expect(find.byType(Align), findsOneWidget);
    },
  );

  testWidgets('TextSpec properties should match Text properties',
      (WidgetTester tester) async {
    const textSpec = TextSpec(
      style: TextStyle(fontSize: 20, color: Colors.red),
      strutStyle: StrutStyle(fontSize: 16),
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 1.5,
      maxLines: 3,
      textWidthBasis: TextWidthBasis.longestLine,
      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
    );

    const textKey = Key('text');
    final text = Text(
      'Sample Text',
      key: textKey,
      style: textSpec.style,
      strutStyle: textSpec.strutStyle,
      textAlign: textSpec.textAlign,
      textDirection: textSpec.textDirection,
      softWrap: textSpec.softWrap,
      overflow: textSpec.overflow,
      textScaleFactor: textSpec.textScaleFactor,
      maxLines: textSpec.maxLines,
      textWidthBasis: textSpec.textWidthBasis,
      textHeightBehavior: textSpec.textHeightBehavior,
    );
    const mixedTextKey = Key('mixed_text');
    const mixedText = MixedText(
      key: mixedTextKey,
      text: 'Mixed Text',
      spec: textSpec,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [text, mixedText],
          ),
        ),
      ),
    );

    final textFinder = find.byKey(textKey);
    final textWidget = tester.widget<Text>(textFinder);
    expect(textFinder, findsOneWidget);

    final mixedTextFinder = find.byKey(mixedTextKey);
    expect(mixedTextFinder, findsOneWidget);

    final mixedTextWidget = tester.widget<Text>(find.descendant(
      of: mixedTextFinder,
      matching: find.byType(Text),
    ));

    expect(textWidget.data, 'Sample Text');
    expect(mixedTextWidget.data, 'Mixed Text');
    expect(textWidget.style, mixedTextWidget.style);
    expect(textWidget.strutStyle, mixedTextWidget.strutStyle);
    expect(textWidget.textAlign, mixedTextWidget.textAlign);
    expect(textWidget.textDirection, mixedTextWidget.textDirection);
    expect(textWidget.softWrap, mixedTextWidget.softWrap);
    expect(textWidget.overflow, mixedTextWidget.overflow);
    expect(textWidget.textScaleFactor, mixedTextWidget.textScaleFactor);
    expect(textWidget.maxLines, mixedTextWidget.maxLines);
    expect(textWidget.textWidthBasis, mixedTextWidget.textWidthBasis);
    expect(textWidget.textHeightBehavior, mixedTextWidget.textHeightBehavior);
  });
}
