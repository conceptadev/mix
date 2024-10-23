import 'package:flutter/material.dart' as m;
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/src/components/radio/radio.dart';

void main() {
  group('Radio', () {
    testWidgets('renders RxBlankRadio with correct properties',
        (WidgetTester tester) async {
      bool value = true;
      bool? changedValue;

      await tester.pumpWidget(
        m.MaterialApp(
          home: Radio(
            value: value,
            onChanged: (v) => changedValue = v,
            groupValue: true,
            disabled: true,
            style: const RadioStyle(),
            label: '',
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
      const color = m.Colors.red;

      await tester.pumpWidget(
        m.MaterialApp(
          home: Radio(
            value: false,
            groupValue: true,
            disabled: false,
            onChanged: (_) {},
            style: const FakeRadioStyle(color),
            label: '',
          ),
        ),
      );

      final container =
          tester.firstWidget<m.Container>(find.byType(m.Container));
      expect(
        (container.decoration as m.BoxDecoration).color,
        equals(m.Colors.red),
      );
    });

    testWidgets('handles onChanged callback', (WidgetTester tester) async {
      bool value = false;
      bool? changedValue;

      await tester.pumpWidget(
        m.MaterialApp(
          home: Radio(
            style: const RadioStyle(),
            value: value,
            groupValue: true,
            onChanged: (v) => changedValue = v,
            label: '',
          ),
        ),
      );

      await tester.tap(find.byType(Radio<bool>));
      expect(changedValue, isFalse);
    });

    testWidgets('displays correct text', (WidgetTester tester) async {
      const testText = 'Test Radio';

      await tester.pumpWidget(
        m.MaterialApp(
          home: Radio(
            style: const RadioStyle(),
            value: false,
            groupValue: true,
            onChanged: (_) {},
            label: testText,
          ),
        ),
      );

      expect(find.text(testText), findsOneWidget);
    });
  });
}

class FakeRadioStyle extends RadioStyle {
  final m.Color color;

  const FakeRadioStyle(
    this.color,
  );

  @override
  Style makeStyle(SpecConfiguration<RadioSpecUtility> spec) {
    final $ = spec.utilities;

    final baseStyle = super.makeStyle(spec);
    return Style.create([
      baseStyle(),
      $.container.color(color),
    ]);
  }
}
