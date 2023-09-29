import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/dtos/edge_insets/edge_insets.dto.dart';

import '../../helpers/context_finder.dart';

void main() {
  group('EdgeInsetsDto tests', () {
    test('EdgeInsetsDto.all creates EdgeInsetsDto with equal values', () {
      const edgeInsetsDto = EdgeInsetsDto.all(8.0);
      expect(edgeInsetsDto.top, 8.0);
      expect(edgeInsetsDto.bottom, 8.0);
      expect(edgeInsetsDto.left, 8.0);
      expect(edgeInsetsDto.right, 8.0);
    });

    test('from method creates EdgeInsetsDto from EdgeInsets', () {
      const edgeInsets = EdgeInsets.only(left: 8.0, top: 16.0);
      final edgeInsetsDto = EdgeInsetsDto.from(edgeInsets);
      expect(edgeInsetsDto.top, 16.0);
      expect(edgeInsetsDto.bottom, null);
      expect(edgeInsetsDto.left, 8.0);
      expect(edgeInsetsDto.right, null);
    });

    test('copyWith method creates new EdgeInsetsDto with updated values', () {
      const edgeInsetsDto = EdgeInsetsDto.only(
        top: 4.0,
        bottom: 4.0,
        left: 4.0,
        right: 4.0,
      );
      final newEdgeInsetsDto = edgeInsetsDto.copyWith(left: 8.0, right: 8.0);
      expect(newEdgeInsetsDto.top, 4.0);
      expect(newEdgeInsetsDto.bottom, 4.0);
      expect(newEdgeInsetsDto.left, 8.0);
      expect(newEdgeInsetsDto.right, 8.0);
    });

    test('merge method merges two EdgeInsetsDto objects', () {
      const firstEdgeInsetsDto = EdgeInsetsDto.only(
        top: 4.0,
        bottom: 4.0,
        left: 4.0,
        right: 4.0,
      );
      const secondEdgeInsetsDto = EdgeInsetsDto.only(
        left: 8.0,
        right: 8.0,
      );
      final mergedEdgeInsetsDto = firstEdgeInsetsDto.merge(secondEdgeInsetsDto);
      expect(mergedEdgeInsetsDto.top, 4.0);
      expect(mergedEdgeInsetsDto.bottom, 4.0);
      expect(mergedEdgeInsetsDto.left, 8.0);
      expect(mergedEdgeInsetsDto.right, 8.0);
    });

    testWidgets('Resolve method returns EdgeInsets with resolved values', (
      WidgetTester tester,
    ) async {
      final edgeInsetsDto = EdgeInsetsDto.only(
        top: $space.small,
        bottom: 4.0,
        left: $space.xlarge,
        right: 4.0,
      );

      final overrideEdgeInsets = EdgeInsetsDto.only(
        bottom: $space.medium,
        left: 20,
        right: $space.xxlarge,
      );

      final mixTheme = MixThemeData();
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (context) {
          return MixTheme(
            data: mixTheme,
            child: MixBuilder(
              style: StyleMix(),
              builder: (mix) {
                return Container(
                  padding: edgeInsetsDto.merge(overrideEdgeInsets).resolve(mix),
                  margin: edgeInsetsDto.resolve(mix),
                  child: const SizedBox(width: 50, height: 50),
                );
              },
            ),
          );
        }),
      ));

      final container = tester.findWidgetOfType<Container>();
      // final container = tester.widget<Container>(widgetFinder);

      // Get BuildContext for boxWidget
      final context = tester.findWidgetContext<Container>();

      expect(
        container.margin,
        EdgeInsets.only(
          left: MixTokenResolver(context).space($space.xlarge),
          top: MixTokenResolver(context).space($space.small),
          right: 4.0,
          bottom: 4.0,
        ),
      );

      expect(
        container.padding,
        EdgeInsets.only(
          left: 20,
          top: MixTokenResolver(context).space($space.small),
          right: MixTokenResolver(context).space($space.xxlarge),
          bottom: MixTokenResolver(context).space($space.medium),
        ),
      );
    });
  });
}
