import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../scalars/scalar_util.dart';
import 'constraints_dto.dart';

/// Utility class for building box constraints-related style attributes.
///
/// Accepts a builder function that returns [T] and takes a [BoxConstraintsDto] as a parameter.
///
/// This utility allows for detailed configuration of box constraints,
/// supporting attributes like `minWidth`, `maxWidth`, `minHeight`, and `maxHeight`.
///
/// Example:
/// ```dart
/// BoxConstraintsUtility().minWidth(100).maxHeight(200)
/// ```
class BoxConstraintsUtility<T extends StyleAttribute>
    extends DtoUtility<T, BoxConstraintsDto, BoxConstraints> {
  /// Creates a [BoxConstraintsUtility] with a builder function.
  ///
  /// The builder function takes a [BoxConstraintsDto] as a parameter and returns [T].
  ///
  /// Example:
  /// ```dart
  /// final boxConstraints = BoxConstraintsUtility<StyleAttribute>(builder);
  /// ```
  const BoxConstraintsUtility(super.builder)
      : super(valueToDto: BoxConstraintsDto.from);

  /// Sets the maximum width of the box constraints.
  ///
  /// The `width` parameter sets the largest width that the box can be.
  ///
  /// Example:
  ///
  /// ```dart
  /// final boxConstraints = BoxConstraintsUtility<StyleAttribute>(builder);
  /// final attribute = boxConstraints.maxWidth(100);
  /// ```
  ///
  /// Attribute now holds a [T] with a [BoxConstraintsDto] that has a maxWidth value of `100`.
  DoubleUtility<T> get maxWidth {
    return DoubleUtility((value) => call(maxWidth: value));
  }

  /// Sets the minimum width of the box constraints.
  ///
  /// The `width` parameter sets the smallest width that the box can be.
  ///
  /// Example:
  /// ```dart
  /// final boxConstraints = BoxConstraintsUtility<StyleAttribute>(builder);
  /// final attribute = boxConstraints.minWidth(100);
  /// ```
  ///
  /// Attribute now holds a [T] with a [BoxConstraintsDto] that has a minWidth value of `100`.
  DoubleUtility<T> get minWidth {
    return DoubleUtility((value) => call(minWidth: value));
  }

  /// Sets the minimum height of the box constraints.
  ///
  /// The `height` parameter sets the smallest height that the box can be.
  ///
  /// Example:
  ///
  /// ```dart
  /// final boxConstraints = BoxConstraintsUtility<StyleAttribute>(builder);
  /// final attribute = boxConstraints.minHeight(100);
  /// ```
  ///
  /// Attribute now holds a [T] with a [BoxConstraintsDto] that has a minHeight value of `100`.
  DoubleUtility<T> get minHeight {
    return DoubleUtility((value) => call(minHeight: value));
  }

  /// Sets the maximum height of the box constraints.
  ///
  /// The `height` parameter sets the largest height that the box can be.
  ///
  /// Example:
  ///
  /// ```dart
  /// final boxConstraints = BoxConstraintsUtility<StyleAttribute>(builder);
  /// final attribute = boxConstraints.maxHeight(100);
  /// ```
  ///
  /// Attribute now holds a [T] with a [BoxConstraintsDto] that has a maxHeight value of `100`.
  DoubleUtility<T> get maxHeight {
    return DoubleUtility((value) => call(maxHeight: value));
  }

  T call({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    return builder(
      BoxConstraintsDto(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
    );
  }
}
