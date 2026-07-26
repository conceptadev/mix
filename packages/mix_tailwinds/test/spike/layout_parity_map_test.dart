// Spike tests exercise unexported mix layout surfaces and internal APIs.
// ignore_for_file: implementation_imports, invalid_use_of_internal_member

import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/layout/grid_track.dart';
import 'package:mix/src/specs/wrap/wrap_spec.dart';
import 'package:mix/src/specs/wrapbox/wrapbox_spec.dart';
import 'package:mix_tailwinds/src/spike/layout_parity_map.dart';

void main() {
  group('Spike 4 Tailwind layout parity map', () {
    test('acceptance mapping table covers honest Grid and Wrap rows only', () {
      expect(spike4AcceptanceMappings, hasLength(2));
      expect(
        spike4AcceptanceMappings.map((m) => m.tailwind).toList(),
        containsAll(['grid-cols-3 gap-4', 'flex-wrap gap-2']),
      );
      expect(
        spike4AcceptanceMappings.map((m) => m.tailwind),
        isNot(contains(contains('@container'))),
      );
      expect(
        spike4AcceptanceMappings.map((m) => m.tailwind),
        isNot(contains(contains('@max-md'))),
      );
    });

    test('grid-cols-3 gap-4 → three fr tracks and 16px gap', () {
      final style = translateGridColsGap(columnCount: 3, gapStep: 4);
      expect(style.columns, hasLength(3));
      expect(style.columns.every((t) => t is FrGridTrack), isTrue);
      expect(style.columnGap, 16);
      expect(style.rowGap, 16);
    });

    test('flex-wrap gap-2 → WrapBoxStyler flow spacing/runSpacing 8', () {
      final style = translateFlexWrapGap(gapStep: 2);
      expect(style, isA<WrapBoxStyler>());
      expect(style.$flow, isNotNull);

      final expected = WrapBoxStyler(
        flow: WrapStyler(spacing: 8, runSpacing: 8),
      );
      expect(style.$flow, expected.$flow);
    });

    test('no @container / @max-md translator is exported from the spike', () {
      // Structural: translateContainerMaxMdFlexCol was removed with the failed
      // universal onConstraints experiment.
      expect(translateGridColsGap, isA<Function>());
      expect(translateFlexWrapGap, isA<Function>());
    });
  });
}
