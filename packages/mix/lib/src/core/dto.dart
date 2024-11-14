import 'package:flutter/widgets.dart';

import '../internal/compare_mixin.dart';
import 'attribute.dart';
import 'factory/mix_data.dart';
import 'utility.dart';

@immutable
abstract class Dto<Value> with EqualityMixin, MergeableMixin<Dto> {
  const Dto();

  Value get defaultValue;

  Value resolve(MixData mix);
}

abstract class DtoUtility<Attr extends Attribute, D extends Dto<Value>, Value>
    extends MixUtility<Attr, D> {
  final D Function(Value) _fromValue;
  DtoUtility(super.builder, {required D Function(Value) valueToDto})
      : _fromValue = valueToDto;

  Attr only();

  Attr as(Value value) => builder(_fromValue(value));
}
