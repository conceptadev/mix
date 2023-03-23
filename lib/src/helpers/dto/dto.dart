import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class Dto<T> {
  const Dto();

  T resolve(BuildContext context);
}

abstract class MergeableDto<T, D extends Dto<T>> extends Dto<T> {
  final List<D> values;

  const MergeableDto(this.values);

  @override
  T resolve(BuildContext context);

  @override
  bool operator ==(Object other) {
    // use listEquals
    if (identical(this, other)) return true;

    return other is MergeableDto<T, D> && listEquals(other.values, values);
  }

  @override
  int get hashCode => values.hashCode;
}
