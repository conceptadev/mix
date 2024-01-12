import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('VariantOperation', () {
    test('should add variant with & operator', () {
      const variant = Variant('test');
      const otherVariant = Variant('other');
      final result = otherVariant & variant;
      expect(result.variants, contains(variant));
      expect(result.variants, contains(otherVariant));
    });

    test('should add variant with | operator', () {
      const variant = Variant('test');
      const otherVariant = Variant('other');
      final result = otherVariant | variant;
      expect(result.variants, contains(variant));
      expect(result.variants, contains(otherVariant));
    });

    group('Operator `or`', () {
      const foo = Variant('foo');
      const bar = Variant('bar');
      const fooBar = Variant('foobar');

      Widget buildWidgetForTest(Style style, Variant variant) {
        return Builder(
          builder: (context) {
            final mixData = MixData.create(context, style.variant(variant));
            final icon = IconSpec.of(mixData);

            expect(icon.color, Colors.black);

            return const SizedBox(
              height: 10,
            );
          },
        );
      }

      testWidgets('should set the same icon color for 2 different variants',
          (WidgetTester tester) async {
        final style = Style(
          (foo | bar)(
            icon.color.black(),
          ),
        );

        await tester.pumpMaterialApp(
          Row(
            children: [
              buildWidgetForTest(style, foo),
              buildWidgetForTest(style, bar),
            ],
          ),
        );
      });

      testWidgets('should set the same icon color for 3 different variants',
          (WidgetTester tester) async {
        final style = Style(
          (foo | bar | fooBar)(
            icon.color.black(),
          ),
        );

        await tester.pumpMaterialApp(
          Row(
            children: [
              buildWidgetForTest(style, foo),
              buildWidgetForTest(style, bar),
              buildWidgetForTest(style, fooBar),
            ],
          ),
        );
      });
    });

    group('Operator `and`', () {
      const foo = Variant('foo');
      const bar = Variant('bar');
      const fooBar = Variant('foobar');

      Widget buildWidgetForTest(Style style, List<Variant> variants) {
        return Builder(
          builder: (context) {
            final mixData =
                MixData.create(context, style.variantList(variants));
            final icon = IconSpec.of(mixData);

            expect(icon.color, Colors.black);

            return const Placeholder();
          },
        );
      }

      testWidgets(
          'should set the icon color when 2 different variants are needed',
          (WidgetTester tester) async {
        final style = Style(
          (foo & bar)(
            icon.color.black(),
          ),
        );

        await tester.pumpMaterialApp(
          buildWidgetForTest(style, [foo, bar]),
        );
      });

      testWidgets(
          'should set the icon color when 3 different variants are needed',
          (WidgetTester tester) async {
        final style = Style(
          (foo & bar & fooBar)(
            icon.color.black(),
          ),
        );

        await tester.pumpMaterialApp(
          buildWidgetForTest(style, [foo, bar, fooBar]),
        );
      });
    });
  });
}
