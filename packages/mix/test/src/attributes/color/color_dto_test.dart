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
          final colorDto = ColorDto(color);
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
        final colorDto = ColorDto(colorRef);
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
      expect(colorDto, isA<ColorDto>());
      expect(colorDto.value, color);
    });

    // Testing merge method
    test('ColorDto.merge should merge correctly with non-null other', () {
      const colorDto1 = ColorDto(Colors.red);
      const colorDto2 = ColorDto(Colors.green);
      final merged = colorDto1.merge(colorDto2);
      expect(merged, isA<ColorDto>());
      expect(merged.value, colorDto2.value);
    });

    test('ColorDto.merge should return the same instance for null other', () {
      const colorDto = ColorDto(Colors.red);
      final merged = colorDto.merge(null);
      expect(merged, same(colorDto));
    });

    // Test equality
    test('ColorDto.equals should return true for equal instances', () {
      const colorDto1 = ColorDto.raw(
        value: Colors.red,
        directives: [OpacityColorDirective(0.5)],
      );
      const colorDto2 = ColorDto.raw(
        value: Colors.red,
        directives: [OpacityColorDirective(0.5)],
      );

      const colorDto3 = ColorDto.raw(
        value: Colors.red,
        directives: [DarkenColorDirective(10)],
      );

      expect(colorDto1, colorDto2);
      expect(colorDto1, isNot(colorDto3));
    });
  });
}
