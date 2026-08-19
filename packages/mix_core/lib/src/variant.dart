// Ported from package:mix `src/variants/variant.dart` (the context-agnostic
// portion), genericized over the resolution context type [C].
//
// Changes from the mix version:
// - `Variant` is `abstract` instead of `sealed`: platform packages subclass
//   [ContextVariant] outside this library (the sealed exhaustiveness was only
//   used for named-vs-context dispatch, which `is NamedVariant` covers).
// - `ContextVariant<C>` takes a `bool Function(C)` predicate. All concrete
//   context variants (widget states, brightness, breakpoints, media queries)
//   are platform-side, as is `widgetStateDependencies` discovery.
// - `ContextVariantBuilder` and `StyleVariation` reference `Style` and stay
//   platform-side until Style's core split lands.

import 'package:meta/meta.dart';

/// Base class for all variant types.
@immutable
abstract class Variant {
  const Variant();

  /// Factory method to create a named variant
  static NamedVariant named(String name) => NamedVariant(name);

  /// Human-readable label used for diagnostics.
  ///
  /// This label is not guaranteed to be unique across variant kinds.
  String get key;
}

/// Manual variants applied when explicitly requested.
@immutable
class NamedVariant extends Variant {
  final String name;

  const NamedVariant(this.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is NamedVariant && other.name == name;

  @override
  String toString() => 'NamedVariant($name)';

  @override
  String get key => name;

  @override
  int get hashCode => name.hashCode;
}

/// Variants that automatically apply based on context conditions.
@immutable
class ContextVariant<C> extends Variant {
  final bool Function(C) shouldApply;

  @override
  final String key;
  const ContextVariant(this.key, this.shouldApply);

  /// Check if this variant should be active for the given context
  bool when(C context) {
    return shouldApply(context);
  }
}

/// Context variant that applies when another context variant does not.
final class NotVariant<C> extends ContextVariant<C> {
  final ContextVariant<C> inner;

  NotVariant(this.inner)
    : super('not_${inner.key}', (context) => !inner.when(context));

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is NotVariant && other.inner == inner;

  @override
  int get hashCode => inner.hashCode;
}

// Helper functions for cleaner variant checking
bool hasVariant(List<NamedVariant> activeVariants, NamedVariant variant) =>
    activeVariants.contains(variant);

bool hasAnyVariant(
  List<NamedVariant> activeVariants,
  List<NamedVariant> variants,
) => variants.any((variant) => activeVariants.contains(variant));

bool hasAllVariants(
  List<NamedVariant> activeVariants,
  List<NamedVariant> variants,
) => variants.every((variant) => activeVariants.contains(variant));

/// Mixin for enums that act as [NamedVariant]s.
///
/// Apply this mixin to an enum to use its values as named variants:
/// ```dart
/// enum ButtonVariant with EnumVariant { primary, secondary, outlined }
/// ```
mixin EnumVariant on Enum implements NamedVariant {
  @override
  String get key => _EnumName(this).name;

  @override
  String get name => _EnumName(this).name;
}

extension type const _EnumName(Enum _value) implements Enum {
  String get name => _value.name;
}
