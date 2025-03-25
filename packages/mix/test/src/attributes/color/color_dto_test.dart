import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('ColorDto Tests', () {
    // Standard colors for basic testing
    const colorList = [Colors.red, Colors.green, Colors.blue];

    // Testing ColorDto.resolve with standard Colors
    for (var color in colorList) {
      test(
        'ColorDto.resolve should return the same color as provided for $color',
        () {
          final colorDto = ColorMix(color);
          final resolvedValue = colorDto.resolve(EmptyMixData);
          expect(resolvedValue, color);
        },
      );
    }

    // Testing ColorDto.resolve with ColorRef
    testWidgets(
      'ColorDto.resolve should resolve ColorRef correctly',
      (tester) async {
        const testColorToken = ColorToken('test');

        await tester.pumpWithMixTheme(
          Container(),
          theme: MixThemeData(colors: {testColorToken: Colors.red}),
        );

        final buildContext = tester.element(find.byType(Container));

        final mockMixData = MixData.create(buildContext, Style());

        final colorRef = testColorToken();
        final colorDto = ColorMix(colorRef);
        final resolvedValue = colorDto.resolve(mockMixData);

        expect(colorRef, isA<ColorRef>());
        expect(colorRef.token, testColorToken);
        expect(resolvedValue, isA<Color>());
        expect(resolvedValue, Colors.red);
      },
    );

    test('ColorDto.maybeFrom should return a ColorDto for non-null input', () {
      const color = Colors.red;
      final colorDto = color.toDto();
      expect(colorDto, isA<ColorMix>());
      expect(colorDto.value, color);
    });

    // Testing merge method
    test('ColorDto.merge should merge correctly with non-null other', () {
      const colorDto1 = ColorMix(Colors.red);
      const colorDto2 = ColorMix(Colors.green);
      final merged = colorDto1.merge(colorDto2);
      expect(merged, isA<ColorMix>());
      expect(merged.value, colorDto2.value);
    });

    test('ColorDto.merge should return the same instance for null other', () {
      const colorDto = ColorMix(Colors.red);
      final merged = colorDto.merge(null);
      expect(merged, same(colorDto));
    });

    test('ColorDirectiveCleaner', () {
      var colorDto = const ColorMix.raw(value: Colors.red, directives: [
        DarkenColorDirective(10),
      ]);

      colorDto =
          colorDto.merge(ColorMix.directive(const ResetColorDirective()));
      expect(
        Colors.red,
        colorDto.resolve(
          MixData.create(
            MockBuildContext(),
            Style(),
          ),
        ),
      );

      colorDto =
          colorDto.merge(const ColorMix.raw(value: Colors.red, directives: [
        DarkenColorDirective(20),
      ]));

      expect(
        Colors.red.darken(20),
        colorDto.resolve(
          MixData.create(
            MockBuildContext(),
            Style(),
          ),
        ),
      );

      colorDto =
          colorDto.merge(ColorMix.directive(const ResetColorDirective()));

      colorDto = colorDto.merge(ColorMix.directive(
        const SaturateColorDirective(20),
      ));

      colorDto = colorDto.merge(ColorMix.directive(
        const DarkenColorDirective(20),
      ));

      expect(
        Colors.red.saturate(20).darken(20),
        colorDto.resolve(
          MixData.create(
            MockBuildContext(),
            Style(),
          ),
        ),
      );
    });

    // Test equality
    test('ColorDto.equals should return true for equal instances', () {
      const colorDto1 = ColorMix.raw(
        value: Colors.red,
        directives: [OpacityColorDirective(0.5)],
      );
      const colorDto2 = ColorMix.raw(
        value: Colors.red,
        directives: [OpacityColorDirective(0.5)],
      );

      const colorDto3 = ColorMix.raw(
        value: Colors.red,
        directives: [DarkenColorDirective(10)],
      );

      expect(colorDto1, colorDto2);
      expect(colorDto1, isNot(colorDto3));
    });
  });
}
