import 'package:flutter/foundation.dart';

import '../factory/exports.dart';
import '../helpers/compare_mixin/compare_mixin.dart';

abstract class Dto with Comparable {
  const Dto();
}

/// Base attribute.
// Some classes have defaults.
// Facade allows us ot set all properties as optional.
// For improved merge and override of properties.
abstract class Attribute with Mergeable, Comparable {
  final Key? _key;
  const Attribute({Key? key}) : _key = key;
  Key get mergeKey => _key == null ? ValueKey(runtimeType) : ValueKey(_key);
}

mixin Resolvable<T> {
  T resolve(MixData mix);
}

mixin Mergeable<T> {
  T merge(covariant T? other);

  M mergeAttribute<M extends Mergeable>(M? currentValue, M? newValue) {
    return currentValue?.merge(newValue) ?? newValue;
  }
}

/// An interface that add support to custom attributes for [MixContext].
@Deprecated('Use Attribute instead')
abstract class StyledWidgetAttributes extends Attribute {
  const StyledWidgetAttributes();

  StyledWidgetAttributes copyWith();
}
