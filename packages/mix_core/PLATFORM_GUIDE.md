# Building a styling platform on mix_core

mix_core is the platform-agnostic Mix styling engine: props, tokens,
directives, variants, the style merge/resolve pipeline, modifier ordering,
and the token-table algebra — pure Dart, zero Flutter. package:mix is the
Flutter binding; this guide is for building another one (terminal UI,
Jaspr, ...).

**The executable version of this guide is
[`test/reference_binding_test.dart`](test/reference_binding_test.dart)** — a
complete miniature terminal binding in ~250 lines. Read it side by side with
this document.

## The one idea

The engine never inspects the resolution context. Everything is generic over
an opaque context type `C`; the engine only passes it through to hooks *you*
implement. Flutter binds `C = BuildContext`; your platform binds whatever
carries its ambient state (a context object threaded through your render
pass is the simplest choice).

## What you implement

### 1. A context type

A class carrying whatever resolution needs: your token table
([`TokenStore<C>`]), interaction states, dimensions, theme brightness —
anything your variants and tokens want to read.

```dart
class TermContext {
  final TokenStore<TermContext> tokens;
  final Set<String> states;   // focused, hovered, ...
  final int columns;
}
```

### 2. Tokens

Subclass `MixToken<C, T>` and implement `resolve(C)` — typically a
`TokenStore` lookup. `TokenStore` entries hold either a value or a
`T Function(C)` resolver, and merge last-wins (that's the whole theming
model; mix's `MixScope` delegates to the same class).

### 3. Specs and an envelope

A `Spec<T>` subclass is your resolved, immutable style data (`copyWith` +
`lerp` — `lerp` is what makes animation possible later, for free). Pair it
with an envelope type carrying resolved metadata alongside the spec
(package:mix's `StyleSpec<S>` carries widget modifiers + animation config).

### 4. Styles

Extend `StyleBase<C, R, Self>` (R = your envelope). You write: the `Prop`
fields, `merge` (field-wise `Prop.mergeProp` + `mergeVariantLists`),
`resolve`, and fluent setters that merge single-field instances. You inherit:
the entire variant fold (`mergeActiveVariants` / `build`), with its
guarantees — state-dependent variants apply after state-free ones,
declaration order is preserved within a group, nested variants recurse,
`IdentityElement` styles short-circuit merging.

Concrete variants are yours too: construct `ContextVariant<C>` with a
predicate over your context; override `stateDependencies` on variants that
read interaction state so `style.stateDependencies` can tell your
interactivity layer what to track.

### 5. Node modifiers + a render entry point

Implement `NodeModifier<N>` over your node type, order resolved modifiers
with `reorderByType` (your own default order), and apply them as a reversed
fold — first in the list is the outermost wrapper. Your render entry point
is the platform's `StyleBuilder`: resolve inherited style → check
`stateDependencies` → `style.build(context)` → paint the spec → apply
modifiers.

## Optional engine hooks

| Hook | When |
| --- | --- |
| `MixConverterRegistry.instanceOf<C>()` | auto-convert raw values to Mix types during resolution |
| `Buildable<C, V>` | a Mix value that must apply variants when nested inside a Prop (styles implement this) |
| `ContextMergeable<C, T>` | a Mix type needing context-aware merge decisions |
| `Directive<T>` | value transformations applied after resolution (`.withOpacity`-style) |
| token ref sentinels | `token()` call syntax; sentinels implement your value interfaces, detected in your `Prop.value` facade (see mix's `token_refs.dart`) |
| `mixCoreDebugLog` | route engine debug diagnostics to your logger |

## What you can defer

- **Animation**: `Spec.lerp` is the interpolation primitive; ship without
  drivers and add a frame-clock curve driver later, purely additively.
- **Reactive scopes with per-state granularity**: a context object threaded
  through rendering is enough; Flutter's `InheritedModel` granularity is a
  perf refinement, not a requirement.
- **Code generation**: hand-write your stylers first (the reference binding
  shows the shape); mix_generator is Flutter-specific today.

## The purity contract

mix_core must never import Flutter or `dart:ui` — enforced by
`test/purity_test.dart` and by this package having no Flutter dependency.
Your platform package should add the same gate against whatever it must not
depend on.
