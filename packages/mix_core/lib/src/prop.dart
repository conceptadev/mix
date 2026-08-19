// Ported from package:mix `src/core/prop.dart`, genericized over the
// resolution context type [C].
//
// Changes from the mix version:
// - `BuildContext` → opaque type parameter `C`. The engine never dereferences
//   the context; it only forwards it to `MixToken.resolve` and nested
//   `Mix.resolve` / `Buildable.build` calls.
// - `FlutterError` → `StateError`; `debugPrint` diagnostic → [mixCoreDebugLog]
//   hook; `listEquals` → local implementation.
// - Token *reference sentinel* detection (`getTokenFromValue`) is not part of
//   core: sentinels implement platform value interfaces (e.g. `ColorRef
//   implements Color`), so the platform facade for `Prop.value` performs
//   detection before delegating here.
// - The nested-style branch checks the [Buildable] interface instead of the
//   concrete Flutter `Style` type.

import 'package:meta/meta.dart';

import 'converter_registry.dart';
import 'directive.dart';
import 'mix_element.dart';
import 'ops.dart';
import 'prop_source.dart';
import 'token.dart';

/// Hook for debug-only engine diagnostics.
///
/// Defaults to a no-op; platforms may route this to their logging facility
/// (package:mix routes it to `debugPrint`). Only invoked inside asserts.
void Function(String message) mixCoreDebugLog = _noopLog;

void _noopLog(String _) {}

/// A property that can hold values, tokens, or Mix types.
///
/// [Prop] is the foundation of the Mix styling system. It provides:
/// - Storage for values through different source types
/// - Token resolution via the platform context [C]
/// - Merging capabilities with different strategies
/// - Directive application for value transformations
///
/// ## Value Creation
/// Use [Prop.value] for regular values - it creates a [ValueSource] without
/// conversion. Use [Prop.mix] for explicit Mix values - it creates a
/// [MixSource].
///
/// ## Conversion Behavior
/// Type conversion to Mix types happens ONLY during resolution when Mix
/// values are present in the property. [Prop.value] never auto-converts
/// values.
@immutable
class Prop<C, V> {
  /// The list of sources that provide values for this property.
  ///
  /// Sources can be [ValueSource], [TokenSource], or [MixSource].
  final List<PropSource<C, V>> sources;

  /// Optional directives to transform the resolved value.
  ///
  /// Directives are applied after resolution but before the value is returned.
  final List<Directive<V>>? $directives;

  // Constructors

  /// Creates a property with the given sources and directives.
  ///
  /// This constructor is private and used internally by factory methods.
  const Prop._({required this.sources, List<Directive<V>>? directives})
    : $directives = directives;

  /// Creates a new property by copying all fields from another property.
  ///
  /// Used by subclasses that need to wrap existing properties.
  Prop.fromProp(Prop<C, V> other)
    : sources = other.sources,
      $directives = other.$directives;

  /// Creates a property that references a token.
  ///
  /// The token is resolved via [MixToken.resolve] during resolution.
  /// Optionally accepts [directives] configuration.
  factory Prop.token(
    MixToken<C, V> token, {
    List<Directive<V>>? directives,
  }) {
    return Prop._(sources: [TokenSource(token)], directives: directives);
  }

  /// Creates a property with only directives.
  ///
  /// This property has no value source and is used for applying
  /// transformations when merged with other properties.
  const Prop.directives(List<Directive<V>> directives)
    : this._(sources: const [], directives: directives);

  // Factory methods

  /// Creates a property from a direct value.
  ///
  /// If [value] is already a [Prop], returns it unchanged.
  ///
  /// Does not auto-convert values to Mix types. Use [Prop.mix] for Mix
  /// values. Platform facades detect token-reference sentinels before
  /// delegating here.
  static Prop<C, V> value<C, V>(V value) {
    if (value is Prop<C, V>) return value;

    return Prop._(sources: [ValueSource(value)]);
  }

  /// Creates a property from a [Mix] value.
  ///
  /// Use this when you explicitly want to store a Mix value
  /// for accumulation merging behavior.
  /// Preserves token references (MixRef objects) instead of wrapping them in
  /// MixSource.
  static Prop<C, V> mix<C, V>(Mix<C, V> mix) {
    // Check if mix is already a token reference (MixRef)
    // MixRef objects are Prop instances with TokenSource that implement Mix
    // interfaces
    if (mix is Prop<C, V>) {
      final prop = mix as Prop<C, V>;
      if (prop.hasToken) {
        return prop; // Return token reference directly to preserve TokenSource
      }
    }

    return Prop._(sources: [MixSource(mix)]);
  }

  /// Creates a property from a nullable value.
  ///
  /// Returns `null` if [value] is `null`, otherwise calls [Prop.value].
  static Prop<C, V>? maybe<C, V>(V? value) {
    if (value == null) return null;

    return Prop.value(value);
  }

  /// Creates a property from a nullable [Mix] value.
  ///
  /// Returns `null` if [value] is `null`, otherwise calls [Prop.mix].
  static Prop<C, V>? maybeMix<C, V>(Mix<C, V>? value) {
    if (value == null) return null;

    return Prop.mix(value);
  }

  /// Creates a property from a regular value by converting it to a Mix.
  ///
  /// Uses the converter registry to transform the value into a Mix type,
  /// then wraps it in a Prop. Returns null if conversion is not possible.
  static Prop<C, V>? mixValue<C, V>(V value) {
    final converted = MixConverterRegistry.instanceOf<C>().tryConvert<V>(
      value,
    );
    if (converted == null) return null;

    return Prop.mix(converted);
  }

  // Properties

  /// The runtime type of the property's value.
  Type get type => V;

  /// Whether this property contains at least one value source.
  ///
  /// Returns `true` if the property has [ValueSource] or [MixSource].
  bool get hasValue =>
      sources.any((s) => s is ValueSource<C, V> || s is MixSource<C, V>);

  /// Whether this property contains at least one token source.
  ///
  /// Returns `true` if the property has [TokenSource].
  bool get hasToken => sources.any((s) => s is TokenSource<C, V>);

  // Methods

  /// Returns a new property with the given directives merged with existing
  /// ones.
  Prop<C, V> directives(List<Directive<V>> directives) {
    return mergeProp(Prop.directives(directives));
  }

  /// Merges this property with another property.
  ///
  /// Always accumulates all sources from both properties.
  /// During resolution, the behavior depends on the source types:
  /// - Mix sources: merged using accumulation strategy
  /// - Regular values: last value wins during resolution
  ///
  /// Directives are merged from both properties.
  Prop<C, V> mergeProp(covariant Prop<C, V>? other) {
    if (other == null) return this;

    // Always accumulate all sources - no conditional logic
    return Prop._(
      sources: [...sources, ...other.sources],
      directives: PropOps.mergeDirectives($directives, other.$directives),
    );
  }

  /// Resolves this property to a concrete value using the given context.
  ///
  /// Resolution process:
  /// 1. Resolves all sources (tokens from context, Mix values, etc.)
  /// 2. Converts regular values to Mix when Mix values are present
  /// 3. Merges multiple values based on type (accumulation for Mix,
  ///    replacement for others)
  /// 4. Applies any directives to transform the final value
  ///
  /// Throws [StateError] if the property has no sources.
  @internal
  V resolveProp(C context) {
    if (sources.isEmpty) {
      throw StateError('Prop<$V> has no sources');
    }

    // Resolve all sources to values
    final values = <Object?>[];
    for (final source in sources) {
      final value = switch (source) {
        ValueSource<C, V>(:final value) => value,
        TokenSource<C, V>(:final token) => token.resolve(context),
        MixSource<C, V>(:final mix) => mix,
      };
      values.add(value);
    }

    // Check if we have Mix values
    final hasMixValues = values.any((v) => v is Mix<C, V>);

    V resolvedValue;
    if (hasMixValues) {
      // Need to merge as Mix types
      final mixValues = <Mix<C, V>>[];

      for (final value in values) {
        if (value is Mix<C, V>) {
          mixValues.add(value);
        } else if (value is V) {
          // Try to convert regular value to Mix
          final converted = MixConverterRegistry.instanceOf<C>()
              .tryConvert<V>(value);
          if (converted != null) {
            mixValues.add(converted);
          } else {
            // Debug-only diagnostic to surface silent conversion failures
            assert(() {
              mixCoreDebugLog(
                'Mix: could not convert value of type ${value.runtimeType} '
                'to Mix<$V>. Register a MixConverter for <$V> or pass a Mix '
                'via Prop.mix.',
              );

              return true;
            }());
          }
        }
      }

      // Invariant check: when hasMixValues is true, we expect at least one
      // Mix collected
      assert(
        mixValues.isNotEmpty,
        'Mix: invariant violated in Prop<$V>.resolveProp - hasMixValues was '
        'true, but no Mix values were collected from sources. Falling back '
        'to last value.',
      );

      if (mixValues.isEmpty) {
        // Release-safe fallback to maintain stability
        resolvedValue = values.last as V;
      } else {
        // Merge all Mix values
        Mix<C, V> mergedMix = mixValues.first;
        for (int i = 1; i < mixValues.length; i++) {
          mergedMix = PropOps.mergeMixes(context, mergedMix, mixValues[i]);
        }
        // A style nested inside another style's [Prop] (e.g. a component
        // sub-style) carries its own context variants. Those are applied by
        // [Buildable.build], not by [Mix.resolve], so resolving a nested
        // style directly would silently drop them. Build such values instead
        // so their variants resolve against the current context.
        resolvedValue = mergedMix is Buildable<C, V>
            ? (mergedMix as Buildable<C, V>).build(context)
            : mergedMix.resolve(context);
      }
    } else {
      // Simple values - use last one (replacement strategy)
      resolvedValue = values.last as V;
    }

    // Apply directives
    return PropOps.applyDirectives(resolvedValue, $directives);
  }

  // Equality and debugging

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Prop<C, V> &&
        _listEquals(other.sources, sources) &&
        _listEquals(other.$directives, $directives);
  }

  @override
  String toString() {
    final parts = <String>[];
    if (sources.isNotEmpty) {
      parts.add('sources: ${sources.length}');
    }
    if ($directives != null && $directives!.isNotEmpty) {
      parts.add('directives: ${$directives!.length}');
    }

    return '$runtimeType(${parts.join(', ')})';
  }

  @override
  int get hashCode => Object.hash(Object.hashAll(sources), $directives);
}

/// Element-wise equality matching Flutter foundation's `listEquals`.
bool _listEquals<T>(List<T>? a, List<T>? b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  if (identical(a, b)) return true;
  for (int index = 0; index < a.length; index += 1) {
    if (a[index] != b[index]) return false;
  }

  return true;
}
