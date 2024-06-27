import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/modifiers/modifiers_data.dart';
import 'package:mix/src/attributes/modifiers/modifiers_data_dto.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('BoxSpec', () {
    test('resolve', () {
      final mix = MixData.create(
        MockBuildContext(),
        Style(
          BoxSpecAttribute(
            alignment: Alignment.center,
            padding: SpacingDto.only(top: 8, bottom: 16),
            margin: SpacingDto.only(top: 10.0, bottom: 12.0),
            constraints:
                const BoxConstraintsDto(maxWidth: 300.0, minHeight: 200.0),
            decoration: const BoxDecorationDto(color: ColorDto(Colors.blue)),
            transform: Matrix4.translationValues(10.0, 10.0, 0.0),
            clipBehavior: Clip.antiAlias,
            modifiers: const ModifiersDataDto([
              OpacityModifierAttribute(1),
              SizedBoxModifierAttribute(height: 10, width: 10),
            ]),
            width: 300,
            height: 200,
          ),
        ),
      );

      final spec = mix.attributeOf<BoxSpecAttribute>()!.resolve(mix);

      expect(spec.alignment, Alignment.center);
      expect(spec.padding, const EdgeInsets.only(top: 8.0, bottom: 16.0));
      expect(spec.margin, const EdgeInsets.only(top: 10.0, bottom: 12.0));
      expect(
        spec.constraints,
        const BoxConstraints(maxWidth: 300.0, minHeight: 200.0),
      );
      expect(spec.decoration, const BoxDecoration(color: Colors.blue));

      expect(spec.transform, Matrix4.translationValues(10.0, 10.0, 0.0));
      expect(spec.modifiers!.value, [
        const OpacityModifierSpec(1),
        const SizedBoxModifierSpec(height: 10, width: 10),
      ]);
      expect(spec.clipBehavior, Clip.antiAlias);
    });

    test('copyWith', () {
      final spec = BoxSpec(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        constraints: const BoxConstraints(maxWidth: 300.0, minHeight: 200.0),
        decoration: const BoxDecoration(color: Colors.blue),
        foregroundDecoration: const BoxDecoration(color: Colors.purple),
        transform: Matrix4.translationValues(10.0, 10.0, 0.0),
        clipBehavior: Clip.antiAlias,
        transformAlignment: Alignment.center,
        width: 300,
        height: 200,
        modifiers: const ModifiersData([
          OpacityModifierSpec(0.5),
          SizedBoxModifierSpec(height: 10, width: 10),
        ]),
      );

      final copiedSpec = spec.copyWith(
        width: 250.0,
        height: 150.0,
        modifiers: const ModifiersData([
          OpacityModifierSpec(1),
        ]),
      );

      expect(copiedSpec.alignment, Alignment.center);
      expect(copiedSpec.padding, const EdgeInsets.all(16.0));
      expect(copiedSpec.margin, const EdgeInsets.only(top: 8.0, bottom: 8.0));
      expect(
        copiedSpec.constraints,
        const BoxConstraints(maxWidth: 300.0, minHeight: 200.0),
      );
      expect(copiedSpec.decoration, const BoxDecoration(color: Colors.blue));
      expect(
        copiedSpec.foregroundDecoration,
        const BoxDecoration(color: Colors.purple),
      );

      expect(copiedSpec.transform, Matrix4.translationValues(10.0, 10.0, 0.0));
      expect(copiedSpec.clipBehavior, Clip.antiAlias);
      expect(copiedSpec.width, 250.0);

      expect(
        copiedSpec.modifiers!.value,
        const ModifiersData(
          [OpacityModifierSpec(1)],
        ).value,
      );
      expect(copiedSpec.height, 150.0);
    });

    test('lerp', () {
      final spec1 = BoxSpec(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(top: 4.0),
        constraints: const BoxConstraints(maxWidth: 200.0),
        decoration: const BoxDecoration(color: Colors.red),
        foregroundDecoration: const BoxDecoration(color: Colors.blue),
        transform: Matrix4.identity(),
        transformAlignment: Alignment.center,
        clipBehavior: Clip.none,
        width: 300,
        height: 200,
      );

      final spec2 = BoxSpec(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 8.0),
        constraints: const BoxConstraints(maxWidth: 400.0),
        decoration: const BoxDecoration(color: Colors.blue),
        foregroundDecoration: const BoxDecoration(color: Colors.red),
        transform: Matrix4.rotationZ(0.5),
        clipBehavior: Clip.antiAlias,
        transformAlignment: Alignment.center,
        width: 400,
        height: 300,
      );

      const t = 0.5;
      final lerpedSpec = spec1.lerp(spec2, t);

      expect(
        lerpedSpec.alignment,
        Alignment.lerp(Alignment.topLeft, Alignment.bottomRight, t),
      );
      expect(
        lerpedSpec.padding,
        EdgeInsets.lerp(
          const EdgeInsets.all(8.0),
          const EdgeInsets.all(16.0),
          t,
        ),
      );
      expect(
        lerpedSpec.margin,
        EdgeInsets.lerp(
          const EdgeInsets.only(top: 4.0),
          const EdgeInsets.only(top: 8.0),
          t,
        ),
      );
      expect(
        lerpedSpec.constraints,
        BoxConstraints.lerp(
          const BoxConstraints(maxWidth: 200.0),
          const BoxConstraints(maxWidth: 400.0),
          t,
        ),
      );
      expect(
        lerpedSpec.decoration,
        DecorationTween(
          begin: const BoxDecoration(color: Colors.red),
          end: const BoxDecoration(color: Colors.blue),
        ).lerp(t),
      );

      expect(
        lerpedSpec.foregroundDecoration,
        DecorationTween(
          begin: const BoxDecoration(color: Colors.blue),
          end: const BoxDecoration(color: Colors.red),
        ).lerp(t),
      );

      expect(lerpedSpec.width, lerpDouble(300, 400, t));
      expect(lerpedSpec.height, lerpDouble(200, 300, t));

      expect(
        lerpedSpec.transform,
        Matrix4Tween(begin: Matrix4.identity(), end: Matrix4.rotationZ(0.5))
            .lerp(t),
      );
      expect(lerpedSpec.clipBehavior, t < 0.5 ? Clip.none : Clip.antiAlias);
    });

    // equality
    test('equality', () {
      final spec1 = BoxSpec(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(top: 4.0),
        constraints: const BoxConstraints(maxWidth: 200.0),
        decoration: const BoxDecoration(color: Colors.red),
        foregroundDecoration: const BoxDecoration(color: Colors.blue),
        transform: Matrix4.identity(),
        transformAlignment: Alignment.center,
        clipBehavior: Clip.none,
        width: 300,
        height: 200,
        modifiers: const ModifiersData([
          OpacityModifierSpec(0.5),
          SizedBoxModifierSpec(height: 10, width: 10),
        ]),
      );

      final spec2 = BoxSpec(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(top: 4.0),
        constraints: const BoxConstraints(maxWidth: 200.0),
        decoration: const BoxDecoration(color: Colors.red),
        foregroundDecoration: const BoxDecoration(color: Colors.blue),
        transform: Matrix4.identity(),
        transformAlignment: Alignment.center,
        clipBehavior: Clip.none,
        width: 300,
        height: 200,
        modifiers: const ModifiersData([
          OpacityModifierSpec(0.5),
          SizedBoxModifierSpec(height: 10, width: 10),
        ]),
      );

      expect(spec1, spec2);
    });

    // merge()
    test('merge() returns correct instance', () {
      final containerSpecAttribute = BoxSpecAttribute(
        alignment: Alignment.center,
        padding: SpacingDto.only(top: 20, bottom: 20, left: 20, right: 20),
        margin: SpacingDto.only(
          top: 10,
          bottom: 10,
          left: 10,
          right: 10,
        ),
        constraints: const BoxConstraintsDto(maxHeight: 100),
        decoration: const BoxDecorationDto(color: ColorDto(Colors.blue)),
        foregroundDecoration:
            const BoxDecorationDto(color: ColorDto(Colors.blue)),
        transform: Matrix4.identity(),
        clipBehavior: Clip.antiAlias,
        width: 100,
        height: 100,
        modifiers: const ModifiersDataDto([
          OpacityModifierAttribute(0.5),
          SizedBoxModifierAttribute(height: 10, width: 10),
        ]),
      );

      final mergedBoxSpecAttribute = containerSpecAttribute.merge(
        BoxSpecAttribute(
          alignment: Alignment.centerLeft,
          padding: SpacingDto.only(top: 30, bottom: 30, left: 30, right: 30),
          margin: SpacingDto.only(
            top: 20,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          constraints: const BoxConstraintsDto(maxHeight: 200),
          decoration: const BoxDecorationDto(color: ColorDto(Colors.red)),
          foregroundDecoration:
              const BoxDecorationDto(color: ColorDto(Colors.amber)),
          transform: Matrix4.identity(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: 200,
          height: 200,
          modifiers: const ModifiersDataDto([
            SizedBoxModifierAttribute(width: 100),
          ]),
        ),
      );

      expect(mergedBoxSpecAttribute.alignment, Alignment.centerLeft);
      expect(mergedBoxSpecAttribute.clipBehavior, Clip.antiAliasWithSaveLayer);

      expect(
        mergedBoxSpecAttribute.constraints,
        const BoxConstraintsDto(maxHeight: 200),
      );
      expect(
        mergedBoxSpecAttribute.decoration,
        const BoxDecorationDto(color: ColorDto(Colors.red)),
      );
      expect(
        mergedBoxSpecAttribute.foregroundDecoration,
        const BoxDecorationDto(color: ColorDto(Colors.amber)),
      );
      expect(mergedBoxSpecAttribute.height, 200);
      expect(
        mergedBoxSpecAttribute.margin,
        SpacingDto.only(top: 20, bottom: 20, left: 20, right: 20),
      );
      expect(
        mergedBoxSpecAttribute.padding,
        SpacingDto.only(top: 30, bottom: 30, left: 30, right: 30),
      );
      expect(mergedBoxSpecAttribute.transform, Matrix4.identity());
      expect(mergedBoxSpecAttribute.width, 200);
      expect(
        mergedBoxSpecAttribute.modifiers!.value,
        [
          const OpacityModifierAttribute(0.5),
          const SizedBoxModifierAttribute(height: 10, width: 100),
        ],
      );
    });
  });
}
