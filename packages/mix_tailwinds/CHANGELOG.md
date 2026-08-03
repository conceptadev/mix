## Unreleased

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
