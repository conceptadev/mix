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
          variant: RadioVariant.outline,
          size: RadioSize.small,
          disabled: true,
        ),
      );

      final rxBlankRadio =
          tester.widget<RxBlankRadio>(find.byType(RxBlankRadio));
      expect(rxBlankRadio.value, equals(true));
      expect(rxBlankRadio.disabled, equals(true));

      await tester.tap(find.byType(RxBlankRadio));
      expect(changedValue, isNull);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      final $radio = RadioSpecUtility.self;

      await tester.pumpRxComponent(
        RxRadio(
          value: false,
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
          onChanged: (v) => changedValue = v,
        ),
      );

      await tester.tap(find.byType(RxBlankRadio));
      expect(changedValue, isTrue);
    });

    testWidgets('applies different variants', (WidgetTester tester) async {
      for (final variant in RadioVariant.values) {
        await tester.pumpRxComponent(
          RxRadio(
            value: true,
            onChanged: (_) {},
            variant: variant,
          ),
        );

        final radio = tester.widget<RxBlankRadio>(find.byType(RxBlankRadio));
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
            onChanged: (_) {},
            size: size,
          ),
        );

        final radio = tester.widget<RxBlankRadio>(find.byType(RxBlankRadio));
        final appliedVariantStillInStyle =
            radio.style.variants.values.any((e) => e.variant == size);

        expect(appliedVariantStillInStyle, false);
      }
    });
  });
}
