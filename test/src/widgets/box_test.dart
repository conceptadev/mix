import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('Box', () {
    testWidgets('by default should not pass its style through the widget tree',
        (tester) async {
      await tester.pumpWidget(
        Box(
          style: Style(
            icon.color.black(),
          ),
          child: Box(
            child: WidgetWithTestableBuild((context) {
              final inheritedStyle = MixProvider.maybeOf(context);

              expect(inheritedStyle?.attributes.length, 0);
            }),
          ),
        ),
      );
    });

    testWidgets(
        'when the property `inherit` is true should pass its style through the widget tree',
        (tester) async {
      await tester.pumpWidget(
        Box(
          style: Style(
            icon.color.black(),
          ),
          child: Box(
            inherit: true,
            child: Builder(builder: (context) {
              final inheritedStyle = MixProvider.maybeOf(context)!;
              final iconSpec = IconSpec.of(inheritedStyle);

              expect(inheritedStyle.attributes.length, 1);
              expect(iconSpec.color, Colors.black);
              return const SizedBox();
            }),
          ),
        ),
      );
    });

    testWidgets(
        'when the property `inherit` is true and it has its own style, should merge the styles',
        (tester) async {
      await tester.pumpWidget(
        Box(
          style: Style(
            icon.color.black(),
          ),
          child: Box(
            inherit: true,
            style: Style(
              box.height(100),
              box.width(100),
            ),
            child: Builder(builder: (context) {
              final inheritedStyle = MixProvider.maybeOf(context)!;
              final iconSpec = IconSpec.of(inheritedStyle);
              final boxSpec = BoxSpec.of(inheritedStyle);

              expect(inheritedStyle.attributes.length, 2);
              expect(iconSpec.color, Colors.black);
              expect(boxSpec.height, 100);
              expect(boxSpec.width, 100);
              return const SizedBox();
            }),
          ),
        ),
      );
    });

    testWidgets(
        'when the property `inherit` is true and it has its own style with different attributes, should merge them',
        (tester) async {
      await tester.pumpWidget(
        Box(
          style: Style(
            icon.color.black(),
          ),
          child: Box(
            inherit: true,
            style: Style(
              box.height(100),
              box.width(100),
            ),
            child: Builder(builder: (context) {
              final inheritedStyle = MixProvider.maybeOf(context)!;
              final iconSpec = IconSpec.of(inheritedStyle);
              final boxSpec = BoxSpec.of(inheritedStyle);

              expect(inheritedStyle.attributes.length, 2);
              expect(iconSpec.color, Colors.black);
              expect(boxSpec.height, 100);
              expect(boxSpec.width, 100);
              return const SizedBox();
            }),
          ),
        ),
      );
    });

    testWidgets(
      'when the property `inherit` is true and it has its own style with similar attributes, should merge them',
      (tester) async {
        await tester.pumpWidget(
          Box(
            style: Style(
              box.height(100),
              box.width(50),
            ),
            child: Box(
              inherit: true,
              style: Style(
                box.width(100),
              ),
              child: Builder(builder: (context) {
                final inheritedStyle = MixProvider.maybeOf(context)!;
                final boxSpec = BoxSpec.of(inheritedStyle);

                expect(inheritedStyle.attributes.length, 1);
                expect(boxSpec.height, 100);
                expect(boxSpec.width, 100);
                return const SizedBox();
              }),
            ),
          ),
        );
      },
    );

    testWidgets(
      'should create a RenderWidgetDecorators widget and all its decorators widgets in the decendant widget tree',
      (tester) async {
        const key = Key('box');

        await tester.pumpWidget(
          Box(
            key: key,
            style: Style(
              box.height(100),
              box.width(50),
              scale(1),
              opacity(0.5),
              rotate(1),
              visibility(true),
              aspectRatio(1),
            ),
          ),
        );

        expect(
            find.descendant(
                of: find.byKey(key),
                matching: find.byType(RenderWidgetDecorators)),
            findsOneWidget);

        expect(
            find.descendant(
              of: find.byKey(key),
              matching: find.byType(Transform),
            ),
            findsOneWidget);

        expect(
            find.descendant(
              of: find.byKey(key),
              matching: find.byType(Opacity),
            ),
            findsOneWidget);

        expect(
            find.descendant(
              of: find.byKey(key),
              matching: find.byType(RotatedBox),
            ),
            findsOneWidget);

        expect(
            find.descendant(
              of: find.byKey(key),
              matching: find.byType(Visibility),
            ),
            findsOneWidget);

        expect(
            find.descendant(
              of: find.byKey(key),
              matching: find.byType(AspectRatio),
            ),
            findsOneWidget);
      },
    );
  });
}
