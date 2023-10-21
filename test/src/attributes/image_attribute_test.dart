import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ImageAttributes', () {
    const image = AssetImageAttribute('assets/image.png');
    final width = WidthAttribute.from(200.0);
    final height = HeightAttribute.from(150.0);
    const color = ColorDto(Colors.red);
    const repeat = ImageRepeatAttribute(ImageRepeat.repeatX);

    const fit = BoxFitAttribute(BoxFit.cover);

    test('merge returns merged object correctly', () {
      final attr1 = ImageAttributes(
        image: image,
        width: width,
        height: height,
        color: color,
        repeat: null,
        fit: fit,
      );
      final attr2 = ImageAttributes(
        image: null,
        width: WidthAttribute.from(250.0),
        height: HeightAttribute.from(200.0),
        color: null,
        repeat: repeat,
        fit: null,
      );

      final merged = attr1.merge(attr2);

      expect(merged.image?.image, image); // should take from attr1
      expect(merged.width?.value, 250.0); // should take from attr2
      expect(merged.height?.value, 200.0); // should take from attr2
      expect(merged.color?.value, Colors.red); // should take from attr1
      expect(
          merged.repeat?.value, ImageRepeat.repeatX); // should take from attr1
      expect(merged.fit?.fit, BoxFit.cover); // should take from attr1
    });

    test('resolve returns correct ImageSpec', () {
      const attr = ImageAttributes(
        image: image,
        width: width,
        height: height,
        color: color,
        repeat: repeat,
        fit: fit,
      );

      final resolvedSpec = attr.resolve(EmptyMixData);

      expect(resolvedSpec.image, const AssetImage('assets/image.png'));
      expect(resolvedSpec.width, 200.0);
      expect(resolvedSpec.height, 150.0);
      expect(resolvedSpec.color, Colors.red);
      expect(resolvedSpec.repeat, ImageRepeat.repeatX);
      expect(resolvedSpec.fit, BoxFit.cover);
      return const Placeholder();
    });

    test('Equality holds when all properties are the same', () {
      const attr1 = ImageAttributes(
        image: image,
        width: width,
        height: height,
        color: color,
        repeat: repeat,
        fit: fit,
      );
      const attr2 = ImageAttributes(
        image: image,
        width: width,
        height: height,
        color: color,
        repeat: repeat,
        fit: fit,
      );

      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const attr1 = ImageAttributes(
        image: image,
        width: width,
        height: height,
        color: color,
        repeat: repeat,
        fit: fit,
      );
      const attr2 = ImageAttributes(
        image: null,
        width: width,
        height: height,
        color: color,
        repeat: repeat,
        fit: fit,
      );

      expect(attr1, isNot(attr2));
    });
  });

  group('ImageSpec', () {
    const image = AssetImage('assets/image.png');
    const width = 200.0;
    const height = 150.0;
    const color = Colors.red;
    const repeat = ImageRepeat.repeatX;
    const fit = BoxFit.cover;

    test('lerp returns correct ImageSpec', () {
      const spec1 = ImageSpec(
        image: AssetImage('assets/image1.png'),
        width: width,
        height: height,
        color: Colors.red,
        repeat: ImageRepeat.noRepeat,
        fit: BoxFit.contain,
      );
      const spec2 = ImageSpec(
        image: AssetImage('assets/image2.png'),
        width: width,
        height: height,
        color: Colors.blue,
        repeat: ImageRepeat.repeatY,
        fit: BoxFit.fill,
      );

      final lerpedSpec = spec1.lerp(spec2, 0.5);

      expect(lerpedSpec.image,
          const AssetImage('assets/image1.png')); // should take from spec1
      expect(lerpedSpec.width, 200.0); // should take from spec1
      expect(lerpedSpec.height, 150.0); // should take from spec1
      expect(
          lerpedSpec.color,
          Color.lerp(Colors.red, Colors.blue,
              0.5)); // should interpolate between red and blue
      expect(lerpedSpec.repeat, ImageRepeat.repeatY); // should take from spec2
      expect(lerpedSpec.fit, BoxFit.fill); // should take from spec2
    });

    test('copyWith returns correct ImageSpec', () {
      const spec = ImageSpec(
        image: AssetImage('assets/image.png'),
        width: width,
        height: height,
        color: Colors.red,
        repeat: ImageRepeat.repeatX,
        fit: BoxFit.cover,
      );

      final copiedSpec = spec.copyWith(
        image: const AssetImage('assets/image2.png'),
        width: 250.0,
        height: 200.0,
        color: Colors.blue,
        repeat: ImageRepeat.repeatY,
        fit: BoxFit.fill,
      );

      expect(copiedSpec.image, const AssetImage('assets/image2.png'));
      expect(copiedSpec.width, 250.0);
      expect(copiedSpec.height, 200.0);
      expect(copiedSpec.color, Colors.blue);
      expect(copiedSpec.repeat, ImageRepeat.repeatY);
      expect(copiedSpec.fit, BoxFit.fill);
    });

    test('Equality holds when all properties are the same', () {
      const spec1 = ImageSpec(
        image: image,
        width: width,
        height: height,
        color: color,
        repeat: repeat,
        fit: fit,
      );
      const spec2 = ImageSpec(
        image: image,
        width: width,
        height: height,
        color: color,
        repeat: repeat,
        fit: fit,
      );

      expect(spec1, spec2);
    });

    test('Equality fails when properties are different', () {
      const spec1 = ImageSpec(
        image: AssetImage('assets/image1.png'),
        width: width,
        height: height,
        color: Colors.red,
        repeat: ImageRepeat.noRepeat,
        fit: BoxFit.contain,
      );
      const spec2 = ImageSpec(
        image: AssetImage('assets/image2.png'),
        width: width,
        height: height,
        color: Colors.blue,
        repeat: ImageRepeat.repeatY,
        fit: BoxFit.fill,
      );

      expect(spec1, isNot(spec2));
    });
  });
}
