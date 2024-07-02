import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../empty_widget.dart';
import '../helpers/testing_utils.dart';

void main() {
  group('Modifiers: ', () {
    const aspectRatio = AspectRatioUtility(UtilityTestAttribute.new);
    const flexible = FlexibleModifierUtility(UtilityTestAttribute.new);
    const visibility = VisibilityUtility(UtilityTestAttribute.new);
    const transform = TransformUtility(UtilityTestAttribute.new);

    const opacity = OpacityUtility(UtilityTestAttribute.new);
    const rotate = RotatedBoxWidgetUtility(UtilityTestAttribute.new);
    const clipPath = ClipPathUtility(UtilityTestAttribute.new);
    const clipRRect = ClipRRectUtility(UtilityTestAttribute.new);
    const clipOval = ClipOvalUtility(UtilityTestAttribute.new);
    const clipRect = ClipRectUtility(UtilityTestAttribute.new);
    const clipTriangle = ClipTriangleUtility(UtilityTestAttribute.new);
    final sizedBox = SizedBoxModifierUtility(UtilityTestAttribute.new);
    const fractionallySizedBox =
        FractionallySizedBoxModifierUtility(UtilityTestAttribute.new);
    const intrinsicHeight =
        IntrinsicHeightWidgetUtility(UtilityTestAttribute.new);
    const intrinsicWidth =
        IntrinsicWidthWidgetUtility(UtilityTestAttribute.new);
    const align = AlignWidgetUtility(UtilityTestAttribute.new);

    test('aspectRatio creates AspectRatioModifier correctly', () {
      final aspectRatioModifier = aspectRatio(2.0);

      expect(aspectRatioModifier.value.aspectRatio, 2.0);
    });

    test('expanded creates FlexibleModifierUtility correctly', () {
      const flexible = FlexibleModifierUtility(UtilityTestAttribute.new);
      final flexibleModifier = flexible.expanded();

      expect(flexibleModifier.value.fit, FlexFit.tight);
    });

    test('default flexible creates FlexibleModifierUtility correctly', () {
      final flexibleModifier = flexible();
      final widget = flexibleModifier.value
          .resolve(EmptyMixData)
          .build(const Empty()) as Flexible;

      expect(flexibleModifier.value.fit, null);
      expect(widget, isA<Flexible>());
      expect(widget.fit, FlexFit.loose);
      expect(widget.flex, 1);
    });

    test('opacity creates OpacityModifier correctly', () {
      final opacityModifier = opacity(0.5);

      expect(opacityModifier.value.opacity, 0.5);
    });

    test('rotate creates RotateModifier correctly', () {
      final rotateModifier = rotate(2);

      expect(rotateModifier.value.quarterTurns, 2);
    });

    test('rotate90 creates RotateModifier correctly', () {
      final rotateModifier = rotate.d90();

      expect(rotateModifier.value.quarterTurns, 1);
    });

    test('rotate180 creates RotateModifier correctly', () {
      final rotateModifier = rotate.d180();

      expect(rotateModifier.value.quarterTurns, 2);
    });

    test('rotate270 creates RotateModifier correctly', () {
      final rotateModifier = rotate.d270();

      expect(rotateModifier.value.quarterTurns, 3);
    });

    test('clipRRect creates ClipRRectModifier correctly', () {
      final clipRRectModifier =
          clipRRect(borderRadius: BorderRadius.circular(10.0));

      final modifier = clipRRectModifier.value;

      expect(modifier.borderRadius, BorderRadius.circular(10.0));
    });

    test('clipOval creates ClipOvalModifier correctly', () {
      final clipOvalModifier = clipOval();

      expect(
        clipOvalModifier.value.resolve(EmptyMixData).build(const Empty()),
        isA<ClipOval>(),
      );
    });
    test('clipPath creates ClipPathModifier correctly', () {
      final clipPathModifier = clipPath();

      expect(
        clipPathModifier.value.resolve(EmptyMixData).build(const Empty()),
        isA<ClipPath>(),
      );
    });

    // clipTriangle
    test('clipTriangle creates ClipTriangleModifier correctly', () {
      final clipTriangleModifier = clipTriangle();

      expect(
        clipTriangleModifier.value.resolve(EmptyMixData).build(const Empty()),
        isA<ClipPath>(),
      );
    });

    test('intrinsicHeight creates IntrinsicHeightModifier correctly', () {
      final widget = intrinsicHeight()
          .value
          .resolve(EmptyMixData)
          .build(const Empty()) as IntrinsicHeight;

      expect(widget, isA<IntrinsicHeight>());
    });

    test('intrinsicWidth creates IntrinsicWidthModifier correctly', () {
      final widget = intrinsicWidth()
          .value
          .resolve(EmptyMixData)
          .build(const Empty()) as IntrinsicWidth;

      expect(widget, isA<IntrinsicWidth>());
    });

    test('clipRect creates ClipRectModifier correctly', () {
      final clipRectModifier = clipRect();

      expect(
        clipRectModifier.value.resolve(EmptyMixData).build(const Empty()),
        isA<ClipRect>(),
      );
    });

    test('visibility creates VisibilityModifier correctly', () {
      final visibilityModifier = visibility.on();
      expect(visibilityModifier.value.visible, true);
    });

    test('transform creates TransformModifier correctly', () {
      final transformModifier = transform(Matrix4.identity());

      expect(transformModifier.value.transform, Matrix4.identity());
    });
    test('sizedBox creates SizedBoxModifier correctly', () {
      final sizedBoxModifier = sizedBox(height: 100, width: 100);

      final widget = sizedBoxModifier.value
          .resolve(EmptyMixData)
          .build(const Empty()) as SizedBox;

      expect(widget.width, 100);
      expect(widget.height, 100);
    });

    test(
      'fractionallySizedBox creates FractionallySizedBoxModifier correctly',
      () {
        final fractionallySizedBoxModifier = fractionallySizedBox(
          heightFactor: 0.5,
          widthFactor: 0.5,
        );

        final widget = fractionallySizedBoxModifier.value
            .resolve(EmptyMixData)
            .build(const Empty()) as FractionallySizedBox;

        expect(widget.widthFactor, 0.5);
        expect(widget.heightFactor, 0.5);
      },
    );

    // align
    test('align creates AlignModifier correctly', () {
      final alignModifier = align(alignment: Alignment.center);

      final widget = alignModifier.value
          .resolve(EmptyMixData)
          .build(const Empty()) as Align;

      expect(widget.alignment, Alignment.center);
    });
  });
  group('Applying Modifiers in Style', () {
    testWidgets(
      'Applying an intrinsicHeight must add an IntrinsicHeight in widget tree',
      (tester) async {
        await tester.pumpWidget(
          _TestableRenderModifier(
            Style(
              $with.intrinsicHeight(),
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
          _TestableRenderModifier(
            Style(
              $with.scale(2.0),
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
          _TestableRenderModifier(
            Style(
              $with.opacity(0.5),
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
          _TestableRenderModifier(
            Style(
              $with.clipPath(),
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
          _TestableRenderModifier(
            Style(
              $with.clipRRect(),
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
          _TestableRenderModifier(
            Style(
              $with.clipOval(),
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
          _TestableRenderModifier(
            Style(
              $with.clipRect(),
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
          _TestableRenderModifier(
            Style(
              $with.visibility.off(),
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
          _TestableRenderModifier(
            Style(
              $with.aspectRatio(2),
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
              _TestableRenderModifier(
                Style(
                  $with.flexible(),
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
          _TestableRenderModifier(
            Style(
              $with.transform(Matrix4.identity()),
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
          _TestableRenderModifier(
            Style(
              $with.align(),
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
          _TestableRenderModifier(
            Style(
              $with.fractionallySizedBox(),
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
          _TestableRenderModifier(
            Style(
              $with.sizedBox(),
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
      of: find.byType(_TestableRenderModifier),
      matching: find.byType(T),
    ),
    findsOneWidget,
  );
}

class _TestableRenderModifier extends StatelessWidget {
  const _TestableRenderModifier(this.style);

  final Style style;

  @override
  Widget build(BuildContext context) {
    return RenderModifiers(
      orderOfModifiers: const [],
      mix: MixData.create(
        context,
        style,
      ),
      child: Container(),
    );
  }
}
