# mix_tailwinds complex visual comparison

Date: 2026-08-04

## Outcome

The ten complex cases now have the same paired comparison workflow as the
dashboard and card-alert examples. The batch captured Tailwind CSS 4.3.1 and
Flutter at 480, 768, and 1024 pixels, including dark-hover for case 09 and the
completed delayed-hover transition for case 10. All 30 pairs completed and all
17 mirrored class-bearing nodes passed the source-parity guard.

Only case 03 is byte-for-byte identical. Cases 01, 05, 07, 08, and 10 match
their intended geometry/state but use different named colors. Cases 02, 04,
06, and 09 have substantive runtime divergence.

The tolerant metric is retained for compatibility with the existing dashboard
workflow. It must not be used alone: its `0.1` threshold can classify nearby
Tailwind-v4 and Flutter colors as zero difference. The strict (`0.01`) and
exact RGBA metrics expose that drift.

## Verdicts

Strict percentages are ordered 480 / 768 / 1024.

| ID | Compared behavior | Capture state | Strict diff % | Verdict | Executed evidence |
|---|---|---:|---:|---|---|
| 01 | card size, padding, border, radius, shadow | static | 0.1661 / 0.1661 / 0.1661 | GEOMETRY-MATCH / COLOR-DIVERGES | Box geometry overlays; named slate border/surface and shadow raster are not exact. |
| 02 | forward/reverse padding and margin precedence in `flex-col` | static | 35.0000 / 38.7500 / 40.3125 | DIVERGES | Both red outer boxes have matching bounds, proving spacing precedence; each Tailwind white child is 64px wide while Flutter stretches it to the content width. Red-500 also differs. |
| 03 | arbitrary size, alpha hex, positive/negative translate | static | 0 / 0 / 0 | EXACT MATCH | Every captured RGBA byte matches at all widths. |
| 04 | 2xl/bold/leading/tracking/uppercase/center/truncate | static | 8.0180 / 8.0180 / 8.0180 | DIVERGES | Tailwind non-background bounds are `(16,21)-(189,39)`; Flutter is `(22,24)-(185,40)`, with different text metrics and slate color. |
| 05 | v4 diagonal three-stop gradient | static | 69.9370 / 69.9370 / 69.9370 | GEOMETRY-MATCH / COLOR-DIVERGES | Gradient rectangle and direction align; all three named stops use different palette values. |
| 06 | translate + rotate + scale on emerald square | static | 26.9640 / 26.9640 / 26.9640 | NOT RENDERED | Tailwind paints 10,512 non-background pixels in `(40,16)-(183,159)`; Flutter paints none because `emerald-500` is absent from the default theme. |
| 07 | `w-full md:w-1/2 lg:w-1/3` | static | 14.0000 / 7.1875 / 4.8340 | RESPONSIVE-MATCH / COLOR-DIVERGES | Left alignment and full/half/third widths overlay at all breakpoints; blue-500 differs. |
| 08 | responsive column/row, gap, alignment, space-between | static | 2.9492 / 1.8408 / 1.3806 | RESPONSIVE-MATCH / COLOR-DIVERGES | All three box bounds overlay at every width; blue/purple/pink named colors differ. |
| 09 | `dark:hover` background | dark-hovered | 56.2500 / 56.2500 / 56.2500 | STATE-DIVERGES | Tailwind paints the 96×96 subject `#1c398e`; Flutter remains slate `#0f172a`. |
| 10 | delayed 300ms hover color transition | hovered after 500ms | 56.2500 / 56.2500 / 56.2500 | STATE-MATCH / COLOR-DIVERGES | Both render the completed blue hover state in the same 96×96 bounds; Tailwind uses `#2b7fff`, Flutter `#3b82f6`. |

## Ranked findings and minimal fixes

### P1 — Tailwind 4.3.1 default color data is stale and incomplete

- **Validated — location:** `lib/src/theme/data/default_theme.g.dart:2` says the
  file is generated from Tailwind 4.3.1, but `:93-120` contains older palette
  values and omits required keys including `emerald-500` and `blue-900`.
- **Executed — observed:** the local pinned Tailwind renderer produced
  blue-500 `#2b7fff` versus Flutter `#3b82f6`, and red-500 `#fb2c36` versus
  Flutter `#ef4444`. Case 06 is fully transparent on Flutter because its named
  color is unavailable. Cases 01, 02, 04, 05, 07, 08, and 10 also expose
  palette drift.
- **Tailwind-correct:** use the values resolved by the pinned
  `@tailwindcss/browser@4.3.1` fixture, which is the same version recorded by
  the package parser snapshot.
- **Minimal fix:** regenerate the default theme color map from the pinned v4.3.1
  theme rather than maintaining a partial older map; update color assertions
  from that same generated source.
- **Verification:** rerun `npm run compare:complex`; flat named-color regions
  should have zero strict diff, case 06 must paint the rotated emerald square,
  and every referenced default color must resolve without diagnostics.

### P1 — compound `dark:hover` does not reach hovered state

- **Validated — location:** nested paths are wrapped in reverse order at
  `lib/src/translate/tw_translator.dart:918-923`; hover and dark are separately
  created at `:942-950`, but interaction discovery does not activate the nested
  hovered style. `blue-900` is also missing from the default map.
- **Executed — observed:** after the same pointer coordinate and dark color
  scheme were applied to both pages, Tailwind rendered `#1c398e`; Flutter stayed
  `#0f172a` across the entire 9,216-pixel subject at all three widths.
- **Tailwind-correct:** `dark:hover:bg-blue-900` must override
  `dark:bg-slate-900` while dark mode and hover are both true.
- **Minimal fix:** make nested runtime variants expose their interaction state
  to the detector (or flatten equivalent compound predicates) and add the
  v4.3.1 `blue-900` token.
- **Verification:** capture case 09 unhovered and hovered in dark mode; it must
  transition slate-900 → blue-900, and leaving hover must restore slate-900.

### P2 — base fixed widths stretch inside a Tailwind column

- **Validated — location:**
  `lib/src/tw_widget.dart:749-759` only recognizes width candidates through the
  responsive-token path, and `:762-783` applies `centerStart` protection only
  when that check succeeds.
- **Executed — observed:** case 02 uses the same `flex w-full flex-col` wrapper
  on both sides. Tailwind renders each `w-16` white child at 64px; Flutter
  stretches it to 368px at 480. The red outer bounds and both forward/reverse
  spacing combinations match.
- **Tailwind-correct:** an explicit base `w-16` overrides cross-axis stretch in
  a column, independently of class order.
- **Minimal fix:** treat active base width candidates as explicit widths in the
  stretch-column wrapper, while preserving breakpoint override selection.
- **Verification:** add a widget test for base and responsive widths as children
  of `Div(classNames: 'flex flex-col')`, then rerun case 02 for a zero geometry
  diff (palette differences handled by the color fix).

### P2 — explicit leading and em-based tracking lose Tailwind precedence

- **Validated — location:** applying a font size assigns its default line height
  at `lib/src/translate/tw_translator.dart:672-684`; `tracking-tight` is stored
  as a fixed `-0.4` at `:1183-1195` rather than Tailwind's `-0.025em` resolved
  against the final font size.
- **Executed — observed:** case 04 has a stable 8.018% strict diff at every
  width, with different painted text bounds despite the same bundled font and
  identical class string.
- **Tailwind-correct:** explicit `leading-tight` wins over the `text-2xl`
  default line height, and `tracking-tight` resolves to `-0.6px` at 24px.
- **Minimal fix:** track whether line height is explicit before applying the
  font-size default, and resolve em tracking after final font-size resolution.
- **Verification:** assert resolved height `1.25` and letter spacing `-0.6`, then
  rerun case 04 and inspect the strict diff/text bounds.

## What is already clear and fixable

- Spacing precedence is clear and works: case 02's outer red boxes align on both
  sides even when the padding/margin utilities are reversed.
- Responsive width, responsive flex direction/gap/alignment, arbitrary values,
  gradient geometry, and delayed hover completion are wired correctly.
- The palette regeneration, base-width stretch, and typography fixes are local
  and well specified. Compound hover is also reproducible, but may require the
  interaction-layer work already gated for a later core review.

No production `lib/` code was changed during this comparison.

## Reproduction and artifacts

- Flutter fixture: `packages/mix_tailwinds/example/lib/complex_parity_preview.dart`
- Tailwind fixture: `packages/mix_tailwinds/example/real_tailwind/complex-parity.html`
- Source/render smoke guard: `packages/mix_tailwinds/example/test/complex_parity_preview_test.dart`
- Batch runner: `packages/mix_tailwinds/tool/visual-comparison/run-complex-comparison.mjs`
- Per-case runner: `packages/mix_tailwinds/tool/visual-comparison/run-visual-comparison.mjs`
- Generated artifacts (gitignored):
  `packages/mix_tailwinds/visual-comparison/complex-parity/`
- Aggregate machine-readable result:
  `packages/mix_tailwinds/visual-comparison/complex-parity/summary.json`

Executed commands:

```text
cd packages/mix_tailwinds/example
fvm flutter test test/complex_parity_preview_test.dart
...
00:00 +2: All tests passed!

cd packages/mix_tailwinds/tool/visual-comparison
npm run compare:complex
...
expectedCaseCount: 10; completedCaseCount: 10; failures: []

cd packages/mix_tailwinds
fvm flutter test
...
00:04 +480 ~9: All tests passed!

cd packages/mix_tailwinds/example
fvm flutter test
...
00:02 +12: All tests passed!

cd <repo-root>
fvm dart analyze packages/mix_tailwinds
Analyzing mix_tailwinds...
No issues found!

cd packages/mix_tailwinds/tool/visual-comparison
node --check run-visual-comparison.mjs
node --check run-complex-comparison.mjs
npm ls @tailwindcss/browser --depth=0
└── @tailwindcss/browser@4.3.1
```
