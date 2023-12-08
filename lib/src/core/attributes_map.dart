// ignore_for_file: prefer_collection_literals

import 'dart:collection';

import '../helpers/compare_mixin.dart';
import 'attribute.dart';

class MixableMap<T extends Attribute> with Comparable {
  final LinkedHashMap<Object, T>? _map;

  const MixableMap._(this._map);

  const MixableMap.empty() : _map = null;

  factory MixableMap(Iterable<T> attributes) {
    return MixableMap._(_mergeMap<T>(attributes));
  }

  static LinkedHashMap<Object, Attr> _mergeMap<Attr extends Attribute>(
    Iterable<Attr> attributes,
  ) {
    final map = LinkedHashMap<Object, Attr>();
    for (final attribute in attributes) {
      final type = attribute.type;

      // If value cannot be merged just overwrite it
      if (attribute is! Mergeable) {
        map[type] = attribute;
        continue;
      }

      // If there is no saved attribute, just add it
      final savedAttribute = map[type] as Mergeable<Attr>?;
      if (savedAttribute == null) {
        map[type] = attribute;
      } else {
        // If there is a saved attribute, merge it with the new one
        map[type] = savedAttribute.merge(attribute);
      }
    }

    return map;
  }

  int get length => _map?.length ?? 0;

  bool get isEmpty => _map?.isEmpty ?? true;

  bool get isNotEmpty => _map?.isNotEmpty ?? false;

  List<T> get values => _map?.values.toList() ?? [];

  bool contains(T attribute) => _map?.containsKey(attribute.type) ?? false;

  Attr? attributeOfType<Attr extends T>() => _map?[Attr] as Attr?;

  Iterable<Attr> whereType<Attr extends T>() =>
      _map?.values.whereType<Attr>() ?? [];

  MixableMap<T> merge(MixableMap<T>? other) {
    return other == null ? this : MixableMap([...values, ...other.values]);
  }

  @override
  List<Object> get props => [_map ?? {}];
}
