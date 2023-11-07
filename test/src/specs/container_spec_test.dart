import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ContainerSpec', () {
    test('resolve', () {
      final mix = MixData.create(
        MockBuildContext(),
        StyleMix(
          const AlignmentAttribute(x: 0.0, y: 0.0),
          const PaddingAttribute(top: 8, bottom: 16),
          const MarginAttribute(top: 10.0, bottom: 12.0),
          const BoxConstraintsAttribute(maxWidth: 300.0, minHeight: 200.0),
          const BoxDecorationAttribute(color: ColorAttribute(Colors.blue)),
          const WidthAttribute(200.0),
          const HeightAttribute(100.0),
          TransformAttribute(Matrix4.translationValues(10.0, 10.0, 0.0)),
          const ClipAttribute(Clip.antiAlias),
        ),
      );

      final spec = ContainerSpec.resolve(mix);

      expect(spec.alignment, Alignment.center);
      expect(spec.padding, const EdgeInsets.only(bottom: 16.0, top: 8.0));
      expect(spec.margin, const EdgeInsets.only(top: 10.0, bottom: 12.0));
      expect(spec.constraints,
          const BoxConstraints(maxWidth: 300.0, minHeight: 200.0));
      expect(spec.decoration, const BoxDecoration(color: Colors.blue));
      expect(spec.width, 200.0);
      expect(spec.height, 100.0);
      expect(spec.transform, Matrix4.translationValues(10.0, 10.0, 0.0));
      expect(spec.clipBehavior, Clip.antiAlias);
    });

    test('copyWith', () {
      final spec = ContainerSpec(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        constraints: const BoxConstraints(maxWidth: 300.0, minHeight: 200.0),
        decoration: const BoxDecoration(color: Colors.blue),
        width: 200.0,
        height: 100.0,
        transform: Matrix4.translationValues(10.0, 10.0, 0.0),
        clipBehavior: Clip.antiAlias,
      );

      final copiedSpec = spec.copyWith(width: 250.0, height: 150.0);

      expect(copiedSpec.alignment, Alignment.center);
      expect(copiedSpec.padding, const EdgeInsets.all(16.0));
      expect(copiedSpec.margin, const EdgeInsets.only(top: 8.0, bottom: 8.0));
      expect(copiedSpec.constraints,
          const BoxConstraints(maxWidth: 300.0, minHeight: 200.0));
      expect(copiedSpec.decoration, const BoxDecoration(color: Colors.blue));
      expect(copiedSpec.width, 250.0);
      expect(copiedSpec.height, 150.0);
      expect(copiedSpec.transform, Matrix4.translationValues(10.0, 10.0, 0.0));
      expect(copiedSpec.clipBehavior, Clip.antiAlias);
    });

    test('lerp', () {
      final spec1 = ContainerSpec(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(top: 4.0),
        constraints: const BoxConstraints(maxWidth: 200.0),
        decoration: const BoxDecoration(color: Colors.red),
        width: 100.0,
        height: 100.0,
        transform: Matrix4.identity(),
        clipBehavior: Clip.none,
      );

      final spec2 = ContainerSpec(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 8.0),
        constraints: const BoxConstraints(maxWidth: 400.0),
        decoration: const BoxDecoration(color: Colors.blue),
        width: 200.0,
        height: 150.0,
        transform: Matrix4.rotationZ(0.5),
        clipBehavior: Clip.antiAlias,
      );

      const t = 0.5;
      final lerpedSpec = spec1.lerp(spec2, t);

      expect(lerpedSpec.alignment,
          Alignment.lerp(Alignment.topLeft, Alignment.bottomRight, t));
      expect(
          lerpedSpec.padding,
          EdgeInsets.lerp(
              const EdgeInsets.all(8.0), const EdgeInsets.all(16.0), t));
      expect(
          lerpedSpec.margin,
          EdgeInsets.lerp(const EdgeInsets.only(top: 4.0),
              const EdgeInsets.only(top: 8.0), t));
      expect(
          lerpedSpec.constraints,
          BoxConstraints.lerp(const BoxConstraints(maxWidth: 200.0),
              const BoxConstraints(maxWidth: 400.0), t));
      expect(
          lerpedSpec.decoration,
          DecorationTween(
                  begin: const BoxDecoration(color: Colors.red),
                  end: const BoxDecoration(color: Colors.blue))
              .lerp(t));
      expect(lerpedSpec.width, lerpDouble(100.0, 200.0, t));
      expect(lerpedSpec.height, lerpDouble(100.0, 150.0, t));
      expect(
          lerpedSpec.transform,
          Matrix4Tween(begin: Matrix4.identity(), end: Matrix4.rotationZ(0.5))
              .lerp(t));
      expect(lerpedSpec.clipBehavior, t < 0.5 ? Clip.none : Clip.antiAlias);
    });
  });
}
