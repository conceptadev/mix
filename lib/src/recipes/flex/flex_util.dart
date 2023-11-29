import 'package:flutter/material.dart';

import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/spacing/spacing_util.dart';
import 'flex_attribute.dart';

/// A utility class for building [FlexMixAttribute]s.
final flex = FlexMixtureUtility.selfBuilder;

class FlexMixtureUtility<T> extends MixUtility<T, FlexMixAttribute> {
  static final selfBuilder = FlexMixtureUtility((value) => value);

  const FlexMixtureUtility(super.builder);

  FlexMixAttribute _direction(Axis direction) => call(direction: direction);
  FlexMixAttribute _mainAxisAlignment(MainAxisAlignment mainAxisAlignment) =>
      call(mainAxisAlignment: mainAxisAlignment);
  FlexMixAttribute _crossAxisAlignment(CrossAxisAlignment crossAxisAlignment) =>
      call(crossAxisAlignment: crossAxisAlignment);
  FlexMixAttribute _mainAxisSize(MainAxisSize mainAxisSize) =>
      call(mainAxisSize: mainAxisSize);
  FlexMixAttribute _verticalDirection(VerticalDirection verticalDirection) =>
      call(verticalDirection: verticalDirection);
  FlexMixAttribute _textDirection(TextDirection textDirection) =>
      call(textDirection: textDirection);
  FlexMixAttribute _textBaseline(TextBaseline textBaseline) =>
      call(textBaseline: textBaseline);
  FlexMixAttribute _clipBehavior(Clip clipBehavior) =>
      call(clipBehavior: clipBehavior);
  FlexMixAttribute _gap(double gap) => call(gap: gap);

  AxisUtility<FlexMixAttribute> get direction => AxisUtility(_direction);
  MainAxisAlignmentUtility<FlexMixAttribute> get mainAxisAlignment =>
      MainAxisAlignmentUtility(_mainAxisAlignment);
  CrossAxisAlignmentUtility<FlexMixAttribute> get crossAxisAlignment =>
      CrossAxisAlignmentUtility(_crossAxisAlignment);
  MainAxisSizeUtility<FlexMixAttribute> get mainAxisSize =>
      MainAxisSizeUtility(_mainAxisSize);
  VerticalDirectionUtility<FlexMixAttribute> get verticalDirection =>
      VerticalDirectionUtility(_verticalDirection);
  TextDirectionUtility<FlexMixAttribute> get textDirection =>
      TextDirectionUtility(_textDirection);
  TextBaselineUtility<FlexMixAttribute> get textBaseline =>
      TextBaselineUtility(_textBaseline);
  ClipUtility<FlexMixAttribute> get clipBehavior => ClipUtility(_clipBehavior);
  SpacingSideUtility<FlexMixAttribute> get gap => SpacingSideUtility(_gap);

  FlexMixAttribute row() => _direction(Axis.horizontal);
  FlexMixAttribute column() => _direction(Axis.vertical);

  FlexMixAttribute call({
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
    return FlexMixAttribute(
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
