import 'package:flutter/material.dart';

import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/spacing/spacing_util.dart';
import '../../core/attribute.dart';
import 'flex_attribute.dart';

/// A utility class for building [FlexMixAttribute]s.
final flex = FlexSpecUtility.selfBuilder;

class FlexSpecUtility<T extends StyleAttribute>
    extends MixUtility<T, FlexMixAttribute> {
  static final selfBuilder = FlexSpecUtility((value) => value);

  const FlexSpecUtility(super.builder);

  AxisUtility<T> get direction {
    return AxisUtility((direction) => call(direction: direction));
  }

  MainAxisAlignmentUtility<T> get mainAxisAlignment {
    return MainAxisAlignmentUtility(
      (mainAxisAlignment) => call(mainAxisAlignment: mainAxisAlignment),
    );
  }

  CrossAxisAlignmentUtility<T> get crossAxisAlignment {
    return CrossAxisAlignmentUtility(
      (crossAxisAlignment) => call(crossAxisAlignment: crossAxisAlignment),
    );
  }

  MainAxisSizeUtility<T> get mainAxisSize {
    return MainAxisSizeUtility(
      (mainAxisSize) => call(mainAxisSize: mainAxisSize),
    );
  }

  VerticalDirectionUtility<T> get verticalDirection {
    return VerticalDirectionUtility(
      (verticalDirection) => call(verticalDirection: verticalDirection),
    );
  }

  TextDirectionUtility<T> get textDirection {
    return TextDirectionUtility(
      (textDirection) => call(textDirection: textDirection),
    );
  }

  TextBaselineUtility<T> get textBaseline {
    return TextBaselineUtility(
      (textBaseline) => call(textBaseline: textBaseline),
    );
  }

  ClipUtility<T> get clipBehavior {
    return ClipUtility((clipBehavior) => call(clipBehavior: clipBehavior));
  }

  SpacingSideUtility<T> get gap {
    return SpacingSideUtility((gap) => call(gap: gap));
  }

  T row() => direction.horizontal();
  T column() => direction.vertical();

  T call({
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
    final attriubte = FlexMixAttribute(
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

    return builder(attriubte);
  }
}
