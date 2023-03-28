import 'dart:collection';

import '../attributes/attribute.dart';
import '../variants/variant_attribute.dart';

/// A map-like data structure that can merge values with the same key based on
/// their runtime type. Maintains insertion order of keys.
///
/// This is used to merge different attributes.
class MergeableMap<T extends MergeableMixin, K> {
  final LinkedHashMap<K, T> _map = LinkedHashMap<K, T>();
  final K Function(T) _keyMapper;

  /// Creates a new [MergeableMap] instance with the given [iterable].
  ///
  /// The required [keyMapper] function is used to map the iterable items to
  /// their respective keys. If not provided, the runtime type of the item is
  /// used as the key.
  MergeableMap(List<T> iterable, K Function(T) keyMapper)
      : _keyMapper = keyMapper {
    for (final item in iterable) {
      _update(item);
    }
  }

  static MergeableMap<T, K> runtimeTypeAsKey<T extends MergeableMixin, K>(
    List<T> iterable,
  ) {
    return MergeableMap(iterable, (item) => item.runtimeType as K);
  }

  static MergeableMap<T, K> variantAsKey<T extends VariantAttribute, K>(
    List<T> iterable,
  ) {
    return MergeableMap(iterable, (item) => item.variant as K);
  }

  /// Creates an empty [MergeableMap] instance.
  MergeableMap<T, K> _emptyInstance() {
    return MergeableMap<T, K>([], _keyMapper);
  }

  void _update(T value) {
    final key = _keyMapper(value);
    _map.update(
      key,
      (existingValue) => existingValue.merge(value),
      ifAbsent: () => value,
    );
  }

  /// Retrieves the value associated with the given [key] or `null` if not found.
  T? operator [](K key) => _map[key];

  /// Associates the [value] with the given [key]. If the key already exists,
  /// the value is merged with the existing value.
  void operator []=(K key, covariant T value) {
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
  MergeableMap<T, K> merge(MergeableMap<T, K>? other) {
    if (other == null) return this;

    final mergedMap = _emptyInstance();
    mergedMap._map.addAll(_map);
    other._map.forEach((key, value) {
      mergedMap[key] = value;
    });

    return mergedMap;
  }

  /// Creates a new [MergeableMap] instance with the same key-value pairs as
  /// this map.
  MergeableMap<T, K> clone() {
    final clonedMap = _emptyInstance();
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

      final thisKeys = _map.keys;
      final otherKeys = other._map.keys;

      for (int i = 0; i < _map.length; i++) {
        final thisKey = thisKeys.elementAt(i);
        final otherKey = otherKeys.elementAt(i);

        if (thisKey != otherKey || _map[thisKey] != other._map[otherKey]) {
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
