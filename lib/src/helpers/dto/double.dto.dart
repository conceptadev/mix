import 'package:flutter/material.dart';

import 'dto.dart';

class DoubleDto extends Dto<double> {
  final double value;

  const DoubleDto(this.value);

  @override
  double resolve(BuildContext context) {
    return value;
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
