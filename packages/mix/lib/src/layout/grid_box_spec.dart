import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../core/spec.dart';
import 'grid_track.dart';

/// Partial geometry override for a constraint-matched branch.
///
/// Null fields preserve the prior value when the branch is applied.
@immutable
final class GridLayoutPatch {
  final List<GridTrack>? columns;
  final List<GridTrack>? rows;
  final GridTrack? autoRows;
  final double? columnGap;
  final double? rowGap;

  const GridLayoutPatch({
    this.columns,
    this.rows,
    this.autoRows,
    this.columnGap,
    this.rowGap,
  });

  /// Whether this patch changes any geometry field.
  bool get isEmpty =>
      columns == null &&
      rows == null &&
      autoRows == null &&
      columnGap == null &&
      rowGap == null;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is GridLayoutPatch &&
            listEquals(columns, other.columns) &&
            listEquals(rows, other.rows) &&
            autoRows == other.autoRows &&
            columnGap == other.columnGap &&
            rowGap == other.rowGap;
  }

  @override
  String toString() {
    final cols = columns;
    final rws = rows;

    return 'GridLayoutPatch('
        'columns: ${cols == null ? 'null' : _tracksToString(cols)}, '
        'rows: ${rws == null ? 'null' : _tracksToString(rws)}, '
        'autoRows: ${autoRows ?? 'null'}, '
        'columnGap: ${columnGap ?? 'null'}, '
        'rowGap: ${rowGap ?? 'null'})';
  }

  @override
  int get hashCode => Object.hash(
    Object.hashAll(columns ?? const []),
    Object.hashAll(rows ?? const []),
    autoRows,
    columnGap,
    rowGap,
  );
}

/// A Grid-local query over the constraints offered by the parent layout.
///
/// This deliberately supports only a bounded maximum width. It is distinct
/// from viewport `Breakpoint` semantics and cannot accidentally interpret an
/// unbounded axis as an infinite concrete size.
@immutable
final class GridConstraintQuery {
  final double maxWidth;

  const GridConstraintQuery._(this.maxWidth);

  /// Matches when the offered maximum width is finite and at most [maxWidth].
  factory GridConstraintQuery.widthAtMost(double maxWidth) {
    if (!maxWidth.isFinite || maxWidth < 0) {
      throw FlutterError.fromParts([
        ErrorSummary('Invalid GridConstraintQuery width threshold.'),
        ErrorDescription(
          'widthAtMost requires a finite, non-negative width; got $maxWidth.',
        ),
      ]);
    }

    return GridConstraintQuery._(maxWidth);
  }

  bool matches(BoxConstraints constraints) {
    return constraints.hasBoundedWidth && constraints.maxWidth <= maxWidth;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is GridConstraintQuery && maxWidth == other.maxWidth;
  }

  @override
  String toString() => 'GridConstraintQuery.widthAtMost($maxWidth)';

  @override
  int get hashCode => maxWidth.hashCode;
}

/// One constraint branch: [query] to [patch].
///
/// Branches are applied in declaration order at layout time.
@immutable
final class GridConstraintBranch {
  final GridConstraintQuery query;
  final GridLayoutPatch patch;

  const GridConstraintBranch({required this.query, required this.patch});

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is GridConstraintBranch &&
            query == other.query &&
            patch == other.patch;
  }

  @override
  String toString() => 'GridConstraintBranch(query: $query, patch: $patch)';

  @override
  int get hashCode => Object.hash(query, patch);
}

/// Immutable, validated geometry resolved from [GridBoxStyler].
///
/// This is the sole complete Grid geometry carrier. Branch selection happens
/// during live and dry layout, not while building the widget tree.
@immutable
final class GridBoxSpec extends Spec<GridBoxSpec> with Diagnosticable {
  final List<GridTrack> columns;
  final List<GridTrack> rows;
  final GridTrack? autoRows;
  final double columnGap;
  final double rowGap;
  final Clip clipBehavior;
  final List<GridConstraintBranch> branches;

  const GridBoxSpec._({
    required this.columns,
    required this.rows,
    required this.autoRows,
    required this.columnGap,
    required this.rowGap,
    required this.clipBehavior,
    required this.branches,
  });

  /// Creates a validated spec and snapshots every caller-owned collection.
  factory GridBoxSpec({
    List<GridTrack> columns = const [GridTrack.fr(1)],
    List<GridTrack> rows = const [],
    GridTrack? autoRows,
    double columnGap = 0,
    double rowGap = 0,
    Clip clipBehavior = .none,
    List<GridConstraintBranch> branches = const [],
  }) {
    final spec = GridBoxSpec._(
      columns: List<GridTrack>.unmodifiable(columns),
      rows: List<GridTrack>.unmodifiable(rows),
      autoRows: autoRows,
      columnGap: columnGap,
      rowGap: rowGap,
      clipBehavior: clipBehavior,
      branches: List<GridConstraintBranch>.unmodifiable([
        for (final branch in branches)
          GridConstraintBranch(
            query: branch.query,
            patch: _snapshotPatch(branch.patch),
          ),
      ]),
    );
    _validateGridSpecGeometry(spec);

    return spec;
  }

  /// Applies matching branches in declaration order for [constraints].
  GridResolvedGeometry resolveGeometryForConstraints(
    BoxConstraints constraints,
  ) {
    var resolvedColumns = columns;
    var resolvedRows = rows;
    var resolvedAutoRows = autoRows;
    var resolvedColumnGap = columnGap;
    var resolvedRowGap = rowGap;

    for (final branch in branches) {
      if (!branch.query.matches(constraints)) continue;
      final patch = branch.patch;
      final patchColumns = patch.columns;
      final patchRows = patch.rows;
      final patchAutoRows = patch.autoRows;
      final patchColumnGap = patch.columnGap;
      final patchRowGap = patch.rowGap;
      if (patchColumns != null) resolvedColumns = patchColumns;
      if (patchRows != null) resolvedRows = patchRows;
      if (patchAutoRows != null) resolvedAutoRows = patchAutoRows;
      if (patchColumnGap != null) resolvedColumnGap = patchColumnGap;
      if (patchRowGap != null) resolvedRowGap = patchRowGap;
    }

    rejectFractionalGridTracksOnUnboundedAxis(
      tracks: resolvedColumns,
      axis: .horizontal,
      constraints: constraints,
    );
    rejectFractionalGridTracksOnUnboundedAxis(
      tracks: resolvedRows,
      axis: .vertical,
      constraints: constraints,
    );

    return GridResolvedGeometry(
      columns: resolvedColumns,
      rows: resolvedRows,
      autoRows: resolvedAutoRows,
      columnGap: resolvedColumnGap,
      rowGap: resolvedRowGap,
    );
  }

  @override
  GridBoxSpec copyWith({
    List<GridTrack>? columns,
    List<GridTrack>? rows,
    GridTrack? autoRows,
    double? columnGap,
    double? rowGap,
    Clip? clipBehavior,
    List<GridConstraintBranch>? branches,
  }) {
    return GridBoxSpec(
      columns: columns ?? this.columns,
      rows: rows ?? this.rows,
      autoRows: autoRows ?? this.autoRows,
      columnGap: columnGap ?? this.columnGap,
      rowGap: rowGap ?? this.rowGap,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      branches: branches ?? this.branches,
    );
  }

  @override
  GridBoxSpec lerp(GridBoxSpec? other, double t) {
    if (other == null) return this;

    return t < 0.5 ? this : other;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty('columns', columns))
      ..add(IterableProperty('rows', rows))
      ..add(DiagnosticsProperty('autoRows', autoRows))
      ..add(DoubleProperty('columnGap', columnGap))
      ..add(DoubleProperty('rowGap', rowGap))
      ..add(
        EnumProperty<Clip>(
          'clipBehavior',
          clipBehavior,
          defaultValue: Clip.none,
        ),
      )
      ..add(IterableProperty('branches', branches));
  }

  @override
  List<Object?> get props => [
    columns,
    rows,
    autoRows,
    columnGap,
    rowGap,
    clipBehavior,
    branches,
  ];
}

/// Geometry after branch selection and before track sizing / placement.
@immutable
final class GridResolvedGeometry {
  final List<GridTrack> columns;
  final List<GridTrack> rows;
  final GridTrack? autoRows;
  final double columnGap;
  final double rowGap;

  const GridResolvedGeometry({
    required this.columns,
    required this.rows,
    required this.autoRows,
    required this.columnGap,
    required this.rowGap,
  });
}

void _validateGridSpecGeometry(GridBoxSpec spec) {
  final columns = spec.columns;
  if (columns.isEmpty) {
    throw FlutterError.fromParts([
      ErrorSummary('GridBoxSpec requires at least one column track.'),
      ErrorDescription('columns was empty.'),
      ErrorHint('Provide at least one fixed or fractional column track.'),
    ]);
  }

  _validateTracks(columns, axisLabel: 'columns');
  _validateTracks(spec.rows, axisLabel: 'rows');
  if (spec.autoRows case final track?) {
    _validateTracks([track], axisLabel: 'autoRows');
  }
  _validateGap(spec.columnGap, label: 'columnGap');
  _validateGap(spec.rowGap, label: 'rowGap');

  for (final branch in spec.branches) {
    final patch = branch.patch;
    final patchColumns = patch.columns;
    final patchRows = patch.rows;
    final patchAutoRows = patch.autoRows;
    final patchColumnGap = patch.columnGap;
    final patchRowGap = patch.rowGap;

    if (patchColumns != null) {
      if (patchColumns.isEmpty) {
        throw FlutterError.fromParts([
          ErrorSummary(
            'GridLayoutPatch.columns must contain at least one track.',
          ),
          ErrorDescription('A constraint branch supplied empty columns.'),
          ErrorHint(
            'Omit columns to preserve the prior value, or supply tracks.',
          ),
        ]);
      }
      _validateTracks(patchColumns, axisLabel: 'patch.columns');
    }
    if (patchRows != null) {
      _validateTracks(patchRows, axisLabel: 'patch.rows');
    }
    if (patchAutoRows != null) {
      _validateTracks([patchAutoRows], axisLabel: 'patch.autoRows');
    }
    if (patchColumnGap != null) {
      _validateGap(patchColumnGap, label: 'patch.columnGap');
    }
    if (patchRowGap != null) {
      _validateGap(patchRowGap, label: 'patch.rowGap');
    }
  }
}

GridLayoutPatch _snapshotPatch(GridLayoutPatch patch) {
  final columns = patch.columns;
  final rows = patch.rows;

  return GridLayoutPatch(
    columns: columns == null ? null : List<GridTrack>.unmodifiable(columns),
    rows: rows == null ? null : List<GridTrack>.unmodifiable(rows),
    autoRows: patch.autoRows,
    columnGap: patch.columnGap,
    rowGap: patch.rowGap,
  );
}

String _tracksToString(List<GridTrack> tracks) {
  return [
    for (final track in tracks)
      switch (track) {
        FixedGridTrack(:final size) => 'GridTrack.fixed($size)',
        FrGridTrack(:final fraction) => 'GridTrack.fr($fraction)',
      },
  ].join(', ');
}

void _validateTracks(List<GridTrack> tracks, {required String axisLabel}) {
  for (var i = 0; i < tracks.length; i++) {
    final track = tracks[i];
    switch (track) {
      case FixedGridTrack(:final size):
        if (!size.isFinite || size < 0) {
          throw FlutterError.fromParts([
            ErrorSummary('Invalid fixed grid track on $axisLabel[$i].'),
            ErrorDescription(
              'Fixed track size must be finite and non-negative; got $size.',
            ),
            ErrorHint('Use GridTrack.fixed with a finite size ≥ 0.'),
          ]);
        }
      case FrGridTrack(:final fraction):
        if (!fraction.isFinite || fraction <= 0) {
          throw FlutterError.fromParts([
            ErrorSummary('Invalid fractional grid track on $axisLabel[$i].'),
            ErrorDescription(
              'Fractional track must be finite and greater than zero; '
              'got $fraction.',
            ),
            ErrorHint('Use GridTrack.fr with a finite fraction > 0.'),
          ]);
        }
    }
  }
}

void _validateGap(double gap, {required String label}) {
  if (!gap.isFinite || gap < 0) {
    throw FlutterError.fromParts([
      ErrorSummary('Invalid grid gap ($label).'),
      ErrorDescription('Gaps must be finite and non-negative; got $gap.'),
      ErrorHint('Use a finite gap ≥ 0.'),
    ]);
  }
}

/// Rejects fractional tracks when their axis has no finite available extent.
void rejectFractionalGridTracksOnUnboundedAxis({
  required List<GridTrack> tracks,
  required Axis axis,
  required BoxConstraints constraints,
}) {
  if (!tracks.any((track) => track is FrGridTrack)) return;

  final bounded = axis == .horizontal
      ? constraints.hasBoundedWidth
      : constraints.hasBoundedHeight;
  if (bounded) return;

  final axisName = axis == .horizontal ? 'width' : 'height';
  throw FlutterError.fromParts([
    ErrorSummary('Grid fractional tracks require a bounded $axisName axis.'),
    ErrorDescription(
      'Axis: $axisName\n'
      'Constraints: $constraints\n'
      'Tracks: [${_tracksToString(tracks)}]',
    ),
    ErrorHint(
      'Valid fixes:\n'
      '• Replace fractional tracks with GridTrack.fixed on this axis.\n'
      '• Place the grid under a bounded constraint '
      '(SizedBox, Expanded in a bounded Flex, etc.).\n'
      '• Content-sized tracks are not yet supported in this spike.',
    ),
  ]);
}
