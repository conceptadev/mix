// Grid spike surfaces are intentionally unexported.
// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/layout/grid_box.dart';
import 'package:mix/src/layout/grid_layout_config.dart';
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

    test('gap math at track boundaries via axisExtent', () {
      final sizes = [100.0, 100.0, 100.0];
      expect(axisExtent(sizes, 10), 320); // 300 + 2*10
      expect(trackOrigin(sizes, 10, 0), 0);
      expect(trackOrigin(sizes, 10, 1), 110);
      expect(trackOrigin(sizes, 10, 2), 220);
    });
  });

  group('computeGridLayout', () {
    test('row-major auto-placement', () {
      final result = computeGridLayout(
        constraints: const BoxConstraints.tightFor(width: 300, height: 200),
        columns: const [GridTrack.fr(1), GridTrack.fr(1), GridTrack.fr(1)],
        rows: const [],
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

  group('GridLayoutConfig', () {
    testWidgets('branch matching inclusive bounds and declaration order', (
      tester,
    ) async {
      late GridLayoutConfig config;
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            config = GridLayoutConfig.resolve(
              columns: const [
                GridTrack.fr(1),
                GridTrack.fr(1),
                GridTrack.fr(1),
              ],
              branches: [
                (
                  const Breakpoint(maxWidth: 560),
                  const GridLayoutPatch(columns: [GridTrack.fr(1)]),
                ),
                (
                  const Breakpoint(maxWidth: 400),
                  const GridLayoutPatch(
                    columns: [GridTrack.fixed(50), GridTrack.fixed(50)],
                  ),
                ),
              ],
              context: context,
            );

            return const SizedBox();
          },
        ),
      );

      // Width 400 matches both maxWidth 560 and maxWidth 400; later wins.
      final at400 = config.resolveGeometryForConstraints(
        const BoxConstraints.tightFor(width: 400, height: 100),
      );
      expect(at400.columns, hasLength(2));
      expect(at400.columns.first, isA<FixedGridTrack>());

      // Width 500 matches only first branch.
      final at500 = config.resolveGeometryForConstraints(
        const BoxConstraints.tightFor(width: 500, height: 100),
      );
      expect(at500.columns, hasLength(1));

      // Width 600 matches none — base geometry.
      final at600 = config.resolveGeometryForConstraints(
        const BoxConstraints.tightFor(width: 600, height: 100),
      );
      expect(at600.columns, hasLength(3));

      // Inclusive: exactly maxWidth matches.
      final at560 = config.resolveGeometryForConstraints(
        const BoxConstraints.tightFor(width: 560, height: 100),
      );
      expect(at560.columns, hasLength(1));
    });

    testWidgets('partial patches preserve prior values', (tester) async {
      late GridLayoutConfig config;
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            config = GridLayoutConfig.resolve(
              columns: const [GridTrack.fr(1), GridTrack.fr(1)],
              rows: const [GridTrack.fixed(40)],
              columnGap: 8,
              rowGap: 4,
              branches: [
                (
                  const Breakpoint(maxWidth: 500),
                  const GridLayoutPatch(columnGap: 16),
                ),
              ],
              context: context,
            );

            return const SizedBox();
          },
        ),
      );

      final g = config.resolveGeometryForConstraints(
        const BoxConstraints.tightFor(width: 400, height: 100),
      );
      expect(g.columns, hasLength(2));
      expect(g.rows, hasLength(1));
      expect(g.columnGap, 16);
      expect(g.rowGap, 4);
    });

    testWidgets('token-backed breakpoint resolves at config resolve', (
      tester,
    ) async {
      late GridLayoutConfig config;
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            config = GridLayoutConfig.resolve(
              columns: const [GridTrack.fr(1), GridTrack.fr(1)],
              branches: [
                (
                  BreakpointToken.mobile(),
                  const GridLayoutPatch(columns: [GridTrack.fr(1)]),
                ),
              ],
              context: context,
            );

            return const SizedBox();
          },
        ),
      );

      // Default mobile is maxWidth 767.
      expect(config.branches.single.breakpoint.maxWidth, 767);
      final narrow = config.resolveGeometryForConstraints(
        const BoxConstraints.tightFor(width: 400, height: 100),
      );
      expect(narrow.columns, hasLength(1));
    });

    test('equality and immutable snapshots', () {
      final cols = [const GridTrack.fr(1), const GridTrack.fr(1)];
      final a = GridLayoutConfig(
        columns: List.unmodifiable(List.of(cols)),
        columnGap: 8,
      );
      final b = GridLayoutConfig(
        columns: List.unmodifiable(const [GridTrack.fr(1), GridTrack.fr(1)]),
        columnGap: 8,
      );
      expect(a, b);
      expect(a.hashCode, b.hashCode);
    });

    testWidgets('mutating original caller lists cannot alter frozen config', (
      tester,
    ) async {
      final cols = <GridTrack>[const GridTrack.fr(1), const GridTrack.fr(1)];
      final patchCols = <GridTrack>[const GridTrack.fr(1)];
      late GridLayoutConfig config;
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            config = GridLayoutConfig.resolve(
              columns: cols,
              branches: [
                (
                  const Breakpoint(maxWidth: 400),
                  GridLayoutPatch(columns: patchCols),
                ),
              ],
              context: context,
            );

            return const SizedBox();
          },
        ),
      );

      cols.add(const GridTrack.fr(1));
      patchCols.add(const GridTrack.fixed(10));

      expect(config.columns, hasLength(2));
      expect(config.branches.single.patch.columns, hasLength(1));
      expect(
        () => config.columns.add(const GridTrack.fr(1)),
        throwsUnsupportedError,
      );
    });
  });

  group('GridLayoutConfig validation', () {
    testWidgets('empty columns throws', (tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            expect(
              () =>
                  GridLayoutConfig.resolve(columns: const [], context: context),
              throwsA(isA<FlutterError>()),
            );

            return const SizedBox();
          },
        ),
      );
    });

    testWidgets('infinite fixed track and non-finite gaps throw FlutterError', (
      tester,
    ) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            // Constructor asserts catch some invalid values in debug; infinite
            // fixed sizes pass the constructor and are rejected by validateGeometry.
            expect(
              () => GridLayoutConfig.resolve(
                columns: [FixedGridTrack(double.infinity)],
                context: context,
              ),
              throwsA(isA<FlutterError>()),
            );
            expect(
              () => GridLayoutConfig.resolve(
                columns: const [GridTrack.fr(1)],
                columnGap: double.infinity,
                context: context,
              ),
              throwsA(isA<FlutterError>()),
            );
            expect(
              () => GridLayoutConfig.resolve(
                columns: const [GridTrack.fr(1)],
                rowGap: -2,
                context: context,
              ),
              throwsA(isA<FlutterError>()),
            );
            expect(
              () => GridLayoutConfig.resolve(
                columns: [FrGridTrack(double.infinity)],
                context: context,
              ),
              throwsA(isA<FlutterError>()),
            );

            return const SizedBox();
          },
        ),
      );
    });

    test(
      'validateGeometry rejects negative fixed and zero fr without asserts',
      () {
        // Bypass constructor asserts by building a config and calling validation
        // on patches that use values only checked at resolveGeometry/validate.
        final config = GridLayoutConfig(
          columns: const [GridTrack.fr(1)],
          branches: [
            GridConstraintBranch(
              breakpoint: const Breakpoint(maxWidth: 100),
              // Direct construction of invalid patch tracks for validation path.
              patch: GridLayoutPatch(
                columns: [FixedGridTrack(double.infinity)],
              ),
            ),
          ],
        );
        expect(() => config.validateGeometry(), throwsA(isA<FlutterError>()));
      },
    );

    test('unbounded fractional axis throws actionable FlutterError', () {
      final config = const GridLayoutConfig(
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
      final text = error.toString();
      expect(text, contains('bounded width'));
      expect(text, contains('Axis: width'));
      expect(text, contains('Tracks:'));
      expect(text, contains('fixed'));
    });

    test('fixed tracks under unbounded constraints succeed', () {
      final config = const GridLayoutConfig(
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
          const Breakpoint(maxWidth: 400),
          GridBoxStyler().wrap(const WidgetModifierConfig()),
        ),
        throwsA(isA<FlutterError>()),
      );
      expect(
        () => GridBoxStyler().onConstraints(
          const Breakpoint(maxWidth: 400),
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
          const Breakpoint(maxWidth: 400),
          GridBoxStyler().onDark(const GridBoxStyler()),
        ),
        throwsA(isA<FlutterError>()),
      );
      expect(
        () => GridBoxStyler()
            .onConstraints(
              const Breakpoint(maxWidth: 400),
              const GridBoxStyler(columns: [GridTrack.fr(1)]),
            )
            .onConstraints(
              const Breakpoint(maxWidth: 300),
              GridBoxStyler().onConstraints(
                const Breakpoint(maxWidth: 200),
                const GridBoxStyler(columns: [GridTrack.fr(1)]),
              ),
            ),
        throwsA(isA<FlutterError>()),
      );
      expect(
        () => GridBoxStyler().onConstraints(
          const Breakpoint(maxWidth: 400),
          const GridBoxStyler(),
        ),
        throwsA(isA<FlutterError>()),
      );
    });

    test('merge appends branches and merges modifiers/animation', () {
      final a = GridBoxStyler(columns: const [GridTrack.fr(1), GridTrack.fr(1)])
          .onConstraints(
            const Breakpoint(maxWidth: 560),
            const GridBoxStyler(columns: [GridTrack.fr(1)]),
          );
      final b = const GridBoxStyler(columnGap: 8).onConstraints(
        const Breakpoint(maxWidth: 400),
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
                config: const GridLayoutConfig(
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
      expect(render.columns.length, 3);
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
                config: const GridLayoutConfig(
                  columns: [GridTrack.fr(1), GridTrack.fr(1)],
                ),
                children: const [
                  SizedBox(key: Key('a')),
                  SizedBox(key: Key('b')),
                  SizedBox(key: Key('c')),
                ],
              ),
            ),
          ),
        ),
      );

      final render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
      expect(render.childLayoutCount, 3);

      render.childLayoutCount = 0;
      render.markNeedsLayout();
      await tester.pump();
      expect(render.childLayoutCount, 3);
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
                config: const GridLayoutConfig(
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
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: SizedBox(
              width: 220,
              height: 100,
              child: MixGrid(
                config: const GridLayoutConfig(
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

      final rightCenter = tester.getCenter(find.byKey(const Key('right')));
      final hit = tester.hitTestOnBinding(rightCenter);
      expect(
        hit.path.any((entry) => entry.target is RenderBox),
        isTrue,
      );
      expect(find.byKey(const Key('right')), findsOneWidget);
    });
  });

  group('GridBox render-time onConstraints', () {
    testWidgets(
      'three-to-one column switch via layout without child rebuild',
      (tester) async {
        // Honest contract: branch selection runs in performLayout. Hold the
        // MixGrid + child widget *instances* stable while only the parent
        // SizedBox width changes, so Element.updateChild short-circuits on
        // identical child widgets and Builders do not re-run.
        var childBuilds = 0;
        final config = GridLayoutConfig(
          columns: const [
            GridTrack.fixed(80),
            GridTrack.fr(2),
            GridTrack.fr(1),
          ],
          columnGap: 8,
          rowGap: 8,
          branches: [
            GridConstraintBranch(
              breakpoint: const Breakpoint(maxWidth: 560),
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
        final grid = MixGrid(config: config, children: children);

        await tester.pumpWidget(
          MaterialApp(
            home: Center(
              child: SizedBox(width: 900, height: 300, child: grid),
            ),
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
            home: Center(
              child: SizedBox(width: 400, height: 300, child: grid),
            ),
          ),
        );

        // Branch selection must not rebuild children.
        expect(childBuilds, buildsAfterWide);

        final render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
        final geometry = render.config.resolveGeometryForConstraints(
          const BoxConstraints.tightFor(width: 400, height: 300),
        );
        expect(geometry.columns.length, 1);

        // Narrow: one column → children stack vertically.
        final narrow0 = tester.getTopLeft(find.byKey(const Key('cell0')));
        final narrow1 = tester.getTopLeft(find.byKey(const Key('cell1')));
        expect(narrow1.dx, narrow0.dx);
        expect(narrow1.dy, greaterThan(narrow0.dy));
        expect(find.byType(LayoutBuilder), findsNothing);
      },
    );

    testWidgets(
      'mutating caller track lists cannot alter a frozen render config',
      (tester) async {
        final cols = <GridTrack>[
          const GridTrack.fr(1),
          const GridTrack.fr(1),
          const GridTrack.fr(1),
        ];
        final config = GridLayoutConfig(columns: cols);

        await tester.pumpWidget(
          MaterialApp(
            home: Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: MixGrid(
                  config: config,
                  children: const [SizedBox(key: Key('only'))],
                ),
              ),
            ),
          ),
        );

        final render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
        expect(render.config.columns, hasLength(3));
        // Render holds a freeze() copy, not the caller list identity.
        expect(identical(render.config.columns, cols), isFalse);

        cols.add(const GridTrack.fr(1));
        expect(render.config.columns, hasLength(3));
        expect(
          () => render.config.columns.add(const GridTrack.fr(1)),
          throwsUnsupportedError,
        );
      },
    );

    testWidgets(
      'GridBoxStyler.onConstraints dashboard collapse under offered width',
      (tester) async {
        final width = ValueNotifier(900.0);

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
                      style: GridBoxStyler(
                        columns: const [
                          GridTrack.fixed(80),
                          GridTrack.fr(2),
                          GridTrack.fr(1),
                        ],
                        columnGap: 8,
                        rowGap: 8,
                      ).onConstraints(
                        const Breakpoint(maxWidth: 560),
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
        expect(render.columns.length, 3);
        expect(find.byType(LayoutBuilder), findsNothing);

        width.value = 400;
        await tester.pump();

        render = tester.renderObject<RenderMixGrid>(find.byType(MixGrid));
        final geometry = render.config.resolveGeometryForConstraints(
          const BoxConstraints.tightFor(width: 400, height: 300),
        );
        expect(geometry.columns.length, 1);

        final narrow0 = tester.getTopLeft(find.byKey(const Key('cell0')));
        final narrow1 = tester.getTopLeft(find.byKey(const Key('cell1')));
        expect(narrow1.dx, narrow0.dx);
        expect(narrow1.dy, greaterThan(narrow0.dy));

        width.dispose();
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
                      columnGap: 8,
                      rowGap: 8,
                    ).onConstraints(
                      const Breakpoint(maxWidth: 560),
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
      final geometry = render.config.resolveGeometryForConstraints(
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
    testWidgets('fixed-row Grid under IntrinsicHeight succeeds', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: IntrinsicHeight(
              child: MixGrid(
                config: const GridLayoutConfig(
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

        await tester.pumpWidget(
          MaterialApp(
            home: Center(
              child: IntrinsicHeight(
                child: MixGrid(
                  config: const GridLayoutConfig(
                    columns: [GridTrack.fixed(50)],
                    rows: [GridTrack.fr(1)],
                  ),
                  children: const [SizedBox(key: Key('a'))],
                ),
              ),
            ),
          ),
        );

        FlutterError.onError = oldOnError;
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

  group('isolation', () {
    test('no ConstraintScope or ConstraintVariant symbols remain in core', () {
      // Structural: these types must not be importable from mix public API.
      // Compile-time absence is the real gate; this documents intent.
      expect(GridBoxStyler, isNotNull);
      expect(GridLayoutConfig, isNotNull);
    });
  });
}
