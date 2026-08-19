# mix_core

Platform-agnostic styling engine for Mix: props, tokens, directives,
variants, the style merge/resolve pipeline (`StyleBase`), modifier ordering,
and the token-table algebra. Pure Dart — no Flutter, no `dart:ui`. Enforced
by `test/purity_test.dart` and by this package having no Flutter dependency
at all.

package:mix consumes this engine (binding `C = BuildContext`); to build a
styling package for another platform (terminal UI, Jaspr), start with
[`PLATFORM_GUIDE.md`](PLATFORM_GUIDE.md) and its executable companion,
[`test/reference_binding_test.dart`](test/reference_binding_test.dart).
Background: [`guides/mix-core-extraction-plan.md`](../../guides/mix-core-extraction-plan.md).

## The idea

The Mix engine (props, tokens, directives, variants, merge/resolve pipeline)
never *dereferences* Flutter's `BuildContext` — it only passes it through to
two platform hooks: token resolution and context-variant predicates. So the
context here is an opaque type parameter `C`:

- **package:mix** (Flutter) binds `C = BuildContext`
  (`typedef Prop<V> = core.Prop<BuildContext, V>` plus thin subclasses),
  keeping its public API unchanged.
- A **terminal UI** or **Jaspr** styling package binds its own context type.

A platform binds the engine by providing:

| Hook | How |
| --- | --- |
| Token resolution | subclass `MixToken<C, T>` and implement `resolve(C)` |
| Conditional styling | construct `ContextVariant<C>` with a `bool Function(C)` |
| Value → Mix conversion | register into `MixConverterRegistry.instanceOf<C>()` |
| Nested style building | implement `Buildable<C, V>` on style-like Mix types |
| Context-aware merging | implement `ContextMergeable<C, T>` on Mix types |
| Token ref sentinels (`token()` call syntax) | platform-side `Prop.value` facade + sentinel types |

See `test/terminal_poc_test.dart` for a complete fake terminal platform
binding exercising the full pipeline.
