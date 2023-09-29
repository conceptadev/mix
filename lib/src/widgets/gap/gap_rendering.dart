import 'package:flutter/rendering.dart';

class RenderGap extends RenderBox {
  double _mainAxisExtent;
  double? _crossAxisExtent;
  Axis? _fallbackDirection;
  Color? _color;
  double get mainAxisExtent => _mainAxisExtent;
  double? get crossAxisExtent => _crossAxisExtent;
  Axis? get fallbackDirection => _fallbackDirection;
  Color? get color => _color;
  Axis? get _direction {
    final parentNode = parent;

    return parentNode is RenderFlex ? parentNode.direction : fallbackDirection;
  }

  set mainAxisExtent(double value) {
    if (_mainAxisExtent != value) {
      _mainAxisExtent = value;
      markNeedsLayout();
    }
  }

  set crossAxisExtent(double? value) {
    if (_crossAxisExtent != value) {
      _crossAxisExtent = value;
      markNeedsLayout();
    }
  }

  set fallbackDirection(Axis? value) {
    if (_fallbackDirection != value) {
      _fallbackDirection = value;
      markNeedsLayout();
    }
  }

  set color(Color? value) {
    if (_color != value) {
      _color = value;
      markNeedsPaint();
    }
  }

  RenderGap({
    Color? color,
    double? crossAxisExtent,
    Axis? fallbackDirection,
    required double mainAxisExtent,
  })  : _mainAxisExtent = mainAxisExtent,
        _crossAxisExtent = crossAxisExtent,
        _color = color,
        _fallbackDirection = fallbackDirection;

  @override
  double computeMinIntrinsicWidth(double height) {
    return _computeIntrinsicExtent(
      Axis.horizontal,
      () => super.computeMinIntrinsicWidth(height),
    )!;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return _computeIntrinsicExtent(
      Axis.horizontal,
      () => super.computeMaxIntrinsicWidth(height),
    )!;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    return _computeIntrinsicExtent(
      Axis.vertical,
      () => super.computeMinIntrinsicHeight(width),
    )!;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return _computeIntrinsicExtent(
      Axis.vertical,
      () => super.computeMaxIntrinsicHeight(width),
    )!;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final direction = _direction;

    if (direction != null) {
      return direction == Axis.horizontal
          ? constraints.constrain(Size(mainAxisExtent, crossAxisExtent!))
          : constraints.constrain(Size(crossAxisExtent!, mainAxisExtent));
    }
    throw FlutterError(
      'A Gap widget must be placed directly inside a Flex widget '
      'or its fallbackDirection must not be null',
    );
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (color != null) {
      final paint = Paint()..color = color!;
      context.canvas.drawRect(offset & size, paint);
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('mainAxisExtent', mainAxisExtent));
    properties.add(DoubleProperty('crossAxisExtent', crossAxisExtent));
    properties.add(ColorProperty('color', color));
    properties.add(EnumProperty<Axis>('fallbackDirection', fallbackDirection));
  }

  double? _computeIntrinsicExtent(Axis axis, double Function() compute) {
    final direction = _direction;

    return direction == axis
        ? _mainAxisExtent
        : _crossAxisExtent!.isFinite
            ? _crossAxisExtent
            : compute();
  }
}
