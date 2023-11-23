import 'package:flutter/material.dart';

import '../../utils/scalar_util.dart';
import '../../utils/spacing_util.dart';
import 'flex_attribute.dart';

/// A utility class for building [FlexAttribute]s.
const flex = FlexUtility();

class FlexUtility {
  const FlexUtility();

  FlexAttribute _direction(Axis direction) => call(direction: direction);
  FlexAttribute _mainAxisAlignment(MainAxisAlignment mainAxisAlignment) =>
      call(mainAxisAlignment: mainAxisAlignment);
  FlexAttribute _crossAxisAlignment(CrossAxisAlignment crossAxisAlignment) =>
      call(crossAxisAlignment: crossAxisAlignment);
  FlexAttribute _mainAxisSize(MainAxisSize mainAxisSize) =>
      call(mainAxisSize: mainAxisSize);
  FlexAttribute _verticalDirection(VerticalDirection verticalDirection) =>
      call(verticalDirection: verticalDirection);
  FlexAttribute _textDirection(TextDirection textDirection) =>
      call(textDirection: textDirection);
  FlexAttribute _textBaseline(TextBaseline textBaseline) =>
      call(textBaseline: textBaseline);
  FlexAttribute _clipBehavior(Clip clipBehavior) =>
      call(clipBehavior: clipBehavior);
  FlexAttribute _gap(double gap) => call(gap: gap);

  AxisUtility<FlexAttribute> get direction => AxisUtility(_direction);
  MainAxisAlignmentUtility<FlexAttribute> get mainAxisAlignment =>
      MainAxisAlignmentUtility(_mainAxisAlignment);
  CrossAxisAlignmentUtility<FlexAttribute> get crossAxisAlignment =>
      CrossAxisAlignmentUtility(_crossAxisAlignment);
  MainAxisSizeUtility<FlexAttribute> get mainAxisSize =>
      MainAxisSizeUtility(_mainAxisSize);
  VerticalDirectionUtility<FlexAttribute> get verticalDirection =>
      VerticalDirectionUtility(_verticalDirection);
  TextDirectionUtility<FlexAttribute> get textDirection =>
      TextDirectionUtility(_textDirection);
  TextBaselineUtility<FlexAttribute> get textBaseline =>
      TextBaselineUtility(_textBaseline);
  ClipUtility<FlexAttribute> get clipBehavior => ClipUtility(_clipBehavior);
  SpacingUtility<FlexAttribute> get gap => SpacingUtility(_gap);

  FlexAttribute row() => _direction(Axis.horizontal);
  FlexAttribute column() => _direction(Axis.vertical);

  FlexAttribute call({
    Axis? direction,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
    VerticalDirection? verticalDirection,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Clip? clipBehavior,
    double? gap,
  }) {
    return FlexAttribute(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      gap: gap,
    );
  }
}
