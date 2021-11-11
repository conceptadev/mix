import 'package:flutter/material.dart';
import 'package:mix/src/interfaces/border_side.dart';
import 'package:mix/src/interfaces/interface.dart';

class IBorder extends DataInterface<Border> {
  const IBorder({
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  final IBorderSide? top;
  final IBorderSide? right;
  final IBorderSide? bottom;
  final IBorderSide? left;

  /// Creates a border whose sides are all the same.
  ///
  /// The `side` argument must not be null.
  const IBorder.fromBorderSide(IBorderSide side)
      : top = side,
        right = side,
        bottom = side,
        left = side;

  /// A uniform border with all sides the same color and width.
  ///
  /// The sides default to black solid borders, one logical pixel wide.
  factory IBorder.all({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    final IBorderSide side = IBorderSide(
      color: color,
      width: width,
      style: style,
    );
    return IBorder.fromBorderSide(side);
  }

  IBorder merge(IBorder? other) {
    if (other == null) {
      return this;
    }
    return IBorder(
      top: other.top?.merge(other.top) ?? top,
      right: other.right?.merge(other.right) ?? right,
      bottom: other.bottom?.merge(other.bottom) ?? bottom,
      left: other.left?.merge(other.left) ?? left,
    );
  }

  @override
  Border generate() {
    return Border(
      top: top?.generate() ?? BorderSide.none,
      right: right?.generate() ?? BorderSide.none,
      bottom: bottom?.generate() ?? BorderSide.none,
      left: left?.generate() ?? BorderSide.none,
    );
  }
}
