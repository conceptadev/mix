import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('StyledWidgetBuilder', () {
    testWidgets(
        '''When a parent StyledWidget has a Style and inherited property is true, the StyledWidgetBuilder.builder should have access to the parent's style attributes in the MixData''',
        (tester) async {
      tester.pumpWidget(
        Box(
          style: Style(height(100)),
          child: StyledWidgetBuilder(
            inherit: true,
            builder: (mix) {
              expect(mix.attributeOf<BoxSpecAttribute>()!.height, 100);
              return const SizedBox();
            },
          ),
        ),
      );
    });

    testWidgets(
      '''When a parent StyledWidget has a Style and inherited property is false, the StyledWidgetBuilder.builder should not have access to the parent's style attributes in the MixData''',
      (tester) async {
        tester.pumpWidget(
          Box(
            style: Style(height(100)),
            child: StyledWidgetBuilder(
              inherit: false,
              builder: (mix) {
                expect(mix.attributeOf<BoxSpecAttribute>(), isNull);
                return const SizedBox();
              },
            ),
          ),
        );
      },
    );

    testWidgets(
      '''When a parent StyledWidgetBuilder has no Style, the MixData in StyledWidgetBuilder.builder should have no attributes''',
      (tester) async {
        tester.pumpWidget(
          StyledWidgetBuilder(
            builder: (mix) {
              expect(mix.attributes.length, isZero);
              return const SizedBox();
            },
          ),
        );
      },
    );

    testWidgets(
      '''When a parent StyledWidget has a Style, the MixData in StyledWidgetBuilder.builder should have the same attributes''',
      (tester) async {
        final style = Style(
          height(100),
          width(100),
          backgroundColor(Colors.red),
        );

        final mixData = MixData.create(MockBuildContext(), style);

        tester.pumpWidget(
          StyledWidgetBuilder(
            inherit: true,
            style: style,
            builder: (mix) {
              expect(mixData, mix);
              return const SizedBox();
            },
          ),
        );
      },
    );
  });
}
