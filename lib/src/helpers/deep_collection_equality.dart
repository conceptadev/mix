class DeepCollectionEquality {
  const DeepCollectionEquality();
  bool _mapsEqual(Map map1, Map map2) {
    if (map1.length != map2.length) return false;
    for (var key in map1.keys) {
      if (!map2.containsKey(key) || !equals(map1[key], map2[key])) {
        return false;
      }
    }

    return true;
  }

  bool _iterablesEqual(Iterable iter1, Iterable iter2) {
    // Use hash values to compare iterables.
    if (iter1.length != iter2.length) return false;
    // Check if iterables are in order
    if (iter1 is List && iter2 is List) {
      for (int i = 0; i < iter1.length; i++) {
        if (!equals(iter1[i], iter2[i])) {
          return false;
        }
      }

      return true;
    }

    return false;
  }

  bool _setsEqual(Set set1, Set set2) {
    if (set1.length != set2.length) return false;
    for (var value in set1) {
      if (!set2.contains(value)) {
        return false;
      }
    }

    return true;
  }

  bool equals(Object? obj1, Object? obj2) {
    if (identical(obj1, obj2)) return true;
    if (obj1.runtimeType != obj2.runtimeType) return false;

    if (obj1 is Map) {
      return _mapsEqual(obj1, obj2 as Map);
    } else if (obj1 is Set) {
      return _setsEqual(obj1, obj2 as Set);
    } else if (obj1 is Iterable) {
      return _iterablesEqual(obj1, obj2 as Iterable);
    }

    return obj1 == obj2;
  }

  int hash(Object? obj) {
    if (obj is Map) {
      return Object.hashAllUnordered(obj.keys) ^
          Object.hashAllUnordered(obj.values);
    } else if (obj is Set) {
      return Object.hashAllUnordered(obj);
    } else if (obj is Iterable) {
      int hashCode = 0;
      for (var value in obj) {
        hashCode ^= hash(value);
      }

      return hashCode;
    }

    return obj.hashCode;
  }
}
