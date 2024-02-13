import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../empty_widget.dart';
import '../../helpers/testing_utils.dart';

void main() {
  group('Decorators: ', () {
    const aspectRatio = AspectRatioUtility(UtilityTestAttribute.new);
    const flexible = FlexibleDecoratorUtility(UtilityTestAttribute.new);

    const opacity = OpacityUtility(UtilityTestAttribute.new);
    const rotate = RotateUtility(UtilityTestAttribute.new);
    const scale = ScaleUtility(UtilityTestAttribute.new);
    const clip = ClipDecoratorUtility(UtilityTestAttribute.new);
    test('aspectRatio creates AspectRatioDecorator correctly', () {
      final aspectRatioDecorator = aspectRatio(2.0);

      expect(aspectRatioDecorator.value.aspectRatio, 2.0);
    });

    test('expanded creates FlexibleDecoratorUtility correctly', () {
      const flexible = FlexibleDecoratorUtility(UtilityTestAttribute.new);
      final flexibleDecorator = flexible.expanded();

      expect(flexibleDecorator.value.fit, FlexFit.tight);
    });

    test('default flexible creates FlexibleDecoratorUtility correctly', () {
      final flexibleDecorator = flexible();
      final widget = flexibleDecorator.value.build(EmptyMixData, const Empty())
          as Flexible;

      expect(flexibleDecorator.value.fit, null);
      expect(widget, isA<Flexible>());
      expect(widget.fit, FlexFit.loose);
      expect(widget.flex, 1);
    });

    test('opacity creates OpacityDecorator correctly', () {
      final opacityDecorator = opacity(0.5);

      expect(opacityDecorator.value.opacity, 0.5);
    });

    test('rotate creates RotateDecorator correctly', () {
      final rotateDecorator = rotate(2);

      expect(rotateDecorator.value.quarterTurns, 2);
    });

    test('rotate90 creates RotateDecorator correctly', () {
      final rotateDecorator = rotate.d90();

      expect(rotateDecorator.value.quarterTurns, 1);
    });

    test('rotate180 creates RotateDecorator correctly', () {
      final rotateDecorator = rotate.d180();

      expect(rotateDecorator.value.quarterTurns, 2);
    });

    test('rotate270 creates RotateDecorator correctly', () {
      final rotateDecorator = rotate.d270();

      expect(rotateDecorator.value.quarterTurns, 3);
    });

    test('scale creates ScaleDecorator correctly', () {
      final scaleDecorator = scale(0.5);

      expect(scaleDecorator.value.scale, 0.5);
    });

    test('clipRRect creates ClipRRectDecorator correctly', () {
      final clipRRectDecorator =
          clip.rrect(borderRadius: BorderRadius.circular(10.0));

      final decorator = clipRRectDecorator.value as ClipRRectDecorator;

      expect(decorator.borderRadius, BorderRadius.circular(10.0));
    });

    test('clipOval creates ClipOvalDecorator correctly', () {
      final clipOvalDecorator = clip.oval();

      expect(
        clipOvalDecorator.value.build(EmptyMixData, const Empty()),
        isA<ClipOval>(),
      );
    });

    test('clipPath creates ClipPathDecorator correctly', () {
      final clipPathDecorator = clip.path();

      expect(
        clipPathDecorator.value.build(EmptyMixData, const Empty()),
        isA<ClipPath>(),
      );
    });

    test('intrinsicHeight creates IntrinsicHeightDecorator correctly', () {
      final widget = intrinsicHeight().build(EmptyMixData, const Empty())
          as IntrinsicHeight;

      expect(widget, isA<IntrinsicHeight>());
    });

    test('intrinsicWidth creates IntrinsicWidthDecorator correctly', () {
      final widget =
          intrinsicWidth().build(EmptyMixData, const Empty()) as IntrinsicWidth;

      expect(widget, isA<IntrinsicWidth>());
    });

    test('clipRect creates ClipRectDecorator correctly', () {
      final clipRectDecorator = clip.rect();

      expect(
        clipRectDecorator.value.build(EmptyMixData, const Empty()),
        isA<ClipRect>(),
      );
    });

    test('visibility creates VisibilityDecorator correctly', () {
      final visibilityDecorator = visibility.on();

      expect(visibilityDecorator.visible, true);
    });

    test('transform creates TransformDecorator correctly', () {
      final transformDecorator = transform(Matrix4.identity());

      expect(transformDecorator.transform, Matrix4.identity());
    });

    test('sizedBox creates SizedBoxDecorator correctly', () {
      final sizedBoxDecorator = sizedBox(height: 100, width: 100);

      final widget =
          sizedBoxDecorator.build(EmptyMixData, const Empty()) as SizedBox;

      expect(widget.width, 100);
      expect(widget.height, 100);
    });

    test(
      'fractionallySizedBox creates FractionallySizedBoxDecorator correctly',
      () {
        final fractionallySizedBoxDecorator = fractionallySizedBox(
          heightFactor: 0.5,
          widthFactor: 0.5,
        );

        final widget = fractionallySizedBoxDecorator.build(
          EmptyMixData,
          const Empty(),
        ) as FractionallySizedBox;

        expect(widget.widthFactor, 0.5);
        expect(widget.heightFactor, 0.5);
      },
    );

    // align
    test('align creates AlignDecorator correctly', () {
      final alignDecorator = align(alignment: Alignment.center);

      final widget = alignDecorator.build(EmptyMixData, const Empty()) as Align;

      expect(widget.alignment, Alignment.center);
    });
  });
}
