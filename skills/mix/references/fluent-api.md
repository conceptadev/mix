# Fluent API

Chaining patterns, style mixins, and composition in Mix.

## Core Principle

Prefer fluent chaining on Styler types. Each setter returns a new merged instance:

```dart
final style = BoxStyler()
    .color(Colors.blue)
    .paddingAll(16)
    .borderRounded(8)
    .width(200);
```

Generated primitive setters merge a new Styler with the changed field. Convenience methods may delegate to lower-level setters or add widget modifiers.

## Style Mixins

Stylers mix in convenience methods. All methods are available on the corresponding Styler.

### SpacingStyleMixin

Padding and margin shortcuts:

| Method | Description |
|--------|-------------|
| `paddingAll(v)` | All sides |
| `paddingX(v)` / `paddingY(v)` | Horizontal / vertical |
| `paddingTop(v)`, `paddingBottom(v)`, `paddingLeft(v)`, `paddingRight(v)` | Individual sides |
| `paddingStart(v)` / `paddingEnd(v)` | RTL-aware |
| `paddingOnly(...)` | Named parameters for any combination |
| `marginAll(v)` | All margin sides |
| `marginTop(v)`, etc. | Individual margin sides |
| `marginOnly(...)` | Named margin parameters |

### DecorationStyleMixin

Decoration, color, gradient, border, shadow, shape, background image:

| Method | Description |
|--------|-------------|
| `color(v)` | Background color |
| `gradient(v)` | Gradient fill |
| `border(v)` | Border (BoxBorderMix) |
| `borderRadius(v)` | Border radius (BorderRadiusGeometryMix) |
| `shadow(v)` / `shadows(v)` | Box shadow(s) |
| `elevation(v)` | Elevation shadow preset |
| `image(v)` | Decoration image |
| `shape(v)` | Shape border |
| `shapeCircle()`, `shapeStadium()`, `shapeRoundedRectangle()`, etc. | Shape shortcuts |
| `backgroundImage(image)`, `backgroundImageUrl(url)`, `backgroundImageAsset(path)` | Background image utilities |
| `linearGradient(...)`, `radialGradient(...)`, `sweepGradient(...)` | Gradient shortcuts |
| `foregroundLinearGradient(...)`, etc. | Foreground gradient shortcuts |

### BorderStyleMixin

| Method | Description |
|--------|-------------|
| `borderAll(...)` | All sides: `color`, `width`, `style`, `strokeAlign` |
| `borderTop(...)`, `borderBottom(...)`, `borderLeft(...)`, `borderRight(...)` | Individual sides |
| `borderStart(...)` / `borderEnd(...)` | RTL-aware |
| `borderVertical(...)` / `borderHorizontal(...)` | Grouped sides |

### BorderRadiusStyleMixin

| Method | Description |
|--------|-------------|
| `borderRounded(radius)` | Uniform circular radius (most common) |
| `borderRadiusAll(radius)` | All corners with `Radius` |
| `borderRadiusTop(r)`, `borderRadiusBottom(r)` | Top/bottom grouped |
| `borderRadiusLeft(r)`, `borderRadiusRight(r)` | Left/right grouped |
| `borderRadiusTopLeft(r)`, `borderRadiusTopRight(r)`, etc. | Individual corners |
| `borderRadiusTopStart(r)`, `borderRadiusTopEnd(r)`, etc. | RTL-aware corners |
| `borderRoundedTop(r)`, `borderRoundedBottom(r)`, etc. | Circular grouped |

### ConstraintStyleMixin

| Method | Description |
|--------|-------------|
| `width(v)` / `height(v)` | Fixed dimension |
| `size(w, h)` | Both dimensions |
| `minWidth(v)` / `maxWidth(v)` | Width constraints |
| `minHeight(v)` / `maxHeight(v)` | Height constraints |
| `constraintsOnly(...)` | Named parameters for any combination |

### ShadowStyleMixin

| Method | Description |
|--------|-------------|
| `shadowOnly(...)` | Single shadow with `color`, `offset`, `blurRadius`, `spreadRadius` |
| `boxShadows(v)` | List of BoxShadowMix |
| `boxElevation(v)` | ElevationShadow preset |

### TransformStyleMixin

| Method | Description |
|--------|-------------|
| `transform(matrix, {alignment})` | Raw Matrix4 |
| `rotate(angle, {alignment})` | Rotation in radians |
| `scale(factor, {alignment})` | Uniform scale |
| `translate(x, y, [z])` | Translation |
| `skew(skewX, skewY)` | Skew |
| `transformReset()` | Reset to identity |

### FlexStyleMixin (on FlexStyler/FlexBoxStyler)

`RowBox` and `ColumnBox` are widgets backed by `FlexBoxStyler`; there are no separate `RowBoxStyler` or `ColumnBoxStyler` classes.

| Method | Description |
|--------|-------------|
| `direction(axis)` | Flex direction |
| `mainAxisAlignment(v)` | Main axis alignment |
| `crossAxisAlignment(v)` | Cross axis alignment |
| `mainAxisSize(v)` | Main axis sizing |
| `spacing(v)` | Gap between children |
| `row()` / `column()` | Direction shortcuts |

### WrapStyleMixin (on WrapStyler/WrapBoxStyler)

`WrapBoxStyler` flattens the common Wrap fields while keeping Box collisions
explicit:

| Method | Description |
|--------|-------------|
| `direction(axis)` | Wrap main-axis direction |
| `spacing(v)` | Space between children within a run |
| `runSpacing(v)` | Space between runs |
| `wrapAlignment(v)` | Child alignment within each run |
| `runAlignment(v)` | Run alignment on the cross axis |
| `crossAxisAlignment(v)` | Child alignment within a run's cross axis |
| `wrapClipBehavior(v)` | Inner Wrap clipping |
| `flow(WrapStyler(...))` | Direct nested Wrap-style composition |

On `WrapBoxStyler`, `alignment()` and `clipBehavior()` belong to the outer Box.
Use `wrapAlignment()` and `wrapClipBehavior()` for the inner Wrap.

### GridBoxStyler

`GridBoxStyler` is handwritten because Grid adds render-time local constraint
selection. Prefer an explicitly typed factory initializer:

```dart
final GridBoxStyler grid = .equalColumns(3)
    .gap(16)
    .autoRows(.fixed(220));
```

Use `columns`, `equalColumns`, `rows`, `autoRows`, `gap`, `columnGap`,
`rowGap`, `clipBehavior`, and `onConstraints`. See [`layout.md`](layout.md) for
the Grid track model, use cases, constraints, and animation compatibility.

### TextStyleMixin (on TextStyler)

| Method | Description |
|--------|-------------|
| `color(v)`, `fontSize(v)`, `fontWeight(v)`, `fontStyle(v)` | Basic text styling |
| `letterSpacing(v)`, `wordSpacing(v)`, `height(v)` | Spacing |
| `decoration(v)`, `decorationColor(v)`, `decorationStyle(v)` | Text decoration |
| `fontFamily(v)`, `fontFamilyFallback(v)` | Font selection |
| `shadows(v)`, `fontFeatures(v)`, `fontVariations(v)` | Advanced |

### IconStyler

Generated fluent setters from `IconSpec`:

| Method | Description |
|--------|-------------|
| `icon(v)` | Icon glyph data |
| `color(v)` | Icon color |
| `size(v)` | Icon size |
| `weight(v)` | Variable-font weight axis |
| `grade(v)` | Variable-font grade axis |
| `opticalSize(v)` | Variable-font optical size axis |
| `fill(v)` | Variable-font fill axis |
| `opacity(v)` | Icon opacity |
| `shadow(v)` / `shadows(v)` | One shadow or a shadow list |
| `blendMode(v)` | Color blend mode |
| `applyTextScaling(v)` | Whether text scaling affects the icon |
| `textDirection(v)` | Text direction for directional icons |
| `semanticsLabel(v)` | Accessibility label |

### ImageStyler

Generated fluent setters from `ImageSpec`:

| Method | Description |
|--------|-------------|
| `image(v)` | Image provider |
| `width(v)` / `height(v)` | Display dimensions |
| `color(v)` | Color filter color |
| `fit(v)` | Box fit |
| `alignment(v)` | Image alignment |
| `repeat(v)` | Image repeat mode |
| `centerSlice(v)` | Nine-patch center slice |
| `filterQuality(v)` | Sampling quality |
| `colorBlendMode(v)` | Color filter blend mode |
| `semanticLabel(v)` | Accessibility label |
| `gaplessPlayback(v)` | Keep old image while new image loads |
| `isAntiAlias(v)` | Anti-alias image edges |
| `matchTextDirection(v)` | Flip in RTL contexts |

See also [`styler-api-policy.md`](styler-api-policy.md) for top-level factory and dot-shorthand guidance.

## Interaction Widgets

Use `Pressable` for interaction state around any child, and `PressableBox` when the interactive surface is also a `Box`.

### Pressable

| Parameter | Description |
|-----------|-------------|
| `child` | Required child widget |
| `onPress` / `onLongPress` | Tap and long-press callbacks |
| `enabled` | Enables interaction; defaults to `true` |
| `enableFeedback` | Enables haptic/audio feedback; defaults to `false` |
| `onFocusChange` | Focus change callback |
| `autofocus` | Requests focus automatically; defaults to `false` |
| `focusNode` | Optional focus node |
| `mouseCursor` | Cursor override |
| `hitTestBehavior` | Gesture hit-test behavior; defaults to `HitTestBehavior.opaque` |
| `canRequestFocus` | Whether focus can be requested; defaults to `true` |
| `controller` | Optional `WidgetStatesController` |
| `actions` | Additional focus actions |
| `onKeyEvent` | Custom key handling while enabled; runs before built-in activation |
| `semanticsLabel` | Accessibility label |
| `semanticsRole` | `PressableSemanticsRole.button` (default), `link`, or `none` |
| `excludeFromSemantics` | Suppresses Pressable's semantic annotations while preserving descendant semantics; defaults to `false` |

While focused, `Pressable` handles unmodified Space, Enter, numpad Enter,
select, and game button A itself: pressed on key down, activated once on key up.
It leaves those keys alone when a descendant holds focus, so a nested
`TextField` still receives them, and leaves modified chords to application
shortcuts. Those direct key bindings are handled before Flutter can dispatch an
`ActivateIntent`; use `onKeyEvent` to override them. Custom actions remain
available to other shortcuts and programmatic intents, but are not installed
while the Pressable is disabled.

### PressableBox

| Parameter | Description |
|-----------|-------------|
| `style` | Optional `BoxStyler` for the surface |
| `child` | Required child widget |
| `onPress` / `onLongPress` | Tap and long-press callbacks |
| `enabled` | Enables interaction; defaults to `true` |
| `focusNode` | Optional focus node |
| `onFocusChange` | Focus change callback |
| `autofocus` | Requests focus automatically; defaults to `false` |
| `enableFeedback` | Enables haptic/audio feedback; defaults to `false` |
| `hitTestBehavior` | Gesture hit-test behavior; defaults to `HitTestBehavior.opaque` |

`PressableBox` forwards the full `Pressable` surface — including `mouseCursor`, `canRequestFocus`, `onKeyEvent`, `controller`, `actions`, `semanticsLabel`, `semanticsRole`, and `excludeFromSemantics` — and renders the child through `Box(style: style, child: child)`.

## Sizing Decision Tree

See [`styler-api-policy.md`](styler-api-policy.md) for the canonical sizing and composition decision tree.
See [`layout.md`](layout.md) when choosing among Box, Flex, Wrap, Grid, and Stack.

## Composition via Merge

Use `merge()` for combining reusable style fragments; see [`styler-api-policy.md`](styler-api-policy.md) for the reference example. Later replacement values override earlier ones, while Mix values merge field-by-field before resolving.

## Callable Stylers

Widget-backed generated Stylers support `call()` for inline widget creation. This includes `BoxStyler`, `TextStyler`, `IconStyler`, `ImageStyler`, `FlexBoxStyler`, `WrapBoxStyler`, and `StackBoxStyler`; layout-only stylers such as `FlexStyler`, `WrapStyler`, and `StackStyler` do not create widgets directly. `GridBoxStyler` is handwritten and is not callable; construct `GridBox(style: ..., children: ...)` explicitly.

```dart
BoxStyler().color(Colors.blue).paddingAll(16)(child: Text('Hello'))
// Equivalent to: Box(style: BoxStyler()..., child: Text('Hello'))
```
