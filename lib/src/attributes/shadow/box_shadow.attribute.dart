import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../base/color.dto.dart';
import 'shadow.attribute.dart';

class BoxShadowAttribute extends ShadowAttribute<BoxShadow> {
  final double? spreadRadius;

  const BoxShadowAttribute({
    super.color,
    super.offset,
    super.blurRadius,
    this.spreadRadius,
  });

  factory BoxShadowAttribute.fromBoxShadow(BoxShadow boxShadow) {
    return BoxShadowAttribute(
      color: ColorDto(boxShadow.color),
      offset: Offset(boxShadow.offset.dx, boxShadow.offset.dy),
      blurRadius: boxShadow.blurRadius,
      spreadRadius: boxShadow.spreadRadius,
    );
  }

  @override
  BoxShadow resolve(MixData mix) {
    const defaultShadow = BoxShadow();

    return BoxShadow(
      color: color?.resolve(mix) ?? defaultShadow.color,
      offset: offset ?? defaultShadow.offset,
      blurRadius: blurRadius ?? defaultShadow.blurRadius,
      spreadRadius: spreadRadius ?? defaultShadow.spreadRadius,
    );
  }

  @override
  BoxShadowAttribute merge(BoxShadowAttribute? other) {
    return BoxShadowAttribute(
      color: mergeProp(color, other?.color),
      offset: other?.offset ?? offset,
      blurRadius: other?.blurRadius ?? blurRadius,
      spreadRadius: other?.spreadRadius ?? spreadRadius,
    );
  }

  @override
  get props => [...super.props, spreadRadius];
}
