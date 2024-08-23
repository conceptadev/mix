import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remix/src/components/switch/switch.dart';

import '../../utils/extensions/widget_tester.dart';

void main() {
  group('RxSwitch', () {
    testWidgets('renders correctly with default props',
        (WidgetTester tester) async {
      bool value = false;
      await tester.pumpRxComponent(
        XSwitch(
          value: value,
          onChanged: (bool newValue) {
            value = newValue;
          },
        ),
      );

      expect(find.byType(RxBlankSwitch), findsOneWidget);
    });

    testWidgets('calls onChanged when tapped', (WidgetTester tester) async {
      bool value = false;
      await tester.pumpRxComponent(
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return XSwitch(
              value: value,
              onChanged: (bool newValue) {
                setState(() {
                  value = newValue;
                });
              },
            );
          },
        ),
      );

      await tester.tap(find.byType(RxBlankSwitch));
      await tester.pump();

      expect(value, isTrue);
    });

    testWidgets('applies correct style based on variant and size',
        (WidgetTester tester) async {
      await tester.pumpRxComponent(
        XSwitch(
          value: true,
          onChanged: (_) {},
          variant: SwitchVariant.outline,
          size: SwitchSize.small,
        ),
      );

      final RxBlankSwitch blankSwitch =
          tester.widget(find.byType(RxBlankSwitch));
      expect(blankSwitch.style, isNotNull);
    });

    testWidgets('does not call onChanged when disabled',
        (WidgetTester tester) async {
      bool value = false;

      await tester.pumpRxComponent(
        XSwitch(
          value: value,
          onChanged: (newValue) {
            value = newValue;
          },
          disabled: true,
        ),
      );

      await tester.tap(find.byType(RxBlankSwitch));
      await tester.pump();

      expect(value, isFalse);
    });

    testWidgets('verifies the alignment of the switch when value is true',
        (WidgetTester tester) async {
      await tester.pumpRxComponent(
        XSwitch(
          value: true,
          onChanged: (_) {},
        ),
      );

      final Container container = tester.widget(find.byWidgetPredicate(
          (widget) => widget is Container && widget.alignment != null));
      expect(container.alignment, equals(Alignment.centerRight));
    });

    testWidgets('verifies the alignment of the switch when value is false',
        (WidgetTester tester) async {
      await tester.pumpRxComponent(
        XSwitch(
          value: false,
          onChanged: (_) {},
        ),
      );

      final Container container = tester.widget(find.byWidgetPredicate(
          (widget) => widget is Container && widget.alignment != null));
      expect(container.alignment, equals(Alignment.centerLeft));
    });
  });
}
