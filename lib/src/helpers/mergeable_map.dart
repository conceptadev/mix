import 'dart:collection';

import '../attributes/attribute.dart';

/// A map-like data structure that can merge values with the same key based on
/// their runtime type. Maintains insertion order of keys.
///
/// This is used to merge different attributes.
class MergeableMap<T extends Mergeable> {
  final LinkedHashMap<Type, T> _map = LinkedHashMap<Type, T>();

  /// Creates a new [MergeableMap] instance with the given [iterable].
  ///
  /// The optional [keyMapper] function is used to map the iterable items to
  /// their respective keys. If not provided, the runtime type of the item is
  /// used as the key.
  MergeableMap(List<T> iterable) {
    for (final item in iterable) {
      _update(item);
    }
  }

  /// Creates an empty [MergeableMap] instance.
  factory MergeableMap.empty() {
    return MergeableMap([]);
  }

  void _update(T value) {
    _map.update(
      value.runtimeType,
      (existingValue) => existingValue.merge(value),
      ifAbsent: () => value,
    );
  }

  /// Retrieves the value associated with the given [key] or `null` if not found.
  T? operator [](Type key) => _map[key];

  /// Associates the [value] with the given [key]. If the key already exists,
  /// the value is merged with the existing value.
  void operator []=(Type key, covariant T value) {
    _update(value);
  }

  /// Merges this [MergeableMap] with another [MergeableMap] and returns a new
  /// [MergeableMap] containing the merged elements.
  ///
  /// If the `other` map is `null`, it returns a new [MergeableMap] that is
  /// identical to the current map. If the `other` map is not `null`, it
  /// iterates over the keys of both maps and creates a new [MergeableMap]
  /// containing the union of both maps. In case of overlapping keys, the value
  /// from the `other` map will overwrite the value from the current map.
  MergeableMap<T> merge(MergeableMap<T>? other) {
    if (other == null) return this;

    final mergedMap = MergeableMap<T>.empty();
    mergedMap._map.addAll(_map);
    other._map.forEach((key, value) {
      mergedMap[key] = value;
    });

    return mergedMap;
  }

  /// Creates a new [MergeableMap] instance with the same key-value pairs as
  /// this map.
  MergeableMap<T> clone() {
    final clonedMap = MergeableMap<T>.empty();
    clonedMap._map.addAll(_map);

    return clonedMap;
  }

  /// Returns an [Iterable] of the values in the map in insertion order.
  Iterable<T> get values => _map.values;

  /// Returns the number of key-value pairs in the map.
  int get length => _map.length;

  /// Removes all key-value pairs from the map.
  void clear() {
    _map.clear();
  }

  T firstWhere(bool Function(T) test) {
    return _map.values.firstWhere(test);
  }

  /// Returns `true` if the map contains no key-value pairs.
  bool get isEmpty => _map.isEmpty;

  /// Returns `true` if the map contains at least one key-value pair.

  bool get isNotEmpty => _map.isNotEmpty;

  /// Determines the equality of two [MergeableMap] instances.
  ///
  /// Returns true if both instances have the same key-value pairs and
  /// insertion order.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other is MergeableMap) {
      if (other._map.length != _map.length) return false;

      for (final key in _map.keys) {
        if (!other._map.containsKey(key) || _map[key] != other._map[key]) {
          return false;
        }
      }

      return true;
    }

    return false;
  }

  /// Generates the hash code for this [MergeableMap] instance based on its
  /// key-value pairs.
  @override
  int get hashCode => _map.hashCode;
}
