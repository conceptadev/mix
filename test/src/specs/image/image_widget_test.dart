import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('StyledImage', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('receive all the attributes', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StyledImage(
              style: Style(
                $image.width(152),
                $image.height(152),
                $image.color.black(),
                $image.repeat(),
                $image.fit.fill(),
                $image.centerSlice.fromLTRB(1, 2, 3, 4),
                $image.alignment.bottomLeft(),
                $image.filterQuality.high(),
                $image.blendMode.colorDodge(),
              ),
              image: FileImage(File('test_resources/logo.png')),
            ),
          ),
        ),
      );

      final imageWidget = tester.element(find.byType(Image)).widget as Image;

      expect(imageWidget.width, 152);
      expect(imageWidget.height, 152);
      expect(imageWidget.color, Colors.black);
      expect(imageWidget.repeat, ImageRepeat.repeat);
      expect(imageWidget.fit, BoxFit.fill);
      expect(imageWidget.centerSlice, const Rect.fromLTRB(1, 2, 3, 4));
      expect(imageWidget.alignment, Alignment.bottomLeft);
      expect(imageWidget.filterQuality, FilterQuality.high);
      expect(imageWidget.colorBlendMode, BlendMode.colorDodge);
    });

    testWidgets('can receive a decorator', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StyledImage(
              style: Style(
                $image.width(152),
                $image.height(152),
                opacity(0.5),
              ),
              image: FileImage(File('test_resources/logo.png')),
            ),
          ),
        ),
      );

      final opacityWidget =
          tester.element(find.byType(Opacity)).widget as Opacity;

      expect(opacityWidget.opacity, 0.5);
    });

    testWidgets(
      'can inherit style from the parent StyledWidget',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          Box(
            style: Style(
              $image.width(152),
              $image.height(152),
              $image.color.black(),
            ),
            child: StyledImage(
              image: FileImage(File('test_resources/logo.png')),
            ),
          ),
        );

        final imageWidget = tester.element(find.byType(Image)).widget as Image;

        expect(imageWidget.width, 152);
        expect(imageWidget.height, 152);
        expect(imageWidget.color, Colors.black);
      },
    );

    testWidgets(
      'StyleImage should apply decorators only once',
      (tester) async {
        await tester.pumpMaterialApp(
          StyledImage(
            style: Style(
              $box.height(100),
              $box.width(100),
              $with.align(),
            ),
            image: FileImage(File('test_resources/logo.png')),
          ),
        );

        expect(find.byType(Align), findsOneWidget);
      },
    );
  });
}
