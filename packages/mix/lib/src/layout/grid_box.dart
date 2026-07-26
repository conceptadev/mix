import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../animation/animation_config.dart';
import '../core/breakpoint.dart';
import '../core/helpers.dart';
import '../core/spec.dart';
import '../core/style.dart';
import '../core/style_spec.dart';
import '../core/style_widget.dart';
import '../modifiers/widget_modifier_config.dart';
import '../style/abstracts/styler.dart';
import 'grid_layout_config.dart';
import 'grid_track.dart';
import 'render_grid.dart';

/// Minimal grid geometry spec for the Spike 3 render slice.
///
/// Hand-written (no codegen) to keep the spike under ~1k LOC and avoid
/// generator investment until the render contract is proven.
///
/// Holds one frozen [GridLayoutConfig]. Branch selection happens only inside
/// [RenderMixGrid] live/dry layout — never during widget build.
@immutable
final class GridBoxSpec extends Spec<GridBoxSpec> with Diagnosticable {
  final GridLayoutConfig layout;

  const GridBoxSpec({
    this.layout = const GridLayoutConfig(columns: [GridTrack.fr(1)]),
  });

  List<GridTrack> get columns => layout.columns;
  List<GridTrack> get rows => layout.rows;
  double get columnGap => layout.columnGap;
  double get rowGap => layout.rowGap;

  @override
  GridBoxSpec copyWith({GridLayoutConfig? layout}) {
    return GridBoxSpec(layout: layout ?? this.layout);
  }

  @override
  GridBoxSpec lerp(GridBoxSpec? other, double t) {
    if (other == null) return this;
    // Snap geometry; no continuous track lerp in the spike.

    return t < 0.5 ? this : other;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('layout', layout))
      ..add(IterableProperty('columns', columns))
      ..add(IterableProperty('rows', rows))
      ..add(DoubleProperty('columnGap', columnGap))
      ..add(DoubleProperty('rowGap', rowGap));
  }

  @override
  List<Object?> get props => [layout];
}

/// Fluent style for [GridBox].
///
/// Geometry fields are nullable so partial merges (e.g. attaching variants)
/// do not clobber earlier values with constructor defaults.
///
/// Constraint-responsive geometry uses Grid-only [onConstraints] — patches
/// may contain columns, rows, and gaps only. Branch selection is frozen into
/// [GridLayoutConfig] at [resolve] and applied at render time.
class GridBoxStyler extends MixStyler<GridBoxStyler, GridBoxSpec> {
  final List<GridTrack>? _columns;
  final List<GridTrack>? _rows;
  final double? _columnGap;
  final double? _rowGap;
  final List<(Breakpoint, GridLayoutPatch)>? _constraintBranches;

  const GridBoxStyler({
    List<GridTrack>? columns,
    List<GridTrack>? rows,
    double? columnGap,
    double? rowGap,
    List<(Breakpoint, GridLayoutPatch)>? constraintBranches,
    super.variants,
    super.modifier,
    super.animation,
  }) : _columns = columns,
       _rows = rows,
       _columnGap = columnGap,
       _rowGap = rowGap,
       _constraintBranches = constraintBranches;

  List<GridTrack> get columns => _columns ?? const [GridTrack.fr(1)];
  List<GridTrack> get rows => _rows ?? const [];
  double get columnGap => _columnGap ?? 0;
  double get rowGap => _rowGap ?? 0;

  /// Unresolved constraint branches (breakpoint may still be a token ref).
  List<(Breakpoint, GridLayoutPatch)> get constraintBranches =>
      _constraintBranches ?? const [];

  GridBoxStyler columnsTracks(List<GridTrack> value) =>
      merge(GridBoxStyler(columns: value));

  GridBoxStyler rowsTracks(List<GridTrack> value) =>
      merge(GridBoxStyler(rows: value));

  GridBoxStyler gap(double value) =>
      merge(GridBoxStyler(columnGap: value, rowGap: value));

  GridBoxStyler columnGapValue(double value) =>
      merge(GridBoxStyler(columnGap: value));

  GridBoxStyler rowGapValue(double value) =>
      merge(GridBoxStyler(rowGap: value));

  /// Attaches a Grid-only constraint branch applied at render time.
  ///
  /// [patch] may set columns, rows, and gaps only. Modifiers, animations,
  /// ordinary variants, nested constraint branches, and empty patches are
  /// rejected. Breakpoint tokens resolve at [resolve]; selection runs in
  /// [RenderMixGrid] without rebuilding the widget tree.
  GridBoxStyler onConstraints(Breakpoint breakpoint, GridBoxStyler patch) {
    _validateConstraintPatch(patch);
    final patchColumns = patch._columns;
    final patchRows = patch._rows;
    final layoutPatch = GridLayoutPatch(
      columns: patchColumns == null
          ? null
          : List<GridTrack>.unmodifiable(List<GridTrack>.of(patchColumns)),
      rows: patchRows == null
          ? null
          : List<GridTrack>.unmodifiable(List<GridTrack>.of(patchRows)),
      columnGap: patch._columnGap,
      rowGap: patch._rowGap,
    );

    return merge(
      GridBoxStyler(constraintBranches: [(breakpoint, layoutPatch)]),
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
    final config = GridLayoutConfig.resolve(
      columns: columns,
      rows: rows,
      columnGap: columnGap,
      rowGap: rowGap,
      branches: constraintBranches,
      context: context,
    );

    return StyleSpec(
      spec: GridBoxSpec(layout: config),
      animation: $animation,
      widgetModifiers: $modifier?.resolve(context),
    );
  }

  @override
  GridBoxStyler merge(covariant GridBoxStyler? other) {
    if (other == null) return this;

    final mergedBranches =
        _constraintBranches == null && other._constraintBranches == null
        ? null
        : <(Breakpoint, GridLayoutPatch)>[
            ...?_constraintBranches,
            ...?other._constraintBranches,
          ];

    return GridBoxStyler(
      columns: other._columns ?? _columns,
      rows: other._rows ?? _rows,
      columnGap: other._columnGap ?? _columnGap,
      rowGap: other._rowGap ?? _rowGap,
      constraintBranches: mergedBranches,
      variants: MixOps.mergeVariants($variants, other.$variants),
      modifier: MixOps.mergeModifier($modifier, other.$modifier),
      animation: MixOps.mergeAnimation($animation, other.$animation),
    );
  }

  @override
  List<Object?> get props => [
    _columns,
    _rows,
    _columnGap,
    _rowGap,
    _constraintBranches,
    $variants,
    $modifier,
    $animation,
  ];
}

void _validateConstraintPatch(GridBoxStyler patch) {
  if (patch.$modifier != null) {
    throw FlutterError.fromParts([
      ErrorSummary(
        'GridBoxStyler.onConstraints patch cannot include modifiers.',
      ),
      ErrorDescription(
        'Constraint patches may only set columns, rows, and gaps.',
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
        'Constraint patches may only set columns, rows, and gaps.',
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
        'Constraint patches may only set columns, rows, and gaps.',
      ),
      ErrorHint('Attach variants on the base GridBoxStyler instead.'),
    ]);
  }
  final nestedBranches = patch._constraintBranches;
  if (nestedBranches != null && nestedBranches.isNotEmpty) {
    throw FlutterError.fromParts([
      ErrorSummary(
        'GridBoxStyler.onConstraints patch cannot nest constraint branches.',
      ),
      ErrorDescription(
        'Chain onConstraints on the base styler; do not nest branches in a patch.',
      ),
    ]);
  }
  final hasGeometry =
      patch._columns != null ||
      patch._rows != null ||
      patch._columnGap != null ||
      patch._rowGap != null;
  if (!hasGeometry) {
    throw FlutterError.fromParts([
      ErrorSummary('GridBoxStyler.onConstraints patch must set geometry.'),
      ErrorDescription(
        'An empty patch (no columns, rows, or gaps) is not allowed.',
      ),
      ErrorHint('Set at least one of columns, rows, columnGap, or rowGap.'),
    ]);
  }
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
    return MixGrid(config: spec.layout, children: children);
  }
}
