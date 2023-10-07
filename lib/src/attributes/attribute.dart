import 'dart:math';

import 'package:flutter/foundation.dart';

import '../factory/exports.dart';
import '../helpers/compare_mixin/compare_mixin.dart';

/// Base attribute.
// Some classes have defaults.
// Facade allows us ot set all properties as optional.
// For improved merge and override of properties.
abstract class Attribute with CompareMixin, MergeMixin {
  final Key? _key;
  const Attribute({Key? key}) : _key = key;
  Key get mergeKey => _key == null ? ValueKey(runtimeType) : ValueKey(_key);
}

abstract class Dto with CompareMixin, MergeMixin {
  const Dto();
}

mixin ResolveMixin<T> {
  T resolve(MixData mix);
}

mixin MergeMixin<T> {
  T merge(covariant T? other);

  static List<T>? mergeLists<T extends MergeMixin>(
    List<T>? list,
    List<T>? other,
  ) {
    if (other == null || other.isEmpty) return list;
    if (list == null || list.isEmpty) return other;

    final listLength = list.length;
    final otherLength = other.length;
    final maxLength = max(listLength, otherLength);

    return List<T>.generate(maxLength, (int index) {
      if (index < listLength && index < otherLength) {
        return list[index].merge(other[index]);
      } else if (index < listLength) {
        return list[index];
      }

      return other[index];
    });
  }
}

/// An interface that add support to custom attributes for [MixContext].
@Deprecated('Use Attribute instead')
abstract class StyledWidgetAttributes extends Attribute {
  const StyledWidgetAttributes();

  StyledWidgetAttributes copyWith();
}
