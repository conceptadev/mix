import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('SpecBuilder', () {
    testWidgets(
        '''When a parent StyledWidget has a Style and inherited property is true, the SpecBuilder.builder should have access to the parent's style attributes in the MixData''',
        (tester) async {
      tester.pumpWidget(
        Box(
          style: Style($box.height(100)),
          child: SpecBuilder(
            inherit: true,
            builder: (context) {
              final mix = Mix.of(context);
              expect(mix.attributeOf<BoxSpecAttribute>()!.height, 100);
              return const SizedBox();
            },
          ),
        ),
      );
    });

    testWidgets(
      '''When a parent StyledWidget has a Style and inherited property is false, the SpecBuilder.builder should not have access to the parent's style attributes in the MixData''',
      (tester) async {
        tester.pumpWidget(
          Box(
            style: Style($box.height(100)),
            child: SpecBuilder(
              inherit: false,
              builder: (context) {
                final mix = Mix.of(context);
                expect(mix.attributeOf<BoxSpecAttribute>(), isNull);
                return const SizedBox();
              },
            ),
          ),
        );
      },
    );

    testWidgets(
      '''When a parent SpecBuilder has no Style, the MixData in SpecBuilder.builder should have no attributes''',
      (tester) async {
        tester.pumpWidget(
          SpecBuilder(
            builder: (context) {
              final mix = Mix.of(context);
              expect(mix.attributes.length, isZero);
              return const SizedBox();
            },
          ),
        );
      },
    );

    testWidgets(
      '''When a parent StyledWidget has a Style, the MixData in SpecBuilder.builder should have the same attributes''',
      (tester) async {
        final style = Style(
          $box.height(100),
          $box.width(100),
          $box.color(Colors.red),
        );

        final mixData = MixData.create(MockBuildContext(), style);

        tester.pumpWidget(
          SpecBuilder(
            inherit: true,
            style: style,
            builder: (context) {
              final mix = Mix.of(context);
              expect(mixData, mix);
              return const SizedBox();
            },
          ),
        );
      },
    );
  });
}
