import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'grid_layout_config.dart';
import 'grid_track.dart';

/// Geometry for a laid-out grid cell (row-major auto-placement, no spans).
@immutable
class GridCellGeometry {
  final int column;
  final int row;
  final Offset offset;
  final Size size;

  const GridCellGeometry({
    required this.column,
    required this.row,
    required this.offset,
    required this.size,
  });
}

/// Shared layout result used by both [RenderMixGrid.performLayout] and
/// [RenderMixGrid.computeDryLayout].
@immutable
class GridLayoutResult {
  final Size size;
  final List<double> columnSizes;
  final List<double> rowSizes;
  final List<GridCellGeometry> cells;

  const GridLayoutResult({
    required this.size,
    required this.columnSizes,
    required this.rowSizes,
    required this.cells,
  });
}

/// Computes grid geometry without touching children.
///
/// Children are placed row-major into a matrix of [columns] × enough rows.
/// Track sizes use only fixed/fr rules and parent constraints — no content
/// measurement in this spike slice.
///
/// When [childCount] is 0 and [rows] is empty, no auto rows are produced.
/// Auto fractional rows are appended only when there are children and not
/// enough explicit rows (and only under a bounded height — enforced by
/// [GridLayoutConfig.resolveGeometryForConstraints] before this is called).
GridLayoutResult computeGridLayout({
  required BoxConstraints constraints,
  required List<GridTrack> columns,
  required List<GridTrack> rows,
  required double columnGap,
  required double rowGap,
  required int childCount,
}) {
  assert(columns.isNotEmpty, 'Grid requires at least one column track.');

  final colCount = columns.length;
  final autoRows = childCount == 0
      ? 0
      : ((childCount + colCount - 1) ~/ colCount);
  final List<GridTrack> effectiveRows;
  if (rows.isEmpty) {
    // No auto rows when there are no children.
    effectiveRows = autoRows == 0
        ? const []
        : List.filled(autoRows, const GridTrack.fr(1));
  } else {
    effectiveRows = [
      ...rows,
      // If more children than explicit rows, append 1fr rows.
      if (autoRows > rows.length)
        ...List.filled(autoRows - rows.length, const GridTrack.fr(1)),
    ];
  }

  // Resolve free space: prefer max constraint when finite; else min.
  final freeWidth = constraints.hasBoundedWidth
      ? constraints.maxWidth
      : constraints.minWidth;
  final freeHeight = constraints.hasBoundedHeight
      ? constraints.maxHeight
      : constraints.minHeight;

  final columnSizes = computeTrackSizes(
    tracks: columns,
    freeSpace: freeWidth,
    gap: columnGap,
  );
  final rowSizes = computeTrackSizes(
    tracks: effectiveRows,
    freeSpace: freeHeight,
    gap: rowGap,
  );

  final intrinsicWidth = axisExtent(columnSizes, columnGap);
  final intrinsicHeight = axisExtent(rowSizes, rowGap);
  final size = constraints.constrain(Size(intrinsicWidth, intrinsicHeight));

  final cells = <GridCellGeometry>[];
  for (var i = 0; i < childCount; i++) {
    final column = i % colCount;
    final row = i ~/ colCount;
    if (row >= rowSizes.length) break;
    cells.add(
      GridCellGeometry(
        column: column,
        row: row,
        offset: Offset(
          trackOrigin(columnSizes, columnGap, column),
          trackOrigin(rowSizes, rowGap, row),
        ),
        size: Size(columnSizes[column], rowSizes[row]),
      ),
    );
  }

  return GridLayoutResult(
    size: size,
    columnSizes: columnSizes,
    rowSizes: rowSizes,
    cells: cells,
  );
}

/// Multi-child render object for the GridBox spike.
///
/// Supports fixed + fr tracks, row/column gaps, row-major auto-placement, and
/// render-time constraint branch selection via [GridLayoutConfig].
/// Excludes spans, named areas, content-sized tracks, RTL, and baseline.
class RenderMixGrid extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, MultiChildLayoutParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, MultiChildLayoutParentData> {
  /// Layout pass counter for tests (reset externally).
  int childLayoutCount = 0;

  GridLayoutConfig _config;

  RenderMixGrid({List<RenderBox>? children, required GridLayoutConfig config})
    // Defensive freeze at the render boundary so caller-held track lists
    // cannot mutate live layout configuration after assignment.
    : _config = config.freeze() {
    addAll(children);
  }

  GridLayoutResult _compute(BoxConstraints constraints) {
    final geometry = _resolveGeometry(constraints);

    return computeGridLayout(
      constraints: constraints,
      columns: geometry.columns,
      rows: geometry.rows,
      columnGap: geometry.columnGap,
      rowGap: geometry.rowGap,
      childCount: childCount,
    );
  }

  /// Shared branch selection + auto-fr unbounded checks for live/dry/intrinsics.
  GridResolvedGeometry _resolveGeometry(BoxConstraints constraints) {
    final geometry = _config.resolveGeometryForConstraints(constraints);

    // Auto-appended fr rows also need the unbounded check.
    final colCount = geometry.columns.length;
    final autoRows = childCount == 0
        ? 0
        : ((childCount + colCount - 1) ~/ colCount);
    final needsAutoFrRows = geometry.rows.isEmpty
        ? autoRows > 0
        : autoRows > geometry.rows.length;
    if (needsAutoFrRows && !constraints.hasBoundedHeight) {
      // Synthetic auto rows are fractional — reject under unbounded height.
      final synthetic = geometry.rows.isEmpty
          ? List.filled(autoRows, const GridTrack.fr(1))
          : [
              ...geometry.rows,
              ...List.filled(
                autoRows - geometry.rows.length,
                const GridTrack.fr(1),
              ),
            ];
      // Re-run through the same diagnostic path used for explicit fr tracks.
      GridLayoutConfig(
        columns: geometry.columns,
        rows: synthetic,
        columnGap: geometry.columnGap,
        rowGap: geometry.rowGap,
      ).resolveGeometryForConstraints(constraints);
    }

    return geometry;
  }

  /// Intrinsic extent for fixed-only tracks after branch selection.
  ///
  /// Fractional tracks on the queried axis throw the same actionable
  /// [FlutterError] as unbounded layout (no LayoutBuilder cascade).
  double _computeIntrinsicExtent({
    required Axis axis,
    required double crossExtent,
  }) {
    final BoxConstraints constraints = .new(
      maxWidth: axis == .vertical && crossExtent.isFinite
          ? crossExtent
          : .infinity,
      maxHeight: axis == .horizontal && crossExtent.isFinite
          ? crossExtent
          : .infinity,
    );
    final geometry = _resolveGeometry(constraints);
    final tracks = axis == .horizontal ? geometry.columns : geometry.rows;

    // Auto rows under intrinsic height are fractional when rows are empty.
    final List<GridTrack> effectiveTracks;
    if (axis == .vertical && tracks.isEmpty && childCount > 0) {
      effectiveTracks = List.filled(
        (childCount + geometry.columns.length - 1) ~/ geometry.columns.length,
        const GridTrack.fr(1),
      );
    } else {
      effectiveTracks = tracks;
    }

    if (effectiveTracks.any((t) => t is FrGridTrack)) {
      // Force the shared diagnostic.
      GridLayoutConfig(
        columns: axis == .horizontal ? effectiveTracks : geometry.columns,
        rows: axis == .vertical ? effectiveTracks : geometry.rows,
        columnGap: geometry.columnGap,
        rowGap: geometry.rowGap,
      ).resolveGeometryForConstraints(constraints);
    }

    var sum = 0.0;
    for (final track in effectiveTracks) {
      switch (track) {
        case FixedGridTrack(:final size):
          sum += size;
        case FrGridTrack():
          break;
      }
    }
    if (effectiveTracks.length > 1) {
      final gap = axis == .horizontal ? geometry.columnGap : geometry.rowGap;
      sum += gap * (effectiveTracks.length - 1);
    }

    return sum;
  }

  GridLayoutConfig get config => _config;

  /// Convenience accessors for tests (resolved base, not branch-selected).
  List<GridTrack> get columns => _config.columns;
  List<GridTrack> get rows => _config.rows;
  double get columnGap => _config.columnGap;
  double get rowGap => _config.rowGap;

  /// Single equality-checked immutable configuration setter.
  ///
  /// Freezes [value] so tracks/branches entering the render object are
  /// unmodifiable. Constraint changes mark needsLayout only — no widget rebuild.
  set config(GridLayoutConfig value) {
    if (_config == value) return;
    _config = value.freeze();
    markNeedsLayout();
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! MultiChildLayoutParentData) {
      child.parentData = MultiChildLayoutParentData();
    }
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    return _computeIntrinsicExtent(axis: .horizontal, crossExtent: height);
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return _computeIntrinsicExtent(axis: .horizontal, crossExtent: height);
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    return _computeIntrinsicExtent(axis: .vertical, crossExtent: width);
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return _computeIntrinsicExtent(axis: .vertical, crossExtent: width);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return _compute(constraints).size;
  }

  @override
  void performLayout() {
    final result = _compute(constraints);
    size = result.size;

    var index = 0;
    var child = firstChild;
    while (child != null) {
      final parentData = child.parentData! as MultiChildLayoutParentData;
      if (index < result.cells.length) {
        final cell = result.cells[index];
        child.layout(BoxConstraints.tight(cell.size), parentUsesSize: false);
        childLayoutCount++;
        parentData.offset = cell.offset;
      } else {
        child.layout(BoxConstraints.tight(.zero), parentUsesSize: false);
        childLayoutCount++;
        parentData.offset = .zero;
      }
      child = parentData.nextSibling;
      index++;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}

/// Widget host for [RenderMixGrid].
///
/// Spike prototype — not exported from `mix.dart`.
class MixGrid extends MultiChildRenderObjectWidget {
  const MixGrid({super.key, required this.config, super.children});

  final GridLayoutConfig config;

  @override
  RenderMixGrid createRenderObject(BuildContext context) {
    return RenderMixGrid(config: config);
  }

  @override
  void updateRenderObject(BuildContext context, RenderMixGrid renderObject) {
    renderObject.config = config;
  }
}
