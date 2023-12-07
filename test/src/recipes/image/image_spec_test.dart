import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('ImageSpec', () {
    test('resolve returns correct recipe', () {
      const attribute = ImageMixAttribute();
      final recipe = ImageSpec.resolve(EmptyMixData);

      expect(recipe.width, null);
      expect(recipe.height, null);
      expect(recipe.color, null);
      expect(recipe.repeat, null);
      expect(recipe.fit, null);
    });

    test('lerp returns correct ImageSpec', () {
      const spec1 = ImageSpec(
        width: 100,
        height: 200,
        color: Colors.red,
        repeat: ImageRepeat.repeat,
        fit: BoxFit.cover,
      );
      const spec2 = ImageSpec(
        width: 150,
        height: 250,
        color: Colors.blue,
        repeat: ImageRepeat.noRepeat,
        fit: BoxFit.fill,
      );
      final lerpSpec = spec1.lerp(spec2, 0.5);

      expect(lerpSpec.width, lerpDouble(100, 150, 0.5));
      expect(lerpSpec.height, lerpDouble(200, 250, 0.5));
      expect(lerpSpec.color, Color.lerp(Colors.red, Colors.blue, 0.5));
      expect(lerpSpec.repeat, ImageRepeat.noRepeat);
      expect(lerpSpec.fit, BoxFit.fill);
    });

    test('copyWith returns correct ImageSpec', () {
      const spec = ImageSpec(
        width: 100,
        height: 200,
        color: Colors.red,
        repeat: ImageRepeat.repeat,
        fit: BoxFit.cover,
      );
      final copiedSpec = spec.copyWith(
        width: 150,
        height: 250,
        color: Colors.blue,
        repeat: ImageRepeat.noRepeat,
        fit: BoxFit.fill,
      );

      expect(copiedSpec.width, 150);
      expect(copiedSpec.height, 250);
      expect(copiedSpec.color, Colors.blue);
      expect(copiedSpec.repeat, ImageRepeat.noRepeat);
      expect(copiedSpec.fit, BoxFit.fill);
    });

    test('props returns correct list of properties', () {
      const spec = ImageSpec(
        width: 100,
        height: 200,
        color: Colors.red,
        repeat: ImageRepeat.repeat,
        fit: BoxFit.cover,
      );
      final props = spec.props;

      expect(props.length, 5);
      expect(props[0], 100);
      expect(props[1], 200);
      expect(props[2], Colors.red);
      expect(props[3], ImageRepeat.repeat);
      expect(props[4], BoxFit.cover);
    });
  });
}
