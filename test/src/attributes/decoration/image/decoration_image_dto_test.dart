import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/decoration/image/decoration_image_dto.dart';

void main() {
  group('DecorationImageDto', () {
    const imageProvider = AssetImage('assets/images/test.png');
    const dto = DecorationImageDto(
      image: imageProvider,
      fit: BoxFit.cover,
    );

    test('maybeFrom', () {
      const decorationImage =
          DecorationImage(image: imageProvider, fit: BoxFit.cover);
      final result = DecorationImageDto.maybeFrom(decorationImage);
      expect(result, isNotNull);
      expect(result!.image, equals(imageProvider));
      expect(result.fit, equals(BoxFit.cover));
    });

    test('merge', () {
      const otherDto =
          DecorationImageDto(image: imageProvider, fit: BoxFit.fill);

      final mergedDto = dto.merge(otherDto);

      expect(mergedDto.image, equals(imageProvider));
      expect(mergedDto.fit, equals(BoxFit.fill));
    });
  });
}
