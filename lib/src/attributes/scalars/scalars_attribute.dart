import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/attribute.dart';

@immutable
abstract class ScalarAttribute<Self extends ScalarAttribute<Self, Value>, Value>
    extends StyleAttribute {
  final Value value;
  const ScalarAttribute(this.value);

  @override
  Type get mergeKey => Self;

  @override
  get props => [value];
}
