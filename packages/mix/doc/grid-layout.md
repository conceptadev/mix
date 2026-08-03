# Grid layout

`GridBox` arranges children in row-major order using fixed and fractional
tracks. Its style supports ordinary Mix variants and modifiers, plus
`onConstraints` for layout decisions based on the Grid's own available space.

## Basic usage

Use `GridBoxStyler.columns` as a dot-shorthand entry point, then chain the
remaining geometry:

```dart
final GridBoxStyler style = .columns([
  .fixed(220),
  .fr(2),
]).gap(16).autoRows(.fixed(160));

GridBox(style: style, children: cards);
```

`GridTrack.fixed(size)` keeps its logical-pixel size. `GridTrack.fr(fraction)`
receives that fraction of the free space left after fixed tracks and gaps.
Fractional tracks require a bounded parent extent on their axis.

## Responsive containers

`onConstraints` uses the existing `Breakpoint` value but evaluates it against
the bounded maximum size offered to this Grid:

```dart
final GridBoxStyler cardGrid = .columns([
  .fr(1),
  .fr(1),
  .fr(1),
]).gap(16).autoRows(.fixed(220)).onConstraints(
  .maxWidth(760),
  .columns([.fr(1), .fr(1)]).gap(12),
).onConstraints(
  .maxWidth(520),
  .columns([.fr(1)]).gap(10),
);
```

Matching branches apply in declaration order, so the narrower branch above
overrides the wider branch when both match. A branch can change columns, rows,
`autoRows`, and gaps. It cannot change clipping, modifiers, animations,
ordinary variants, or contain another constraint branch.

Use `onBreakpoint` when a style should respond to the viewport instead:

```dart
final viewportStyle = cardGrid.onBreakpoint(
  .maxWidth(520),
  .columns([.fr(1)]),
);
```

Two GridBoxes on the same screen can therefore select different
`onConstraints` branches when their parent containers offer different widths.

## Rows and auto-placement

Children fill columns from left to right, then continue on the next row.
Provide explicit `rows` for known row geometry, or `autoRows` for each repeated
row needed beyond the explicit list:

```dart
final GridBoxStyler gallery = .columns([
  .fr(1),
  .fr(1),
  .fr(1),
]).rows([
  .fixed(180),
]).autoRows(.fixed(180)).columnGap(12).rowGap(12);
```

If children require more rows than declared and `autoRows` is absent, GridBox
reports an actionable layout error rather than guessing a content-sizing rule.

## Overflow and clipping

Fixed tracks do not shrink when their total is larger than the available
space. `Clip.none` leaves that overflow visible and reports Flutter-style
diagnostics. Set `clipBehavior` on the base style when overflow should be
contained:

```dart
final GridBoxStyler clipped = .clipBehavior(.hardEdge);
```

## Current track model

GridBox intentionally supports fixed and fractional tracks with row-major
auto-placement. Content-sized tracks, spans, named areas, direction-aware
placement, and baseline alignment are not part of the current API.

Run the card, dashboard, and gallery examples from `packages/mix/example`:

```sh
flutter run -t lib/grid_main.dart
```

<p>
  <img src="../example/test/goldens/grid_dashboard_wide.png" alt="Wide GridBox dashboard" width="66%">
  <img src="../example/test/goldens/grid_dashboard_compact.png" alt="Compact GridBox dashboard" width="24%">
</p>
