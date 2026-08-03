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
  final List<GridTrack>? $columns;
  final List<GridTrack>? $rows;
  final GridTrack? $autoRows;
  final double? $columnGap;
  final double? $rowGap;
  final Clip? $clipBehavior;
  final List<GridConstraintBranch>? $constraintBranches;

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
  }) : $columns = columns,
       $rows = rows,
       $autoRows = autoRows,
       $columnGap = columnGap,
       $rowGap = rowGap,
       $clipBehavior = clipBehavior,
       $constraintBranches = constraintBranches;

  /// Creates a style that sets [columns].
  factory GridBoxStyler.columns(List<GridTrack> columns) =>
      GridBoxStyler(columns: columns);

  /// Creates a style that sets [rows].
  factory GridBoxStyler.rows(List<GridTrack> rows) => GridBoxStyler(rows: rows);

  /// Creates a style that sets [autoRows].
  factory GridBoxStyler.autoRows(GridTrack autoRows) =>
      GridBoxStyler(autoRows: autoRows);

  /// Creates a style that sets both Grid gaps to [gap].
  factory GridBoxStyler.gap(double gap) =>
      GridBoxStyler(columnGap: gap, rowGap: gap);

  /// Creates a style that sets [columnGap].
  factory GridBoxStyler.columnGap(double columnGap) =>
      GridBoxStyler(columnGap: columnGap);

  /// Creates a style that sets [rowGap].
  factory GridBoxStyler.rowGap(double rowGap) => GridBoxStyler(rowGap: rowGap);

  /// Creates a style that sets [clipBehavior].
  factory GridBoxStyler.clipBehavior(Clip clipBehavior) =>
      GridBoxStyler(clipBehavior: clipBehavior);

  /// Creates a style with one local constraint branch.
  factory GridBoxStyler.onConstraints(
    Breakpoint breakpoint,
    GridBoxStyler patch,
  ) => GridBoxStyler().onConstraints(breakpoint, patch);

  /// Creates an animated Grid style.
  factory GridBoxStyler.animate(AnimationConfig animation) =>
      GridBoxStyler().animate(animation);

  GridBoxStyler columns(List<GridTrack> value) =>
      merge(GridBoxStyler(columns: value));

  GridBoxStyler rows(List<GridTrack> value) =>
      merge(GridBoxStyler(rows: value));

  GridBoxStyler autoRows(GridTrack value) =>
      merge(GridBoxStyler(autoRows: value));

  GridBoxStyler gap(double value) =>
      merge(GridBoxStyler(columnGap: value, rowGap: value));

  GridBoxStyler columnGap(double value) =>
      merge(GridBoxStyler(columnGap: value));

  GridBoxStyler rowGap(double value) => merge(GridBoxStyler(rowGap: value));

  GridBoxStyler clipBehavior(Clip value) =>
      merge(GridBoxStyler(clipBehavior: value));

  /// Attaches a Grid-only constraint branch applied at render time.
  ///
  /// [breakpoint] observes the bounded maximum size offered to this Grid.
  /// Unlike [onBreakpoint], it does not observe the viewport. [patch] may set
  /// columns, rows, autoRows, and gaps only. Modifiers, animations, ordinary
  /// variants, nested constraint branches, and empty patches are rejected.
  /// Selection runs during layout without rebuilding the widget tree.
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
      columns: $columns ?? const [GridTrack.fr(1)],
      rows: $rows ?? const [],
      autoRows: $autoRows,
      columnGap: $columnGap ?? 0,
      rowGap: $rowGap ?? 0,
      clipBehavior: $clipBehavior ?? .none,
      constraintBranches: [
        for (final branch in $constraintBranches ?? const [])
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
        $constraintBranches == null && other.$constraintBranches == null
        ? null
        : <GridConstraintBranch>[
            ...?$constraintBranches,
            ...?other.$constraintBranches,
          ];

    return GridBoxStyler(
      columns: other.$columns ?? $columns,
      rows: other.$rows ?? $rows,
      autoRows: other.$autoRows ?? $autoRows,
      columnGap: other.$columnGap ?? $columnGap,
      rowGap: other.$rowGap ?? $rowGap,
      clipBehavior: other.$clipBehavior ?? $clipBehavior,
      constraintBranches: mergedConstraintBranches,
      variants: MixOps.mergeVariants($variants, other.$variants),
      modifier: MixOps.mergeModifier($modifier, other.$modifier),
      animation: MixOps.mergeAnimation($animation, other.$animation),
    );
  }

  @override
  List<Object?> get props => [
    $columns,
    $rows,
    $autoRows,
    $columnGap,
    $rowGap,
    $clipBehavior,
    $constraintBranches,
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
  final nestedConstraintBranches = patch.$constraintBranches;
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
  if (patch.$clipBehavior != null) {
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
  final columns = patch.$columns;
  final rows = patch.$rows;
  final layoutPatch = GridLayoutPatch(
    columns: columns == null ? null : List<GridTrack>.unmodifiable(columns),
    rows: rows == null ? null : List<GridTrack>.unmodifiable(rows),
    autoRows: patch.$autoRows,
    columnGap: patch.$columnGap,
    rowGap: patch.$rowGap,
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

/// Multi-child Grid widget driven by [GridBoxStyler] and [GridBoxSpec].
class GridBox extends StyleWidget<GridBoxSpec> {
  const GridBox({
    super.style = const GridBoxStyler(),
    super.styleSpec,
    super.key,
    this.children = const <Widget>[],
  });

  /// Children placed into cells in row-major order.
  final List<Widget> children;

  @override
  Widget build(BuildContext context, GridBoxSpec spec) {
    return MixGrid(spec: spec, children: children);
  }
}
