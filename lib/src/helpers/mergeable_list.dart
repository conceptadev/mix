import 'dart:math';

import 'package:flutter/foundation.dart';

import '../attributes/attribute.dart';

List<T> combineMergeableLists<T extends Mergeable>(
  List<T> list,
  List<T>? other,
) {
  if (other == null || listEquals(other, list)) return list;

  final maxLength = max(list.length, other.length);

  return List<T>.generate(maxLength, (int index) {
    final otherValue = index < other.length ? other[index] : null;
    final thisValue = index < list.length ? list[index] : null;

    return thisValue?.merge(otherValue) ?? otherValue!;
  });
}
