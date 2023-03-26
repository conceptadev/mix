import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/extensions/mix_extensions.dart';
import 'package:mix/src/helpers/dto/border.dto.dart';
import 'package:mix/src/helpers/dto/border_radius.dto.dart';
import 'package:mix/src/helpers/dto/double.dto.dart';
import 'package:mix/src/helpers/dto/edge_insets.dto.dart';

import '../testing_utils.dart';

void main() {
  group(
    "Mix Box widget",
    () {
      const widgetText = 'This is a Box Widget';
      testWidgets(
        'Adds child on widget',
        (tester) async {
          await tester.pumpWidget(
            TestMixWidget(
              child: Mix().box(
                child: const Text(
                  widgetText,
                  key: Key('child-key'),
                ),
              ),
            ),
          );

          expect(
            tester.widget<Box>(find.byType(Box)).child?.key,
            const Key('child-key'),
          );

          expect(
            tester.widget<Text>(find.byType(Text)).data,
            widgetText,
          );
        },
      );

      testWidgets(
        'Responds to Flexible attributes',
        (tester) async {
          await tester.pumpWidget(
            VBox(
              mix: Mix(
                const FlexibleDecorator(flex: 2),
                const FlexibleDecorator(flexFit: FlexFit.tight),
              ),
            ),
          );

          final flexibleWidget = tester.widget<Flexible>(
            find.byType(Flexible),
          );

          expect(flexibleWidget.flex, 2);
          expect(flexibleWidget.fit, FlexFit.tight);
        },
      );

      testWidgets(
        'Responds to RotatedBox attributes',
        (tester) async {
          await tester.pumpWidget(
            BoxTestWidget(
              Mix(const RotateDecorator(quarterTurns: 3)),
            ),
          );

          final rotatedBoxWidget = tester.widget<RotatedBox>(
            find.byType(RotatedBox),
          );

          expect(rotatedBoxWidget.quarterTurns, 3);
        },
      );

      testWidgets(
        'Responds to Hidden attributes',
        (tester) async {
          await tester.pumpWidget(
            BoxTestWidget(
              Mix(const CommonAttributes(visible: false)),
            ),
          );

          final hiddenWidget = tester.widget<SizedBox>(
            find.byType(SizedBox),
          );

          expect(hiddenWidget.height, 0.0);
          expect(hiddenWidget.width, 0.0);
        },
      );

      testWidgets(
        'Responds to AspectRatio attributes',
        (tester) async {
          await tester.pumpWidget(
            BoxTestWidget(
              Mix(const AspectRatioDecorator(aspectRatio: 3 / 2)),
            ),
          );

          final aspectRatioWidget = tester.widget<AspectRatio>(
            find.byType(AspectRatio),
          );

          expect(aspectRatioWidget.aspectRatio, 1.5);
        },
      );

      testWidgets(
        'Responds to Align attributes',
        (tester) async {
          await tester.pumpWidget(
            BoxTestWidget(
              Mix(
                const BoxAttributes(
                  alignment: Alignment.centerRight,
                ),
              ),
            ),
          );

          final alignWidget = tester.widget<Align>(
            find.byType(Align),
          );

          expect(alignWidget.alignment, Alignment.centerRight);
        },
      );

      testWidgets(
        'Responds to Opacity attributes',
        (tester) async {
          await tester.pumpWidget(
            BoxTestWidget(
              Mix(
                const OpacityDecorator(opacity: 0.5),
              ),
            ),
          );

          final opacityWidget = tester.widget<Opacity>(
            find.byType(Opacity),
          );

          expect(opacityWidget.opacity, 0.5);
        },
      );

      testWidgets(
        'Responds to ColoredBox attributes',
        (tester) async {
          await tester.pumpWidget(
            BoxTestWidget(
              Mix(BoxUtility.fromValues(color: Colors.lime)),
            ),
          );

          final coloredBoxWidget = tester.widget<ColoredBox>(
            find.byType(ColoredBox),
          );

          expect(coloredBoxWidget.color, Colors.lime);
        },
      );

      testWidgets(
        'Responds to Decoration attributes',
        (tester) async {
          final borderProps = BorderDto.all(
            color: Colors.green,
            width: 1.0,
            style: BorderStyle.solid,
          );

          final border = Border.all(
            color: Colors.green,
            width: 1.0,
            style: BorderStyle.solid,
          );
          final borderRadiusProps =
              const BorderRadiusDto.only(topLeft: DoubleDto.from(20));
          const borderRadius = BorderRadius.only(
            topLeft: Radius.circular(20),
          );
          await tester.pumpWidget(
            BoxTestWidget(
              Mix(
                BoxAttributes(color: Colors.purple.toDto()),
                BoxAttributes(borderRadius: borderRadiusProps),
                BoxAttributes(border: borderProps),
              ),
            ),
          );

          final decoratedBoxWidget = tester.widget<Container>(
            find.byType(Container),
          );

          final widgetDecoration =
              decoratedBoxWidget.decoration as BoxDecoration;

          final decoration = BoxDecoration(
            color: Colors.purple,
            borderRadius: borderRadius,
            border: border,
          );
          expect(widgetDecoration.color, decoration.color);
          expect(widgetDecoration.borderRadius, decoration.borderRadius);
          expect(widgetDecoration.border, decoration.border);
          // expect(widgetDecoration, decoration);
        },
      );

      testWidgets(
        'Responds to Margin attributes',
        (tester) async {
          const edgeInsets = EdgeInsets.only(
            left: 15,
            top: 25,
            right: 35,
            bottom: 45,
          );

          await tester.pumpWidget(
            BoxTestWidget(
              Mix(
                BoxAttributes(
                  margin: EdgeInsetsDto.from(edgeInsets),
                ),
              ),
            ),
          );

          final marginWidget = tester.widget<Padding>(
            find.byType(Padding).first,
          );

          expect(
            marginWidget.padding,
            edgeInsets,
          );
        },
      );

      testWidgets(
        'Responds to Padding attributes',
        (tester) async {
          const edgeInsets = EdgeInsets.only(
            left: 10,
            top: 20,
            right: 30,
            bottom: 40,
          );

          await tester.pumpWidget(
            BoxTestWidget(
              Mix(
                BoxAttributes(
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
        },
      );

      testWidgets(
        'Responds to max/min constraints',
        (tester) async {
          await tester.pumpWidget(
            BoxTestWidget(
              Mix(
                BoxAttributes(maxHeight: 105.toDto()),
                BoxAttributes(minHeight: 55.toDto()),
                BoxAttributes(maxWidth: 155.toDto()),
                BoxAttributes(minWidth: 45.toDto()),
              ),
            ),
          );

          final container = tester.widget<Container>(
            find.byType(Container),
          );

          final constraints = container.constraints;

          expect(constraints!.maxHeight, 105.0);
          expect(constraints.minHeight, 55.0);
          expect(constraints.maxWidth, 155.0);
          expect(constraints.minWidth, 45.0);
        },
      );
    },
  );
}
