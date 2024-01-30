import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('StyledImage', () {
    testWidgets('receive all the attributes', (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StyledImage(
              style: Style(
                image.width(152),
                image.height(152),
                image.color.black(),
                image.repeat.repeat(),
                image.fit.fill(),
                image.centerSlice.fromLTRB(1, 2, 3, 4),
                image.alignment.bottomLeft(),
                image.filterQuality.high(),
                image.blendMode.colorDodge(),
              ),
              image: const AssetImage('test_resources/logo.png'),
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
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StyledImage(
              style: Style(
                image.width(152),
                image.height(152),
                opacity(0.5),
              ),
              image: const AssetImage('test_resources/logo.png'),
            ),
          ),
        ),
      );

      final opacityWidget =
          tester.element(find.byType(Opacity)).widget as Opacity;

      expect(opacityWidget.opacity, 0.5);
    });
  });
}
