import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';
import 'color_attribute.dart';

@immutable
class ShadowAttribute<T extends Shadow> extends VisualAttribute<Shadow> {
  final ColorAttribute? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowAttribute({this.blurRadius, this.color, this.offset});

  @override
  Shadow resolve(MixData mix) {
    const defaultShadow = Shadow();

    return Shadow(
      color: color?.resolve(mix) ?? defaultShadow.color,
      offset: offset ?? defaultShadow.offset,
      blurRadius: blurRadius ?? defaultShadow.blurRadius,
    );
  }

  @override
  ShadowAttribute merge(ShadowAttribute? other) {
    return ShadowAttribute(
      blurRadius: other?.blurRadius ?? blurRadius,
      color: color?.merge(other?.color) ?? other?.color,
      offset: other?.offset ?? offset,
    );
  }

  @override
  get props => [color, offset, blurRadius];
}

class BoxShadowAttribute extends ShadowAttribute<BoxShadow> {
  final double? spreadRadius;

  const BoxShadowAttribute({
    super.color,
    super.offset,
    super.blurRadius,
    this.spreadRadius,
  });

  @override
  BoxShadow resolve(MixData mix) {
    const defaultShadow = BoxShadow();

    final shadow = super.resolve(mix);

    return BoxShadow(
      color: shadow.color,
      offset: shadow.offset,
      blurRadius: shadow.blurRadius,
      spreadRadius: spreadRadius ?? defaultShadow.spreadRadius,
    );
  }

  @override
  BoxShadowAttribute merge(BoxShadowAttribute? other) {
    return BoxShadowAttribute(
      color: color?.merge(other?.color) ?? other?.color,
      offset: other?.offset ?? offset,
      blurRadius: other?.blurRadius ?? blurRadius,
      spreadRadius: other?.spreadRadius ?? spreadRadius,
    );
  }

  @override
  get props => [...super.props, spreadRadius];
}
