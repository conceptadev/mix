import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/core/extensions/color_ext.dart';

void main() {
  group('ColorExt Tests', () {
    const color1 = Color.fromARGB(255, 244, 67, 54); // Colors.red
    const color2 = Color.fromARGB(255, 33, 150, 243); // Colors.blue
    test('mix() should return the correct color', () {
      final mixedColor = color1.mix(color2, 50);

      expect(mixedColor, const Color.fromARGB(255, 139, 109, 149)); // Colors.purple
    });

    test('lighten() should return the correct color', () {
      final lightenedColor = color1.lighten(10);

      expect(lightenedColor, const Color.fromARGB(255, 247, 112, 102));
    });

    test('brighten() should return the correct color', () {
      final brightenedColor = color1.brighten(10);

      expect(brightenedColor, const Color.fromARGB(255, 255, 93, 80));
    });

    test('darken() should return the correct color', () {
      final darkenedColor = color1.darken(10);

      expect(darkenedColor, const Color.fromARGB(255, 234, 28, 13));
    });

    test('tint() should return the correct color', () {
      final tintedColor = color1.tint(10);

      expect(tintedColor, const Color.fromARGB(255, 245, 86, 74));
    });

    test('shade() should return the correct color', () {
      final shadedColor = color1.shade(10);

      expect(shadedColor, const Color.fromARGB(255, 220, 60, 49));
    });

    test('desaturate() should return the correct color', () {
      final desaturatedColor = color1.desaturate(10);

      expect(desaturatedColor, const Color.fromARGB(255, 233, 76, 65));
    });

    test('saturate() should return the correct color', () {
      final saturatedColor = color1.saturate(10);

      expect(saturatedColor, const Color.fromARGB(255, 255, 58, 43));
    });

    test('greyscale() should return the correct color', () {
      final greyscaleColor = color1.greyscale();

      expect(greyscaleColor, const Color.fromARGB(255, 149, 149, 149));
    });

    test('complement() should return the correct color', () {
      final complementColor = color1.complement();

      expect(complementColor, const Color.fromARGB(255, 54, 231, 244));
    });

    test('toDto() should return the correct ColorDto', () {
      const color = Colors.blue;
      final colorDto = color.toDto();

      expect(colorDto, equals(const ColorDto(color)));
    });
  });

  // contrast
  // group('contrast() Tests', () {
  //   test('should return the correct color', () {
  //     const color = Color.fromARGB(255, 255, 255, 255);
  //     final contrastColor = color.contrast();

  //     expect(contrastColor, equals(const Color.fromARGB(255, 0, 0, 0)));
  //   });

  //   test('should return the correct color', () {
  //     const color = Colors.black;
  //     final contrastColor = color.contrast();

  //     expect(contrastColor, Colors.white);
  //   });

  //   test('should return the correct color', () {
  //     const color = Colors.red;
  //     final contrastColor = color.contrast();

  //     expect(contrastColor, Colors.black);
  //   });
  // });
}
