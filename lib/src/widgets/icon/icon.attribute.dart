import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../attributes/color/color.dto.dart';
import '../../attributes/resolvable_attribute.dart';
import '../../factory/mix_provider_data.dart';

class IconAttributes extends ResolvableAttribute<IconAttributesResolved> {
  final ColorDto? color;
  final double? size;
  final IconData? icon;

  const IconAttributes({this.color, this.size, this.icon});

  @override
  IconAttributes merge(IconAttributes? other) {
    if (other == null) return this;

    return IconAttributes(
      color: color?.merge(other.color) ?? other.color,
      size: size ?? other.size,
      icon: icon ?? other.icon,
    );
  }

  @override
  IconAttributesResolved resolve(MixData mix) {
    //    final iconAttributes = mix.attributeOf<StyledIconAttributes>();

    // StyledIconDescriptor props;

    // if (iconAttributes == null) {
    //   props = const StyledIconDescriptor(size: 24);
    // } else {
    //   final theme = IconTheme.of(mix.resolveToken.context);

    //   props = StyledIconDescriptor(
    //     color: iconAttributes.color?.resolve(mix) ?? theme.color,
    //     size: iconAttributes.size ?? theme.size ?? 24,
    //   );
    // }

    // return props;

    return IconAttributesResolved(
      color: color?.resolve(mix),
      size: size,
      icon: icon,
    );
  }

  @override
  List<Object?> get props => [color, size, icon];
}

class IconAttributesResolved extends Dto {
  final Color? color;
  final double? size;
  final IconData? icon;

  const IconAttributesResolved({
    required this.color,
    required this.size,
    required this.icon,
  });

  @override
  get props => [color, size, icon];
}
