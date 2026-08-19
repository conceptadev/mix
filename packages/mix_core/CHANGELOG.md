## 0.1.0-dev.0

Initial extraction of the platform-neutral Mix styling engine from
`package:mix`, generic over an opaque resolution-context type `C`:

- `Prop<C, V>` with value/token/Mix sources, accumulation merging, and
  directive application; `PropSource`, `PropOps`, converter registry
  (`MixConverterRegistry.instanceOf<C>()`).
- `Mix<C, T>`, `Mixable`, `Resolvable<C, V>`, plus the `Buildable<C, V>` and
  `ContextMergeable<C, T>` engine hooks.
- `MixToken<C, T>` and `TokenStore<C>` (value-or-resolver entries, last-wins
  merge).
- `Variant`, `NamedVariant`, `EnumVariant`, `ContextVariant<C>` (with
  `stateDependencies`), `ContextVariantBuilder<C, St>`,
  `StyleVariation<C, St>`.
- `StyleBase<C, R, Self>`: the variant fold (`mergeActiveVariants`/`build`),
  `VariantStyle`, `mergeStyles`/`mergeVariantLists`, `IdentityElement`, and
  the state-dependency traversal.
- `Spec<T>`, `Equatable` and the props equality helpers, `Directive<T>`,
  `Breakpoint`, `NodeModifier<N>` with `reorderByType` and
  `mergeKeyedWithReset`.

Pure Dart — no Flutter or `dart:ui`, enforced by a purity test. See
`PLATFORM_GUIDE.md` for building a non-Flutter styling platform on top.
