import 'package:flutter/widgets.dart';

import '../factory/exports.dart';
import '../helpers/compare_mixin/compare_mixin.dart';

abstract class DataClass with Comparable {
  const DataClass();
}

abstract class Dto<T> extends DataClass with Mergeable, Resolvable<T> {
  const Dto();
}

/// Base attribute.
// Some classes have defaults.
// Facade allows us ot set all properties as optional.
// For improved merge and override of properties.
abstract class Attribute<T> extends DataClass with Mergeable {
  final Key? _key;
  const Attribute({Key? key}) : _key = key;
  Key get mergeKey => _key == null ? ValueKey(runtimeType) : ValueKey(_key);
}

mixin Resolvable<T> {
  T resolve(MixData mix);
}

mixin Mergeable<T> {
  T merge(covariant T? other);

  M mergeProp<M extends Mergeable>(M? currentValue, M? newValue) {
    return currentValue?.merge(newValue) ?? newValue;
  }
}
