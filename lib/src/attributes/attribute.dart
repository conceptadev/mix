import 'dart:math';

import 'package:flutter/foundation.dart';

import '../helpers/equality_mixin/equality_mixin.dart';

/// Base attribute.
// Some classes have defaults.
// Facade allows us ot set all properties as optional.
// For improved merge and override of properties.
abstract class StyleAttribute with CompareMixin, MergeMixin {
  final Key? _key;
  const StyleAttribute({Key? key}) : _key = key;
  Key get mergeKey => _key == null ? ValueKey(runtimeType) : ValueKey(_key);
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
abstract class StyledWidgetAttributes extends StyleAttribute {
  const StyledWidgetAttributes();

  StyledWidgetAttributes copyWith();
}
