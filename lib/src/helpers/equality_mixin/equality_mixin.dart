import '../../extensions/helper_ext.dart';
import 'deep_collection_equality.dart';

/// Returns a `hashCode` for [props].
int _mapPropsToHashCode(Iterable? props) =>
    _finish([...?props].fold(0, _combine));

const _equality = DeepCollectionEquality();

/// Determines whether [list1] and [list2] are equal.
bool _equals(List? list1, List? list2) {
  if (identical(list1, list2)) return true;
  if (list1 == null || list2 == null) return false;
  final length = list1.length;
  if (length != list2.length) return false;

  for (var i = 0; i < length; i++) {
    final dynamic unit1 = list1[i];
    final dynamic unit2 = list2[i];

    if (_isEquatable(unit1) && _isEquatable(unit2)) {
      if (unit1 != unit2) return false;
    } else if (unit1 is Iterable || unit1 is Map) {
      if (!_equality.equals(unit1, unit2)) return false;
    } else if (unit1?.runtimeType != unit2?.runtimeType) {
      return false;
    } else if (unit1 != unit2) {
      return false;
    }
  }

  return true;
}

bool _isEquatable(dynamic object) {
  return object is EqualityMixin;
}

/// Jenkins Hash Functions
/// https://en.wikipedia.org/wiki/Jenkins_hash_function
int _combine(int hash, dynamic object) {
  if (object is Map) {
    object.keys
        .sorted((dynamic a, dynamic b) => a.hashCode - b.hashCode)
        .forEach((dynamic key) {
      hash = hash ^ _combine(hash, <dynamic>[key, object[key]]);
    });

    return hash;
  }
  if (object is Set) {
    object = object.sorted(((dynamic a, dynamic b) => a.hashCode - b.hashCode));
  }
  if (object is Iterable) {
    for (final value in object) {
      hash = hash ^ _combine(hash, value);
    }

    return hash ^ object.length;
  }

  hash = 0x1fffffff & (hash + object.hashCode);
  hash = 0x1fffffff & (hash + ((hash & 0x0007ffff) << 10));

  return hash ^ (hash >> 6);
}

int _finish(int hash) {
  hash = 0x1fffffff & (hash + ((hash & 0x03ffffff) << 3));
  hash = hash ^ (hash >> 11);

  return 0x1fffffff & (hash + ((hash & 0x00003fff) << 15));
}

/// Returns a string for [props].
String mapPropsToString(Type runtimeType, List<Object?> props) {
  var nonNullProps = props.where((prop) => prop != null).toList();

  return '$runtimeType(${nonNullProps.map((prop) => prop.toString()).join(', ')})';
}

/// A mixin that helps implement equality
/// without needing to explicitly override [operator ==] and [hashCode].

mixin EqualityMixin {
  List<Object?> get props;

  bool get stringify => true;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is EqualityMixin &&
            runtimeType == other.runtimeType &&
            _equals(props, other.props);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ _mapPropsToHashCode(props);

  List<String> getDiff(Object other) {
    final diff = <String>[];

    // Return if there are no diferences.
    if (this == other) return diff;

    if (other is EqualityMixin) {
      final otherProps = other.props;
      final length = props.length;

      for (var i = 0; i < length; i++) {
        final unit1 = props[i];
        final unit2 = otherProps[i];

        if (unit1 is Iterable || unit1 is Map) {
          if (!_equality.equals(unit1, unit2)) {
            diff.add(props[i].toString());
          }
        } else if (unit1?.runtimeType != unit2?.runtimeType) {
          diff.add(props[i].toString());
        } else if (unit1 != unit2) {
          diff.add(props[i].toString());
        }
      }
    } else {
      diff.add('other is not EquatableMixin');
    }

    return diff;
  }

  @override
  String toString() {
    return stringify ? mapPropsToString(runtimeType, props) : '$runtimeType';
  }
}
