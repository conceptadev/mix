import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/decoration/image/decoration_image_dto.dart';

import '../../../../helpers/testing_utils.dart';

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
        mergedDto.centerSlice,
        equals(const Rect.fromLTRB(50, 60, 70, 80)),
      );
      expect(mergedDto.repeat, equals(ImageRepeat.repeatX));
      expect(mergedDto.filterQuality, equals(FilterQuality.low));
      expect(mergedDto.invertColors, equals(false));
      expect(mergedDto.isAntiAlias, equals(false));
    });

    test('resolve with default values', () {
      const dto = DecorationImageDto(image: imageProvider);
      final result = dto.resolve(EmptyMixData);

      expect(result.image, equals(imageProvider));
      expect(result.alignment, equals(Alignment.center));
      expect(result.repeat, equals(ImageRepeat.noRepeat));
      expect(result.filterQuality, equals(FilterQuality.low));
      expect(result.invertColors, equals(false));
      expect(result.isAntiAlias, equals(false));
    });

    test('resolve with custom values', () {
      const dto = DecorationImageDto(
        image: imageProvider,
        fit: BoxFit.scaleDown,
        alignment: Alignment.bottomCenter,
        centerSlice: Rect.fromLTRB(5, 10, 15, 20),
        repeat: ImageRepeat.repeatY,
        filterQuality: FilterQuality.medium,
        invertColors: true,
        isAntiAlias: true,
      );
      final result = dto.resolve(EmptyMixData);

      expect(result.image, equals(imageProvider));
      expect(result.fit, equals(BoxFit.scaleDown));
      expect(result.alignment, equals(Alignment.bottomCenter));
      expect(result.centerSlice, equals(const Rect.fromLTRB(5, 10, 15, 20)));
      expect(result.repeat, equals(ImageRepeat.repeatY));
      expect(result.filterQuality, equals(FilterQuality.medium));
      expect(result.invertColors, equals(true));
      expect(result.isAntiAlias, equals(true));
    });

    test('resolve throws assertion error when image is null', () {
      const dto = DecorationImageDto(image: null);
      expect(() => dto.resolve(EmptyMixData), throwsAssertionError);
    });

    test('equality', () {
      const dto1 = DecorationImageDto(
        image: imageProvider,
        fit: BoxFit.scaleDown,
        alignment: Alignment.bottomCenter,
        centerSlice: Rect.fromLTRB(5, 10, 15, 20),
        repeat: ImageRepeat.repeatY,
        filterQuality: FilterQuality.medium,
        invertColors: true,
        isAntiAlias: true,
      );

      const dto2 = DecorationImageDto(
        image: imageProvider,
        fit: BoxFit.scaleDown,
        alignment: Alignment.bottomCenter,
        centerSlice: Rect.fromLTRB(5, 10, 15, 20),
        repeat: ImageRepeat.repeatY,
        filterQuality: FilterQuality.medium,
        invertColors: true,
        isAntiAlias: true,
      );

      expect(dto1, equals(dto2));

      const dto3 = DecorationImageDto(
        image: imageProvider,
        fit: BoxFit.scaleDown,
        alignment: Alignment.bottomCenter,
        centerSlice: Rect.fromLTRB(5, 10, 15, 20),
        repeat: ImageRepeat.repeatY,
        filterQuality: FilterQuality.medium,
        invertColors: true,
        isAntiAlias: false,
      );

      expect(dto1, isNot(equals(dto3)));
      expect(dto2, isNot(equals(dto3)));
    });
  });
}
