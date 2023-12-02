// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import 'decoration_dto.dart';

@immutable
class DecorationAttribute
    extends DtoAttribute<DecorationAttribute, DecorationDto, Decoration>
    with SingleChildRenderAttributeMixin<DecoratedBox> {
  const DecorationAttribute(super.value);

  @override
  DecorationAttribute merge(DecorationAttribute? other) {
    if (other == null) return this;

    return value.runtimeType == other.value.runtimeType
        ? DecorationAttribute(value.merge(other.value))
        : other;
  }

  @override
  DecoratedBox build(mix, child) {
    return DecoratedBox(decoration: resolve(mix), child: child);
  }
}
