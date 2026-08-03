import 'package:flutter/widgets.dart';

import '../animation/animation_config.dart';
import '../core/breakpoint.dart';
import '../core/helpers.dart';
import '../core/style.dart';
import '../core/style_spec.dart';
import '../core/style_widget.dart';
import '../modifiers/widget_modifier_config.dart';
import '../style/abstracts/styler.dart';
import '../theme/tokens/token_refs.dart';
import 'grid_box_spec.dart';
import 'grid_track.dart';
import 'render_grid.dart';

export 'grid_box_spec.dart';

/// Fluent style for [GridBox].
///
/// Geometry fields are nullable so partial merges (e.g. attaching variants)
/// do not clobber earlier values with constructor defaults.
///
/// Constraint-responsive geometry uses Grid-only [onConstraints] — patches
/// may contain columns, rows, autoRows, and gaps only. Paint configuration such
/// as [clipBehavior] remains on the base style. Constraint branches are
/// snapshotted into [GridBoxSpec] at [resolve] and applied at render time.
///
/// [clipBehavior] defaults to [Clip.none]. Fixed tracks keep their declared
/// size when they overflow; clipping changes paint containment, not geometry.
class GridBoxStyler extends MixStyler<GridBoxStyler, GridBoxSpec> {
  final List<GridTrack>? _columns;
  final List<GridTrack>? _rows;
  final GridTrack? _autoRows;
  final double? _columnGap;
  final double? _rowGap;
  final Clip? _clipBehavior;
  final List<GridConstraintBranch>? _constraintBranches;

  const GridBoxStyler({
    List<GridTrack>? columns,
    List<GridTrack>? rows,
    GridTrack? autoRows,
    double? columnGap,
    double? rowGap,
    Clip? clipBehavior,
    List<GridConstraintBranch>? constraintBranches,
    super.variants,
    super.modifier,
    super.animation,
  }) : _columns = columns,
       _rows = rows,
       _autoRows = autoRows,
       _columnGap = columnGap,
       _rowGap = rowGap,
       _clipBehavior = clipBehavior,
       _constraintBranches = constraintBranches;

  List<GridTrack> get columns => _columns ?? const [GridTrack.fr(1)];
  List<GridTrack> get rows => _rows ?? const [];
  GridTrack? get autoRows => _autoRows;
  double get columnGap => _columnGap ?? 0;
  double get rowGap => _rowGap ?? 0;
  Clip get clipBehavior => _clipBehavior ?? .none;

  List<GridConstraintBranch> get constraintBranches =>
      _constraintBranches ?? const [];

  GridBoxStyler columnsTracks(List<GridTrack> value) =>
      merge(GridBoxStyler(columns: value));

  GridBoxStyler rowsTracks(List<GridTrack> value) =>
      merge(GridBoxStyler(rows: value));

  GridBoxStyler autoRowsTrack(GridTrack value) =>
      merge(GridBoxStyler(autoRows: value));

  GridBoxStyler gap(double value) =>
      merge(GridBoxStyler(columnGap: value, rowGap: value));

  GridBoxStyler columnGapValue(double value) =>
      merge(GridBoxStyler(columnGap: value));

  GridBoxStyler rowGapValue(double value) =>
      merge(GridBoxStyler(rowGap: value));

  /// Attaches a Grid-only constraint branch applied at render time.
  ///
  /// [breakpoint] observes the bounded maximum size offered to this Grid.
  /// Unlike [onBreakpoint], it does not observe the viewport. [patch] may set
  /// columns, rows, autoRows, and gaps only. Modifiers, animations, ordinary
  /// variants, nested constraint branches, and empty patches are rejected.
  /// Selection runs in [RenderMixGrid] without rebuilding the widget tree.
  GridBoxStyler onConstraints(Breakpoint breakpoint, GridBoxStyler patch) {
    final layoutPatch = _createValidatedConstraintPatch(patch);

    return merge(
      GridBoxStyler(
        constraintBranches: [
          GridConstraintBranch(breakpoint: breakpoint, patch: layoutPatch),
        ],
      ),
    );
  }

  @override
  GridBoxStyler animate(AnimationConfig value) =>
      merge(GridBoxStyler(animation: value));

  @override
  GridBoxStyler variants(List<VariantStyle<GridBoxSpec>> value) =>
      merge(GridBoxStyler(variants: value));

  @override
  GridBoxStyler wrap(WidgetModifierConfig value) =>
      merge(GridBoxStyler(modifier: value));

  @override
  StyleSpec<GridBoxSpec> resolve(BuildContext context) {
    final spec = GridBoxSpec(
      columns: columns,
      rows: rows,
      autoRows: autoRows,
      columnGap: columnGap,
      rowGap: rowGap,
      clipBehavior: clipBehavior,
      constraintBranches: [
        for (final branch in constraintBranches)
          GridConstraintBranch(
            breakpoint: _resolveConstraintBreakpoint(
              context,
              branch.breakpoint,
            ),
            patch: branch.patch,
          ),
      ],
    );

    return StyleSpec(
      spec: spec,
      animation: $animation,
      widgetModifiers: $modifier?.resolve(context),
    );
  }

  @override
  GridBoxStyler merge(covariant GridBoxStyler? other) {
    if (other == null) return this;

    final mergedConstraintBranches =
        _constraintBranches == null && other._constraintBranches == null
        ? null
        : <GridConstraintBranch>[
            ...?_constraintBranches,
            ...?other._constraintBranches,
          ];

    return GridBoxStyler(
      columns: other._columns ?? _columns,
      rows: other._rows ?? _rows,
      autoRows: other._autoRows ?? _autoRows,
      columnGap: other._columnGap ?? _columnGap,
      rowGap: other._rowGap ?? _rowGap,
      clipBehavior: other._clipBehavior ?? _clipBehavior,
      constraintBranches: mergedConstraintBranches,
      variants: MixOps.mergeVariants($variants, other.$variants),
      modifier: MixOps.mergeModifier($modifier, other.$modifier),
      animation: MixOps.mergeAnimation($animation, other.$animation),
    );
  }

  @override
  List<Object?> get props => [
    _columns,
    _rows,
    _autoRows,
    _columnGap,
    _rowGap,
    _clipBehavior,
    _constraintBranches,
    $variants,
    $modifier,
    $animation,
  ];
}

Breakpoint _resolveConstraintBreakpoint(
  BuildContext context,
  Breakpoint breakpoint,
) {
  if (breakpoint case BreakpointRef(:final token)) {
    return token.resolve(context);
  }

  return breakpoint;
}

GridLayoutPatch _createValidatedConstraintPatch(GridBoxStyler patch) {
  if (patch.$modifier != null) {
    throw FlutterError.fromParts([
      ErrorSummary(
        'GridBoxStyler.onConstraints patch cannot include modifiers.',
      ),
      ErrorDescription(
        'Constraint patches may only set columns, rows, autoRows, and gaps.',
      ),
      ErrorHint('Move modifiers to the base GridBoxStyler.'),
    ]);
  }
  if (patch.$animation != null) {
    throw FlutterError.fromParts([
      ErrorSummary(
        'GridBoxStyler.onConstraints patch cannot include animation.',
      ),
      ErrorDescription(
        'Constraint patches may only set columns, rows, autoRows, and gaps.',
      ),
      ErrorHint('Move animation to the base GridBoxStyler.'),
    ]);
  }
  if (patch.$variants != null && patch.$variants!.isNotEmpty) {
    throw FlutterError.fromParts([
      ErrorSummary(
        'GridBoxStyler.onConstraints patch cannot include ordinary variants.',
      ),
      ErrorDescription(
        'Constraint patches may only set columns, rows, autoRows, and gaps.',
      ),
      ErrorHint('Attach variants on the base GridBoxStyler instead.'),
    ]);
  }
  final nestedConstraintBranches = patch._constraintBranches;
  if (nestedConstraintBranches != null && nestedConstraintBranches.isNotEmpty) {
    throw FlutterError.fromParts([
      ErrorSummary(
        'GridBoxStyler.onConstraints patch cannot nest constraint branches.',
      ),
      ErrorDescription(
        'Chain onConstraints on the base styler; do not nest branches in a patch.',
      ),
    ]);
  }
  if (patch._clipBehavior != null) {
    throw FlutterError.fromParts([
      ErrorSummary(
        'GridBoxStyler.onConstraints patch cannot include clipBehavior.',
      ),
      ErrorDescription(
        'Constraint patches are geometry-only; clipping is a paint policy.',
      ),
      ErrorHint('Move clipBehavior to the base GridBoxStyler.'),
    ]);
  }
  final columns = patch._columns;
  final rows = patch._rows;
  final layoutPatch = GridLayoutPatch(
    columns: columns == null
        ? null
        : List<GridTrack>.unmodifiable(List<GridTrack>.of(columns)),
    rows: rows == null
        ? null
        : List<GridTrack>.unmodifiable(List<GridTrack>.of(rows)),
    autoRows: patch._autoRows,
    columnGap: patch._columnGap,
    rowGap: patch._rowGap,
  );
  if (layoutPatch.isEmpty) {
    throw FlutterError.fromParts([
      ErrorSummary('GridBoxStyler.onConstraints patch must set geometry.'),
      ErrorDescription(
        'An empty patch (no columns, rows, autoRows, or gaps) is not allowed.',
      ),
      ErrorHint(
        'Set at least one of columns, rows, autoRows, columnGap, or rowGap.',
      ),
    ]);
  }

  return layoutPatch;
}

/// Grid host: [MixGrid] driven by [GridBoxStyler] / [GridBoxSpec].
///
/// Spike prototype — not exported from `mix.dart`.
class GridBox extends StyleWidget<GridBoxSpec> {
  const GridBox({
    super.style = const GridBoxStyler(),
    super.styleSpec,
    super.key,
    this.children = const <Widget>[],
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context, GridBoxSpec spec) {
    return MixGrid(spec: spec, children: children);
  }
}
