// Grid spike surfaces are intentionally unexported.
// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/layout/grid_box.dart';
import 'package:mix/src/layout/grid_track.dart';
import 'package:mix/src/layout/render_grid.dart';

void main() {
  group('computeTrackSizes', () {
    test('fixed tracks ignore free space', () {
      final sizes = computeTrackSizes(
        tracks: const [GridTrack.fixed(100), GridTrack.fixed(50)],
        freeSpace: 400,
        gap: 0,
      );
      expect(sizes, [100, 50]);
    });

    test('fr tracks share remaining after fixed and gaps', () {
      // free=300, fixed=100, gaps=2×10 → remaining=180; 1fr+1fr → 90 each
      final sizes = computeTrackSizes(
        tracks: const [GridTrack.fixed(100), GridTrack.fr(1), GridTrack.fr(1)],
        freeSpace: 300,
        gap: 10,
      );
      expect(sizes[0], 100);
      expect(sizes[1], closeTo(90, 0.001));
      expect(sizes[2], closeTo(90, 0.001));
    });

    test('2fr vs 1fr ratio', () {
      final sizes = computeTrackSizes(
        tracks: const [GridTrack.fr(2), GridTrack.fr(1)],
        freeSpace: 300,
        gap: 0,
      );
      expect(sizes[0], closeTo(200, 0.001));
      expect(sizes[1], closeTo(100, 0.001));
    });

    test('gap math produces the expected extent and track origins', () {
      final sizes = [100.0, 100.0, 100.0];
      expect(axisExtent(sizes, 10), 320); // 300 + 2*10
      expect(computeTrackOrigins(sizes, 10), [0, 110, 220]);
    });
  });

  group('computeGridLayout', () {
    test('fixed auto rows shrink-wrap under unbounded height', () {
      final result = computeGridLayout(
        constraints: const BoxConstraints(maxWidth: 100),
        columns: const [GridTrack.fixed(100)],
        rows: const [],
        autoRows: const GridTrack.fixed(40),
        columnGap: 0,
        rowGap: 8,
        childCount: 3,
      );

      expect(result.rowSizes, [40.0, 40.0, 40.0]);
      expect(result.size, const Size(100, 136));
    });

    test('missing auto rows reports the undeclared row strategy', () {
      expect(
        () => computeGridLayout(
          constraints: const BoxConstraints(maxWidth: 100, maxHeight: 200),
          columns: const [GridTrack.fixed(100)],
          rows: const [],
          columnGap: 0,
          rowGap: 0,
          childCount: 1,
        ),
        throwsA(
          isA<FlutterError>()
              .having(
                (error) => error.toString(),
                'message',
                contains('autoRows'),
              )
              .having(
                (error) => error.toString(),
                'message',
                isNot(contains('fractional')),
              ),
        ),
      );
    });

    test('fractional auto rows name the configured track when unbounded', () {
      expect(
        () => computeGridLayout(
          constraints: const BoxConstraints(maxWidth: 100),
          columns: const [GridTrack.fixed(100)],
          rows: const [],
          autoRows: const GridTrack.fr(1),
          columnGap: 0,
          rowGap: 0,
          childCount: 1,
        ),
        throwsA(
          isA<FlutterError>()
              .having(
                (error) => error.toString(),
                'message',
                contains('autoRows'),
              )
              .having(
                (error) => error.toString(),
                'message',
                contains('bounded height'),
              )
              .having(
                (error) => error.toString(),
                'message',
                contains('GridTrack.fr(1'),
              ),
        ),
      );
    });

    test('row-major auto-placement', () {
      final result = computeGridLayout(
        constraints: const BoxConstraints.tightFor(width: 300, height: 200),
        columns: const [GridTrack.fr(1), GridTrack.fr(1), GridTrack.fr(1)],
        rows: const [],
        autoRows: const GridTrack.fr(1),
        columnGap: 0,
        rowGap: 0,
        childCount: 5,
      );

      expect(result.cells.length, 5);
      expect(result.cells[0].column, 0);
      expect(result.cells[0].row, 0);
      expect(result.cells[3].column, 0);
      expect(result.cells[3].row, 1);
      expect(result.cells[4].column, 1);
      expect(result.cells[4].row, 1);
      expect(result.columnSizes.every((s) => s == 100), isTrue);
    });

    test('unbounded height with fixed rows uses fixed sizes', () {
      final result = computeGridLayout(
        constraints: const BoxConstraints(maxWidth: 300, minHeight: 0),
        columns: const [GridTrack.fixed(100)],
        rows: const [GridTrack.fixed(40), GridTrack.fixed(40)],
        columnGap: 0,
        rowGap: 8,
        childCount: 2,
      );

      expect(result.rowSizes, [40.0, 40.0]);
      expect(result.size.height, 88); // 40+40+8 gap
    });

    test('no auto rows when there are no children', () {
      final result = computeGridLayout(
        constraints: const BoxConstraints(maxWidth: 100, maxHeight: 100),
        columns: const [GridTrack.fixed(100)],
        rows: const [],
        columnGap: 0,
        rowGap: 0,
        childCount: 0,
      );

      expect(result.rowSizes, isEmpty);
      expect(result.cells, isEmpty);
      // Loose constraints: intrinsic height collapses to zero with no rows.
      expect(result.size.height, 0);
    });
  });

  group('GridConstraintQuery', () {
    test('widthAtMost is inclusive and evaluates the offered max width', () {
      final query = GridConstraintQuery.widthAtMost(560);

      expect(query.matches(const BoxConstraints(maxWidth: 560)), isTrue);
      expect(query.matches(const BoxConstraints(maxWidth: 561)), isFalse);
      expect(
        query.matches(const BoxConstraints(minWidth: 400)),
        isFalse,
        reason: 'an unbounded width is not a concrete offered width',
      );
    });

    test('unbounded height does not affect a width query', () {
      final query = GridConstraintQuery.widthAtMost(560);

      expect(query.matches(const BoxConstraints(maxWidth: 400)), isTrue);
    });

    test('invalid width thresholds throw in the public factory', () {
      expect(
        () => GridConstraintQuery.widthAtMost(-1),
        throwsA(isA<FlutterError>()),
      );
      expect(
        () => GridConstraintQuery.widthAtMost(.infinity),
        throwsA(isA<FlutterError>()),
      );
    });
  });

  group('GridBoxSpec', () {
    test('constructor validates and snapshots all caller-owned lists', () {
      final columns = [const GridTrack.fr(1), const GridTrack.fr(1)];
      final branchColumns = [const GridTrack.fr(1)];

      final spec = GridBoxSpec(
        columns: columns,
        branches: [
          GridConstraintBranch(
            query: GridConstraintQuery.widthAtMost(400),
            patch: GridLayoutPatch(columns: branchColumns),
          ),
        ],
      );

      columns.add(const GridTrack.fr(1));
      branchColumns.add(const GridTrack.fixed(10));

      expect(spec.columns, hasLength(2));
      expect(spec.branches.single.patch.columns, hasLength(1));
      expect(
        () => spec.columns.add(const GridTrack.fr(1)),
        throwsUnsupportedError,
      );
      expect(
        () => spec.branches.add(
          GridConstraintBranch(
            query: GridConstraintQuery.widthAtMost(300),
            patch: const GridLayoutPatch(columnGap: 4),
          ),
        ),
        throwsUnsupportedError,
      );
    });

    test('branch matching is inclusive and declaration ordered', () {
      final spec = GridBoxSpec(
        columns: const [GridTrack.fr(1), GridTrack.fr(1), GridTrack.fr(1)],
        branches: [
          GridConstraintBranch(
            query: GridConstraintQuery.widthAtMost(560),
            patch: const GridLayoutPatch(columns: [GridTrack.fr(1)]),
          ),
          GridConstraintBranch(
            query: GridConstraintQuery.widthAtMost(400),
            patch: const GridLayoutPatch(
              columns: [GridTrack.fixed(50), GridTrack.fixed(50)],
            ),
          ),
        ],
      );

      // Width 400 matches both maxWidth 560 and maxWidth 400; later wins.
      final at400 = spec.resolveGeometryForConstraints(
        const BoxConstraints.tightFor(width: 400, height: 100),
      );
      expect(at400.columns, hasLength(2));
      expect(at400.columns.first, isA<FixedGridTrack>());

      // Width 500 matches only first branch.
      final at500 = spec.resolveGeometryForConstraints(
        const BoxConstraints.tightFor(width: 500, height: 100),
      );
      expect(at500.columns, hasLength(1));

      // Width 600 matches none — base geometry.
      final at600 = spec.resolveGeometryForConstraints(
        const BoxConstraints.tightFor(width: 600, height: 100),
      );
      expect(at600.columns, hasLength(3));

      // Inclusive: exactly maxWidth matches.
      final at560 = spec.resolveGeometryForConstraints(
        const BoxConstraints.tightFor(width: 560, height: 100),
      );
      expect(at560.columns, hasLength(1));
    });

    test('partial patches preserve prior values', () {
      final spec = GridBoxSpec(
        columns: const [GridTrack.fr(1), GridTrack.fr(1)],
        rows: const [GridTrack.fixed(40)],
        columnGap: 8,
        rowGap: 4,
        branches: [
          GridConstraintBranch(
            query: GridConstraintQuery.widthAtMost(500),
            patch: const GridLayoutPatch(columnGap: 16),
          ),
        ],
      );

      final g = spec.resolveGeometryForConstraints(
        const BoxConstraints.tightFor(width: 400, height: 100),
      );
      expect(g.columns, hasLength(2));
      expect(g.rows, hasLength(1));
      expect(g.columnGap, 16);
      expect(g.rowGap, 4);
    });

    test('width query selects a branch when height is unbounded', () {
      final spec = GridBoxSpec(
        columns: const [GridTrack.fixed(50), GridTrack.fixed(50)],
        rows: const [GridTrack.fixed(40)],
        branches: [
          GridConstraintBranch(
            query: GridConstraintQuery.widthAtMost(500),
            patch: const GridLayoutPatch(columns: [GridTrack.fixed(100)]),
          ),
        ],
      );

      final narrow = spec.resolveGeometryForConstraints(
        const BoxConstraints(maxWidth: 400),
      );
      expect(narrow.columns, hasLength(1));
    });

    test('uses value equality for snapped geometry', () {
      final cols = [const GridTrack.fr(1), const GridTrack.fr(1)];
      final a = GridBoxSpec(
        columns: List.unmodifiable(List.of(cols)),
        columnGap: 8,
      );
      final b = GridBoxSpec(
        columns: List.unmodifiable(const [GridTrack.fr(1), GridTrack.fr(1)]),
        columnGap: 8,
      );
      expect(a, b);
      expect(a.hashCode, b.hashCode);
    });
  });

  group('GridBoxSpec validation', () {
    test('empty columns throws', () {
      expect(
        () => GridBoxSpec(columns: const []),
        throwsA(isA<FlutterError>()),
      );
    });

    test('infinite fixed track and non-finite gaps throw FlutterError', () {
      expect(
        () => GridBoxSpec(columns: [FixedGridTrack(.infinity)]),
        throwsA(isA<FlutterError>()),
      );
      expect(
        () =>
            GridBoxSpec(columns: const [GridTrack.fr(1)], columnGap: .infinity),
        throwsA(isA<FlutterError>()),
      );
      expect(
        () => GridBoxSpec(columns: const [GridTrack.fr(1)], rowGap: -2),
        throwsA(isA<FlutterError>()),
      );
      expect(
        () => GridBoxSpec(columns: [FrGridTrack(.infinity)]),
        throwsA(isA<FlutterError>()),
      );
    });

    test('constructor rejects invalid branch geometry', () {
      expect(
        () => GridBoxSpec(
          branches: [
            GridConstraintBranch(
              query: GridConstraintQuery.widthAtMost(100),
              patch: const GridLayoutPatch(),
            ),
          ],
        ),
        throwsA(
          isA<FlutterError>().having(
            (error) => error.toString(),
            'message',
            contains('empty patch'),
          ),
        ),
      );
      expect(
        () => GridBoxSpec(
          columns: const [GridTrack.fr(1)],
          branches: [
            GridConstraintBranch(
              query: GridConstraintQuery.widthAtMost(100),
              patch: GridLayoutPatch(columns: [FixedGridTrack(.infinity)]),
            ),
          ],
        ),
        throwsA(isA<FlutterError>()),
      );
    });

    test('unbounded fractional axis throws actionable FlutterError', () {
      final config = GridBoxSpec(
        columns: [GridTrack.fr(1)],
        rows: [GridTrack.fixed(40)],
      );

      Object? error;
      try {
        config.resolveGeometryForConstraints(
          const BoxConstraints(maxHeight: 100),
        );
      } catch (e) {
        error = e;
      }
      expect(error, isA<FlutterError>());
      final text = error?.toString() ?? '';
      expect(text, contains('bounded width'));
      expect(text, contains('Axis: width'));
      expect(text, contains('Tracks:'));
      expect(text, contains('fixed'));
    });

    test('fixed tracks under unbounded constraints succeed', () {
      final config = GridBoxSpec(
        columns: [GridTrack.fixed(80), GridTrack.fixed(80)],
        rows: [GridTrack.fixed(40)],
      );
      final g = config.resolveGeometryForConstraints(const BoxConstraints());
      expect(g.columns, hasLength(2));
    });
  });

  group('GridBoxStyler.onConstraints patch rules', () {
    test('rejects modifiers, animations, variants, nested branches, empty', () {
      expect(
        () => GridBoxStyler().onConstraints(
          GridConstraintQuery.widthAtMost(400),
          GridBoxStyler().wrap(const WidgetModifierConfig()),
        ),
        throwsA(isA<FlutterError>()),
      );
      expect(
        () => GridBoxStyler().onConstraints(
          GridConstraintQuery.widthAtMost(400),
          GridBoxStyler().animate(
            const CurveAnimationConfig(
              duration: Duration(milliseconds: 100),
              curve: Curves.linear,
            ),
          ),
        ),
        throwsA(isA<FlutterError>()),
      );
      expect(
        () => GridBoxStyler().onConstraints(
          GridConstraintQuery.widthAtMost(400),
          GridBoxStyler().onDark(const GridBoxStyler()),
        ),
        throwsA(isA<FlutterError>()),
      );
      expect(
        () => GridBoxStyler()
            .onConstraints(
              GridConstraintQuery.widthAtMost(400),
              const GridBoxStyler(columns: [GridTrack.fr(1)]),
            )
            .onConstraints(
              GridConstraintQuery.widthAtMost(300),
              GridBoxStyler().onConstraints(
                GridConstraintQuery.widthAtMost(200),
                const GridBoxStyler(columns: [GridTrack.fr(1)]),
              ),
            ),
        throwsA(isA<FlutterError>()),
      );
      expect(
        () => GridBoxStyler().onConstraints(
          GridConstraintQuery.widthAtMost(400),
          const GridBoxStyler(),
        ),
        throwsA(isA<FlutterError>()),
      );
    });

    test('merge appends branches and merges modifiers/animation', () {
      final a = GridBoxStyler(columns: const [GridTrack.fr(1), GridTrack.fr(1)])
          .onConstraints(
            GridConstraintQuery.widthAtMost(560),
            const GridBoxStyler(columns: [GridTrack.fr(1)]),
          );
      final b = const GridBoxStyler(columnGap: 8).onConstraints(
        GridConstraintQuery.widthAtMost(400),
        const GridBoxStyler(columnGap: 4),
      );

      final merged = a.merge(b);
      expect(merged.constraintBranches, hasLength(2));
      expect(merged.columnGap, 8);
      expect(merged.columns, hasLength(2));
    });

    test('base modifiers merge via MixOps.mergeModifier', () {
      final base = GridBoxStyler().wrap(WidgetModifierConfig.opacity(0.5));
      final other = GridBoxStyler().wrap(WidgetModifierConfig.opacity(0.8));
      final merged = base.merge(other);
      expect(merged.$modifier, isNotNull);
      // Merged config is a new object combining both.
      expect(merged.$modifier, isNot(same(base.$modifier)));
    });
  });

  group('RenderMixGrid live == dry', () {
    testWidgets('live size equals dry size for deterministic children', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: SizedBox(
              width: 300,
              height: 200,
              child: MixGrid(
                spec: GridBoxSpec(
                  columns: [
                    GridTrack.fixed(100),
                    GridTrack.fr(2),
                    GridTrack.fr(1),
                  ],
                  rows: [GridTrack.fr(1), GridTrack.fr(1)],
                  columnGap: 10,
                  rowGap: 10,
                ),
                children: List.generate(
                  6,
                  (i) => ColoredBox(
                    key: Key('c$i'),
                    color: Colors.primaries[i % Colors.primaries.length],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      final render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
      final live = render.size;
      final dry = render.getDryLayout(
        const BoxConstraints.tightFor(width: 300, height: 200),
      );
      expect(live, dry);
      expect(live, const Size(300, 200));
      expect(render.spec.columns.length, 3);
    });

    testWidgets('loose fixed auto rows produce meaningful live/dry parity', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: .min,
                children: [
                  MixGrid(
                    spec: GridBoxSpec(
                      columns: const [
                        GridTrack.fixed(100),
                        GridTrack.fixed(100),
                      ],
                      autoRows: const GridTrack.fixed(40),
                      columnGap: 10,
                      rowGap: 8,
                    ),
                    children: const [SizedBox(), SizedBox(), SizedBox()],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      final render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
      final dry = render.getDryLayout(const BoxConstraints(maxWidth: 300));

      expect(render.size, const Size(210, 88));
      expect(dry, render.size);
    });

    testWidgets('each child laid out exactly once per performLayout', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: MixGrid(
                spec: GridBoxSpec(
                  columns: [GridTrack.fr(1), GridTrack.fr(1)],
                  autoRows: GridTrack.fr(1),
                ),
                children: const [
                  _LayoutCallCounter(key: Key('a')),
                  _LayoutCallCounter(key: Key('b')),
                  _LayoutCallCounter(key: Key('c')),
                ],
              ),
            ),
          ),
        ),
      );

      final render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
      final counters = tester
          .renderObjectList<_RenderLayoutCallCounter>(
            find.byType(_LayoutCallCounter),
          )
          .toList();
      expect(counters, hasLength(3));
      expect(counters.map((counter) => counter.layoutCount), everyElement(1));

      for (final counter in counters) {
        counter.layoutCount = 0;
      }
      render.markNeedsLayout();
      await tester.pump();
      expect(counters.map((counter) => counter.layoutCount), everyElement(1));
    });

    testWidgets('gap math at track boundaries positions children', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: SizedBox(
              width: 220, // 100 + 20 gap + 100
              height: 100,
              child: MixGrid(
                spec: GridBoxSpec(
                  columns: [GridTrack.fixed(100), GridTrack.fixed(100)],
                  rows: [GridTrack.fixed(100)],
                  columnGap: 20,
                ),
                children: const [
                  SizedBox(key: Key('left')),
                  SizedBox(key: Key('right')),
                ],
              ),
            ),
          ),
        ),
      );

      final left = tester.getTopLeft(find.byKey(const Key('left')));
      final right = tester.getTopLeft(find.byKey(const Key('right')));
      expect(right.dx - left.dx, 120); // 100 width + 20 gap
    });

    testWidgets('hit testing hits the child at its laid-out offset', (
      tester,
    ) async {
      var leftTaps = 0;
      var rightTaps = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: SizedBox(
              width: 220,
              height: 100,
              child: MixGrid(
                spec: GridBoxSpec(
                  columns: [GridTrack.fixed(100), GridTrack.fixed(100)],
                  rows: [GridTrack.fixed(100)],
                  columnGap: 20,
                ),
                children: [
                  GestureDetector(
                    key: const Key('left'),
                    onTap: () => leftTaps++,
                    behavior: .opaque,
                  ),
                  GestureDetector(
                    key: const Key('right'),
                    onTap: () => rightTaps++,
                    behavior: .opaque,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      final rightCenter = tester.getCenter(find.byKey(const Key('right')));
      await tester.tapAt(rightCenter);

      expect(rightTaps, 1);
      expect(leftTaps, 0);
    });
  });

  group('GridBox render-time onConstraints', () {
    testWidgets('three-to-one column switch via layout without child rebuild', (
      tester,
    ) async {
      // Honest contract: branch selection runs in performLayout. Hold the
      // MixGrid + child widget *instances* stable while only the parent
      // SizedBox width changes, so Element.updateChild short-circuits on
      // identical child widgets and Builders do not re-run.
      var childBuilds = 0;
      final config = GridBoxSpec(
        columns: const [GridTrack.fixed(80), GridTrack.fr(2), GridTrack.fr(1)],
        autoRows: const GridTrack.fr(1),
        columnGap: 8,
        rowGap: 8,
        branches: [
          GridConstraintBranch(
            query: GridConstraintQuery.widthAtMost(560),
            patch: const GridLayoutPatch(
              columns: [GridTrack.fr(1)],
              columnGap: 8,
              rowGap: 8,
            ),
          ),
        ],
      );

      // Created once — reused across pumps so child Elements are not updated.
      final children = <Widget>[
        Builder(
          builder: (context) {
            childBuilds++;

            return const ColoredBox(key: Key('cell0'), color: Colors.red);
          },
        ),
        Builder(
          builder: (context) {
            childBuilds++;

            return const ColoredBox(key: Key('cell1'), color: Colors.green);
          },
        ),
        Builder(
          builder: (context) {
            childBuilds++;

            return const ColoredBox(key: Key('cell2'), color: Colors.blue);
          },
        ),
      ];
      final grid = MixGrid(spec: config, children: children);

      await tester.pumpWidget(
        MaterialApp(
          home: Center(child: SizedBox(width: 900, height: 300, child: grid)),
        ),
      );

      expect(find.byType(LayoutBuilder), findsNothing);
      final buildsAfterWide = childBuilds;
      expect(buildsAfterWide, 3);

      // Wide: three columns → cell0 and cell1 share the first row.
      final wide0 = tester.getTopLeft(find.byKey(const Key('cell0')));
      final wide1 = tester.getTopLeft(find.byKey(const Key('cell1')));
      expect(wide1.dx, greaterThan(wide0.dx));
      expect(wide1.dy, wide0.dy);

      // Only parent constraints change; same MixGrid/child instances.
      await tester.pumpWidget(
        MaterialApp(
          home: Center(child: SizedBox(width: 400, height: 300, child: grid)),
        ),
      );

      // Branch selection must not rebuild children.
      expect(childBuilds, buildsAfterWide);

      final render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
      final geometry = render.spec.resolveGeometryForConstraints(
        const BoxConstraints.tightFor(width: 400, height: 300),
      );
      expect(geometry.columns.length, 1);

      // Narrow: one column → children stack vertically.
      final narrowOffsets = [
        tester.getTopLeft(find.byKey(const Key('cell0'))),
        tester.getTopLeft(find.byKey(const Key('cell1'))),
      ];
      expect(narrowOffsets[1].dx, narrowOffsets[0].dx);
      expect(narrowOffsets[1].dy, greaterThan(narrowOffsets[0].dy));
    });

    testWidgets(
      'spec snapshot prevents caller list mutation from reaching render',
      (tester) async {
        final cols = [
          const GridTrack.fr(1),
          const GridTrack.fr(1),
          const GridTrack.fr(1),
        ];
        final config = GridBoxSpec(
          columns: cols,
          autoRows: const GridTrack.fr(1),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: MixGrid(
                  spec: config,
                  children: const [SizedBox(key: Key('only'))],
                ),
              ),
            ),
          ),
        );

        final render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
        final snappedColumns = render.spec.columns;
        expect(snappedColumns, hasLength(3));
        // The spec owns its snapshot before it reaches the render boundary.
        expect(identical(snappedColumns, cols), isFalse);

        cols.add(const GridTrack.fr(1));
        expect(render.spec.columns, same(snappedColumns));
        expect(
          () => render.spec.columns.add(const GridTrack.fr(1)),
          throwsUnsupportedError,
        );
      },
    );

    testWidgets(
      'GridBoxStyler.onConstraints dashboard collapse under offered width',
      (tester) async {
        final width = ValueNotifier(900.0);
        addTearDown(width.dispose);

        await tester.pumpWidget(
          MaterialApp(
            home: Center(
              child: ValueListenableBuilder<double>(
                valueListenable: width,
                builder: (context, w, _) {
                  return SizedBox(
                    width: w,
                    height: 300,
                    child: GridBox(
                      style:
                          GridBoxStyler(
                            columns: const [
                              GridTrack.fixed(80),
                              GridTrack.fr(2),
                              GridTrack.fr(1),
                            ],
                            autoRows: const GridTrack.fr(1),
                            columnGap: 8,
                            rowGap: 8,
                          ).onConstraints(
                            GridConstraintQuery.widthAtMost(560),
                            const GridBoxStyler(
                              columns: [GridTrack.fr(1)],
                              columnGap: 8,
                              rowGap: 8,
                            ),
                          ),
                      children: const [
                        ColoredBox(key: Key('cell0'), color: Colors.red),
                        ColoredBox(key: Key('cell1'), color: Colors.green),
                        ColoredBox(key: Key('cell2'), color: Colors.blue),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );

        var render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
        expect(render.spec.columns.length, 3);
        expect(find.byType(LayoutBuilder), findsNothing);

        width.value = 400;
        await tester.pump();

        render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
        final geometry = render.spec.resolveGeometryForConstraints(
          const BoxConstraints.tightFor(width: 400, height: 300),
        );
        expect(geometry.columns.length, 1);

        final narrow0 = tester.getTopLeft(find.byKey(const Key('cell0')));
        final narrow1 = tester.getTopLeft(find.byKey(const Key('cell1')));
        expect(narrow1.dx, narrow0.dx);
        expect(narrow1.dy, greaterThan(narrow0.dy));
      },
    );

    testWidgets('gallery 3×N collapses to one column under narrow width', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: SizedBox(
              width: 300,
              height: 400,
              child: GridBox(
                style:
                    GridBoxStyler(
                      columns: const [
                        GridTrack.fr(1),
                        GridTrack.fr(1),
                        GridTrack.fr(1),
                      ],
                      autoRows: const GridTrack.fr(1),
                      columnGap: 8,
                      rowGap: 8,
                    ).onConstraints(
                      GridConstraintQuery.widthAtMost(560),
                      const GridBoxStyler(
                        columns: [GridTrack.fr(1)],
                        columnGap: 8,
                        rowGap: 8,
                      ),
                    ),
                children: List.generate(
                  6,
                  (i) => ColoredBox(
                    key: Key('g$i'),
                    color: Colors.primaries[i % Colors.primaries.length],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      final render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
      final geometry = render.spec.resolveGeometryForConstraints(
        const BoxConstraints.tightFor(width: 300, height: 400),
      );
      expect(geometry.columns.length, 1);
      expect(render.childCount, 6);

      // Live layout places all six in one column (6 rows).
      final first = tester.getTopLeft(find.byKey(const Key('g0')));
      final second = tester.getTopLeft(find.byKey(const Key('g1')));
      expect(second.dx, first.dx);
      expect(second.dy, greaterThan(first.dy));
    });
  });

  group('intrinsic / unbounded diagnostics', () {
    testWidgets('fixed auto rows shrink-wrap inside a Column', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisSize: .min,
              children: [
                GridBox(
                  style: const GridBoxStyler(
                    columns: [GridTrack.fixed(100)],
                    autoRows: GridTrack.fixed(40),
                    rowGap: 8,
                  ),
                  children: const [
                    SizedBox(key: Key('column-0')),
                    SizedBox(key: Key('column-1')),
                    SizedBox(key: Key('column-2')),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      expect(tester.takeException(), isNull);
      final render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
      expect(render.size, const Size(100, 136));
      expect(
        tester.getTopLeft(find.byKey(const Key('column-2'))).dy,
        tester.getTopLeft(find.byKey(const Key('column-0'))).dy + 96,
      );
    });

    testWidgets('fixed auto rows shrink-wrap inside a vertical scroll view', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,
              height: 100,
              child: SingleChildScrollView(
                child: GridBox(
                  style: const GridBoxStyler(
                    columns: [GridTrack.fixed(100)],
                    autoRows: GridTrack.fixed(40),
                    rowGap: 8,
                  ),
                  children: const [
                    SizedBox(key: Key('scroll-0')),
                    SizedBox(key: Key('scroll-1')),
                    SizedBox(key: Key('scroll-2')),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      expect(tester.takeException(), isNull);
      final render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
      expect(render.size, const Size(100, 136));
    });

    testWidgets('fixed-row Grid under IntrinsicHeight succeeds', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: IntrinsicHeight(
              child: MixGrid(
                spec: GridBoxSpec(
                  columns: [GridTrack.fixed(50), GridTrack.fixed(50)],
                  rows: [GridTrack.fixed(40)],
                  columnGap: 4,
                ),
                children: const [
                  SizedBox(key: Key('a')),
                  SizedBox(key: Key('b')),
                ],
              ),
            ),
          ),
        ),
      );

      expect(tester.takeException(), isNull);
      final render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
      expect(render.size.height, 40);
    });

    testWidgets(
      'fractional tracks on unbounded intrinsic axis produce Grid diagnostic',
      (tester) async {
        final captured = <String>[];
        final oldOnError = FlutterError.onError;
        FlutterError.onError = (details) {
          captured.add(details.exceptionAsString());
          // Swallow so the test harness does not aggregate secondary failures.
        };

        try {
          await tester.pumpWidget(
            MaterialApp(
              home: Center(
                child: IntrinsicHeight(
                  child: MixGrid(
                    spec: GridBoxSpec(
                      columns: [GridTrack.fixed(50)],
                      rows: [GridTrack.fr(1)],
                    ),
                    children: const [SizedBox(key: Key('a'))],
                  ),
                ),
              ),
            ),
          );
        } finally {
          FlutterError.onError = oldOnError;
        }
        // Drain any residual exception stored by the binding.
        tester.takeException();

        final messages = captured.join('\n');
        expect(messages, isNotEmpty);
        // Expect a Grid fractional diagnostic — not LayoutBuilder cascade.
        expect(messages, contains('fractional'));
        expect(messages, contains('bounded height'));
        expect(messages, isNot(contains('LayoutBuilder')));
        expect(messages, isNot(contains('_RenderLayoutBuilder')));
      },
    );
  });
}

class _LayoutCallCounter extends SingleChildRenderObjectWidget {
  const _LayoutCallCounter({super.key});

  @override
  _RenderLayoutCallCounter createRenderObject(BuildContext context) {
    return _RenderLayoutCallCounter();
  }
}

class _RenderLayoutCallCounter extends RenderProxyBox {
  int layoutCount = 0;

  @override
  void layout(Constraints constraints, {bool parentUsesSize = false}) {
    layoutCount++;
    super.layout(constraints, parentUsesSize: parentUsesSize);
  }
}
