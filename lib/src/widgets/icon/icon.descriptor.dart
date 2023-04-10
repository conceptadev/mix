import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import 'icon.attributes.dart';

class StyledIconDescriptor {
  final Color? color;
  final double size;

  const StyledIconDescriptor({
    this.color,
    required this.size,
  });

  factory StyledIconDescriptor.fromContext(MixData mix) {
    final iconAttributes = mix.attributesOfType<StyledIconAttributes>();

    StyledIconDescriptor props;

    if (iconAttributes == null) {
      props = const StyledIconDescriptor(
        size: 24,
      );
    } else {
      final theme = IconTheme.of(mix.resolveToken.context);

      props = StyledIconDescriptor(
        color: iconAttributes.color?.resolve(mix) ?? theme.color,
        size: iconAttributes.size ?? theme.size ?? 24,
      );
    }

    return props;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StyledIconDescriptor &&
        other.color == color &&
        other.size == size;
  }

  @override
  int get hashCode => color.hashCode ^ size.hashCode;
}
