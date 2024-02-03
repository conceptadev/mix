import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/core/extensions/color_ext.dart';

import '../../../helpers/testing_utils.dart';

class TestColorAttribute extends SpecAttribute<TestColorAttribute, Color> {
  final ColorDto? value;
  const TestColorAttribute([this.value]);

  @override
  TestColorAttribute merge(TestColorAttribute? other) {
    return TestColorAttribute(value?.merge(other?.value));
  }

  @override
  Color resolve(MixData mix) {
    return value?.resolve(mix) ?? Colors.transparent;
  }

  @override
  get props => [value];
}

void main() {
  group('ColorUtility directives', () {
    const colorUtility = ColorUtility(TestColorAttribute.new);
    // withOpacity
    test('withOpacity should return a new ColorDirective', () {
      final attribute = colorUtility.withOpacity(0.5);

      expect(attribute.value?.directives.length, 1);
      expect(attribute.value?.directives.first, isA<OpacityColorDirective>());
    });

    test('withOpacity resolves the correct value', () {
      final style = Style(
        colorUtility(Colors.red),
        colorUtility.withOpacity(0.5),
      );

      final result = MockMixData(style);
      final value = result.resolvableOf<Color, TestColorAttribute>()!;

      expect(value, Colors.red.withOpacity(0.5));
    });

    // withAlpha
    test('withAlpha should return a new ColorDirective', () {
      final attribute = colorUtility.withAlpha(100);

      expect(attribute.value?.directives.length, 1);
      expect(attribute.value?.directives.first, isA<AlphaColorDirective>());
    });

    // withAlpha resolves
    test('withAlpha resolves the correct value', () {
      final style = Style(
        colorUtility(Colors.red),
        colorUtility.withAlpha(50),
      );

      final result = MockMixData(style);
      final value = result.resolvableOf<Color, TestColorAttribute>()!;

      expect(value, Colors.red.withAlpha(50));
    });

    // darken
    test('darken should return a new ColorDirective', () {
      final attribute = colorUtility.darken(10);

      expect(attribute.value?.directives.length, 1);
      expect(attribute.value?.directives.first, isA<DarkenColorDirective>());
    });

    //  darken resolves
    test('darken resolves the correct value', () {
      final style = Style(colorUtility(Colors.red), colorUtility.darken(10));

      final result = MockMixData(style);
      final value = result.resolvableOf<Color, TestColorAttribute>()!;

      expect(value, Colors.red.darken(10));
    });

    // lighten
    test('lighten should return a new ColorDirective', () {
      final attribute = colorUtility.lighten(10);

      expect(attribute.value?.directives.length, 1);
      expect(attribute.value?.directives.first, isA<LightenColorDirective>());
    });

    // lighten resolves
    test('lighten resolves the correct value', () {
      final style = Style(
        colorUtility(Colors.red),
        colorUtility.lighten(10),
      );

      final result = MockMixData(style);
      final value = result.resolvableOf<Color, TestColorAttribute>()!;

      expect(value, Colors.red.lighten(10));
    });

    // saturate
    test('saturate should return a new ColorDirective', () {
      final attribute = colorUtility.saturate(10);

      expect(attribute.value?.directives.length, 1);
      expect(attribute.value?.directives.first, isA<SaturateColorDirective>());
    });

    // saturate resolves
    test('saturate resolves the correct value', () {
      final style = Style(
        colorUtility(Colors.red),
        colorUtility.saturate(10),
      );

      final result = MockMixData(style);
      final value = result.resolvableOf<Color, TestColorAttribute>()!;

      expect(value, Colors.red.saturate(10));
    });

    // desaturate
    test('desaturate should return a new ColorDirective', () {
      final attribute = colorUtility.desaturate(10);

      expect(attribute.value?.directives.length, 1);
      expect(attribute.value?.directives.first, isA<DesaturateColorDirective>());
    });

    // desaturate resolves
    test('desaturate resolves the correct value', () {
      final style = Style(
        colorUtility(Colors.red),
        colorUtility.desaturate(10),
      );

      final result = MockMixData(style);
      final value = result.resolvableOf<Color, TestColorAttribute>()!;

      expect(value, Colors.red.desaturate(10));
    });

    // tint
    test('tint should return a new ColorDirective', () {
      final attribute = colorUtility.tint(10);

      expect(attribute.value?.directives.length, 1);
      expect(attribute.value?.directives.first, isA<TintColorDirective>());
    });

    // tint resolves
    test('tint resolves the correct value', () {
      final style = Style(colorUtility(Colors.red), colorUtility.tint(10));

      final result = MockMixData(style);
      final value = result.resolvableOf<Color, TestColorAttribute>()!;
      expect(value, Colors.red.tint(10));
    });

    // shade
    test('shade should return a new ColorDirective', () {
      final attribute = colorUtility.shade(10);

      expect(attribute.value?.directives.length, 1);
      expect(attribute.value?.directives.first, isA<ShadeColorDirective>());
    });

    // shade resolves
    test('shade resolves the correct value', () {
      final style = Style(colorUtility(Colors.red), colorUtility.shade(10));

      final result = MockMixData(style);
      final value = result.resolvableOf<Color, TestColorAttribute>()!;

      expect(value, Colors.red.shade(10));
    });

    // brighten
    test('brighten should return a new ColorDirective', () {
      final attribute = colorUtility.brighten(10);

      expect(attribute.value?.directives.length, 1);
      expect(attribute.value?.directives.first, isA<BrightenColorDirective>());
    });

    // brighten resolves
    test('brighten resolves the correct value', () {
      final style = Style(
        colorUtility(Colors.red),
        colorUtility.brighten(10),
      );

      final result = MockMixData(style);
      final value = result.resolvableOf<Color, TestColorAttribute>()!;

      expect(value, Colors.red.brighten(10));
    });

    // lighten and darken and opacity
    test('lighten and darken and opacity resolves the correct value', () {
      final style = Style(
        colorUtility(Colors.red),
        colorUtility.lighten(10),
        colorUtility.darken(10),
        colorUtility.withOpacity(0.5),
      );

      final result = MockMixData(style);
      final value = result.resolvableOf<Color, TestColorAttribute>()!;

      expect(value, Colors.red.lighten(10).darken(10).withOpacity(0.5));
    });
  });
}
