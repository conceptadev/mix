import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../scalars/scalar_util.dart';
import 'constraints_attribute.dart';
import 'constraints_dto.dart';

/// Utility class for building box constraints-related style attributes.
///
/// Accepts a builder function that returns [T] and takes a [BoxConstraintsAttribute] as a parameter.
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
  /// The builder function takes a [BoxConstraintsAttribute] as a parameter and returns [T].
  ///
  /// Example:
  /// ```dart
  /// final boxConstraints = BoxConstraintsUtility<StyleAttribute>(builder);
  /// ```
  const BoxConstraintsUtility(super.builder)
      : super(valueToDto: BoxConstraintsDto.from);

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
  /// Attribute now holds a [T] with a [BoxConstraintsAttribute] that has a minWidth value of `100`.
  T minWidth(double width) => call(minWidth: width);

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
  /// Attribute now holds a [T] with a [BoxConstraintsAttribute] that has a maxWidth value of `100`.
  T maxWidth(double width) => call(maxWidth: width);

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
  /// Attribute now holds a [T] with a [BoxConstraintsAttribute] that has a minHeight value of `100`.
  T minHeight(double height) => call(minHeight: height);

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
  /// Attribute now holds a [T] with a [BoxConstraintsAttribute] that has a maxHeight value of `100`.
  T maxHeight(double height) => call(maxHeight: height);

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
