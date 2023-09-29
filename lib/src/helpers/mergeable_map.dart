import 'package:flutter/foundation.dart';

import '../attributes/attribute.dart';

/// Represents a map that can merge values of type [Mergeable] based on their runtime type.
/// Maintains the insertion order of keys.
///
/// The type parameter [T] must extend [Mergeable], ensuring that the values can be merged.
///
/// This class is useful for scenarios where you need to merge objects based on their types
/// while preserving the order in which they were inserted.
@immutable
class MergeableMap<T extends Mergeable> {
  // Internal list to hold the keys to maintain insertion order.
  final List<Type> _keys;

  // Internal map to associate keys to values.
  final Map<Type, T> _map;

  /// Private constructor used by factory methods.
  ///
  /// Both [_keys] and [_map] must not be null.
  const MergeableMap._(this._keys, this._map);

  /// Factory constructor to create an empty [MergeableMap].
  ///
  /// Useful for initializing an empty map.
  const MergeableMap.empty()
      : _keys = const [],
        _map = const {};

  /// Creates a [MergeableMap] instance from an iterable of type [T].
  ///
  /// Iterates through each item in the [iterable], merging items of the same type.
  factory MergeableMap.fromList(List<T> iterable) {
    final keys = <Type>[];
    final map = <Type, T>{};
    for (final item in iterable) {
      final key = item.runtimeType;
      if (map.containsKey(key)) {
        map[key] = map[key]!.merge(item);
      } else {
        keys.add(key);
        map[key] = item;
      }
    }

    return MergeableMap<T>._(keys, map);
  }

  /// Returns an iterable of the values in the map, maintaining the order of insertion.
  ///
  /// The order of return is determined by the order the key/value pairs were inserted in the map.
  Iterable<T> get values => _keys.map((key) => _map[key]!);

  /// Returns the number of key/value pairs in the map.
  ///
  /// A length of zero means the map is empty.
  int get length => _keys.length;

  /// Returns `true` if the map contains no key/value pairs.
  ///
  /// This is a quick way to verify if the map is empty or not.
  bool get isEmpty => _keys.isEmpty;

  /// Returns `true` if the map contains at least one key/value pair.
  ///
  /// This is a quick way to verify if the map has stored values.
  bool get isNotEmpty => _keys.isNotEmpty;

  @override
  int get hashCode => _keys.hashCode ^ _map.hashCode;

  /// Retrieves the value associated with the given [key].
  ///
  /// Returns `null` if the [key] is not found.
  T? get(Type key) => _map[key];

  /// Merges this [MergeableMap] with another [MergeableMap].
  ///
  /// Returns a new instance containing the merged elements.
  /// If [other] is null, returns the current instance.
  MergeableMap<T> merge(MergeableMap<T>? other) {
    if (other == null) return this;

    final mergedKeys = List<Type>.of(_keys);
    final mergedMap = Map<Type, T>.from(_map);

    for (var key in other._keys) {
      if (mergedMap.containsKey(key)) {
        mergedMap[key] = mergedMap[key]!.merge(other._map[key]!);
      } else {
        mergedKeys.add(key);
        mergedMap[key] = other._map[key]!;
      }
    }

    return MergeableMap<T>._(mergedKeys, mergedMap);
  }

  /// Creates a new [MergeableMap] instance identical to this instance.
  ///
  /// This method is typically used when a copy of the map is needed, so the original
  /// map can be preserved while the copy is manipulated.
  MergeableMap<T> clone() {
    return MergeableMap._(List<Type>.of(_keys), Map<Type, T>.from(_map));
  }

  /// Finds the first value in the map that satisfies the given [test].
  ///
  /// This is a simplified way to find a value in the map without iterating manually.
  ///
  /// The [test] function should return `true` for the desired value.
  T firstWhere(bool Function(T) test) => values.firstWhere(test);

  /// Overrides the equality operator to compare [MergeableMap] instances.
  ///
  /// Two instances are considered equal if they have identical keys and values.
  /// This checks the length of keys and then verifies that each key has identical values in both maps.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MergeableMap &&
        _keys.length == other._keys.length &&
        _keys.every((key) =>
            other._map.containsKey(key) && _map[key] == other._map[key]);
  }
}
