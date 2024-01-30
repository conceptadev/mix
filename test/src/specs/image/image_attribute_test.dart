import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('ImageMixAttribute', () {
    test('resolve returns correct ImageSpec', () {
      const attribute = ImageSpecAttribute(
        width: 100,
        height: 200,
        color: ColorDto(Colors.red),
        repeat: ImageRepeat.repeat,
        fit: BoxFit.cover,
      );

      final spec = attribute.resolve(EmptyMixData);

      expect(spec.width, 100);
      expect(spec.height, 200);
      expect(spec.color, Colors.red);
      expect(spec.repeat, ImageRepeat.repeat);
      expect(spec.fit, BoxFit.cover);
    });

    test('merge returns correct ImageMixAttribute', () {
      const attribute1 = ImageSpecAttribute(
        width: 100,
        height: 200,
        color: ColorDto(Colors.red),
        repeat: ImageRepeat.repeat,
        fit: BoxFit.cover,
      );
      const attribute2 = ImageSpecAttribute(
        width: 150,
        height: 250,
        color: ColorDto(Colors.blue),
        repeat: ImageRepeat.noRepeat,
        fit: BoxFit.fill,
      );
      final mergedAttribute = attribute1.merge(attribute2);

      expect(mergedAttribute.width, 150);
      expect(mergedAttribute.height, 250);
      expect(mergedAttribute.color, const ColorDto(Colors.blue));
      expect(mergedAttribute.repeat, ImageRepeat.noRepeat);
      expect(mergedAttribute.fit, BoxFit.fill);
    });

    test('props returns correct list of properties', () {
      const attribute = ImageSpecAttribute(
        width: 100,
        height: 200,
        color: ColorDto(Colors.black),
        repeat: ImageRepeat.repeat,
        fit: BoxFit.cover,
        alignment: Alignment.bottomCenter,
        centerSlice: Rect.zero,
        filterQuality: FilterQuality.low,
        colorBlendMode: BlendMode.srcOver,
      );
      final props = attribute.props;

      expect(props.length, 9);
      expect(props[0], 100);
      expect(props[1], 200);
      expect(props[2], const ColorDto(Colors.black));
      expect(props[3], ImageRepeat.repeat);
      expect(props[4], BoxFit.cover);
      expect(props[5], Rect.zero);
      expect(props[6], Alignment.bottomCenter);
      expect(props[7], FilterQuality.low);
      expect(props[8], BlendMode.srcOver);
    });
  });
}
