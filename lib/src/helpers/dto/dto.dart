import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class Dto<T> {
  const Dto();

  T resolve(BuildContext context);
}

abstract class MergeableDto<T, D extends Dto<T>> extends Dto<T> {
  final List<D> mergeableValues;
  final D lastValue;

  const MergeableDto(this.lastValue, this.mergeableValues);

  @override
  T resolve(BuildContext context);

  @override
  bool operator ==(Object other) {
    // use listEquals
    if (identical(this, other)) return true;

    return other is MergeableDto<T, D> &&
        other.lastValue == lastValue &&
        listEquals(other.mergeableValues, mergeableValues);
  }

  @override
  int get hashCode => mergeableValues.hashCode ^ lastValue.hashCode;
}
