import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BoxSpecAttribute', () {
    test('Constructor assigns correct properties', () {
      final containerSpecAttribute = BoxSpecAttribute(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        constraints: const BoxConstraintsDto(maxHeight: 100),
        decoration: const BoxDecorationDto(color: ColorDto(Colors.blue)),
        height: 100,
        margin: const SpacingDto.only(
          bottom: 10,
          left: 10,
          right: 10,
          top: 10,
        ),
        padding:
            const SpacingDto.only(bottom: 20, left: 20, right: 20, top: 20),
        transform: Matrix4.identity(),
        width: 100,
      );

      expect(containerSpecAttribute.alignment, Alignment.center);
      expect(containerSpecAttribute.clipBehavior, Clip.antiAlias);

      expect(containerSpecAttribute.constraints,
          const BoxConstraintsDto(maxHeight: 100));
      expect(containerSpecAttribute.decoration,
          const BoxDecorationDto(color: ColorDto(Colors.blue)));

      expect(containerSpecAttribute.height, 100);
      expect(
          containerSpecAttribute.margin,
          const SpacingDto.only(
            bottom: 10,
            left: 10,
            right: 10,
            top: 10,
          ));
      expect(
        containerSpecAttribute.padding,
        const SpacingDto.only(bottom: 20, left: 20, right: 20, top: 20),
      );
      expect(containerSpecAttribute.transform, Matrix4.identity());
      expect(containerSpecAttribute.width, 100);
    });

    // resolve()
    test('resolve() returns correct instance', () {
      final containerSpecAttribute = BoxSpecAttribute(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        constraints: const BoxConstraintsDto(maxHeight: 100),
        decoration: const BoxDecorationDto(color: ColorDto(Colors.blue)),
        height: 100,
        margin: const SpacingDto.only(
          bottom: 10,
          left: 10,
          right: 10,
          top: 10,
        ),
        padding:
            const SpacingDto.only(bottom: 20, left: 20, right: 20, top: 20),
        transform: Matrix4.identity(),
        width: 100,
      );

      final containerSpec = containerSpecAttribute.resolve(EmptyMixData);

      expect(containerSpec.alignment, Alignment.center);
      expect(containerSpec.clipBehavior, Clip.antiAlias);

      expect(containerSpec.constraints,
          const BoxConstraints(maxHeight: 100, maxWidth: double.infinity));
      expect(containerSpec.decoration, const BoxDecoration(color: Colors.blue));

      expect(containerSpec.height, 100);
      expect(
          containerSpec.margin,
          const EdgeInsets.only(
            bottom: 10,
            left: 10,
            right: 10,
            top: 10,
          ));
      expect(
        containerSpec.padding,
        const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
      );
      expect(containerSpec.transform, Matrix4.identity());
      expect(containerSpec.width, 100);
    });

    // merge()
    test('merge() returns correct instance', () {
      final containerSpecAttribute = BoxSpecAttribute(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        constraints: const BoxConstraintsDto(maxHeight: 100),
        decoration: const BoxDecorationDto(color: ColorDto(Colors.blue)),
        height: 100,
        margin: const SpacingDto.only(
          bottom: 10,
          left: 10,
          right: 10,
          top: 10,
        ),
        padding:
            const SpacingDto.only(bottom: 20, left: 20, right: 20, top: 20),
        transform: Matrix4.identity(),
        width: 100,
      );

      final mergedBoxSpecAttribute = containerSpecAttribute.merge(
        BoxSpecAttribute(
          alignment: Alignment.centerLeft,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          constraints: const BoxConstraintsDto(maxHeight: 200),
          decoration: const BoxDecorationDto(color: ColorDto(Colors.red)),
          height: 200,
          margin: const SpacingDto.only(
            bottom: 20,
            left: 20,
            right: 20,
            top: 20,
          ),
          padding:
              const SpacingDto.only(bottom: 30, left: 30, right: 30, top: 30),
          transform: Matrix4.identity(),
          width: 200,
        ),
      );

      expect(mergedBoxSpecAttribute.alignment, Alignment.centerLeft);
      expect(mergedBoxSpecAttribute.clipBehavior, Clip.antiAliasWithSaveLayer);

      expect(mergedBoxSpecAttribute.constraints,
          const BoxConstraintsDto(maxHeight: 200));
      expect(mergedBoxSpecAttribute.decoration,
          const BoxDecorationDto(color: ColorDto(Colors.red)));

      expect(mergedBoxSpecAttribute.height, 200);
      expect(
          mergedBoxSpecAttribute.margin,
          const SpacingDto.only(
            bottom: 20,
            left: 20,
            right: 20,
            top: 20,
          ));
      expect(
        mergedBoxSpecAttribute.padding,
        const SpacingDto.only(bottom: 30, left: 30, right: 30, top: 30),
      );
      expect(mergedBoxSpecAttribute.transform, Matrix4.identity());
      expect(mergedBoxSpecAttribute.width, 200);
    });

    // equality
    test('equality', () {
      final containerSpecAttribute = BoxSpecAttribute(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        constraints: const BoxConstraintsDto(maxHeight: 100),
        decoration: const BoxDecorationDto(color: ColorDto(Colors.blue)),
        height: 100,
        margin: const SpacingDto.only(
          bottom: 10,
          left: 10,
          right: 10,
          top: 10,
        ),
        padding:
            const SpacingDto.only(bottom: 20, left: 20, right: 20, top: 20),
        transform: Matrix4.identity(),
        width: 100,
      );

      expect(
        containerSpecAttribute,
        equals(
          BoxSpecAttribute(
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            constraints: const BoxConstraintsDto(maxHeight: 100),
            decoration: const BoxDecorationDto(color: ColorDto(Colors.blue)),
            height: 100,
            margin: const SpacingDto.only(
              bottom: 10,
              left: 10,
              right: 10,
              top: 10,
            ),
            padding:
                const SpacingDto.only(bottom: 20, left: 20, right: 20, top: 20),
            transform: Matrix4.identity(),
            width: 100,
          ),
        ),
      );
    });

    // not equals
    test('not equals', () {
      final containerSpecAttribute = BoxSpecAttribute(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        constraints: const BoxConstraintsDto(maxHeight: 100),
        decoration: const BoxDecorationDto(color: ColorDto(Colors.blue)),
        height: 100,
        margin: const SpacingDto.only(
          bottom: 10,
          left: 10,
          right: 10,
          top: 10,
        ),
        padding:
            const SpacingDto.only(bottom: 20, left: 20, right: 20, top: 20),
        transform: Matrix4.identity(),
        width: 100,
      );

      expect(
        containerSpecAttribute,
        isNot(
          equals(
            BoxSpecAttribute(
              alignment: Alignment.centerLeft,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              constraints: const BoxConstraintsDto(maxHeight: 200),
              decoration: const BoxDecorationDto(color: ColorDto(Colors.red)),
              height: 200,
              margin: const SpacingDto.only(
                bottom: 20,
                left: 20,
                right: 20,
                top: 20,
              ),
              padding: const SpacingDto.only(
                  bottom: 30, left: 30, right: 30, top: 30),
              transform: Matrix4.identity(),
              width: 200,
            ),
          ),
        ),
      );
    });
  });
}
