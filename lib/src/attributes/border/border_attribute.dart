import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'border_dto.dart';

@immutable
class BoxBorderAttribute
    extends DtoAttribute<BoxBorderAttribute, BoxBorderDto, BoxBorder> {
  const BoxBorderAttribute(super.value);

  BorderSideDto? get top => value.top;

  BorderSideDto? get bottom => value.bottom;

  BorderSideDto? get left => value.left;

  BorderSideDto? get right => value.right;

  BorderSideDto? get start => value.start;

  BorderSideDto? get end => value.end;

  @override
  BoxBorderAttribute merge(BoxBorderAttribute? other) {
    return other == null ? this : BoxBorderAttribute(value.merge(other.value));
  }

  @override
  BoxBorder resolve(MixData mix) => value.resolve(mix);

  @override
  List<Object?> get props => [value];
}
