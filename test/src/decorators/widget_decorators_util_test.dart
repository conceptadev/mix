import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../empty_widget.dart';
import '../../helpers/testing_utils.dart';

void main() {
  group('Decorators: ', () {
    const aspectRatio = AspectRatioUtility(UtilityTestAttribute.new);
    const flexible = FlexibleDecoratorUtility(UtilityTestAttribute.new);
    const visibility = VisibilityUtility(UtilityTestAttribute.new);
    const transform = TransformUtility(UtilityTestAttribute.new);

    const opacity = OpacityUtility(UtilityTestAttribute.new);
    const rotate = RotatedBoxWidgetUtility(UtilityTestAttribute.new);
    const clipPath = ClipPathUtility(UtilityTestAttribute.new);
    const clipRRect = ClipRRectUtility(UtilityTestAttribute.new);
    const clipOval = ClipOvalUtility(UtilityTestAttribute.new);
    const clipRect = ClipRectUtility(UtilityTestAttribute.new);
    const clipTriangle = ClipTriangleUtility(UtilityTestAttribute.new);
    const sizedBox = SizedBoxDecoratorUtility(UtilityTestAttribute.new);
    const fractionallySizedBox =
        FractionallySizedBoxDecoratorUtility(UtilityTestAttribute.new);
    const intrinsicHeight =
        IntrinsicHeightWidgetUtility(UtilityTestAttribute.new);
    const intrinsicWidth =
        IntrinsicWidthWidgetUtility(UtilityTestAttribute.new);
    const align = AlignWidgetUtility(UtilityTestAttribute.new);

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
      final widget = flexibleDecorator.value
          .resolve(EmptyMixData)
          .build(const Empty()) as Flexible;

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

    test('clipRRect creates ClipRRectDecorator correctly', () {
      final clipRRectDecorator =
          clipRRect(borderRadius: BorderRadius.circular(10.0));

      final decorator = clipRRectDecorator.value;

      expect(decorator.borderRadius, BorderRadius.circular(10.0));
    });

    test('clipOval creates ClipOvalDecorator correctly', () {
      final clipOvalDecorator = clipOval();

      expect(
        clipOvalDecorator.value.resolve(EmptyMixData).build(const Empty()),
        isA<ClipOval>(),
      );
    });
    test('clipPath creates ClipPathDecorator correctly', () {
      final clipPathDecorator = clipPath();

      expect(
        clipPathDecorator.value.resolve(EmptyMixData).build(const Empty()),
        isA<ClipPath>(),
      );
    });

    // clipTriangle
    test('clipTriangle creates ClipTriangleDecorator correctly', () {
      final clipTriangleDecorator = clipTriangle();

      expect(
        clipTriangleDecorator.value.resolve(EmptyMixData).build(const Empty()),
        isA<ClipPath>(),
      );
    });

    test('intrinsicHeight creates IntrinsicHeightDecorator correctly', () {
      final widget = intrinsicHeight()
          .value
          .resolve(EmptyMixData)
          .build(const Empty()) as IntrinsicHeight;

      expect(widget, isA<IntrinsicHeight>());
    });

    test('intrinsicWidth creates IntrinsicWidthDecorator correctly', () {
      final widget = intrinsicWidth()
          .value
          .resolve(EmptyMixData)
          .build(const Empty()) as IntrinsicWidth;

      expect(widget, isA<IntrinsicWidth>());
    });

    test('clipRect creates ClipRectDecorator correctly', () {
      final clipRectDecorator = clipRect();

      expect(
        clipRectDecorator.value.resolve(EmptyMixData).build(const Empty()),
        isA<ClipRect>(),
      );
    });

    test('visibility creates VisibilityDecorator correctly', () {
      final visibilityDecorator = visibility.on();
      expect(visibilityDecorator.value.visible, true);
    });

    test('transform creates TransformDecorator correctly', () {
      final transformDecorator = transform(Matrix4.identity());

      expect(transformDecorator.value.transform, Matrix4.identity());
    });
    test('sizedBox creates SizedBoxDecorator correctly', () {
      final sizedBoxDecorator = sizedBox(height: 100, width: 100);

      final widget = sizedBoxDecorator.value
          .resolve(EmptyMixData)
          .build(const Empty()) as SizedBox;

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

        final widget = fractionallySizedBoxDecorator.value
            .resolve(EmptyMixData)
            .build(const Empty()) as FractionallySizedBox;

        expect(widget.widthFactor, 0.5);
        expect(widget.heightFactor, 0.5);
      },
    );

    // align
    test('align creates AlignDecorator correctly', () {
      final alignDecorator = align(alignment: Alignment.center);

      final widget = alignDecorator.value
          .resolve(EmptyMixData)
          .build(const Empty()) as Align;

      expect(widget.alignment, Alignment.center);
    });
  });
  group('Applying Decorators in Style', () {
    testWidgets(
      'Applying an intrinsicHeight must add an IntrinsicHeight in widget tree',
      (tester) async {
        await tester.pumpWidget(
          _TestableRenderDecorator(
            Style(
              intrinsicHeight(),
            ),
          ),
        );

        _expectOneWidgetOfType<IntrinsicHeight>();
      },
    );

    testWidgets(
      'Applying a scale must add a ScaleTransition in widget tree',
      (tester) async {
        await tester.pumpWidget(
          _TestableRenderDecorator(
            Style(
              scale(2.0),
            ),
          ),
        );

        _expectOneWidgetOfType<Transform>();
      },
    );

    testWidgets(
      'Applying an opacity must add an Opacity in widget tree',
      (tester) async {
        await tester.pumpWidget(
          _TestableRenderDecorator(
            Style(
              opacity(0.5),
            ),
          ),
        );

        _expectOneWidgetOfType<Opacity>();
      },
    );

    testWidgets(
      'Applying a clipPath must add a ClipPath in widget tree',
      (tester) async {
        await tester.pumpWidget(
          _TestableRenderDecorator(
            Style(
              clipPath(),
            ),
          ),
        );

        _expectOneWidgetOfType<ClipPath>();
      },
    );

    testWidgets(
      'Applying a clipRRect must add a ClipRRect in widget tree',
      (tester) async {
        await tester.pumpWidget(
          _TestableRenderDecorator(
            Style(
              clipRRect(),
            ),
          ),
        );

        _expectOneWidgetOfType<ClipRRect>();
      },
    );

    testWidgets(
      'Applying a clipOval must add a ClipOval in widget tree',
      (tester) async {
        await tester.pumpWidget(
          _TestableRenderDecorator(
            Style(
              clipOval(),
            ),
          ),
        );

        _expectOneWidgetOfType<ClipOval>();
      },
    );

    testWidgets(
      'Applying a clipRect must add a ClipRect in widget tree',
      (tester) async {
        await tester.pumpWidget(
          _TestableRenderDecorator(
            Style(
              clipRect(),
            ),
          ),
        );

        _expectOneWidgetOfType<ClipRect>();
      },
    );

    testWidgets(
      'Applying a visibility must add a Visibility widget in the widget tree',
      (tester) async {
        await tester.pumpWidget(
          _TestableRenderDecorator(
            Style(
              visibility.off(),
            ),
          ),
        );

        _expectOneWidgetOfType<Visibility>();
      },
    );

    testWidgets(
      'Applying an aspectRatio must add an AspectRatio widget in the widget tree',
      (tester) async {
        await tester.pumpWidget(
          _TestableRenderDecorator(
            Style(
              aspectRatio(2),
            ),
          ),
        );

        _expectOneWidgetOfType<AspectRatio>();
      },
    );

    testWidgets(
      'Applying a flexible must add a Flexible widget in the widget tree',
      (tester) async {
        await tester.pumpWidget(
          Column(
            children: [
              _TestableRenderDecorator(
                Style(
                  flexible(),
                ),
              ),
            ],
          ),
        );

        _expectOneWidgetOfType<Flexible>();
      },
    );

    testWidgets(
      'Applying a transform must add a Transform widget in the widget tree',
      (tester) async {
        await tester.pumpWidget(
          _TestableRenderDecorator(
            Style(
              transform(Matrix4.identity()),
            ),
          ),
        );

        _expectOneWidgetOfType<Transform>();
      },
    );

    testWidgets(
      'Applying an align must add an Align widget in the widget tree',
      (tester) async {
        await tester.pumpWidget(
          _TestableRenderDecorator(
            Style(
              align(),
            ),
          ),
        );

        _expectOneWidgetOfType<Align>();
      },
    );

    testWidgets(
      'Applying a fractionallySizedBox must add a FractionallySizedBox widget in the widget tree',
      (tester) async {
        await tester.pumpWidget(
          _TestableRenderDecorator(
            Style(
              fractionallySizedBox(),
            ),
          ),
        );

        _expectOneWidgetOfType<FractionallySizedBox>();
      },
    );

    testWidgets(
      'Applying a sizedBox must add a SizedBox widget in the widget tree',
      (tester) async {
        await tester.pumpWidget(
          _TestableRenderDecorator(
            Style(
              sizedBox(),
            ),
          ),
        );

        _expectOneWidgetOfType<SizedBox>();
      },
    );
  });
}

void _expectOneWidgetOfType<T>() {
  expect(
    find.descendant(
      of: find.byType(_TestableRenderDecorator),
      matching: find.byType(T),
    ),
    findsOneWidget,
  );
}

class _TestableRenderDecorator extends StatelessWidget {
  const _TestableRenderDecorator(this.style);

  final Style style;

  @override
  Widget build(BuildContext context) {
    return RenderDecorators(
      orderOfDecorators: const [],
      mix: MixData.create(
        context,
        style,
      ),
      child: Container(),
    );
  }
}
