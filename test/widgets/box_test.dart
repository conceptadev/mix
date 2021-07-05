import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/dynamic/hidden.dart';
import 'package:mix/src/attributes/layout/aspect_ratio.dart';
import 'package:mix/src/attributes/layout/flex.dart';
import 'package:mix/src/attributes/painting/alignment.dart';
import 'package:mix/src/attributes/painting/border.dart';
import 'package:mix/src/attributes/painting/border_radius.dart';
import 'package:mix/src/attributes/painting/border_side.dart';
import 'package:mix/src/attributes/painting/opacity.dart';
import 'package:mix/src/attributes/painting/rotate.dart';
import 'package:mix/src/attributes/primitives/color.dart';
import 'package:mix/src/attributes/primitives/size.dart';
import 'package:mix/src/attributes/primitives/space.dart';
import 'package:mix/src/attributes/rendering/flex/flex_fit.dart';
import 'package:mix/src/widgets/primitives/box.dart';

import '../test_utils.dart';

void main() {
  group(
    "Mix Box widget",
    () {
      const widgetText = 'This is a Box Widget';
      testWidgets(
        'Adds child on widget',
        (tester) async {
          await tester.pumpWidget(
            DirectionalTestWidget(
              child: Mix().box(
                  child: Text(
                widgetText,
                key: Key('child-key'),
              )),
            ),
          );

          expect(
            tester.widget<Box>(find.byType(Box)).child?.key,
            Key('child-key'),
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
            BoxInsideFlexWidget(
              Mix(FlexAttribute(2), FlexFitAttribute(FlexFit.tight)),
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
              Mix(RotateAttribute(3)),
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
              Mix(HiddenAttribute()),
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
              Mix(AspectRatioAttribute(3 / 2)),
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
              Mix(AlignmentAttribute(Alignment.centerRight)),
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
              Mix(OpacityAttribute(0.5)),
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
              Mix(BackgroundColorAttribute(Colors.lime)),
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
          final side = BorderSideAttribute(
            color: Colors.green,
            width: 1.0,
            style: BorderStyle.solid,
          );
          await tester.pumpWidget(
            BoxTestWidget(
              Mix(
                BackgroundColorAttribute(Colors.purple),
                BorderRadiusAttribute(topLeft: 20),
                BorderAttribute(
                  bottom: side,
                  top: side,
                  left: side,
                  right: side,
                ),
              ),
            ),
          );

          final decoratedBoxWidget = tester.widget<DecoratedBox>(
            find.byType(DecoratedBox),
          );

          expect(
            decoratedBoxWidget.decoration,
            BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
              ),
              border: Border.fromBorderSide(
                BorderSide(
                  color: Colors.green,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          );
        },
      );

      testWidgets(
        'Responds to Margin attributes',
        (tester) async {
          await tester.pumpWidget(
            BoxTestWidget(
              Mix(
                MarginAttribute(
                  left: 15,
                  top: 25,
                  right: 35,
                  bottom: 45,
                ),
              ),
            ),
          );

          final marginWidget = tester.widget<Padding>(
            find.byType(Padding).first,
          );

          expect(
            marginWidget.padding,
            EdgeInsets.fromLTRB(15, 25, 35, 45),
          );
        },
      );

      testWidgets(
        'Responds to Padding attributes',
        (tester) async {
          await tester.pumpWidget(
            BoxTestWidget(
              Mix(
                PaddingAttribute(
                  left: 10,
                  top: 20,
                  right: 30,
                  bottom: 40,
                ),
              ),
            ),
          );

          final paddingWidget = tester.widget<Padding>(
            find.byType(Padding).first,
          );

          expect(
            paddingWidget.padding,
            EdgeInsets.fromLTRB(10, 20, 30, 40),
          );
        },
      );

      testWidgets(
        'Responds to max/min constraints',
        (tester) async {
          await tester.pumpWidget(
            BoxTestWidget(
              Mix(
                MaxHeightAttribute(105),
                MinHeightAttribute(55),
                MaxWidthAttribute(155),
                MinWidthAttribute(45),
              ),
            ),
          );

          final constrainedBoxWidget = tester.widget<ConstrainedBox>(
            find.byType(ConstrainedBox),
          );

          expect(
            constrainedBoxWidget.constraints,
            BoxConstraints(
              maxHeight: 105,
              minHeight: 55,
              maxWidth: 155,
              minWidth: 45,
            ),
          );

          final limitedBoxWidget = tester.widget<LimitedBox>(
            find.byType(LimitedBox),
          );

          expect(limitedBoxWidget.maxHeight, 105);
          expect(limitedBoxWidget.maxWidth, 155);
        },
      );
    },
  );
}
