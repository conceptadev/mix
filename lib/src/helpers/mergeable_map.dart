import '../attributes/attribute.dart';

// Mergeable Map, that merges values baed on their runtime type.
// This is used to merge different attributes.
// Also outputs a list in the order that they were added.
class MergeableMap<T extends MergeableMixin> {
  final Map<Type, T> _map = {};
  final List<Type> _keys = [];

  T? operator [](Type key) => _map[key];

  void operator []=(Type key, covariant T value) {
    if (!_map.containsKey(key)) {
      _keys.add(key);
      _map[key] = value;
    } else {
      _map[key] = _map[key]!.merge(value);
    }
  }

  static MergeableMap<T> fromList<T extends MergeableMixin>(
    List<T> iterable,
  ) {
    final map = MergeableMap<T>();
    for (final item in iterable) {
      map[item.runtimeType] = item;
    }

    return map;
  }

  /// Merges this [MergeableMap] with another [MergeableMap] and returns a new
  /// [MergeableMap] containing the merged elements.
  ///
  /// The method takes an optional [MergeableMap] named `other` as input.
  /// If the `other` map is `null`, it returns a new [MergeableMap] that is
  /// identical to the current map. If the `other` map is not `null`, it
  /// iterates over the keys of both maps and creates a new [MergeableMap]
  /// containing the union of both maps. In case of overlapping keys, the value
  /// from the `other` map will overwrite the value from the current map.
  ///
  /// [other]: An optional [MergeableMap] object to be merged with the current map.
  ///
  /// Returns a new [MergeableMap] object containing the merged elements.
  MergeableMap<T> merge(MergeableMap<T>? other) {
    // If the other map is null, return a the current map.
    if (other == null) return this;

    // Create a new MergeableMap instance to store the merged result.
    final map = MergeableMap<T>();

    // Iterate over the keys of the current map and add them to the new map.
    for (var key in _keys) {
      map[key] = _map[key] as T;
    }

    // Iterate over the keys of the other map and add them to the new map.
    // If a key already exists in the new map, the value from the other map
    // will overwrite the existing value.
    for (var key in other._keys) {
      map[key] = other._map[key] as T;
    }

    // Return the new map containing the merged elements.
    return map;
  }

  MergeableMap<T> clone() {
    final map = MergeableMap<T>();
    for (final key in _keys) {
      map[key] = _map[key] as T;
    }

    return map;
  }

  Iterable<T> get values => _keys.map((key) => _map[key] as T);

  int get length => _map.length;

  void clear() {
    _map.clear();
    _keys.clear();
  }

  bool get isEmpty => _map.isEmpty;

  bool get isNotEmpty => _map.isNotEmpty;

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other is MergeableMap) {
      if (other._keys.length != _keys.length) return false;

      for (final key in _keys) {
        if (other._map[key] != _map[key]) return false;
      }

      return true;
    }

    return false;
  }

  @override
  int get hashCode => _map.hashCode ^ _keys.hashCode;
}
