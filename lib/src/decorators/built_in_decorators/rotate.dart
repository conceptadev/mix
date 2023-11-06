import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

RotateDecorator rotate(int quarterTurns) {
  return RotateDecorator(value: quarterTurns);
}

RotateDecorator rotate90() => rotate(1);
RotateDecorator rotate180() => rotate(2);
RotateDecorator rotate270() => rotate(3);

class RotateDecorator extends ParentDecorator<int> {
  final int value;
  const RotateDecorator({required this.value});

  @override
  RotateDecorator merge(RotateDecorator other) {
    return RotateDecorator(value: other.value);
  }

  @override
  int resolve(MixData mix) => value;

  @override
  get props => [value];

  @override
  Widget build(child, value) {
    return RotatedBox(quarterTurns: value, child: child);
  }
}
