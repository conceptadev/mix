import 'package:flutter/widgets.dart';

import '../../core/element.dart';
import '../../core/factory/mix_data.dart';

/// A mixable class that can be used to create a simple mixable class.
/// it is a Mixable class that has no extra logic to resolve or merge.
class SimpleMixableData<T> extends Mixable<T?> {
  final T? value;

  @override
  List<Object?> get props => [value];

  const SimpleMixableData(this.value);

  @override
  T? resolve(MixData mix) => value;

  @override
  SimpleMixableData<T> merge(covariant SimpleMixableData<T>? other) =>
      SimpleMixableData(other?.value ?? value);
}

class MixDouble extends SimpleMixableData<double> {
  MixDouble(super.value);
  const MixDouble.zero() : super(0);
  const MixDouble.infinity() : super(double.infinity);
}

class MixInt extends SimpleMixableData<int> {
  MixInt(super.value);
  const MixInt.zero() : super(0);
}

typedef MixBool = SimpleMixableData<bool>;
typedef MixAlignment = SimpleMixableData<Alignment>;
typedef MixAlignmentGeometry = SimpleMixableData<AlignmentGeometry>;
