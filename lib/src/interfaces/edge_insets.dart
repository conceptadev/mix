import 'package:flutter/material.dart';
import 'package:mix/src/interfaces/interface.dart';

class IEdgeInsets extends DataInterface<EdgeInsets> {
  const IEdgeInsets({
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  final double? top;
  final double? right;
  final double? bottom;
  final double? left;

  IEdgeInsets merge(IEdgeInsets? other) {
    if (other == null) {
      return this;
    }
    return IEdgeInsets(
      top: other.top ?? top,
      right: other.right ?? right,
      bottom: other.bottom ?? bottom,
      left: other.left ?? left,
    );
  }

  @override
  EdgeInsets generate() {
    return EdgeInsets.only(
      top: top ?? 0,
      right: right ?? 0,
      bottom: bottom ?? 0,
      left: left ?? 0,
    );
  }
}
