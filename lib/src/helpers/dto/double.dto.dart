import 'package:flutter/material.dart';

import 'dto.dart';

typedef ValueModifier<T> = T Function(T value);

class DoubleDto extends Dto<double> {
  final double value;

  // Modifier is only used after value is resolved.
  final ValueModifier<double>? _modifier;

  const DoubleDto(
    this.value, {
    ValueModifier<double>? directive,
  }) : _modifier = directive;

  @override
  double resolve(BuildContext context) {
    final modifier = _modifier;

    // Apply modifier if it exists
    return modifier != null ? modifier(value) : value;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DoubleDto && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'DoubleDto(value: $value)';
}

// This class allows to create a list Double
// that will only be merged and resolved when the resolve method is called.
@Deprecated('This is not needed due to the Scalar value')
class DoubleRef extends MergeableDto<double, DoubleDto> {
  DoubleRef(double value) : super([DoubleDto(value)]);

  const DoubleRef.fromList(List<DoubleDto> values) : super(values);

  static const zero = DoubleRef.fromList([DoubleDto(0.0)]);

  @override
  double resolve(BuildContext context) {
    var mergedValue = values.first.resolve(context);

    // Skip first value after
    for (var i = 1; i < values.length; i++) {
      mergedValue = values[i].resolve(context);
    }

    return mergedValue;
  }

  DoubleRef copyWith({
    List<DoubleDto>? values,
  }) {
    return DoubleRef.fromList(
      [...this.values, ...?values],
    );
  }

  DoubleRef merge(DoubleRef? other) {
    if (other == null) return this;

    return copyWith(
      values: other.values,
    );
  }
}

extension DoubleExtension on double {
  DoubleDto get dto => DoubleDto(this);
}
