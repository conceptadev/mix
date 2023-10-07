import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../color/color_dto.dart';
import 'shadow.dto.dart';

class BoxShadowDto extends ShadowDto<BoxShadow> {
  final double? spreadRadius;

  const BoxShadowDto({
    super.color,
    super.offset,
    super.blurRadius,
    this.spreadRadius,
  });

  factory BoxShadowDto.fromBoxShadow(BoxShadow boxShadow) {
    return BoxShadowDto(
      color: ColorDto.from(boxShadow.color),
      offset: Offset(boxShadow.offset.dx, boxShadow.offset.dy),
      blurRadius: boxShadow.blurRadius,
      spreadRadius: boxShadow.spreadRadius,
    );
  }

  @override
  BoxShadow resolve(MixData mix) {
    return BoxShadow(
      color: color?.resolve(mix) ?? const BoxShadow().color,
      offset: offset ?? const BoxShadow().offset,
      blurRadius: blurRadius ?? const BoxShadow().blurRadius,
      spreadRadius: spreadRadius ?? const BoxShadow().spreadRadius,
    );
  }

  @override
  BoxShadowDto merge(BoxShadowDto? other) {
    return BoxShadowDto(
      color: color?.merge(other?.color) ?? color,
      offset: other?.offset ?? offset,
      blurRadius: other?.blurRadius ?? blurRadius,
      spreadRadius: other?.spreadRadius ?? spreadRadius,
    );
  }

  @override
  get props => [color, offset, blurRadius, spreadRadius];
}
