import 'dart:core';

import 'package:flutter/material.dart';

import 'variant.dart';

typedef WhenContextFunction = bool Function(BuildContext context);

@immutable
class ContextVariant extends Variant {
  final WhenContextFunction _when;

  const ContextVariant(super.name, {required WhenContextFunction when})
      : _when = when;

  bool when(BuildContext context) => _when(context);

  @override
  get props => [name, _when];
}
