# Plan: complete WidgetModifierConfig convenience APIs

Status: proposal for review only. This PR does not implement or release any API.

## Goal

Give every existing public modifier a dedicated `WidgetModifierConfig` factory,
and complete the corresponding fluent chaining methods. Callers should not need
`.modifier(SomeModifierMix(...))` for built-in modifiers.

The audit of Mix 2.2.0-beta.5 and published 2.1.0 found the same gaps:

| API | Factory | Instance chaining | Proposed work |
| --- | --- | --- | --- |
| `mouseCursor` | Missing | Missing | Add both |
| `scrollView` | Missing | Missing | Add both |
| `skew` | Exists | Missing | Add chaining |
| `defaultIcon` | Exists | Missing | Add chaining |
| `iconTheme` | Exists | Missing | Add chaining |
| `box` | Exists | Missing | Add chaining |
| `reset` | Exists | Missing | Add chaining with reset characterization tests |

## Scope and invariants

- Add convenience APIs only; reuse the existing modifier classes and factories.
- Keep current modifier ordering, merge keys, null/default handling, rendering,
  and animation behavior unchanged.
- Keep generic `modifier` and `modifiers` entry points for custom modifiers.
- Do not add convenience methods to every Styler, change generated exports,
  introduce new modifier types, or migrate the DartPad examples in this change.
- Do not change the signatures of existing factories or chaining methods.
- No dependency or package-version change is required by the implementation.

## 1. Lock the additive API contract

**File:** `packages/mix/lib/src/modifiers/widget_modifier_config.dart`.

- Add `mouseCursor(MouseCursor mouseCursor)` as a factory and instance method.
  Forward to `MouseCursorModifierMix(mouseCursor: mouseCursor)`. An explicit
  `MouseCursor.defer` restores inherited cursor behavior.
- Add `scrollView` as a factory and instance method with named, nullable
  `Axis? scrollDirection`, `bool? reverse`, `EdgeInsetsGeometryMix? padding`,
  `ScrollPhysics? physics`, and `Clip? clipBehavior`. Forward these unchanged to
  `ScrollViewModifierMix`; leave defaults with the existing modifier.
- Add instance `skew`, `defaultIcon`, `iconTheme`, and `box`, matching their
  existing factory signatures exactly and delegating through `merge`.
- Add instance `reset()` as `merge(WidgetModifierConfig.reset())`. Document that
  it clears preceding modifiers in that composition, not the configured ordering.
  Characterize the existing merge behavior before implementation; do not turn
  this task into a reset-algorithm redesign.

**Acceptance:** these proposed forms compile through `package:mix/mix.dart`:

```dart
final style = BoxStyler().wrap(
  .mouseCursor(SystemMouseCursors.click),
);

final wrappers = WidgetModifierConfig.opacity(0.8)
    .mouseCursor(SystemMouseCursors.click)
    .scrollView(scrollDirection: Axis.horizontal);
```

These are future APIs, not snippets supported by the currently published release.

## 2. Add focused contract and widget tests

**New file:** `packages/mix/test/src/modifiers/widget_modifier_config_test.dart`.
**Existing references:** `mouse_cursor_modifier_test.dart` and
`scroll_view_modifier_test.dart` in the same directory.

- Compare each new factory with the equivalent explicit modifier configuration.
- Verify every forwarded scroll and icon-theme option, including nullable values.
- Compare each new chain method with merging the corresponding factory result.
- Compile contextual dot shorthand through a Styler's `wrap` argument.
- Verify same-type modifiers merge without duplication, existing configurations
  remain immutable, and custom ordering survives chaining.
- Test that `opacity(...).reset().padding(...)` removes opacity, retains padding,
  and follows the existing reset factory's behavior when merged with another
  configuration. Cover repeated reset and reset on an empty configuration.
- Pump a cursor example and a constrained scroll example to confirm the factories
  produce the existing widgets and preserve their runtime behavior.

**Validation:** run `flutter test test/src/modifiers` from `packages/mix`.
If characterization exposes an existing behavior defect, record it separately
instead of silently broadening this additive API change.

## 3. Document and verify the implementation

**Files:** `packages/mix/lib/src/modifiers/widget_modifier_config.dart`,
`packages/mix/CHANGELOG.md`, and `guides/api-composition-guidelines.md`.

- Add concise Dart documentation for the new entry points, especially reset.
- Add a short composition example and an unreleased changelog entry.
- Run formatting and focused tests, then the repository's required checks from
  the root: `melos run gen:build && melos run ci && melos run analyze`.
- Inspect generation output and the complete base-to-head diff. Do not include
  unrelated regeneration, example cleanup, or dependency changes.
- Confirm the factory/chaining audit has no remaining gaps in this scope.

## Review and delivery

Review the names and signatures above before authorizing implementation. In
particular, approve `scrollView` as the name and `reset()` as an explicit fluent
operation. Implementation should be a separate focused PR with its own fresh
validation evidence; this plan-only PR does not claim those checks have passed.

The change is additive and requires no consumer migration. DartPad examples must
retain the existing `.modifier(...)` form until the new release is available on
their target channel. No release or publishing action is included in this plan.
