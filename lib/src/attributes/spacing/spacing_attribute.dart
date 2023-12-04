// ignore_for_file: unnecessary_overrides, prefer-moving-to-variable

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'spacing_dto.dart';

@immutable
abstract class SpacingAttribute<Self extends SpacingAttribute<Self>>
    extends DtoAttribute<Self, SpacingDto, EdgeInsetsGeometry>
    with SingleChildRenderAttributeMixin<Padding> {
  const SpacingAttribute(super.value);

  bool get isDirectional => value.isDirectional;

  double? get top => value.top;
  double? get bottom => value.bottom;
  double? get left => value.left;
  double? get right => value.right;
  double? get start => value.start;
  double? get end => value.end;

  @override
  Padding build(MixData mix, Widget child) {
    return Padding(padding: resolve(mix), child: child);
  }
}

@immutable
class PaddingAttribute extends SpacingAttribute<PaddingAttribute> {
  const PaddingAttribute(super.value);

  @override
  PaddingAttribute merge(PaddingAttribute? other) {
    return other == null ? this : PaddingAttribute(value.merge(other.value));
  }
}

@immutable
class MarginAttribute extends SpacingAttribute<MarginAttribute> {
  const MarginAttribute(super.value);

  @override
  MarginAttribute merge(MarginAttribute? other) {
    return other == null ? this : MarginAttribute(value.merge(other.value));
  }
}
