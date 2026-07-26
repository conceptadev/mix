// Spike prototypes intentionally use unexported / @internal mix layout surfaces.
// ignore_for_file: implementation_imports, invalid_use_of_internal_member

/// Spike 4 — Tailwind → unbundled Mix layout mapping (not productized).
///
/// Maps the advanced-layout utilities identified in the exploration doc onto
/// the Spike 2–3 primitives (Wrap + Grid). Nothing here is exported from
/// [mix_tailwinds.dart].
///
/// ## Mapping table
///
/// | Tailwind | Mix spike target | Notes |
/// |---|---|---|
/// | `grid-cols-3` | `GridBoxStyler(columns: [fr(1), fr(1), fr(1)])` | equal fr tracks |
/// | `grid-cols-[80px_2fr_1fr]` | `GridBoxStyler(columns: [fixed(80), fr(2), fr(1)])` | arbitrary tracks |
/// | `gap-4` (on grid) | `GridBoxStyler(...).gap(16)` | theme spacing scale; 4 → 16px in default TW |
/// | `gap-x-4` / `gap-y-2` | `columnGapValue` / `rowGapValue` | split axes |
/// | `flex-wrap` | `WrapBox` host (not FlexBox) | FlexBox cannot express wrap; flow family required |
/// | `gap-2` (on wrap) | `WrapBoxStyler(flow: WrapStyler(spacing: 8, runSpacing: 8))` | TW gap applies both axes |
/// | `content-*` / `items-*` on wrap | `WrapStyler(alignment/runAlignment/crossAxisAlignment)` | via nested flow |
///
/// ## Not mapped (failed / deferred experiments)
///
/// | Tailwind | Why omitted |
/// |---|---|
/// | `@container` / `@max-md:flex-col` | Universal `onConstraints` via LayoutBuilder failed dry/intrinsic layout. Grid-only render-time branches remain an internal validation direction — not a Tailwind container-query product claim. |
/// | `md:flex-col` (viewport) | Already covered by public `onBreakpoint` / `onMobile`; not part of this layout spike. |
///
/// ## Completeness findings
///
/// 1. Nested field name `flow` (not `wrap`) on WrapBoxSpec — generator reserves
///    `wrap` for modifier chaining. Tailwind `flex-wrap` still maps cleanly to
///    the WrapBox host; the internal field name is a productization detail.
/// 2. WrapBoxStyler is not flattened like FlexBoxStyler (no SpacingStyleMixin
///    etc. on the composite). Productization should add a WrapStyleMixin for
///    fluent `spacing`/`runSpacing` without nesting `flow:`.
/// 3. Grid is hand-written (no codegen) in the spike; productization should
///    either codegen GridBoxSpec or keep a thin hand API. Spans, named areas,
///    and content-sized tracks are intentionally out of scope.
/// 4. WrapBox has no constraint-responsive styling in the spike. Grid-only
///    render-time `onConstraints` is internal validation, not public API and
///    not a descendant-scope / `@container` equivalent.
library;

import 'package:flutter/foundation.dart';
import 'package:mix/src/layout/grid_box.dart';
import 'package:mix/src/layout/grid_track.dart';
import 'package:mix/src/specs/wrap/wrap_spec.dart';
import 'package:mix/src/specs/wrapbox/wrapbox_spec.dart';

/// Translates `grid-cols-N gap-G` where G is a Tailwind spacing step (×4 px).
GridBoxStyler translateGridColsGap({
  required int columnCount,
  required int gapStep,
}) {
  assert(columnCount > 0);
  final gapPx = gapStep * 4.0;
  return GridBoxStyler(
    columns: List.filled(columnCount, const GridTrack.fr(1)),
    columnGap: gapPx,
    rowGap: gapPx,
  );
}

/// Translates `flex-wrap gap-G`.
WrapBoxStyler translateFlexWrapGap({required int gapStep}) {
  final gapPx = gapStep * 4.0;
  return WrapBoxStyler(
    flow: WrapStyler(spacing: gapPx, runSpacing: gapPx),
  );
}

/// Structural record of a single mapping row for tests/docs.
@immutable
class TailwindLayoutMapping {
  const TailwindLayoutMapping({
    required this.tailwind,
    required this.mixDescription,
  });

  final String tailwind;
  final String mixDescription;
}

/// Honest acceptance mappings retained after the container-query claim was dropped.
const spike4AcceptanceMappings = <TailwindLayoutMapping>[
  TailwindLayoutMapping(
    tailwind: 'grid-cols-3 gap-4',
    mixDescription:
        'GridBoxStyler(columns: [fr, fr, fr], columnGap: 16, rowGap: 16)',
  ),
  TailwindLayoutMapping(
    tailwind: 'flex-wrap gap-2',
    mixDescription:
        'WrapBoxStyler(flow: WrapStyler(spacing: 8, runSpacing: 8))',
  ),
];
