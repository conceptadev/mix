import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/shared/shared.attributes.dart';
import 'package:mix/src/decorators/decorators_utilities.dart';
import 'package:mix/src/dtos/border/border.dto.dart';
import 'package:mix/src/dtos/color.dto.dart';
import 'package:mix/src/dtos/edge_insets/edge_insets.dto.dart';
import 'package:mix/src/dtos/radius/border_radius.dto.dart';
import 'package:mix/src/dtos/radius/radius_dto.dart';
import 'package:mix/src/extensions/style_mix_ext.dart';
import 'package:mix/src/factory/style_mix.dart';
import 'package:mix/src/widgets/container/container.attribute.dart';
import 'package:mix/src/widgets/container/container.utilities.dart';
import 'package:mix/src/widgets/container/container.widget.dart';

import '../helpers/random_dto.dart';
import '../helpers/testing_utils.dart';

void main() {
  group("Mix Box widget", () {
    const widgetText = 'This is a Box Widget';

    testWidgets('Adds child on widget', (tester) async {
      await tester.pumpWidget(
        TestMixWidget(
          child: StyleMix().box(
            child: const Text(widgetText, key: Key('child-key')),
          ),
        ),
      );

      expect(
        tester.widget<StyledContainer>(find.byType(StyledContainer)).child?.key,
        const Key('child-key'),
      );

      expect(tester.widget<Text>(find.byType(Text)).data, widgetText);
    });

    testWidgets('Responds to Flexible attributes', (tester) async {
      await tester.pumpWidget(
        BoxInsideFlexWidget(
          StyleMix(
            DecoratorUtility.flex(2),
            DecoratorUtility.flexFit(FlexFit.tight),
          ),
        ),
      );

      final flexibleWidget = tester.widget<Flexible>(
        find.byType(Flexible),
      );

      expect(flexibleWidget.flex, 2);
      expect(flexibleWidget.fit, FlexFit.tight);
    });

    testWidgets('Responds to RotatedBox attributes', (tester) async {
      await tester.pumpWidget(
        BoxTestWidget(
          StyleMix(DecoratorUtility.rotate(3)),
        ),
      );

      final rotatedBoxWidget = tester.widget<RotatedBox>(
        find.byType(RotatedBox),
      );

      expect(rotatedBoxWidget.quarterTurns, 3);
    });

    testWidgets('Responds to Hidden attributes', (tester) async {
      await tester.pumpWidget(
        BoxTestWidget(
          StyleMix(const SharedStyleAttributes(visible: false)),
        ),
      );

      final hiddenWidget = tester.widget<SizedBox>(
        find.byType(SizedBox),
      );

      expect(hiddenWidget.height, 0.0);
      expect(hiddenWidget.width, 0.0);
    });

    testWidgets('Responds to AspectRatio attributes', (tester) async {
      await tester.pumpWidget(
        BoxTestWidget(StyleMix(DecoratorUtility.aspectRatio(3 / 2))),
      );

      final aspectRatioWidget = tester.widget<AspectRatio>(
        find.byType(AspectRatio),
      );

      expect(aspectRatioWidget.aspectRatio, 1.5);
    });

    testWidgets('Responds to Align attributes', (tester) async {
      await tester.pumpWidget(
        BoxTestWidget(
          StyleMix(
            const StyledContainerAttributes(
              alignment: Alignment.centerRight,
            ),
          ),
        ),
      );

      final alignWidget = tester.widget<Align>(find.byType(Align));

      expect(alignWidget.alignment, Alignment.centerRight);
    });

    testWidgets('Responds to Opacity attributes', (tester) async {
      await tester.pumpWidget(
        BoxTestWidget(
          StyleMix(DecoratorUtility.opacity(0.5)),
        ),
      );

      final opacityWidget = tester.widget<Opacity>(find.byType(Opacity));

      expect(opacityWidget.opacity, 0.5);
    });

    testWidgets('Responds to ColoredBox attributes', (tester) async {
      await tester.pumpWidget(
        BoxTestWidget(
          StyleMix(
              const ContainerStyleUtilities().backgroundColor(Colors.lime)),
        ),
      );

      final coloredBoxWidget = tester.widget<ColoredBox>(
        find.byType(ColoredBox),
      );

      expect(coloredBoxWidget.color, Colors.lime);
    });

    testWidgets('Responds to Decoration attributes', (tester) async {
      final borderProps = BorderDto.all(
        color: const ColorDto(Colors.green),
        width: 1.0,
        style: BorderStyle.solid,
      );

      const border = Border.fromBorderSide(BorderSide(
        color: Colors.green,
      ));
      const borderRadiusProps = BorderRadiusDto.only(
        topLeft: RadiusDto.circular(20),
      );
      const borderRadius = BorderRadius.only(
        topLeft: Radius.circular(20),
      );
      await tester.pumpWidget(
        BoxTestWidget(
          StyleMix(
            const StyledContainerAttributes(color: ColorDto(Colors.purple)),
            const StyledContainerAttributes(
              borderRadius: borderRadiusProps,
            ),
            StyledContainerAttributes(border: borderProps),
          ),
        ),
      );

      final decoratedBoxWidget = tester.widget<Container>(
        find.byType(Container),
      );

      final widgetDecoration = decoratedBoxWidget.decoration as BoxDecoration;

      const decoration = BoxDecoration(
        color: Colors.purple,
        border: border,
        borderRadius: borderRadius,
      );
      expect(widgetDecoration.color, decoration.color);
      expect(widgetDecoration.borderRadius, decoration.borderRadius);
      expect(widgetDecoration.border, decoration.border);
      // Expect(widgetDecoration, decoration);.
    });

    testWidgets('Responds to Margin attributes', (tester) async {
      const edgeInsets = EdgeInsets.only(
        left: 15,
        top: 25,
        right: 35,
        bottom: 45,
      );

      await tester.pumpWidget(
        BoxTestWidget(
          StyleMix(
            StyledContainerAttributes(
              margin: EdgeInsetsDto.from(edgeInsets),
            ),
          ),
        ),
      );

      final marginWidget = tester.widget<Padding>(
        find.byType(Padding).first,
      );

      expect(marginWidget.padding, edgeInsets);
    });

    testWidgets('Responds to Padding attributes', (tester) async {
      const edgeInsets = EdgeInsets.only(
        left: 10,
        top: 20,
        right: 30,
        bottom: 40,
      );

      await tester.pumpWidget(
        BoxTestWidget(
          StyleMix(
            StyledContainerAttributes(
              padding: EdgeInsetsDto.from(edgeInsets),
            ),
          ),
        ),
      );

      final paddingWidget = tester.widget<Padding>(
        find.byType(Padding).first,
      );

      expect(
        paddingWidget.padding,
        const EdgeInsets.fromLTRB(10, 20, 30, 40),
      );
    });

    testWidgets('Responds to max/min constraints', (tester) async {
      await tester.pumpWidget(
        BoxTestWidget(
          StyleMix(
            const StyledContainerAttributes(maxHeight: 105),
            const StyledContainerAttributes(minHeight: 55),
            const StyledContainerAttributes(maxWidth: 155),
            const StyledContainerAttributes(minWidth: 45),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));

      final constraints = container.constraints;

      expect(constraints!.maxHeight, 105.0);
      expect(constraints.minHeight, 55.0);
      expect(constraints.maxWidth, 155.0);
      expect(constraints.minWidth, 45.0);
    });
  });

  const int N = 1000; // Number of iterations for the benchmark

  testWidgets('Benchmark StyledContainer build method', (
    WidgetTester tester,
  ) async {
    final multipleMixes = List.generate(
      N,
      (index) => RandomGenerator.mix(),
    );

    final stopwatch = Stopwatch()..start();

    final combinedMixes = StyleMix.combine(multipleMixes);

    print('Combining $N mixes: ${stopwatch.elapsedMilliseconds} ms');

    stopwatch.reset();

    for (int i = 0; i < N; i++) {
      await tester.pumpWidget(StyledContainer(
        style: combinedMixes,
      ));
    }

    stopwatch.stop();
    final averageBuildTimeStyled = stopwatch.elapsedMilliseconds / N;
    print('Average build time for StyledContainer: $averageBuildTimeStyled ms');
  });

  testWidgets('Benchmark Container build method', (WidgetTester tester) async {
    final stopwatch = Stopwatch()..start();

    for (int i = 0; i < N; i++) {
      await tester.pumpWidget(Container());
    }

    stopwatch.stop();
    final averageBuildTimeContainer = stopwatch.elapsedMilliseconds / N;
    print('Average build time for Container: $averageBuildTimeContainer ms');
  });
}
