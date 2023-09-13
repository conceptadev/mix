/// A class to perform deep equality checks on collections.
///
/// This class compares collections (List, Set, Map) recursively for equality.
/// It can also compute a hash code for a collection.
class DeepCollectionEquality {
  /// Constructs a DeepCollectionEquality instance.
  const DeepCollectionEquality();

  /// Compares [object1] and [object2] deeply for equality.
  ///
  /// Returns true if both objects are deeply equal; otherwise, returns false.
  bool equals(Object? object1, Object? object2) {
    if (identical(object1, object2)) {
      return true;
    }
    if (object1 is List && object2 is List) {
      return _compareLists(object1, object2);
    }
    if (object1 is Set && object2 is Set) {
      return _compareSets(object1, object2);
    }
    if (object1 is Map && object2 is Map) {
      return _compareMaps(object1, object2);
    }

    // Equality comparison for custom classes
    if (object1?.runtimeType == object2?.runtimeType) {
      return object1 == object2;
    }

    return false;
  }

  /// Computes a hash code for [object].
  ///
  /// If [object] is a collection (List, Set, Map), computes a hash code recursively.
  /// Otherwise, returns the hash code of the object.
  int hash(Object? object) {
    if (object == null) {
      return 0;
    }

    var hashCode = 0;
    if (object is List) {
      for (var element in object) {
        hashCode = 31 * hashCode + hash(element);
      }
    } else if (object is Set) {
      for (var element in object) {
        hashCode = 31 * hashCode + hash(element);
      }
    } else if (object is Map) {
      for (var key in object.keys) {
        hashCode = 31 * hashCode + hash(key);
        hashCode = 31 * hashCode + hash(object[key]);
      }
    } else {
      hashCode = object.hashCode;
    }

    return hashCode;
  }

  /// Compares two lists [list1] and [list2] deeply for equality.
  ///
  /// Returns true if both lists are deeply equal; otherwise, returns false.
  bool _compareLists(List list1, List list2) {
    if (list1.length != list2.length) {
      return false;
    }
    for (var i = 0; i < list1.length; i++) {
      if (!equals(list1[i], list2[i])) {
        return false;
      }
    }

    return true;
  }

  /// Compares two sets [set1] and [set2] deeply for equality.
  ///
  /// Returns true if both sets are deeply equal; otherwise, returns false.
  bool _compareSets(Set set1, Set set2) {
    if (set1.length != set2.length) {
      return false;
    }
    for (var element1 in set1) {
      bool isEqual = false;
      for (var element2 in set2) {
        if (equals(element1, element2)) {
          isEqual = true;
          break;
        }
      }
      if (!isEqual) {
        return false;
      }
    }

    return true;
  }

  /// Compares two maps [map1] and [map2] deeply for equality.
  ///
  /// Returns true if both maps are deeply equal; otherwise, returns false.
  bool _compareMaps(Map map1, Map map2) {
    if (map1.length != map2.length) {
      return false;
    }
    for (var key in map1.keys) {
      if (!map2.containsKey(key) || !equals(map1[key], map2[key])) {
        return false;
      }
    }

    return true;
  }
}
