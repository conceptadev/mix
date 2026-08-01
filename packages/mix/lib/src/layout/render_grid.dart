import 'package:flutter/foundation.dart' show precisionErrorTolerance;
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'grid_box_spec.dart';
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
  /// The constrained size reported to the parent.
  final Size size;

  /// Full track-and-gap extent before parent constraints are applied.
  final Size contentSize;
  final List<double> columnSizes;
  final List<double> rowSizes;
  final List<GridCellGeometry> cells;

  const GridLayoutResult({
    required this.size,
    required this.contentSize,
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
/// When children exceed the explicit row capacity, [autoRows] provides the
/// repeated track used for every additional row.
GridLayoutResult computeGridLayout({
  required BoxConstraints constraints,
  required List<GridTrack> columns,
  required List<GridTrack> rows,
  GridTrack? autoRows,
  required double columnGap,
  required double rowGap,
  required int childCount,
}) {
  assert(columns.isNotEmpty, 'Grid requires at least one column track.');

  final colCount = columns.length;
  final effectiveRows = _resolveEffectiveRows(
    constraints: constraints,
    columnCount: colCount,
    rows: rows,
    autoRows: autoRows,
    childCount: childCount,
  );

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
    contentSize: Size(intrinsicWidth, intrinsicHeight),
    columnSizes: columnSizes,
    rowSizes: rowSizes,
    cells: cells,
  );
}

List<GridTrack> _resolveEffectiveRows({
  required BoxConstraints constraints,
  required int columnCount,
  required List<GridTrack> rows,
  required GridTrack? autoRows,
  required int childCount,
}) {
  final requiredRowCount = childCount == 0
      ? 0
      : ((childCount + columnCount - 1) ~/ columnCount);
  final missingRowCount = requiredRowCount - rows.length;
  if (missingRowCount > 0 && autoRows == null) {
    throw FlutterError.fromParts([
      ErrorSummary('Grid auto-placement requires an autoRows track.'),
      ErrorDescription(
        '$childCount children across $columnCount columns require '
        '$requiredRowCount rows, but only ${rows.length} explicit rows were '
        'provided.',
      ),
      ErrorHint(
        'Provide enough explicit rows or set autoRows to the GridTrack used '
        'for each additional row.',
      ),
    ]);
  }
  if (missingRowCount > 0 &&
      autoRows is FrGridTrack &&
      !constraints.hasBoundedHeight) {
    throw FlutterError.fromParts([
      ErrorSummary(
        'Grid autoRows requires a bounded height for fractional tracks.',
      ),
      ErrorDescription(
        'The grid needs $missingRowCount additional rows under $constraints, '
        'but autoRows is $autoRows.',
      ),
      ErrorHint(
        'Use GridTrack.fixed for autoRows or place the grid under a bounded '
        'height.',
      ),
    ]);
  }

  final effectiveRows = <GridTrack>[
    ...rows,
    if (missingRowCount > 0) ...List.filled(missingRowCount, autoRows!),
  ];

  return effectiveRows;
}

/// Multi-child render object for the GridBox spike.
///
/// Supports fixed + fr tracks, row/column gaps, row-major auto-placement, and
/// render-time constraint branch selection via [GridBoxSpec]. Fixed-track
/// overflow is diagnosed on both axes and optionally clipped by the spec.
/// Excludes spans, named areas, content-sized tracks, RTL, and baseline.
class RenderMixGrid extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, MultiChildLayoutParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, MultiChildLayoutParentData>,
        DebugOverflowIndicatorMixin {
  /// Layout pass counter for tests (reset externally).
  int childLayoutCount = 0;

  GridBoxSpec _spec;
  Size _contentSize = .zero;
  final LayerHandle<ClipRectLayer> _clipRectLayer =
      LayerHandle<ClipRectLayer>();

  RenderMixGrid({List<RenderBox>? children, required GridBoxSpec spec})
    : _spec = spec {
    addAll(children);
  }

  GridLayoutResult _compute(BoxConstraints constraints) {
    final geometry = _resolveGeometry(constraints);

    return computeGridLayout(
      constraints: constraints,
      columns: geometry.columns,
      rows: geometry.rows,
      autoRows: geometry.autoRows,
      columnGap: geometry.columnGap,
      rowGap: geometry.rowGap,
      childCount: childCount,
    );
  }

  /// Shared branch selection for live, dry, and intrinsic layout.
  GridResolvedGeometry _resolveGeometry(BoxConstraints constraints) {
    return _spec.resolveGeometryForConstraints(constraints);
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
    final effectiveTracks = axis == .horizontal
        ? geometry.columns
        : _resolveEffectiveRows(
            constraints: constraints,
            columnCount: geometry.columns.length,
            rows: geometry.rows,
            autoRows: geometry.autoRows,
            childCount: childCount,
          );

    if (effectiveTracks.any((t) => t is FrGridTrack)) {
      rejectFractionalGridTracksOnUnboundedAxis(
        tracks: effectiveTracks,
        axis: axis,
        constraints: constraints,
      );
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

  bool get _hasVisualOverflow =>
      _contentSize.width - size.width > precisionErrorTolerance ||
      _contentSize.height - size.height > precisionErrorTolerance;

  GridBoxSpec get spec => _spec;

  /// Convenience accessors for tests (resolved base, not branch-selected).
  List<GridTrack> get columns => _spec.columns;
  List<GridTrack> get rows => _spec.rows;
  GridTrack? get autoRows => _spec.autoRows;
  double get columnGap => _spec.columnGap;
  double get rowGap => _spec.rowGap;
  Clip get clipBehavior => _spec.clipBehavior;

  /// Single equality-checked immutable spec setter.
  ///
  /// Constraint changes mark needsLayout only — no widget rebuild.
  set spec(GridBoxSpec value) {
    if (_spec == value) return;
    _spec = value;
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
    _contentSize = result.contentSize;

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
    if (clipBehavior != .none && _hasVisualOverflow) {
      _clipRectLayer.layer = context.pushClipRect(
        needsCompositing,
        offset,
        Offset.zero & size,
        defaultPaint,
        clipBehavior: clipBehavior,
        oldLayer: _clipRectLayer.layer,
      );
    } else {
      _clipRectLayer.layer = null;
      defaultPaint(context, offset);
    }

    assert(() {
      if (!_hasVisualOverflow || size.isEmpty) return true;
      final overflowSize = Size(
        _contentSize.width > size.width ? _contentSize.width : size.width,
        _contentSize.height > size.height ? _contentSize.height : size.height,
      );
      paintOverflowIndicator(
        context,
        offset,
        Offset.zero & size,
        Offset.zero & overflowSize,
        overflowHints: [
          ErrorDescription(
            'The Grid tracks and gaps require $_contentSize, but the parent '
            'constrained $runtimeType to $size.',
          ),
          ErrorHint(
            'Fixed GridTrack sizes intentionally do not shrink. Reduce fixed '
            'tracks or gaps, replace suitable tracks with GridTrack.fr on a '
            'bounded axis, or give the GridBox more space.',
          ),
          ErrorHint(
            'If the larger content is intentional, put GridBox in a scrollable '
            'or set clipBehavior to Clip.hardEdge (or another non-none Clip). '
            'Clip.none deliberately leaves overflow visible.',
          ),
          ErrorHint(
            'Content-sized tracks and implicit content-sized rows are not '
            'supported by this internal Grid slice.',
          ),
        ],
      );

      return true;
    }());
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  Rect? describeApproximatePaintClip(RenderObject child) {
    if (clipBehavior == .none || !_hasVisualOverflow) return null;

    return Offset.zero & size;
  }

  @override
  void dispose() {
    _clipRectLayer.layer = null;
    super.dispose();
  }
}

/// Widget host for [RenderMixGrid].
///
/// Spike prototype — not exported from `mix.dart`.
class MixGrid extends MultiChildRenderObjectWidget {
  const MixGrid({super.key, required this.spec, super.children});

  final GridBoxSpec spec;

  @override
  RenderMixGrid createRenderObject(BuildContext context) {
    return RenderMixGrid(spec: spec);
  }

  @override
  void updateRenderObject(BuildContext context, RenderMixGrid renderObject) {
    renderObject.spec = spec;
  }
}
