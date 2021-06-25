import 'package:flutter/material.dart';

import '../base_attribute.dart';
import 'border_side.dart';

class BorderUtility {
  BorderAttribute call(BorderSidePosition position, BorderSideAttribute side) {
    switch (position) {
      case BorderSidePosition.all:
        return all(side);
      case BorderSidePosition.left:
        return BorderAttribute(left: side);
      case BorderSidePosition.top:
        return BorderAttribute(top: side);
      case BorderSidePosition.right:
        return BorderAttribute(right: side);
      case BorderSidePosition.bottom:
        return BorderAttribute(bottom: side);
      default:
        throw Exception('Could not generate Border from $side');
    }
  }

  BorderAttribute all(BorderSideAttribute side) {
    return BorderAttribute(
      left: side,
      top: side,
      right: side,
      bottom: side,
    );
  }
}

/// Border attribute
class BorderAttribute extends Attribute<Border> {
  const BorderAttribute({
    this.left,
    this.top,
    this.right,
    this.bottom,
  });

  final BorderSideAttribute? left;
  final BorderSideAttribute? top;
  final BorderSideAttribute? right;
  final BorderSideAttribute? bottom;

  Border get value {
    return Border(
      left: left?.value ?? BorderSide.none,
      top: top?.value ?? BorderSide.none,
      right: right?.value ?? BorderSide.none,
      bottom: bottom?.value ?? BorderSide.none,
    );
  }

  BorderAttribute copyWith(BorderAttribute other) {
    return BorderAttribute(
      left: left?.copyWith(other.left) ?? other.left,
      top: top?.copyWith(other.top) ?? other.top,
      right: right?.copyWith(other.right) ?? other.right,
      bottom: bottom?.copyWith(other.bottom) ?? other.bottom,
    );
  }
}
