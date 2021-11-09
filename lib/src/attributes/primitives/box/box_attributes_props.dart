import 'package:flutter/material.dart';
import 'package:mix/src/attributes/base_attribute.dart';

class BoxShadowProperties extends Properties<BoxShadow> {
  const BoxShadowProperties({
    this.color,
    this.offset,
    this.blurRadius,
    this.spreadRadius,
  });

  /// The amount the box should be inflated prior to applying the blur.
  final double? spreadRadius;
  final Color? color;
  final Offset? offset;
  final double? blurRadius;

  BoxShadowProperties merge(BoxShadowProperties? boxShadow) {
    if (boxShadow == null) {
      return this;
    }
    return BoxShadowProperties(
      color: boxShadow.color ?? color,
      offset: boxShadow.offset ?? offset,
      blurRadius: boxShadow.blurRadius ?? blurRadius,
      spreadRadius: boxShadow.spreadRadius ?? spreadRadius,
    );
  }

  final BoxShadow _defaultBoxShadow = const BoxShadow();

  @override
  BoxShadow build() {
    return BoxShadow(
      color: color ?? _defaultBoxShadow.color,
      offset: offset ?? _defaultBoxShadow.offset,
      blurRadius: blurRadius ?? _defaultBoxShadow.blurRadius,
      spreadRadius: spreadRadius ?? _defaultBoxShadow.spreadRadius,
    );
  }
}
