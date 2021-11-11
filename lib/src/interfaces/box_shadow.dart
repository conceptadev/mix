import 'package:flutter/material.dart';
import 'package:mix/src/interfaces/interface.dart';

class IBoxShadow extends DataInterface<BoxShadow> {
  const IBoxShadow({
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

  IBoxShadow merge(IBoxShadow? boxShadow) {
    if (boxShadow == null) {
      return this;
    }
    return IBoxShadow(
      color: boxShadow.color ?? color,
      offset: boxShadow.offset ?? offset,
      blurRadius: boxShadow.blurRadius ?? blurRadius,
      spreadRadius: boxShadow.spreadRadius ?? spreadRadius,
    );
  }

  final BoxShadow _defaultBoxShadow = const BoxShadow();

  @override
  BoxShadow generate() {
    return BoxShadow(
      color: color ?? _defaultBoxShadow.color,
      offset: offset ?? _defaultBoxShadow.offset,
      blurRadius: blurRadius ?? _defaultBoxShadow.blurRadius,
      spreadRadius: spreadRadius ?? _defaultBoxShadow.spreadRadius,
    );
  }
}
