// Ported from package:mix `src/core/mix_element.dart`.
//
// The one architectural change of the mix_core extraction lives here: the
// resolution context is an opaque type parameter `C` instead of Flutter's
// `BuildContext`. The engine never dereferences the context — it only passes
// it through to two platform-implemented hooks: `MixToken.resolve(C)` and
// `ContextVariant.when(C)`. Flutter (package:mix) binds `C = BuildContext`;
// a terminal or Jaspr styling package binds its own context type.

import 'package:meta/meta.dart';

import 'equatable.dart';

/// Mixin for types that can be resolved to a value using a context [C].
///
/// Provides the ability to resolve context-dependent values like tokens,
/// responsive properties, or theme-dependent values. The context type is
/// platform-defined (e.g. `BuildContext` in Flutter).
mixin Resolvable<C, V> {
  /// Resolves this to a concrete value using the provided [context].
  V resolve(C context);
}

/// Base class for types that can be merged together.
///
/// Provides the ability to combine two instances of the same type,
/// typically used for combining style properties.
abstract class Mixable<T> {
  const Mixable();

  /// The key used to identify compatible types for merging.
  Object get mergeKey => runtimeType;

  /// Merges this instance with [other], with [other] taking precedence.
  Mixable<T> merge(covariant Mixable<T>? other);
}

/// Base class for Mix-compatible styling elements that are both mixable and
/// resolvable.
///
/// Combines the abilities to merge with other instances and resolve to
/// concrete values using a context [C]. This is the foundation for all
/// styling elements in Mix.
abstract class Mix<C, T> extends Mixable<T> with Resolvable<C, T>, Equatable {
  const Mix();

  @override
  Mix<C, T> merge(covariant Mix<C, T>? other);

  @override
  T resolve(C context);
}

/// Mixin for types that have default values.
///
/// Provides a way to specify default values that can be used when
/// no explicit value is provided or when resolution returns null.
mixin DefaultValue<Value> {
  /// The default value to use when no explicit value is available.
  @protected
  Value get defaultValue;
}

/// A [Mix] that must be built — variants applied against the context —
/// rather than resolved directly.
///
/// In package:mix, `Style` implements this: a style nested inside another
/// style's [Mix] value carries its own context variants (widget states,
/// brightness, breakpoints), which `build` applies and plain `resolve`
/// would silently drop. The engine checks for this interface when resolving
/// merged Mix values so nested styles keep their variants.
abstract interface class Buildable<C, V> {
  /// Builds the value for [context], applying any context variants first.
  V build(C context);
}

/// A [Mix] that customizes how it merges with another value of the same
/// merge key when a resolution context is available.
///
/// In package:mix, `DecorationMix` and `ShapeBorderMix` implement this to
/// make context-aware merging decisions (previously hardcoded in the merge
/// pipeline). Return null to fall back to the plain [Mixable.merge].
///
/// [T] must be the abstract value type of the [Prop] the values live in
/// (`Decoration`, not `BoxDecoration`): the engine tests
/// `a is ContextMergeable<C, V>` against the prop's `V` and silently falls
/// back to [Mixable.merge] otherwise. Narrower props cannot hold cross-type
/// values, so nothing is lost there.
abstract interface class ContextMergeable<C, T> {
  /// Attempts a context-aware merge with [other].
  ///
  /// Returns null when no special handling applies, in which case the
  /// engine falls back to [Mixable.merge].
  Mix<C, T>? tryMergeWith(C context, covariant Mix<C, T> other);
}
