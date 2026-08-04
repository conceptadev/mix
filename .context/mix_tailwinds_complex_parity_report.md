# Complex Tailwind CSS v4.3.1 parity comparison

## Scope

This comparison exercises ten representative multi-utility class strings against
observable `mix_tailwinds` Flutter runtime output. The Tailwind side is the package's
pinned v4.3.1 inventory (`8a14a710102cae195f6811e8578bef9477bc6be9`), its
generated candidate CSS fixtures, and standard Tailwind theme semantics. The Flutter
side is measured from rendered widget size, decoration, text, transform matrices,
responsive layout, pointer state, and animation frames.

This is a semantic/metric comparison, not a browser pixel-diff run. It deliberately
does not use the example HTML's Tailwind CDN dependency.

## Results

| Case | Tailwind classes | Result | Executed runtime evidence |
|---|---|---|---|
| 01 | `w-80 h-48 p-6 bg-slate-900 border-2 border-slate-700 rounded-2xl shadow-lg` | MATCH | 320×192 border-box, 24 px padding, expected colors, 16 px radius, and both `shadow-lg` layers. |
| 02 | `p-2 px-6 pt-4 m-2 mx-4 mt-8 bg-red-500` and reverse | MATCH | Both token orders resolved padding `(24,16,24,8)`, margin `(16,32,16,8)`, and red-500. |
| 03 | `w-[37px] h-[29px] bg-[#123456]/[50%] translate-x-[11px] -translate-y-[7px]` | MATCH | Rendered 37×29, ARGB `0x80123456`, translated `(11,-7)`. |
| 04 | `text-2xl font-bold leading-tight tracking-tight text-slate-700 uppercase text-center truncate` | DIVERGES | Tailwind-correct height/tracking is `1.25/-0.6px`; runtime produced `1.333/-0.4px`. Other typography fields matched. |
| 05 | `bg-linear-to-br from-blue-500 via-purple-500 to-pink-500` | MATCH | Three exact colors/stops and CSS rectangle-aware diagonal transform matched. |
| 06 | `translate-x-4 -translate-y-2 rotate-45 scale-105` | MATCH | All 16 composite matrix entries matched Tailwind's translate → rotate → scale order. |
| 07 | `w-full md:w-1/2 lg:w-1/3 h-12 bg-blue-500` | MATCH | Widths were 600 at 600 px, 450 at 900 px, and 400 at 1200 px. |
| 08 | `flex flex-col gap-2 md:flex-row md:gap-6 items-center justify-between` | MATCH | 600 px resolved vertical/8 px; 900 px resolved horizontal/24 px; alignment matched. |
| 09 | `w-24 h-24 bg-white dark:bg-slate-900 dark:hover:bg-blue-900` | DIVERGES | Dark base resolved slate-900; pointer hover incorrectly remained slate-900 instead of blue-900. |
| 10 | `w-24 h-24 bg-red-500 hover:bg-blue-500 transition-colors duration-300 ease-in-out delay-100` | MATCH | Stayed red during 100 ms delay, interpolated during 300 ms duration, ended blue-500. |

## Findings

### Typography composition

- Observed: `text-2xl`'s default line height overwrites explicit `leading-tight`
  after canonical candidate sorting; tracking remains a fixed `-0.4px` value.
- Tailwind-correct: an explicit line-height utility overrides the font-size default,
  and `tracking-tight: -0.025em` resolves to `-0.6px` at a 24 px font size.
- Minimal fix: model utility precedence at the affected CSS-property level so an
  explicit `leading-*` wins over a `text-*` default line height; retain tracking as
  an em value or resolve it after final font-size selection.
- Verification: unskip case 04 and add order-reversed typography controls.

### Nested dark/hover state discovery

- Observed: `dark:hover:` correctly resolves the dark condition but its nested hover
  dependency is not discovered, so a bare `Div` has no interaction detector.
- Tailwind-correct: the declaration applies only when dark and hover are both true.
- Minimal fix: recursively collect widget-state dependencies inside nested variants
  in Mix core.
- Verification: unskip case 09 and test all light/dark × hovered/not-hovered states.

## Verdict

Eight of ten sampled complex cases match. `mix_tailwinds` is therefore useful across
substantial layout and visual styling paths, but it is not completely Tailwind-correct.
The two correct-behavior regressions remain skipped so the package suite stays green.

## Verification

- `fvm flutter test test/complex_tailwind_parity_test.dart`:
  `00:00 +8 ~2: All tests passed!`
- `fvm flutter test`:
  `00:04 +480 ~9: All tests passed!`
- `fvm dart analyze packages/mix_tailwinds`: `No issues found!`
- `fvm dart format --output=none --set-exit-if-changed ...`:
  `Formatted 1 file (0 changed)`
- `git diff --name-only origin/main...HEAD -- packages/mix`: no output.
