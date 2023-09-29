import 'dart:math';

import 'package:flutter/foundation.dart';

import '../helpers/equality_mixin/equality_mixin.dart';

/// Base attribute.
// Some classes have defaults
// Facade allows us ot set all properties as optional
// For improved merge and override of properties
abstract class StyleAttribute with EqualityMixin {
  const StyleAttribute();
}

mixin Mergeable<T> {
  T merge(covariant T? other);

  static List<T>? mergeLists<T extends Mergeable>(
    List<T>? list,
    List<T>? other,
  ) {
    if (other == null || other.isEmpty) return list;
    if (list == null || list.isEmpty) return other;

    if (listEquals(list, other)) return list;

    final maxLength = max(list.length, other.length);

    return List<T>.generate(maxLength, (int index) {
      final otherValue = index < other.length ? other[index] : null;
      final thisValue = index < list.length ? list[index] : null;

      return thisValue?.merge(otherValue) ?? otherValue!;
    });
  }
}

/// An interface that add support to custom attributes for [MixContext].
abstract class StyledWidgetAttributes extends StyleAttribute
    with Mergeable<StyledWidgetAttributes> {
  const StyledWidgetAttributes();

  StyledWidgetAttributes copyWith();
}
