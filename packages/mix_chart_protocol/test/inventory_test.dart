import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mix_chart_protocol/mix_chart_protocol.dart';
import 'package:mix_chart_protocol/src/mix_chart_inventory.dart';

import '../../mix_protocol/tool/styler_surface.dart' as inventory;

void main() {
  test(
    'vocabulary and manifest cover the complete mix_chart styler surface',
    () {
      final surface = inventory.collectStylerSurface(
        sourceRoot: Directory('../mix_chart/lib/src'),
      );
      final vocabularyTypes = {
        for (final branch in mixChartVocabulary.branches)
          branch.valueType.toString(),
      };

      expect(vocabularyTypes, surface.stylerNames);
      expect(mixChartStylerInventory, surface.fieldsByStyler);
    },
  );
}
