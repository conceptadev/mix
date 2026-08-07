## Unreleased

- Fixed `self-start`, `self-end`, and `self-center`, which silently did nothing
  whenever the container carried an `items-*` utility. A flex holding a
  self-aligned child now renders through a `RenderFlex` that offsets those
  children after it has measured its cross axis, so the override also works in
  the common case of a row nested inside a column.

- **Breaking:** `TwConfig.standard()` now contains only Tailwind CSS 4.3.1
  defaults. The fixture-only `brand-500`, `card` spacing/radius, `3xl`
  breakpoint, and `shadow-card` values were removed; add project values with
  `TwConfig.copyWith` or explicit Mix composition.
- **Breaking (experimental alpha):** Removed `TwPressable` in favor of `Button`;
  rename `onPress` to `onPressed`. A null `onPressed` disables the control
  unless `onLongPress` supplies an action, and semantics are always button
  semantics. Its margin stays outside the pressed, tappable, and semantic
  border box.
- Added class-first lowercase convenience functions for `Div`, text, headings,
  `Button`, `TwIcon`, and `TruncatedP`. They return the concrete uppercase
  widgets; use those const-capable constructors for advanced options.
- `H1` through `H6` now expose matching Flutter semantics heading levels 1
  through 6.
- Generated every supported default theme namespace from a checked-in,
  versioned Tailwind 4.3.1 snapshot, including the complete stock palette and
  corrected radii, blurs, font line heights, leading, and tracking values.
- Resolve `tracking-*` em values against the final font size and preserve an
  explicit `leading-*` over font-size defaults in either class order, including
  inherited default text styles.
- Fixed nested interaction variants, routed `focus-visible` through input
  modality, and removed the non-Tailwind `theme-midnight` dark-mode alias.
- Fixed fixed/fraction/full/auto responsive width behavior under stretched
  Flutter constraints. Responsive `w-auto` and `h-auto` now clear earlier
  fixed constraints explicitly.
- Visual comparisons now enforce per-example, per-width acceptance contracts
  and generate a filterable, browser-smoked HTML light-table report after
  successful and failed runs.
- Added a source-backed web showcase for five product-scale examples with
  Tailwind/Flutter code comparison, published parity evidence, linkable
  viewports, and one-engine single/multi-view Flutter embedding modes.
- **Breaking (experimental alpha):** Removed the legacy `TwResolver`, the
  `wrapDefaultTextStyle` styler extensions, and unused `TwConfig` lookup
  helpers. Use `TwParser`, standard Mix composition, and the public config
  maps instead.
- **Breaking (experimental alpha):** Removed the unused semantic AST and plugin
  registry that were previously exported from `tw_semantic.dart`.
- Restored the hosted `mix: ^2.1.0` dependency so the package remains
  publishable by the repository release workflow.
- Added structured `TwDiagnostic` reporting through `onDiagnostic`; ignored
  adaptations and unsupported candidates no longer disappear silently. The
  token-only `onUnsupported` callback remains as a deprecated shim.
- Resolve conflicting utilities in canonical registry order so class-string
  order no longer changes base or variant output.
- Report unsupported `basis-*` flex item utilities through `onDiagnostic`
  instead of silently ignoring fraction, full, arbitrary, or unknown values.
- Keep supported `basis-auto` and spacing-scale basis utilities quiet while
  preserving the existing pixel-basis runtime behavior.
- Made the parser registry reproducible from a committed compact Tailwind
  registry snapshot and added a named Melos generation script.

## 0.0.1-alpha.1

- Initial alpha release of `mix_tailwinds`.
- Experimental Tailwind-like class utilities mapped to Mix 2.0 stylers.
