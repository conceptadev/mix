// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../helpers/testing_utils.dart';

class StyledContainerExample extends StatelessWidget {
  const StyledContainerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingAttr = box.padding(10);
    final marginAttr = box.margin(15);
    final alignmentAttr = box.alignment.center();
    final clipAttr = box.clipBehavior.hardEdge();

    final borderAttribute = box.border.all(
      color: Colors.red,
      width: 1,
      style: BorderStyle.solid,
    );

    final radiusAttribute = box.border.radius(10);

    final colorAttribute = box.color(Colors.red);

    return StyledContainer(
      style: StyleMix(
        paddingAttr,
        marginAttr,
        alignmentAttr,
        clipAttr,
        borderAttribute,
        radiusAttribute,
        colorAttribute,
      ),
      child: const SizedBox(
        width: 100,
        height: 100,
      ),
    );
  }
}

class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(15),
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      child: const SizedBox(
        width: 100,
        height: 100,
      ),
    );
  }
}

void main() {
  testWidgets('Is fast enough', (WidgetTester tester) async {
    const iterationCount = 10000;

    Future<int> buildWidget(Widget widget) async {
      return await tester.runAsync<int>(() async {
            final stopwatch = Stopwatch()..start();
            for (int i = 0; i < iterationCount; i++) {
              await tester.pumpWidget(widget);
            }
            stopwatch.stop();
            return stopwatch.elapsedMilliseconds;
          }) ??
          0;
    }

    // warm up
    await buildWidget(ContainerExample());
    await buildWidget(StyledContainerExample());

    final styledContainerTime = await buildWidget(StyledContainer());

    final containerTime = await buildWidget(ContainerExample());

    final elapsedStyledContainerTime = styledContainerTime / iterationCount;
    final elapsedContainerTime = containerTime / iterationCount;

    // print('StyledContainer: $elapsedStyledContainerTime ms');
    // print('Container: $elapsedContainerTime ms');
    // StyledContainer shoudl not b slower than 0.01 ms
    expect(elapsedStyledContainerTime, lessThan(elapsedContainerTime + 0.02),
        reason: 'StyledContainer is too slow');
  });

  // test perfromance for StyleMix.create
  test('StyleMix.create', () {
    const iterations = 10000;
    final stopwatch = Stopwatch()..start();
    for (int i = 0; i < iterations; i++) {
      StyleMix.create([
        box.padding(10),
        box.margin(15),
        box.alignment.center(),
        box.clipBehavior.hardEdge(),
        box.border.all(
          color: Colors.red,
          width: 1,
          style: BorderStyle.solid,
        ),
        box.border.radius(10),
        box.color(Colors.red),
      ]);
    }
    stopwatch.stop();

    final elapsedTime = stopwatch.elapsedMilliseconds / iterations;
    print('StyleMix.create: $elapsedTime ms');
  });

  // test performance for MixData.create
  test('MixData.create', () {
    const iterations = 10000;
    final stopwatch = Stopwatch()..start();
    for (int i = 0; i < iterations; i++) {
      MixData.create(
        MockBuildContext(),
        StyleMix(
          box.padding(10),
          box.margin(15),
          box.alignment.center(),
          box.clipBehavior.hardEdge(),
          box.border.all(
            color: Colors.red,
            width: 1,
            style: BorderStyle.solid,
          ),
          box.border.radius(10),
          box.color(Colors.red),
        ),
      );
    }

    stopwatch.stop();
    final timeElapsed = stopwatch.elapsedMilliseconds / iterations;

    print('MixData.create: $timeElapsed ms');
  });
}

class StyleWidgetExpensiveAttributge extends StatelessWidget {
  const StyleWidgetExpensiveAttributge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingAttr = box.padding(10);
    final marginAttr = box.margin(15);
    final alignmentAttr = box.alignment.center();
    final clipAttr = box.clipBehavior.hardEdge();

    // final borderAttribute = box.border.all(
    //   color: Colors.red,
    //   width: 1,
    //   style: BorderStyle.solid,
    // );

    // final radiusAttribute = box.border.radius(10);

    final colorAttribute = box.color(Colors.red);

    StyleMix buildStyle() {
      return StyleMix(
        paddingAttr,
        marginAttr,
        alignmentAttr,
        clipAttr,
        // borderAttribute,
        // radiusAttribute,
        colorAttribute,
      );
    }

    StyleMix mergedStyle = buildStyle();

    // merge 100 times buildStyles()
    for (int i = 0; i < 10000; i++) {
      mergedStyle = mergedStyle.merge(buildStyle());
    }

    return StyledContainer(
      style: mergedStyle,
      child: const SizedBox(
        width: 100,
        height: 100,
      ),
    );
  }
}
