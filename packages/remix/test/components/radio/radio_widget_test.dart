import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/src/components/radio/radio.dart';

void main() {
  group('xRadio', () {
    testWidgets('renders RxBlankRadio with correct properties',
        (WidgetTester tester) async {
      bool value = true;
      bool? changedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Radio(
            value: value,
            onChanged: (v) => changedValue = v,
            groupValue: true,
            disabled: true,
            text: '',
          ),
        ),
      );

      final rxBlankRadio = tester.widget<Radio<bool>>(find.byType(Radio<bool>));
      expect(rxBlankRadio.value, equals(true));
      expect(rxBlankRadio.groupValue, equals(true));
      expect(rxBlankRadio.disabled, equals(true));

      await tester.tap(find.byType(Radio<bool>));
      expect(changedValue, isNull);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      final $radio = RadioSpecUtility.self;

      await tester.pumpWidget(
        MaterialApp(
          home: Radio(
            value: false,
            groupValue: true,
            disabled: false,
            onChanged: (_) {},
            style: Style(
              $radio.container.color.red(),
            ),
            text: '',
          ),
        ),
      );

      final container = tester.firstWidget<Container>(find.byType(Container));
      expect(
        (container.decoration as BoxDecoration).color,
        equals(Colors.red),
      );
    });

    testWidgets('handles onChanged callback', (WidgetTester tester) async {
      bool value = false;
      bool? changedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Radio(
            value: value,
            groupValue: true,
            onChanged: (v) => changedValue = v,
            text: '',
          ),
        ),
      );

      await tester.tap(find.byType(Radio<bool>));
      expect(changedValue, isFalse);
    });

    testWidgets('displays correct text', (WidgetTester tester) async {
      const testText = 'Test Radio';

      await tester.pumpWidget(
        MaterialApp(
          home: Radio(
            value: false,
            groupValue: true,
            onChanged: (_) {},
            text: testText,
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
    });
  });
}
