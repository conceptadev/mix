# Internal Grid layout validation

## Status

Grid is an internal render-contract validation slice. Its source is excluded
from the generated `mix.dart` barrel and is not a public stability promise.

The implementation exists to validate the smallest credible Grid contract
before Mix commits to names or behavior that would be difficult to change.
It does not make Grid interchangeable with `Box`, `FlexBox`, or `WrapBox`.

## Validated scope

The current slice supports:

- fixed and fractional (`fr`) column and row tracks;
- explicit rows plus an explicit repeated `autoRows` strategy;
- row and column gaps;
- row-major child placement without spans;
- immutable, validated `GridBoxSpec` geometry;
- Grid-local render-time constraint branches;
- shared live and dry layout computation;
- overflow diagnostics and configurable clipping; and
- ordinary Flutter hit testing and child lifecycle behavior.

`GridConstraintQuery.widthAtMost` observes the finite maximum width offered to
the Grid render object. Matching branches apply partial geometry patches in
declaration order. Patches may change columns, rows, `autoRows`, and gaps only.
Modifiers, animation, ordinary variants, nested branches, clipping, and empty
patches are rejected with actionable errors.

This host-owned branch selection is deliberately narrower than a universal
Styler constraint API. It runs in live, dry, and intrinsic Grid layout without
inserting `LayoutBuilder`, rebuilding children, or changing the widget tree.

## Track and overflow contract

All configured geometry is validated before it crosses the render boundary:

- at least one column is required;
- fixed tracks and gaps must be finite and non-negative;
- fractional tracks must be finite and greater than zero;
- fractional tracks require a bounded extent on their axis; and
- extra auto-placed children require an explicit `autoRows` track.

Fixed tracks keep their declared sizes even when the parent is smaller. The
layout result therefore retains two sizes:

- `size`, constrained and reported to the parent; and
- `contentSize`, the complete track-and-gap extent used to detect overflow.

`Clip.none` leaves overflow visible. Other `Clip` values contain painting and
provide a paint clip. Overflow on either axis emits Flutter-style diagnostics
with Grid-specific remediation. Hit testing remains bounded by the render
object even when overflow painting is visible.

## Why Grid remains internal

A generally useful public Grid still needs product decisions and measurement
rules for:

- content-sized tracks;
- implicit content-sized rows for unconstrained child counts;
- spans and named areas;
- direction-aware placement;
- baseline behavior; and
- the contribution of spanning children to track sizes.

Content tracks and spans require a child-measurement phase beyond this finite
fixed/fr slice. Publishing the current API would either hide those gaps or
make later productization unnecessarily constrained.

## `flutter_layout_grid` evaluation

[`flutter_layout_grid` 2.0.8](https://pub.dev/packages/flutter_layout_grid/versions/2.0.8)
was evaluated at [source revision
`e05d48c`](https://github.com/shyndman/flutter_layout_grid/tree/e05d48cb919fb558a7c6b7c8fab386d158d2686c).
It is useful prior art and provides CSS-inspired content tracks and dry layout.

It still requires explicit row tracks and does not provide the repeated
implicit content-sized row behavior Mix needs. Adopting it would add a
substantial runtime surface without clearing the blocker that currently keeps
Grid internal. Mix therefore does not add the dependency. Re-evaluate only if
the package's row model or Mix's required implicit-row contract changes.

## Explicit exclusions

This validation does not introduce:

- universal `onConstraints` or `ConstraintScope` behavior;
- public Grid exports;
- WrapBox or a public Grid protocol codec, discriminator, or wire branch;
- Tailwind Grid translation; or
- a third-party Grid runtime dependency.

## Evidence

Tests under `packages/mix/test/src/layout/` cover deterministic unit geometry,
seeded fixed/fr properties, live/dry parity, exact placement and gaps,
constraint-branch selection, validation failures, two-axis overflow,
clipping, diagnostics, and hit testing.
