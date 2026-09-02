// Ported from package:mix `src/core/style.dart` (the platform-neutral
// portion), genericized over:
//
//   C    — the resolution context type (Flutter binds `BuildContext`)
//   R    — the resolved envelope type (Flutter binds `StyleSpec<S>`)
//   Self — the concrete style type, for fluent covariant signatures
//
// What stays platform-side: the envelope type itself (modifiers/animation
// payloads), widget-tree lookups (`Style.of`), and all concrete context
// variants. The variant fold's ordering and identity semantics are
// load-bearing — this is a verbatim port, not a redesign.

import 'equatable.dart';
import 'mix_element.dart';
import 'variant.dart';

/// Marker interface for styles that act as a merge identity.
///
/// [mergeStyles] returns the other operand when one side is an identity,
/// without calling `merge` — so a platform's identity style never needs to
/// know the concrete type it merges with. package:mix's `IdentityStyle`
/// implements this.
abstract interface class IdentityElement {}

/// Base class for style classes that can be resolved to a value of type [R].
///
/// Provides variant support and the merge/resolve pipeline for styled
/// elements. Platform packages layer their own metadata on top (package:mix
/// adds widget modifiers and animation configuration).
abstract class StyleBase<C, R, Self extends StyleBase<C, R, Self>>
    extends Mix<C, R>
    implements Buildable<C, R> {
  final List<VariantStyle<C, R, Self>>? $variants;

  const StyleBase({required List<VariantStyle<C, R, Self>>? variants})
    : $variants = variants;

  /// Interaction-state dependencies declared anywhere in this style's
  /// variant tree.
  ///
  /// Walks the `$variants` graph collecting [ContextVariant.stateDependencies].
  /// Only context-variant-headed entries are walked: named-variant branches
  /// are inert until hoisted, and builder variants ignore their stored
  /// placeholder value at resolution.
  Set<Object> get stateDependencies => collectStateDependencies<Object>();

  /// [stateDependencies] narrowed to [T] in the same single pass (package:mix
  /// uses `collectStateDependencies<WidgetState>()`).
  Set<T> collectStateDependencies<T extends Object>() {
    final states = <T>{};
    // Identity, not equality, and it earns its keep twice over:
    //  1. Cycles. `$variants` is stored by reference, so a caller can pass a
    //     list to a styler constructor and then append the styler to that same
    //     list. Value equality would also recurse forever comparing the cycle.
    //  2. Sharing. A style instance can be shared between multiple context-
    //     variant branches, so identity avoids visiting it more than once.
    final visited = Set<StyleBase<C, R, Self>>.identity();

    void collectDependencies(StyleBase<C, R, Self> style) {
      if (!visited.add(style)) return;

      final variants = style.$variants;
      if (variants == null) return;

      for (final variantStyle in variants) {
        final variant = variantStyle.variant;
        if (variant is ContextVariant<C>) {
          for (final dependency in variant.stateDependencies) {
            if (dependency is T) states.add(dependency);
          }
          collectDependencies(variantStyle.value);
        }
      }
    }

    collectDependencies(this);

    return states;
  }

  /// Merges all active variants with their nested variants recursively.
  ///
  /// Evaluates which variants are active in [context] and against
  /// [namedVariants], then recursively resolves the nested variants inside
  /// each active variant's style.
  ///
  /// Active variants apply in two priority groups, lowest first: those that
  /// declare no [ContextVariant.stateDependencies], then those that do.
  /// Within a group, the variant declared last merges last and so wins on
  /// the properties they share.
  Self mergeActiveVariants(
    C context, {
    required Set<NamedVariant> namedVariants,
  }) {
    final variants = $variants;
    if (variants == null) return this as Self;

    // Partition, don't sort: declaration order inside a group is load-bearing,
    // and List.sort is only stable by accident of the insertion sort it falls
    // back to below 32 elements.
    final lowPriority = <VariantStyle<C, R, Self>>[];
    final highPriority = <VariantStyle<C, R, Self>>[];

    for (final variantAttr in variants) {
      final variant = variantAttr.variant;

      final isActive = switch (variant) {
        ContextVariant<C>() => variant.when(context),
        NamedVariant() => namedVariants.contains(variant),
        ContextVariantBuilder<C, Object?>() => true,
        _ => _unknownVariant(variant, false),
      };
      if (!isActive) continue;

      // Keyed off the declaration, not the class: a focus-visible variant is
      // not a widget-state variant yet reads the focused state just the same,
      // and NotVariant forwards whatever its inner variant reads.
      final readsState =
          variant is ContextVariant<C> && variant.stateDependencies.isNotEmpty;

      (readsState ? highPriority : lowPriority).add(variantAttr);
    }

    // Extract the style from each active variant
    final stylesToMerge = <(Self, bool)>[];

    for (final variantAttr in lowPriority.followedBy(highPriority)) {
      final variant = variantAttr.variant;
      // (style, isFromStyleVariation); the stored value is the default.
      var result = (variantAttr.value, false);
      if (variant is ContextVariantBuilder<C, Object?>) {
        result = (variant.build(context) as Self, false);
        // ignore: avoid-unrelated-type-assertions
      } else if (variantAttr.value case final StyleVariation<C, Self> variation
          when namedVariants.contains(variation.variantType)) {
        // An active StyleVariation builds its own final style.
        result = (
          variation.styleBuilder(this as Self, namedVariants, context),
          true,
        );
      }
      stylesToMerge.add(result);
    }

    // Start with current style as base
    Self mergedStyle = this as Self;

    // Merge each variant style, recursively resolving nested variants
    for (final (variantStyle, isFromStyleVariation) in stylesToMerge) {
      final fullyResolvedStyle = isFromStyleVariation
          // For StyleVariation results, we don't recursively resolve variants
          // since StyleVariation.styleBuilder should handle its own variant logic
          // and return a final style. This prevents infinite recursion.
          ? variantStyle
          // For regular variants, recursively resolve any nested variants
          : variantStyle.mergeActiveVariants(
              context,
              namedVariants: namedVariants,
            );
      mergedStyle = mergeStyles<C, R, Self>(mergedStyle, fullyResolvedStyle);
    }

    return mergedStyle;
  }

  /// Resolves this style to its concrete envelope value using [context].
  @override
  R resolve(C context);

  /// Merges this style with another style of the same type.
  @override
  Self merge(covariant Self? other);

  /// Builds the style into a fully resolved value.
  ///
  /// Applies active variants first, then resolves.
  @override
  R build(C context, {Set<NamedVariant> namedVariants = const {}}) {
    final styleData = mergeActiveVariants(
      context,
      namedVariants: namedVariants,
    );

    return styleData.resolve(context);
  }
}

/// Merges two styles, honoring [IdentityElement] as a merge identity.
St mergeStyles<C, R, St extends StyleBase<C, R, St>>(St current, St other) {
  if (current is IdentityElement) {
    return other;
  }

  if (other is IdentityElement) {
    return current;
  }

  return current.merge(other);
}

/// Merges two variant lists by each entry's semantic [VariantStyle.mergeKey].
///
/// Entries sharing a key merge pairwise; order of first appearance is kept.
List<VariantStyle<C, R, St>>? mergeVariantLists<
  C,
  R,
  St extends StyleBase<C, R, St>
>(List<VariantStyle<C, R, St>>? current, List<VariantStyle<C, R, St>>? other) {
  if (current == null && other == null) return null;
  if (current == null) return List.of(other!);
  if (other == null) return List.of(current);

  final Map<Object, VariantStyle<C, R, St>> merged = {};

  for (final variant in current) {
    merged[variant.mergeKey] = variant;
  }

  for (final variant in other) {
    final key = variant.mergeKey;
    final existing = merged[key];
    merged[key] = existing != null ? existing.merge(variant) : variant;
  }

  return merged.values.toList();
}

enum _VariantMergeNamespace { named, context, builder }

/// Opaque semantic identity for a variant, used as [VariantStyle.mergeKey].
///
/// Keeps diagnostic labels out of semantic identity. Record equality
/// delegates to the value semantics already defined by each supported
/// variant kind.
///
/// Binding [C] on the builder check keeps the `fn` read type-safe; a raw
/// `ContextVariantBuilder` receiver would cast it to `dynamic Function(dynamic)`
/// and fail at runtime (parameter contravariance).
Object _variantMergeKey<C>(Variant variant) => switch (variant) {
  NamedVariant(:final name) => (_VariantMergeNamespace.named, name),
  ContextVariantBuilder<C, Object?>(:final fn) => (
    _VariantMergeNamespace.builder,
    fn,
  ),
  ContextVariant<C>() => (_VariantMergeNamespace.context, variant),
  _ => _unknownVariant(variant, (_VariantMergeNamespace.context, variant)),
};

/// Debug-only guard for unsupported [Variant] subclasses; release builds
/// degrade to [fallback] (inactive / an identity-keyed entry).
T _unknownVariant<T>(Variant variant, T fallback) {
  assert(
    false,
    'Unknown Variant kind: ${variant.runtimeType}. Custom variants must '
    'extend NamedVariant, ContextVariant, or ContextVariantBuilder.',
  );

  return fallback;
}

/// Variant wrapper for conditional styling.
final class VariantStyle<C, R, St extends StyleBase<C, R, St>>
    extends Mixable<R>
    with Equatable {
  final Variant variant;
  final St _style;

  const VariantStyle(this.variant, St style) : _style = style;

  St get value => _style;

  bool matches(Iterable<Variant> otherVariants) =>
      otherVariants.contains(variant);

  VariantStyle<C, R, St>? removeVariants(Iterable<Variant> variantsToRemove) {
    if (!variantsToRemove.contains(variant)) {
      return this;
    }

    return null;
  }

  @override
  VariantStyle<C, R, St> merge(covariant VariantStyle<C, R, St>? other) {
    if (other == null) {
      return VariantStyle(variant, _style);
    }

    if (mergeKey != other.mergeKey) {
      throw ArgumentError(
        'Cannot merge VariantStyle with different variants. '
        '${variant.runtimeType}(key: "${variant.key}") and '
        '${other.variant.runtimeType}(key: "${other.variant.key}") do not '
        'have the same semantic merge identity.',
      );
    }

    return VariantStyle(variant, mergeStyles<C, R, St>(_style, other._style));
  }

  @override
  List<Object?> get props => [variant, _style];

  /// Opaque semantic identity used when merging variant style fragments.
  @override
  Object get mergeKey => _variantMergeKey<C>(variant);
}
