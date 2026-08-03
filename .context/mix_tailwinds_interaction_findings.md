# mix_tailwinds interaction and variant findings

## Scope and evidence basis

- **Executed:** `cd packages/mix_tailwinds && fvm flutter test` before new tests: `00:03 +447: All tests passed!`.
- **Executed:** each correct-behavior interaction test without a skip first. Failing output was captured before currently broken tests were marked with a `BROKEN:` reason.
- **Executed:** the full package suite after each group A through E; every group gate exited 0.
- **Validated:** Flutter 3.41.7 exposes `testWidgets(skip:)` as `bool?`, so each test file has a test-only wrapper that accepts the required `BROKEN: <reason>`, adds it to the test name, and delegates to `skip: true`.
- **Validated:** observed runtime behavior is compared with the canonical program's Tailwind semantics and with the pinned Tailwind v4.3.1 fixture output. `FLUTTER_ADAPTATIONS.md` is used only to distinguish documented adaptations from undocumented behavior.

## Verdict table

| Item | Verdict | Executed runtime evidence | Test |
|---|---|---|---|
| A1 | WORKS | Decoration resolved red → blue on mouse enter → red on exit. | `test/interaction/hover_interaction_test.dart:71` |
| A2 | WORKS | A point halfway through the 32 px left margin kept red; the inner border box turned blue. | `test/interaction/hover_interaction_test.dart:96` |
| A3 | BROKEN | Correct assertion expected opacity 1.0 while hovered; executed failure observed 0.5. | `test/interaction/hover_interaction_test.dart:134` |
| A4 | WORKS | The flex rendering branch resolved red → blue on hover. | `test/interaction/hover_interaction_test.dart:156` |
| A5 | WORKS | Rendered `Text.style.color` resolved red → blue → red for a plain `Span`. | `test/interaction/hover_interaction_test.dart:185` |
| B1 | WORKS | Held bare `Div` resolved blue and reverted red; it exposed no tap semantic action and its ancestor still received the tap. | `test/interaction/press_interaction_test.dart:47` |
| B2 | WORKS | `Pressable` propagated held state to its child (`red → blue → red`). | `test/interaction/press_interaction_test.dart:83` |
| B3 | WORKS | Siblings under one controller both became blue; with independent Pressables the unpressed sibling stayed red. | `test/interaction/press_interaction_test.dart:111` |
| B4 | WRONG-SEMANTICS | Margin-strip press produced `[blue500, 1 callback]`; CSS-correct expectation was `[red500, 0]`. | `test/interaction/press_interaction_test.dart:180` |
| C1 | WORKS | `FocusNode.requestFocus()` made the child decoration blue after focus settled. | `test/interaction/focus_keyboard_interaction_test.dart:42` |
| C2 | WORKS | Space and Enter each incremented `onPress` on a focused Pressable. | `test/interaction/focus_keyboard_interaction_test.dart:68` |
| C3 | BROKEN | Space hold produced `[red500, red500]` before/after release; correct held state was `[blue500, red500]`. | `test/interaction/focus_keyboard_interaction_test.dart:97` |
| C4 | WRONG-SEMANTICS | Pointer-triggered focus produced `[focused: true, blue500]`; `focus-visible:` should have stayed red for pointer modality. | `test/interaction/focus_keyboard_interaction_test.dart:130` |
| D1 | WORKS | Disabled resolved opacity 0.5/base red; enabled resolved opacity 1.0/`enabled:` blue. | `test/interaction/disabled_interaction_test.dart:53` |
| D2 | WORKS | Disabled tap and Space/Enter produced zero callbacks, focus stayed false, and hover stayed red. | `test/interaction/disabled_interaction_test.dart:86` |
| D3 | BROKEN | Actual disabled node had `actions: [tap]`, `isButton`, and no enabled-state flags; correct matcher requires disabled state and no tap action. | `test/interaction/disabled_interaction_test.dart:125` |
| D4 | WORKS | Tab moved from the first enabled Pressable to the third, skipping the disabled middle node. | `test/interaction/disabled_interaction_test.dart:153` |
| E1 | WRONG-SEMANTICS | Forward order resolved `[blue500, padding 16, blue500 hover]`; reverse resolved `[red500, padding 8, red500 hover]`. | `test/interaction/variant_correctness_interaction_test.dart:153` |
| E2 | BROKEN | Hover and breakpoint controls passed and `hover:md` worked, but wide+hovered `md:hover` stayed red. | `test/interaction/variant_correctness_interaction_test.dart:181` |
| E3 | WRONG-SEMANTICS | `dark:` correctly followed brightness, but `theme-midnight:` also followed platform dark (`blue500`, no warning) instead of its pinned `[data-theme="midnight"]` meaning. | `test/interaction/variant_correctness_interaction_test.dart:233` |
| E4 | NOT-WIRED | Leading `!important` reported successfully; arbitrary property, `@md:`, `group-hover:`, and `peer-hover:` each rendered the base red with an empty callback list. | `test/interaction/variant_correctness_interaction_test.dart:277`, `:290` |

## Ranked findings

### P1 — interaction or diagnostic paths cannot be relied on

#### P1 · Negated widget state is not discovered (A3)

- **What's wrong:** `Style.widgetStates` only collects top-level `WidgetStateVariant` instances at `packages/mix/lib/src/core/style.dart:68`; `not-hover:` is emitted as a `NotVariant` by `packages/mix_tailwinds/lib/src/translate/tw_translator.dart:765`. Consequently `StyleBuilder` does not insert its interaction detector (`packages/mix/lib/src/core/style_builder.dart:129`).
- **Executed — observed:** mouse entry left `not-hover:opacity-50` at 0.5.
- **Validated — Tailwind-correct:** `not-hover:` must stop applying when `:hover` becomes true.
- **Minimal fix:** recursively collect widget-state dependencies through `NotVariant` (including its inner `WidgetStateVariant`) in Mix core.
- **Verification:** unskip A3 and assert 0.5 → 1.0 → 0.5 across enter/exit.

#### P1 · Keyboard activation never drives pressed visuals (C3)

- **What's wrong:** `ActivateIntent` calls `onPress` directly at `packages/mix/lib/src/specs/pressable/pressable_widget.dart:179` without updating the state controller.
- **Executed — observed:** Space invoked the callback but the held decoration stayed red.
- **Validated — Tailwind/a11y-correct:** keyboard activation of a button needs the same held pressed feedback as pointer activation; the canonical program requires Space-down blue and key-up red.
- **Minimal fix:** use a key-aware activation path that sets `_controller.pressed` for the Space/Enter hold lifecycle and clears it on key-up/cancel while retaining activation callbacks.
- **Verification:** unskip C3 and add upstream Pressable tests for Space/Enter down, repeat, up, focus loss, and disable transitions.

#### P1 · Nested state discovery depends on variant order (E2)

- **What's wrong:** variant wrapping at `packages/mix_tailwinds/lib/src/translate/tw_translator.dart:745` can put hover beneath a breakpoint. Mix's top-level-only state discovery at `packages/mix/lib/src/core/style.dart:68` then misses `md:hover`, while `hover:md` works because hover is outermost.
- **Executed — observed:** simple hover and `md` controls behaved correctly; wide+hovered `hover:md` turned blue, while wide+hovered `md:hover` stayed red.
- **Validated — Tailwind-correct:** these responsive/hover conditions are commutative; both spellings require and respond to both conditions.
- **Minimal fix:** recursively discover widget-state dependencies inside nested variant styles, not only top-level variants.
- **Verification:** unskip E2 and keep both positive controls plus all four width/hover combinations for both stack orders.

#### P1 · Four documented adaptations disappear without diagnostics (E4)

- **What's wrong:** arbitrary properties and container/group/peer variants route to `TwRouteKind.ignored` at `packages/mix_tailwinds/lib/src/translate/tw_routing.dart:31`, `:66`, and `:76`; the translator reports only ignored important modifiers at `packages/mix_tailwinds/lib/src/translate/tw_translator.dart:218`.
- **Executed — observed:** `[color:red]`, `@md:bg-blue-500`, `group-hover:bg-blue-500`, and `peer-hover:bg-blue-500` each produced `[]`; `!bg-blue-500` was the passing control and did report.
- **Validated — correct 1.0 contract:** the features may remain unsupported adaptations, but no parsed token may disappear silently. `FLUTTER_ADAPTATIONS.md:228-232` documents their unsupported/ignored behavior, not permission for silent loss.
- **Minimal fix:** emit a structured diagnostic for every ignored/unsupported route, with reason and workaround where available; deduplicate at the `Div` boundary.
- **Verification:** unskip all four E4 cases and enumerate every `ignored`/`unsupported` routing branch in a diagnostic test.

### P2 — Tailwind or accessibility semantics are wrong

#### P2 · External Pressable includes CSS margin in its interaction box (B4)

- **What's wrong:** `_CssSemanticBox` correctly places margin outside its own detector at `packages/mix_tailwinds/lib/src/tw_widget.dart:245`, but a consumer-level Pressable wraps that outer padding; its opaque gesture boundary begins at `packages/mix/lib/src/specs/pressable/pressable_widget.dart:201`.
- **Executed — observed:** pressing the margin activated the blue style and invoked `onPress` once.
- **Validated — Tailwind-correct:** CSS margin is outside the element's interactive border box.
- **Minimal fix:** an integrated mix_tailwinds interactive widget must split margin first and put Pressable around only the inner border box; do not make `Div` itself clickable.
- **Verification:** unskip B4 for the integrated widget and assert both held color and callback count from margin and inner points.

#### P2 · `focus-visible:` is indistinguishable from `focus:` (C4)

- **What's wrong:** both roots map to `TwRuntimeVariantKind.focus` at `packages/mix_tailwinds/lib/src/translate/tw_routing.dart:155`.
- **Executed — observed:** a pointer tap that requested focus turned `focus-visible:bg-blue-500` blue.
- **Validated — Tailwind-correct:** `focus-visible` is modality-sensitive and should remain off for ordinary pointer focus while applying for keyboard focus.
- **Minimal fix:** add modality-aware focus-visible state, or explicitly choose and document the alias as an adaptation and classify it accordingly in the ledger.
- **Verification:** unskip C4 and add the complementary keyboard-focus case that must turn blue.

#### P2 · Disabled Pressable semantics remain actionable and role is fixed (D3)

- **What's wrong:** `Semantics(button: true, onTap: widget.onPress)` is unconditional at `packages/mix/lib/src/specs/pressable/pressable_widget.dart:231`; enabled state is not exposed, disabled still has tap, and role cannot be button/link/none.
- **Executed — observed:** Flutter 3.41 semantics output was `actions: [tap]`, flags `[isButton]`, with no enabled-state flags.
- **Validated — accessibility-correct:** disabled controls expose disabled state and no active action; reusable headless controls need an intentional role.
- **Minimal fix:** set `enabled`, omit `onTap` when disabled, and introduce a configurable semantic role with button/link/none at minimum.
- **Verification:** unskip D3 and add enabled/disabled/action/role semantics matrix tests using `isSemantics`.

#### P2 · Utility conflicts follow class-string order (E1)

- **What's wrong:** candidates are translated in input order at `packages/mix_tailwinds/lib/src/translate/tw_translator.dart:209`, so later tokens overwrite earlier accumulator values.
- **Executed — observed:** reversing tokens reversed base background, padding, and hovered background.
- **Validated — Tailwind-correct:** stylesheet utility order, not HTML class-string order, decides conflicts; reversal must preserve the same result.
- **Minimal fix:** canonically order parsed candidates by pinned snapshot utility order with a deterministic candidate tie-break before translation.
- **Verification:** unskip E1 and retain base, spacing, and variant conflict pairs in both input orders.

### P3 — undocumented adaptation or oddity

#### P3 · `theme-midnight` is hardcoded as platform dark (E3)

- **What's wrong:** `packages/mix_tailwinds/lib/src/translate/tw_routing.dart:171` aliases `theme-midnight` to `dark`; blame traces it only to the initial parity-tooling commit and no package documentation explains it.
- **Executed — observed:** light resolved red, dark resolved blue, and no unsupported callback fired.
- **Validated — Tailwind-correct:** the pinned v4.3.1 fixture at `packages/mix_tailwinds/test/fixtures/candidate-probes.json:1662` defines this custom variant as `[data-theme="midnight"]`, not system brightness. Native Flutter has no equivalent selector context by default.
- **Minimal fix:** remove the alias and diagnose it, or replace it with a documented configurable custom-variant mechanism.
- **Verification:** unskip E3; keep `dark:` light/dark controls and require `theme-midnight:` not to react to platform dark without explicit custom context.

## What this means

- **Executed:** basic bare-`Div` hover/press, flex hover, text hover, Pressable pointer propagation/isolation, focus visuals, Space/Enter callbacks, disabled visuals/input blocking, tab skipping, and `dark:` all work at HEAD.
- **Executed:** interaction cannot yet be relied on for `not-hover:`, Space-held `active:`, `md:hover` on a bare element, margin-safe external Pressable composition, or disabled accessibility semantics.
- **Validated — upstream `packages/mix`:** A3/E2 share Mix state-dependency discovery; C3/D3 are Pressable behavior.
- **Validated — `mix_tailwinds`:** B4 needs an integrated margin-aware control; C4, E1, E3, and E4 are routing/translation/accounting concerns.
- **Validated — adaptation status:** group/peer/container/arbitrary-property non-support is already documented, so the defect is silent diagnostics. `focus-visible` aliasing and `theme-midnight` aliasing are not documented and require an explicit decision.

## Final Part 1 suite proof

**Executed:** `cd packages/mix_tailwinds && fvm flutter test`

`00:04 +460 ~12: All tests passed!`
