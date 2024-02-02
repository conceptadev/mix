import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/decoration/image/decoration_image_dto.dart';

void main() {
  group('DecorationImageDto', () {
    const imageProvider = AssetImage('assets/images/test.png');
    const dto = DecorationImageDto(
      image: imageProvider,
      fit: BoxFit.cover,
      alignment: Alignment.topLeft,
      centerSlice: Rect.fromLTRB(10, 20, 30, 40),
      repeat: ImageRepeat.repeat,
      filterQuality: FilterQuality.high,
      invertColors: true,
      isAntiAlias: true,
    );

    test('maybeFrom', () {
      const decorationImage = DecorationImage(
        image: imageProvider,
        fit: BoxFit.cover,
        alignment: Alignment.topLeft,
        centerSlice: Rect.fromLTRB(10, 20, 30, 40),
        repeat: ImageRepeat.repeat,
        filterQuality: FilterQuality.high,
        invertColors: true,
        isAntiAlias: true,
      );
      final result = DecorationImageDto.maybeFrom(decorationImage);
      expect(result, isNotNull);
      expect(result!.image, equals(imageProvider));
      expect(result.fit, equals(BoxFit.cover));
      expect(result.alignment, equals(Alignment.topLeft));
      expect(result.centerSlice, equals(const Rect.fromLTRB(10, 20, 30, 40)));
      expect(result.repeat, equals(ImageRepeat.repeat));
      expect(result.filterQuality, equals(FilterQuality.high));
      expect(result.invertColors, equals(true));
      expect(result.isAntiAlias, equals(true));
    });

    test('merge', () {
      const otherDto = DecorationImageDto(
        image: imageProvider,
        fit: BoxFit.fill,
        alignment: Alignment.bottomRight,
        centerSlice: Rect.fromLTRB(50, 60, 70, 80),
        repeat: ImageRepeat.repeatX,
        filterQuality: FilterQuality.low,
        invertColors: false,
        isAntiAlias: false,
      );

      final mergedDto = dto.merge(otherDto);

      expect(mergedDto.image, equals(imageProvider));
      expect(mergedDto.fit, equals(BoxFit.fill));
      expect(mergedDto.alignment, equals(Alignment.bottomRight));
      expect(
          mergedDto.centerSlice, equals(const Rect.fromLTRB(50, 60, 70, 80)));
      expect(mergedDto.repeat, equals(ImageRepeat.repeatX));
      expect(mergedDto.filterQuality, equals(FilterQuality.low));
      expect(mergedDto.invertColors, equals(false));
      expect(mergedDto.isAntiAlias, equals(false));
    });
  });
}
