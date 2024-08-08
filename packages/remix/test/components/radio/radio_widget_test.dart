import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/radio/radio.dart';

import '../../utils/extensions/widget_tester.dart';

void main() {
  group('RxRadio', () {
    testWidgets('renders RxBlankRadio with correct properties',
        (WidgetTester tester) async {
      bool value = true;
      bool? changedValue;

      await tester.pumpRxComponent(
        RxRadio(
          value: value,
          onChanged: (v) => changedValue = v,
          groupValue: true,
          variant: RadioVariant.outline,
          size: RadioSize.small,
          disabled: true,
        ),
      );

      final rxBlankRadio =
          tester.widget<RxBlankRadio<bool>>(find.byType(RxBlankRadio<bool>));
      expect(rxBlankRadio.value, equals(true));
      expect(rxBlankRadio.groupValue, equals(true));
      expect(rxBlankRadio.disabled, equals(true));

      await tester.tap(find.byType(RxBlankRadio<bool>));
      expect(changedValue, isNull);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      final $radio = RadioSpecUtility.self;

      await tester.pumpRxComponent(
        RxRadio(
          value: false,
          groupValue: true,
          disabled: false,
          onChanged: (_) {},
          style: Style(
            RadioVariant.solid(
              $radio.container.color.red(),
            ),
          ),
        ),
      );

      final rxBlankRadio =
          tester.firstWidget<Container>(find.byType(Container));
      expect(
        (rxBlankRadio.decoration as BoxDecoration).color,
        equals(Colors.red),
      );
    });

    testWidgets('handles onChanged callback', (WidgetTester tester) async {
      bool value = false;
      bool? changedValue;

      await tester.pumpRxComponent(
        RxRadio(
          value: value,
          groupValue: true,
          onChanged: (v) => changedValue = v,
        ),
      );

      await tester.tap(find.byType(RxBlankRadio<bool>));
      expect(changedValue, isFalse);
    });

    testWidgets('applies different variants', (WidgetTester tester) async {
      for (final variant in RadioVariant.values) {
        await tester.pumpRxComponent(
          RxRadio(
            value: true,
            groupValue: false,
            onChanged: (_) {},
            variant: variant,
          ),
        );

        final radio =
            tester.widget<RxBlankRadio<bool>>(find.byType(RxBlankRadio<bool>));
        final appliedVariantStillInStyle =
            radio.style.variants.values.any((e) => e.variant == variant);

        expect(appliedVariantStillInStyle, false);
      }
    });

    testWidgets('applies different sizes', (WidgetTester tester) async {
      for (final size in RadioSize.values) {
        await tester.pumpRxComponent(
          RxRadio(
            value: true,
            groupValue: false,
            onChanged: (_) {},
            size: size,
          ),
        );

        final radio =
            tester.widget<RxBlankRadio<bool>>(find.byType(RxBlankRadio<bool>));
        final appliedVariantStillInStyle =
            radio.style.variants.values.any((e) => e.variant == size);

        expect(appliedVariantStillInStyle, false);
      }
    });
  });
}
