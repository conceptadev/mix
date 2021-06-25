import 'package:flutter/material.dart';

import '../base_attribute.dart';
import 'border.dart';

enum BorderSidePosition {
  all,
  left,
  top,
  right,
  bottom,
}

class BorderSideUtility {
  BorderSideUtility(this.position);

  final BorderSidePosition position;

  factory BorderSideUtility.all() => BorderSideUtility(BorderSidePosition.all);

  factory BorderSideUtility.left() =>
      BorderSideUtility(BorderSidePosition.left);

  factory BorderSideUtility.top() => BorderSideUtility(BorderSidePosition.top);

  factory BorderSideUtility.right() =>
      BorderSideUtility(BorderSidePosition.right);

  factory BorderSideUtility.bottom() =>
      BorderSideUtility(BorderSidePosition.bottom);

  BorderAttribute color(Color color) => builder(color: color);
  BorderAttribute width(double width) => builder(width: width);
  BorderAttribute style(BorderStyle style) => builder(style: style);

  BorderAttribute builder({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    final side = BorderSideAttribute(
      color: color,
      width: width,
      style: style,
    );

    return BorderUtility()(position, side);
  }
}

class BorderSideAttribute extends Attribute<BorderSide> {
  const BorderSideAttribute({
    this.color,
    this.width,
    this.style,
  });

  final Color? color;
  final double? width;
  final BorderStyle? style;

  BorderSide get value {
    return BorderSide().copyWith(
      color: color,
      width: width,
      style: style,
    );
  }

  BorderSideAttribute copyWith(BorderSideAttribute? other) {
    return BorderSideAttribute(
      color: other?.color ?? color,
      width: other?.width ?? width,
      style: other?.style ?? style,
    );
  }
}
