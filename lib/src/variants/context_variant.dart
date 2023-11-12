import 'dart:core';

import 'package:flutter/material.dart';

import 'variant.dart';

typedef WhenContextFunction = bool Function(BuildContext context);

@immutable
class ContextVariant extends Variant {
  final WhenContextFunction when;

  const ContextVariant(super.name, {required this.when});

  @override
  get props => [name, when];
}
