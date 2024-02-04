import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  testWidgets(
    'Verify if widgets are wrapped with Padding when there are 2 children',
    (tester) async {
      await tester.pumpWidget(
        VBox(
          style: Style(flex.gap(10)),
          children: const [SizedBox(), SizedBox()],
        ),
      );

      final mixedFlex = find.byType(MixedFlex);

      expect(
        find.descendant(of: mixedFlex, matching: find.byType(Padding)),
        findsNWidgets(1),
      );
    },
  );

  testWidgets(
    'Verify if widgets are wrapped with Padding when there are 1 children',
    (tester) async {
      await tester.pumpWidget(
        VBox(style: Style(flex.gap(10)), children: const [SizedBox()]),
      );

      final mixedFlex = find.byType(MixedFlex);

      expect(
        find.descendant(of: mixedFlex, matching: find.byType(Padding)),
        findsNWidgets(0),
      );
    },
  );

  test(
    'Verify if widgets are wrapped with Padding when there are 3 children',
    () {
      var sut = MixedFlex(
        mix: EmptyMixData,
        direction: Axis.horizontal,
        children: const [SizedBox(), SizedBox(), SizedBox()],
      ).buildChildren(10);

      expect(sut.length, 3);

      for (var i = 0; i < sut.length; i++) {
        expect(sut[i], i == sut.length - 1 ? isA<SizedBox>() : isA<Padding>());
      }
    },
  );

  test('Verify if widgets are wrapped with Padding when there is 1 child', () {
    var sut = MixedFlex(
      mix: EmptyMixData,
      direction: Axis.horizontal,
      children: const [SizedBox()],
    ).buildChildren(10);

    expect(sut.length, 1);

    for (var i = 0; i < sut.length; i++) {
      expect(sut[i], i == sut.length - 1 ? isA<SizedBox>() : isA<Padding>());
    }
  });

  test(
    'Verify if when MixedFlex has direction horizontal the padding is only in the right',
    () {
      var sut = MixedFlex(
        mix: EmptyMixData,
        direction: Axis.horizontal,
        children: const [SizedBox(), SizedBox()],
      ).buildChildren(10);

      for (var i = 0; i < sut.length; i++) {
        if (i == sut.length - 1) continue;

        final paddingWidget = sut[i] as Padding;
        final edgeInsets = paddingWidget.padding.resolve(TextDirection.ltr);

        expect(edgeInsets.right, 10);
        expect(edgeInsets.left, 0);
        expect(edgeInsets.top, 0);
        expect(edgeInsets.bottom, 0);
      }
    },
  );

  test(
    'Verify if when MixedFlex has direction vertical the padding is only in the right',
    () {
      var sut = MixedFlex(
        mix: EmptyMixData,
        direction: Axis.vertical,
        children: const [SizedBox(), SizedBox()],
      ).buildChildren(10);

      for (var i = 0; i < sut.length; i++) {
        if (i == sut.length - 1) continue;

        final paddingWidget = sut[i] as Padding;
        final edgeInsets = paddingWidget.padding.resolve(TextDirection.ltr);

        expect(edgeInsets.right, 0);
        expect(edgeInsets.left, 0);
        expect(edgeInsets.top, 0);
        expect(edgeInsets.bottom, 10);
      }
    },
  );

  testWidgets(
    'HBox with gap() rendered correctly in complex widget tree',
    (tester) async {
      await tester.pumpMaterialApp(
        Center(
          child: Column(
            children: [
              Row(
                children: [
                  HBox(
                    style: Style(flex.gap(10)),
                    children: const [StyledText('test'), StyledText('case')],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );

  testWidgets(
    'VBox with gap() rendered correctly in complex widget tree',
    (tester) async {
      await tester.pumpMaterialApp(
        Center(
          child: Row(
            children: [
              Column(
                children: [
                  VBox(
                    style: Style(flex.gap(10)),
                    children: const [StyledText('test'), StyledText('case')],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
