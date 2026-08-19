// Ported from package:mix `src/core/helpers.dart` (the context-agnostic
// `PropOps` portion). The Flutter-typed `MixOps` helpers (lerp, animation and
// modifier merging) stay platform-side.

import 'directive.dart';
import 'mix_element.dart';

/// Operations for Prop merge and resolution logic.
///
/// Centralizes all prop-related operations to keep prop classes lean
/// and focused on data storage while providing sophisticated merge
/// and resolution capabilities.
class PropOps {
  const PropOps._();

  /// Applies directives to a resolved value.
  ///
  /// Returns the original value if no directives are provided.
  static V applyDirectives<V>(V value, List<Directive<V>>? directives) {
    if (directives == null || directives.isEmpty) return value;

    var result = value;
    for (final directive in directives) {
      result = directive.apply(result);
    }

    return result;
  }

  /// Merges two directive lists.
  ///
  /// Returns a new list containing all directives from both lists,
  /// or null if both lists are null.
  static List<Directive<V>>? mergeDirectives<V>(
    List<Directive<V>>? current,
    List<Directive<V>>? other,
  ) {
    return switch ((current, other)) {
      (null, null) => null,
      (final a?, null) => a,
      (null, final b?) => b,
      (final a?, final b?) => [...a, ...b],
    };
  }

  /// Merges two Mix instances, letting [ContextMergeable] values make
  /// context-aware merging decisions.
  ///
  /// In package:mix this special-cased `DecorationMix` and `ShapeBorderMix`;
  /// those types now opt in by implementing [ContextMergeable].
  static Mix<C, V> mergeMixes<C, V>(C context, Mix<C, V> a, Mix<C, V> b) {
    if (a is ContextMergeable<C, V>) {
      final merged = (a as ContextMergeable<C, V>).tryMergeWith(context, b);
      if (merged != null) return merged;
    }

    return a.merge(b);
  }
}
