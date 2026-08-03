import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix_protocol/mix_protocol.dart';

void main() {
  final contract = mixProtocol;

  JsonMap encode(Object styler) {
    return switch (contract.encodeStyle(styler)) {
      MixProtocolSuccess<JsonMap>(:final value) => value,
      MixProtocolFailure<JsonMap>(:final errors) => fail('$errors'),
    };
  }

  T decode<T extends Object>(JsonMap payload) {
    return switch (contract.decodeStyle<T>(payload)) {
      MixProtocolSuccess<T>(:final value) => value,
      MixProtocolFailure<T>(:final errors) => fail('$errors'),
    };
  }

  test('grid_box canonical payload covers geometry and style metadata', () {
    final payload = <String, Object>{
      'v': 1,
      'type': 'grid_box',
      'columns': [
        {'type': 'fixed', 'size': 220.0},
        {'type': 'fr', 'fraction': 2.0},
      ],
      'rows': [
        {'type': 'fixed', 'size': 120.0},
      ],
      'autoRows': {'type': 'fixed', 'size': 96.0},
      'columnGap': 16.0,
      'rowGap': 12.0,
      'clipBehavior': 'hardEdge',
      'constraintBranches': [
        {
          'breakpoint': {'maxWidth': 720.0, 'maxHeight': 900.0},
          'patch': {
            'columns': [
              {'type': 'fr', 'fraction': 1.0},
            ],
            'columnGap': 8.0,
            'rowGap': 8.0,
          },
        },
        {
          'breakpoint': {'token': 'breakpoint.grid.compact'},
          'patch': {
            'autoRows': {'type': 'fixed', 'size': 80.0},
          },
        },
      ],
      'variants': [
        {
          'kind': 'named',
          'name': 'dense',
          'style': {'type': 'grid_box', 'columnGap': 4.0, 'rowGap': 4.0},
        },
      ],
      'modifiers': [
        {'type': 'opacity', 'opacity': 0.75},
      ],
      'animation': {'duration': 120, 'curve': 'easeInOut', 'delay': 0},
    };

    final decoded = decode<GridBoxStyler>(payload);

    expect(encode(decoded), payload);
    expect(tokenReferencesOf(decoded), {
      const MixProtocolTokenReference('breakpoints', 'breakpoint.grid.compact'),
    });
  });

  test('runtime grid style round-trips without losing branch order', () {
    final style = GridBoxStyler(
      columns: const [GridTrack.fixed(200), GridTrack.fr(2)],
      rows: const [GridTrack.fixed(100)],
      autoRows: const GridTrack.fixed(84),
      columnGap: 16,
      rowGap: 12,
      clipBehavior: Clip.antiAlias,
      constraintBranches: [
        const GridConstraintBranch(
          breakpoint: Breakpoint(maxWidth: 900, minHeight: 400),
          patch: GridLayoutPatch(columnGap: 10),
        ),
        GridConstraintBranch(
          breakpoint: const BreakpointToken('breakpoint.grid.compact')(),
          patch: const GridLayoutPatch(columns: [GridTrack.fr(1)], rowGap: 8),
        ),
      ],
      variants: [
        VariantStyle(
          const NamedVariant('dense'),
          const GridBoxStyler(rowGap: 4),
        ),
      ],
      modifier: WidgetModifierConfig.opacity(0.5),
      animation: CurveAnimationConfig.easeInOut(
        const Duration(milliseconds: 120),
      ),
    );

    final payload = encode(style);
    final decoded = decode<GridBoxStyler>(payload);

    expect(decoded, style);
    expect(encode(decoded), payload);
    expect(
      decoded.$constraintBranches!.map((branch) => branch.breakpoint),
      orderedEquals([
        const Breakpoint(maxWidth: 900, minHeight: 400),
        const BreakpointToken('breakpoint.grid.compact')(),
      ]),
    );
  });

  test('grid_box rejects invalid geometry and constraint branches', () {
    final invalidFields = <String, Object>{
      'empty columns': <Object>[],
      'zero fraction': [
        {'type': 'fr', 'fraction': 0.0},
      ],
      'negative fixed size': [
        {'type': 'fixed', 'size': -1.0},
      ],
      'infinite fixed size': [
        {'type': 'fixed', 'size': double.infinity},
      ],
      'infinite fraction': [
        {'type': 'fr', 'fraction': double.infinity},
      ],
    };

    for (final MapEntry(key: label, value: columns) in invalidFields.entries) {
      final result = contract.decodeStyle<GridBoxStyler>({
        'v': 1,
        'type': 'grid_box',
        'columns': columns,
      });

      expect(result, isA<MixProtocolFailure<GridBoxStyler>>(), reason: label);
    }

    for (final branch in <JsonMap>[
      {
        'breakpoint': <String, Object>{},
        'patch': {'columnGap': 8.0},
      },
      {
        'breakpoint': {'token': 'breakpoint.compact', 'maxWidth': 600.0},
        'patch': {'columnGap': 8.0},
      },
      {
        'breakpoint': {'minWidth': 700.0, 'maxWidth': 600.0},
        'patch': {'columnGap': 8.0},
      },
      {
        'breakpoint': {'maxWidth': double.infinity},
        'patch': {'columnGap': 8.0},
      },
      {
        'breakpoint': {'maxWidth': 600.0},
        'patch': <String, Object>{},
      },
    ]) {
      final result = contract.decodeStyle<GridBoxStyler>({
        'v': 1,
        'type': 'grid_box',
        'constraintBranches': [branch],
      });

      expect(
        result,
        isA<MixProtocolFailure<GridBoxStyler>>(),
        reason: '$branch',
      );
    }

    expect(
      contract.decodeStyle<GridBoxStyler>({
        'v': 1,
        'type': 'grid_box',
        'columnGap': double.infinity,
      }),
      isA<MixProtocolFailure<GridBoxStyler>>(),
    );
  });

  test('grid_box encoding rejects invalid runtime geometry', () {
    final invalidStyles = <(String, GridBoxStyler)>[
      ('empty columns', const GridBoxStyler(columns: [])),
      (
        'infinite fixed track',
        const GridBoxStyler(columns: [GridTrack.fixed(double.infinity)]),
      ),
      ('infinite gap', const GridBoxStyler(columnGap: double.infinity)),
      (
        'empty patch',
        const GridBoxStyler(
          constraintBranches: [
            GridConstraintBranch(
              breakpoint: Breakpoint(maxWidth: 600),
              patch: GridLayoutPatch(),
            ),
          ],
        ),
      ),
      (
        'inverted breakpoint range',
        const GridBoxStyler(
          constraintBranches: [
            GridConstraintBranch(
              breakpoint: Breakpoint(minWidth: 700, maxWidth: 600),
              patch: GridLayoutPatch(columnGap: 8),
            ),
          ],
        ),
      ),
    ];

    for (final (label, style) in invalidStyles) {
      expect(
        contract.encodeStyle(style),
        isA<MixProtocolFailure<JsonMap>>(),
        reason: label,
      );
    }
  });

  test('exported schema contains the complete grid_box field surface', () {
    final schema = contract.exportStyleJsonSchema();
    final branches = (schema['anyOf']! as List).cast<JsonMap>();
    final branch = branches.singleWhere((candidate) {
      final properties = candidate['properties']! as JsonMap;
      final type = properties['type']! as JsonMap;

      return type['const'] == 'grid_box';
    });
    final properties = branch['properties']! as JsonMap;

    expect(properties.keys.toSet(), {
      'v',
      'type',
      'columns',
      'rows',
      'autoRows',
      'columnGap',
      'rowGap',
      'clipBehavior',
      'constraintBranches',
      'variants',
      'modifiers',
      'animation',
    });
  });
}
