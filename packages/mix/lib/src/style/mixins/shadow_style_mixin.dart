import 'package:flutter/material.dart';

import '../../core/mix_element.dart';
import '../../properties/painting/decoration_mix.dart';
import '../../properties/painting/shadow_mix.dart';

/// Mixin that provides convenient shadow styling methods
mixin ShadowStyleMixin<T extends Mix<Object?>> {
  /// Must be implemented by the class using this mixin
  T decoration(DecorationMix value);

  /// Creates a single box shadow with named parameters
  @Deprecated(
    'Use shadow(.color(...).offset(x: ..., y: ...).blurRadius(...)) instead. shadowOnly will be removed in Mix 3.0.',
  )
  T shadowOnly({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    final shadow = BoxShadowMix(
      color: color,
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );

    return decoration(BoxDecorationMix.boxShadow([shadow]));
  }

  /// Creates multiple box shadows from a list of BoxShadowMix
  @Deprecated(
    'Use shadows(value) instead. boxShadows will be removed in Mix 3.0.',
  )
  T boxShadows(List<BoxShadowMix> value) {
    return decoration(BoxDecorationMix.boxShadow(value));
  }

  /// Creates box shadows from Material Design elevation level
  @Deprecated(
    'Use elevation(value) instead. boxElevation will be removed in Mix 3.0.',
  )
  T boxElevation(ElevationShadow value) {
    return decoration(
      BoxDecorationMix.boxShadow(BoxShadowMix.fromElevation(value)),
    );
  }
}
