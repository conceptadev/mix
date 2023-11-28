// ignore_for_file: avoid-mutating-parameters

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Gap extends LeafRenderObjectWidget {
  const Gap(this.size, {Key? key}) : super(key: key);

  final double size;

  @override
  RenderGap createRenderObject(BuildContext context) {
    return RenderGap(mainAxisExtent: size);
  }

  @override
  void updateRenderObject(BuildContext context, RenderGap renderObject) {
    renderObject.mainAxisExtent = size;
  }
}

class RenderGap extends RenderBox {
  double _mainAxisExtent;

  RenderGap({required double mainAxisExtent})
      : _mainAxisExtent = mainAxisExtent;

  Axis? get _direction {
    final parentRenderObject = parent;

    return parentRenderObject is RenderFlex
        ? parentRenderObject.direction
        : null;
  }

  double get mainAxisExtent => _mainAxisExtent;
  set mainAxisExtent(double value) {
    if (_mainAxisExtent == value) return;
    _mainAxisExtent = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    final direction = _direction;
    final isHorizontal = direction == Axis.horizontal;

    double extent;
    extent = isHorizontal
        ? constraints.hasBoundedWidth
            ? min(_mainAxisExtent, constraints.maxWidth)
            : _mainAxisExtent
        : constraints.hasBoundedHeight
            ? min(_mainAxisExtent, constraints.maxHeight)
            : _mainAxisExtent;
    size = isHorizontal
        ? Size(extent, constraints.maxHeight)
        : Size(constraints.maxWidth, extent);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // No painting required as this widget is just a gap.
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('mainAxisExtent', mainAxisExtent));
  }
}
