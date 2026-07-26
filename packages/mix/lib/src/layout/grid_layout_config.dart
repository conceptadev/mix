import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../core/breakpoint.dart';
import '../theme/tokens/token_refs.dart';
import 'grid_track.dart';

/// Partial geometry override for a constraint-matched branch.
///
/// Only columns, rows, and gaps may be patched. Null fields preserve the
/// prior value when the branch is applied.
@immutable
final class GridLayoutPatch {
  final List<GridTrack>? columns;
  final List<GridTrack>? rows;
  final double? columnGap;
  final double? rowGap;

  const GridLayoutPatch({this.columns, this.rows, this.columnGap, this.rowGap});

  /// Whether this patch changes any geometry field.
  bool get isEmpty =>
      columns == null && rows == null && columnGap == null && rowGap == null;

  /// Defensive unmodifiable snapshot of this patch.
  GridLayoutPatch freeze() {
    final cols = columns;
    final rws = rows;

    return GridLayoutPatch(
      columns: cols == null ? null : List.unmodifiable(cols),
      rows: rws == null ? null : List.unmodifiable(rws),
      columnGap: columnGap,
      rowGap: rowGap,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is GridLayoutPatch &&
            listEquals(columns, other.columns) &&
            listEquals(rows, other.rows) &&
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
        'columnGap: ${columnGap ?? 'null'}, '
        'rowGap: ${rowGap ?? 'null'})';
  }

  @override
  int get hashCode => Object.hash(
    Object.hashAll(columns ?? const []),
    Object.hashAll(rows ?? const []),
    columnGap,
    rowGap,
  );
}

/// One constraint branch: inclusive [breakpoint] bounds → [patch].
///
/// Breakpoints must already be concrete (token refs resolved at styler
/// resolve). Applied in declaration order at layout time.
@immutable
final class GridConstraintBranch {
  final Breakpoint breakpoint;
  final GridLayoutPatch patch;

  const GridConstraintBranch({required this.breakpoint, required this.patch});

  GridConstraintBranch freeze() {
    return GridConstraintBranch(breakpoint: breakpoint, patch: patch.freeze());
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is GridConstraintBranch &&
            breakpoint == other.breakpoint &&
            patch == other.patch;
  }

  @override
  String toString() =>
      'GridConstraintBranch(breakpoint: $breakpoint, patch: $patch)';

  @override
  int get hashCode => Object.hash(breakpoint, patch);
}

/// Frozen grid geometry configuration consumed by [RenderMixGrid].
///
/// Base tracks/gaps plus ordered constraint branches. Branch selection runs
/// only inside live/dry layout — never during widget build.
@immutable
final class GridLayoutConfig {
  final List<GridTrack> columns;
  final List<GridTrack> rows;
  final double columnGap;
  final double rowGap;
  final List<GridConstraintBranch> branches;

  const GridLayoutConfig({
    required this.columns,
    this.rows = const [],
    this.columnGap = 0,
    this.rowGap = 0,
    this.branches = const [],
  });

  /// Builds an immutable config, resolving token-backed breakpoints.
  ///
  /// [columns], [rows], and [branches] are defensively copied into
  /// unmodifiable collections. Geometry is validated in debug and release.
  factory GridLayoutConfig.resolve({
    required List<GridTrack> columns,
    List<GridTrack> rows = const [],
    double columnGap = 0,
    double rowGap = 0,
    List<(Breakpoint, GridLayoutPatch)> branches = const [],
    required BuildContext context,
  }) {
    final resolvedBranches = <GridConstraintBranch>[
      for (final (breakpoint, patch) in branches)
        GridConstraintBranch(
          breakpoint: _resolveBreakpoint(context, breakpoint),
          patch: patch.freeze(),
        ),
    ];

    final config = GridLayoutConfig(
      columns: List.unmodifiable(List.of(columns)),
      rows: List.unmodifiable(List.of(rows)),
      columnGap: columnGap,
      rowGap: rowGap,
      branches: List.unmodifiable(resolvedBranches),
    );
    config.validateGeometry();

    return config;
  }

  /// Defensive unmodifiable copy of an existing config.
  GridLayoutConfig freeze() {
    return GridLayoutConfig(
      columns: List.unmodifiable(List.of(columns)),
      rows: List.unmodifiable(List.of(rows)),
      columnGap: columnGap,
      rowGap: rowGap,
      branches: List.unmodifiable([
        for (final branch in branches) branch.freeze(),
      ]),
    );
  }

  /// Validates track/gap geometry (runs in debug and release).
  ///
  /// Does not check axis boundedness — that requires layout constraints and
  /// is enforced in [resolveGeometryForConstraints].
  void validateGeometry() {
    if (columns.isEmpty) {
      throw FlutterError.fromParts([
        ErrorSummary('GridLayoutConfig requires at least one column track.'),
        ErrorDescription('columns was empty.'),
        ErrorHint('Provide at least one fixed or fractional column track.'),
      ]);
    }

    _validateTracks(columns, axisLabel: 'columns');
    _validateTracks(rows, axisLabel: 'rows');
    _validateGap(columnGap, label: 'columnGap');
    _validateGap(rowGap, label: 'rowGap');

    for (final branch in branches) {
      final patch = branch.patch;
      final patchColumns = patch.columns;
      final patchRows = patch.rows;
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
      if (patchColumnGap != null) {
        _validateGap(patchColumnGap, label: 'patch.columnGap');
      }
      if (patchRowGap != null) {
        _validateGap(patchRowGap, label: 'patch.rowGap');
      }
    }
  }

  /// Applies matching branches in declaration order for [constraints].
  ///
  /// Bounds are inclusive via [Breakpoint.matches]. Missing patch fields keep
  /// the prior value. Unbounded maxima remain infinity on
  /// [BoxConstraints.biggest].
  GridResolvedGeometry resolveGeometryForConstraints(
    BoxConstraints constraints,
  ) {
    var resolvedColumns = columns;
    var resolvedRows = rows;
    var resolvedColumnGap = columnGap;
    var resolvedRowGap = rowGap;

    final offered = constraints.biggest;
    for (final branch in branches) {
      if (!branch.breakpoint.matches(offered)) continue;
      final patch = branch.patch;
      final patchColumns = patch.columns;
      final patchRows = patch.rows;
      final patchColumnGap = patch.columnGap;
      final patchRowGap = patch.rowGap;
      if (patchColumns != null) resolvedColumns = patchColumns;
      if (patchRows != null) resolvedRows = patchRows;
      if (patchColumnGap != null) resolvedColumnGap = patchColumnGap;
      if (patchRowGap != null) resolvedRowGap = patchRowGap;
    }

    // Validate axis boundedness against the post-branch tracks.
    _rejectFractionalOnUnboundedAxis(
      tracks: resolvedColumns,
      axis: .horizontal,
      constraints: constraints,
    );
    _rejectFractionalOnUnboundedAxis(
      tracks: resolvedRows,
      axis: .vertical,
      constraints: constraints,
    );

    return GridResolvedGeometry(
      columns: resolvedColumns,
      rows: resolvedRows,
      columnGap: resolvedColumnGap,
      rowGap: resolvedRowGap,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is GridLayoutConfig &&
            listEquals(columns, other.columns) &&
            listEquals(rows, other.rows) &&
            columnGap == other.columnGap &&
            rowGap == other.rowGap &&
            listEquals(branches, other.branches);
  }

  @override
  String toString() {
    final branchSummary = [
      for (final branch in branches) branch.toString(),
    ].join(', ');

    return 'GridLayoutConfig('
        'columns: ${_tracksToString(columns)}, '
        'rows: ${_tracksToString(rows)}, '
        'columnGap: $columnGap, rowGap: $rowGap, '
        'branches: $branchSummary)';
  }

  @override
  int get hashCode => Object.hash(
    Object.hashAll(columns),
    Object.hashAll(rows),
    columnGap,
    rowGap,
    Object.hashAll(branches),
  );
}

/// Geometry after branch selection — input to track sizing / placement.
@immutable
final class GridResolvedGeometry {
  final List<GridTrack> columns;
  final List<GridTrack> rows;
  final double columnGap;
  final double rowGap;

  const GridResolvedGeometry({
    required this.columns,
    required this.rows,
    required this.columnGap,
    required this.rowGap,
  });
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

Breakpoint _resolveBreakpoint(BuildContext context, Breakpoint breakpoint) {
  if (breakpoint case final BreakpointRef ref) {
    return ref.token.resolve(context);
  }

  return breakpoint;
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

void _rejectFractionalOnUnboundedAxis({
  required List<GridTrack> tracks,
  required Axis axis,
  required BoxConstraints constraints,
}) {
  final hasFr = tracks.any((t) => t is FrGridTrack);
  if (!hasFr) return;

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
