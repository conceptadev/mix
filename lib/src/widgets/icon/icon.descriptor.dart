
import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import 'icon.attributes.dart';

class IconDescriptor {
  final Color? color;
  final double size;

  const IconDescriptor({
    this.color,
    required this.size,
  });

  factory IconDescriptor.fromContext(MixData mix) {
    final iconAttributes = mix.attributesOfType<IconAttributes>();

    IconDescriptor props;

    if (iconAttributes == null) {
      props = const IconDescriptor(
        size: 24,
      );
    } else {
      final theme = IconTheme.of(mix.resolveToken.context);

      props = IconDescriptor(
        color: iconAttributes.color?.resolve(mix) ?? theme.color,
        size: iconAttributes.size ?? theme.size ?? 24,
      );
    }

    return props;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IconDescriptor &&
        other.color == color &&
        other.size == size;
  }

  @override
  int get hashCode => color.hashCode ^ size.hashCode;
}
