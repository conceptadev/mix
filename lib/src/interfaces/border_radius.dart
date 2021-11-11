import 'package:flutter/material.dart';
import 'package:mix/src/interfaces/interface.dart';

class IBorderRadius extends DataInterface<BorderRadius> {
  const IBorderRadius({
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
  });

  final Radius? topLeft;
  final Radius? topRight;
  final Radius? bottomLeft;
  final Radius? bottomRight;

  const IBorderRadius.all(Radius radius)
      : topLeft = radius,
        topRight = radius,
        bottomLeft = radius,
        bottomRight = radius;

  IBorderRadius merge(IBorderRadius? borderRadius) {
    if (borderRadius == null) {
      return this;
    }
    return IBorderRadius(
      topLeft: borderRadius.topLeft ?? topLeft,
      topRight: borderRadius.topRight ?? topRight,
      bottomLeft: borderRadius.bottomLeft ?? bottomLeft,
      bottomRight: borderRadius.bottomRight ?? bottomRight,
    );
  }

  final BorderRadius _default = const BorderRadius.all(Radius.zero);

  @override
  BorderRadius generate() {
    return BorderRadius.only(
      topLeft: topLeft ?? _default.topLeft,
      topRight: topRight ?? _default.topRight,
      bottomLeft: bottomLeft ?? _default.bottomLeft,
      bottomRight: bottomRight ?? _default.bottomRight,
    );
  }
}
