# Grid layout

`GridBox` arranges children in row-major order using fixed and fractional
tracks. Its style supports ordinary Mix variants and modifiers, plus
`onConstraints` for layout decisions based on the Grid's own available space.

## Basic usage

For equal-width columns, use `GridBoxStyler.equalColumns` as a dot-shorthand
entry point, then chain the remaining geometry:

```dart
final GridBoxStyler style = .equalColumns(3)
    .gap(16)
    .autoRows(.fixed(160));

GridBox(style: style, children: cards);
```

`GridTrack.fixed(size)` keeps its logical-pixel size. `GridTrack.fr(fraction)`
receives that fraction of the free space left after fixed tracks and gaps.
For example, with 300 pixels of remaining space, `[.fr(2), .fr(1)]` produces
tracks of 200 and 100 pixels. Fractional tracks require a bounded parent extent
on their axis. Use `columns` directly when tracks are intentionally mixed:

```dart
final GridBoxStyler sidebarAndContent = .columns([
  .fixed(240),
  .fr(1),
]);
```

## Responsive containers

`onConstraints` uses the existing `Breakpoint` value but evaluates it against
the bounded maximum size offered to this Grid:

```dart
final GridBoxStyler cardGrid = .equalColumns(3)
    .gap(16)
    .autoRows(.fixed(220))
    .onConstraints(
  .maxWidth(760),
  .equalColumns(2).gap(12),
).onConstraints(
  .maxWidth(520),
  .equalColumns(1).gap(10),
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
final GridBoxStyler gallery = .equalColumns(2).rows([
  .fixed(180),
]).autoRows(.fixed(180)).columnGap(12).rowGap(12);
```

With five children and two columns, the example needs three rows: the first
uses the explicit 180-pixel row and the next two repeat `autoRows`. When
`rows` is empty, every required row uses `autoRows`.

If children require more rows than declared and `autoRows` is absent, GridBox
reports an actionable layout error rather than guessing a content-sizing rule.
Use fixed rows on an unbounded vertical axis such as `SingleChildScrollView`.
Fractional rows and fractional `autoRows` require bounded height.

## Design tokens

Fixed sizes and gaps can use `SpaceToken`; fractional weights can use
`DoubleToken`. Tokens resolve through the surrounding `MixScope` before Grid
geometry is validated, including geometry inside `onConstraints` patches:

```dart
const cardWidth = SpaceToken('grid.card.width');
const gridGap = SpaceToken('grid.gap');
const contentWeight = DoubleToken('grid.content.weight');

final GridBoxStyler tokenGrid = .columns([
  .fixed(cardWidth()),
  .fr(contentWeight()),
]).gap(gridGap()).autoRows(.fixed(cardWidth()));

MixScope(
  spaces: {cardWidth: 160, gridGap: 12},
  doubles: {contentWeight: 2},
  child: GridBox(style: tokenGrid, children: cards),
);
```

## Animation

`animate` provides implicit Grid animation: rebuild with different geometry and
Mix interpolates the resolved `GridBoxSpec` without an `AnimationController`.
For example, this state-driven Grid moves from equal columns to a 2:1 focus
layout while also increasing its row height and gaps:

```dart
final GridBoxStyler animatedGrid = .columns([
  .fr(focused ? 2 : 1),
  .fr(1),
])
    .autoRows(.fixed(focused ? 148 : 112))
    .gap(focused ? 20 : 12)
    .animate(.easeInOut(const Duration(milliseconds: 600)));

return Column(
  children: [
    FilledButton(
      onPressed: () => setState(() => focused = !focused),
      child: Text(focused ? 'Balance 1:1' : 'Focus 2:1'),
    ),
    GridBox(style: animatedGrid, children: cards),
  ],
);
```

When `setState` rebuilds the styler, Mix creates a tween between the old and new
resolved geometry. The render object lays out the Grid at each animation value.
In the example, the first track's weight moves from `1` to `2`, the second stays
at `1`, and the resulting pixel widths continuously move from 1:1 toward 2:1.

Animation compatibility is positional:

- fixed tracks interpolate with fixed tracks;
- fractional tracks interpolate with fractional tracks;
- the two track lists must keep the same length and track kinds;
- compatible `autoRows`, `columnGap`, and `rowGap` values interpolate too.

A track-count or track-kind change has no continuous geometric equivalent, so
it switches at the animation midpoint. `clipBehavior` and constraint patches
also switch at the midpoint. Resizing across an `onConstraints` breakpoint
stays immediate: branch selection happens during layout and does not rebuild a
new animation target. Use state or an ordinary Mix variant when the geometry
change itself should animate.

The runnable gallery includes balanced and focused states of this example:

<p>
  <img src="../example/test/goldens/grid_animation_balanced.png" alt="Balanced animated GridBox state" width="46%">
  <img src="../example/test/goldens/grid_animation_focused.png" alt="Focused animated GridBox state" width="46%">
</p>

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

Run the card, dashboard, gallery, and animation examples from
`packages/mix/example`:

```sh
flutter run -t lib/grid_main.dart
```

<p>
  <img src="../example/test/goldens/grid_dashboard_wide.png" alt="Wide GridBox dashboard" width="66%">
  <img src="../example/test/goldens/grid_dashboard_compact.png" alt="Compact GridBox dashboard" width="24%">
</p>
