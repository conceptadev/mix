import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix_example/main.dart';

const _goldenDiffTolerance = 0.03;

void main() {
  testWidgets('gallery smoke test exposes controls and all direction samples', (
    tester,
  ) async {
    await tester.pumpWidget(const WrapBoxExampleApp());

    expect(find.byType(WrapBox), findsWidgets);
    expect(find.byKey(const Key('tag-cloud')), findsOneWidget);
    expect(find.text('Horizontal · LTR'), findsOneWidget);
    expect(find.text('Horizontal · RTL'), findsOneWidget);
    expect(find.text('Vertical · LTR'), findsOneWidget);
    expect(find.text('Vertical · RTL'), findsOneWidget);

    await tester.tap(find.text('Wide').first);
    await tester.pumpAndSettle();
    expect(
      tester.getSize(find.byKey(const Key('tag-cloud'))).width,
      CloudWidth.wide.pixels,
    );

    await tester.tap(find.text('Vertical').first);
    await tester.tap(find.text('RTL').first);
    await tester.pumpAndSettle();

    final wrap = tester.widget<Wrap>(
      find.descendant(
        of: find.byKey(const Key('tag-cloud')),
        matching: find.byType(Wrap),
      ),
    );
    expect(wrap.direction, Axis.vertical);
    expect(wrap.textDirection, TextDirection.rtl);
  });

  for (final width in CloudWidth.values) {
    testWidgets('${width.label.toLowerCase()} cloud matches its golden', (
      tester,
    ) async {
      final previousComparator = goldenFileComparator;
      goldenFileComparator = _TolerantGoldenFileComparator(
        Uri.parse('test/wrap_box_example_test.dart'),
        precisionTolerance: _goldenDiffTolerance,
      );
      addTearDown(() => goldenFileComparator = previousComparator);

      await tester.binding.setSurfaceSize(const Size(520, 280));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true),
          home: Material(
            color: const Color(0xFFF5F5FA),
            child: Center(
              child: WrapCloudPreview(
                width: width.pixels,
                boundaryKey: const Key('cloud-golden-boundary'),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byKey(const Key('cloud-golden-boundary')),
        matchesGoldenFile('goldens/wrap_cloud_${width.name}.png'),
      );
    });
  }
}

/// Allows small rasterization differences between macOS and Linux renderers.
class _TolerantGoldenFileComparator extends LocalFileComparator {
  _TolerantGoldenFileComparator(
    super.testFile, {
    required this.precisionTolerance,
  }) : assert(
         precisionTolerance >= 0 && precisionTolerance <= 1,
         'precisionTolerance must be between 0 and 1',
       );

  final double precisionTolerance;

  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final result = await GoldenFileComparator.compareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );

    if (result.passed || result.diffPercent <= precisionTolerance) {
      result.dispose();
      return true;
    }

    final error = await generateFailureOutput(result, golden, basedir);
    result.dispose();
    throw FlutterError(error);
  }
}
