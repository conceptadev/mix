import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import 'flex.attributes.dart';

class FlexDescriptor {
  final Axis? direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final VerticalDirection verticalDirection;
  final double? gapSize;

  const FlexDescriptor({
    this.direction,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.mainAxisSize,
    required this.verticalDirection,
    this.gapSize,
  });

  factory FlexDescriptor.fromContext(MixData mix) {
    final flexAttributes = mix.attributesOfType<FlexAttributes>();

    return FlexDescriptor(
      direction: flexAttributes?.direction,
      mainAxisAlignment:
          flexAttributes?.mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment:
          flexAttributes?.crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: flexAttributes?.mainAxisSize ?? MainAxisSize.max,
      verticalDirection:
          flexAttributes?.verticalDirection ?? VerticalDirection.down,
      gapSize: flexAttributes?.gapSize,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FlexDescriptor &&
        other.direction == direction &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.crossAxisAlignment == crossAxisAlignment &&
        other.mainAxisSize == mainAxisSize &&
        other.verticalDirection == verticalDirection &&
        other.gapSize == gapSize;
  }

  @override
  int get hashCode {
    return direction.hashCode ^
        mainAxisAlignment.hashCode ^
        crossAxisAlignment.hashCode ^
        mainAxisSize.hashCode ^
        verticalDirection.hashCode ^
        gapSize.hashCode;
  }
}
