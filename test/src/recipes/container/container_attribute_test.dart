import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('ContainerSpecAttribute', () {
    test('Constructor assigns correct properties', () {
      final containerSpecAttribute = ContainerSpecAttribute(
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
      final containerSpecAttribute = ContainerSpecAttribute(
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
      final containerSpecAttribute = ContainerSpecAttribute(
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

      final mergedContainerSpecAttribute = containerSpecAttribute.merge(
        ContainerSpecAttribute(
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

      expect(mergedContainerSpecAttribute.alignment, Alignment.centerLeft);
      expect(mergedContainerSpecAttribute.clipBehavior,
          Clip.antiAliasWithSaveLayer);

      expect(mergedContainerSpecAttribute.constraints,
          const BoxConstraintsDto(maxHeight: 200));
      expect(mergedContainerSpecAttribute.decoration,
          const BoxDecorationDto(color: ColorDto(Colors.red)));

      expect(mergedContainerSpecAttribute.height, 200);
      expect(
          mergedContainerSpecAttribute.margin,
          const SpacingDto.only(
            bottom: 20,
            left: 20,
            right: 20,
            top: 20,
          ));
      expect(
        mergedContainerSpecAttribute.padding,
        const SpacingDto.only(bottom: 30, left: 30, right: 30, top: 30),
      );
      expect(mergedContainerSpecAttribute.transform, Matrix4.identity());
      expect(mergedContainerSpecAttribute.width, 200);
    });

    // equality
    test('equality', () {
      final containerSpecAttribute = ContainerSpecAttribute(
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
          ContainerSpecAttribute(
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
      final containerSpecAttribute = ContainerSpecAttribute(
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
            ContainerSpecAttribute(
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
