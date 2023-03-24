import 'package:flutter/material.dart';

import 'dto.dart';

typedef ValueModifier<T> = T Function(T value);

class DoubleDto extends Dto<double> {
  final double _value;

  // Modifier is only used after value is resolved.
  final ValueModifier<double>? _modifier;

  const DoubleDto(
    double value, {
    ValueModifier<double>? directive,
  })  : _value = value,
        _modifier = directive;

  factory DoubleDto.from(double value) => DoubleDto(value);

  static DoubleDto? maybeFrom(double? value) {
    if (value == null) return null;

    return DoubleDto(value);
  }

  @override
  double resolve(BuildContext context) {
    final modifier = _modifier;

    // Apply modifier if it exists
    return modifier != null ? modifier(_value) : _value;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DoubleDto && other._value == _value;
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() => 'DoubleDto(value: $_value)';
}
