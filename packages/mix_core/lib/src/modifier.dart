// Platform-neutral modifier plumbing extracted from package:mix's
// `WidgetModifierConfig`: type-based ordering and keyed merge-with-reset.
// The modifier VALUE type is platform-owned — Flutter wraps Widgets, a
// terminal UI wraps its own node type — expressed by [NodeModifier].

import 'mix_element.dart';

/// A modifier over a platform node type [N]: wraps a node in another node.
///
/// Rendering applies an ordered modifier list as a reversed fold, so the
/// first modifier in the list becomes the outermost wrapper:
///
/// ```dart
/// var current = child;
/// for (final modifier in modifiers.reversed) {
///   current = modifier.build(current);
/// }
/// ```
///
/// package:mix's `WidgetModifier.build(Widget child)` is the Flutter
/// instance of this shape.
abstract interface class NodeModifier<N> {
  N build(N child);
}

/// Orders [items] by runtime type: [typeOrder] (user-specified) first, then
/// [defaultOrder], then any remaining types in appearance order.
///
/// Keeps only the first item of each runtime type, matching package:mix's
/// modifier semantics where merge has already collapsed same-key modifiers.
List<M> reorderByType<M extends Object>(
  List<M> items, {
  List<Type>? typeOrder,
  List<Type> defaultOrder = const [],
}) {
  if (items.isEmpty) return items;

  final order = {
    // Prioritize the order provided by the user.
    ...?typeOrder,
    // Add the platform's default order.
    ...defaultOrder,
    // Add any remaining types that were not included in the order.
    ...items.map((e) => e.runtimeType),
  }.toList();

  final ordered = <M>[];

  for (final type in order) {
    for (final item in items) {
      if (item.runtimeType == type) {
        ordered.add(item);
        break;
      }
    }
  }

  return ordered;
}

/// Merges [list] into [acc] keyed by [Mixable.mergeKey]; an entry whose key
/// equals [resetKey] clears everything accumulated so far.
///
/// This is package:mix's modifier merge-with-reset semantics: a reset marker
/// discards inherited modifiers so a style can start from a clean slate.
void mergeKeyedWithReset<M extends Mixable<Object?>>(
  Map<Object, M> acc,
  Iterable<M> list, {
  required Object resetKey,
}) {
  for (final m in list) {
    final key = m.mergeKey;
    if (key == resetKey) {
      acc.clear();
      continue;
    }
    final existing = acc[key];
    acc[key] = existing == null ? m : existing.merge(m) as M;
  }
}
