import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../theme/tokens/space_token.dart';
import '../scalars/scalar_util.dart';
import 'spacing_dto.dart';

/// A utility class for defining spacing attributes like padding and margin in Flutter widgets.
///
/// This class provides a convenient and intuitive way to specify various types of spacing in UI components.
/// It works with `SpacingDto` to create custom spacing attributes that can be applied to widgets.
@immutable
class SpacingUtility<T extends StyleAttribute>
    extends DtoUtility<T, SpacingDto, EdgeInsetsGeometry> {
  /// Comment goes here
  const SpacingUtility(super.builder) : super(valueToDto: SpacingDto.from);

  SpacingDirectionalUtility<T> get directional =>
      SpacingDirectionalUtility(builder);

  /// Applies uniform horizontal spacing to a widget.
  ///
  /// This method returns a `SpacingSideUtility<T>` that provides equal horizontal spacing on both the left and right sides of a widget.
  /// It is ideal for consistent horizontal padding or margin, aiding in maintaining a harmonious alignment in the horizontal axis of the layout.
  ///
  /// Parameters:
  /// `value` (double): The spacing value to apply equally to the left and right sides.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Applying 15 units of uniform horizontal spacing to the left and right sides of a widget
  /// final horizontalSpacing = spacing.horizontal(15);
  /// ```
  ///
  /// See also:
  /// * [SpacingSideUtility], the utility class for applying spacing to individual sides of a widget
  SpacingSideUtility<T> get horizontal {
    return SpacingSideUtility(
      (double value) => only(left: value, right: value),
    );
  }

  /// Applies uniform vertical spacing to a widget.
  ///
  /// This method creates a `SpacingSideUtility<T>` instance that applies equal spacing to both the top and bottom sides of a widget.
  /// It's especially useful for achieving symmetrical vertical padding or margin, enhancing the visual balance of the layout.
  ///
  /// Parameters:
  /// `value` (double): The amount of vertical spacing to apply uniformly to the top and bottom.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Creating a vertical spacing utility with 20 units of spacing for the top and bottom sides
  /// final verticalSpacing = spacing.vertical(20);
  /// ```
  ///
  /// See also:
  /// * [SpacingSideUtility], the utility class for applying spacing to individual sides of a widget
  SpacingSideUtility<T> get vertical {
    return SpacingSideUtility(
      (double value) => only(top: value, bottom: value),
    );
  }

  /// Creates a spacing utility that applies uniform spacing to all sides of a widget.
  ///
  /// This method returns a `SpacingSideUtility<T>` for setting equal spacing on the top, bottom, left, and right sides.
  /// It is ideal for creating consistent padding or margin around a widget.
  ///
  /// Parameters:
  /// `value` (double): The uniform spacing value to apply on all sides.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Applying 10 units of uniform spacing to all sides of a widget
  /// final uniformSpacing = spacing.all(10);
  /// ```
  ///
  /// See also:
  /// * [SpacingSideUtility], the utility class for applying spacing to individual sides of a widget
  SpacingSideUtility<T> get all {
    return SpacingSideUtility(
      (double value) =>
          only(top: value, bottom: value, left: value, right: value),
    );
  }

  /// Applies uniform spacing to the top side of a widget.
  ///
  /// This method returns a `SpacingSideUtility<T>` for setting a specified amount of spacing
  /// (either padding or margin) at the top edge of a widget. It is helpful for adjusting vertical
  /// alignment and spacing within layouts.
  ///
  /// Parameters:
  /// `value` (double): The spacing value to be applied to the top side.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Adding 5 units of spacing to the top side of a widget
  /// final topSpacing = spacing.top(5);
  /// ```
  ///
  /// See also:
  /// * [SpacingSideUtility], the utility class for applying spacing to individual sides of a widget
  SpacingSideUtility<T> get top {
    return SpacingSideUtility((value) => only(top: value));
  }

  /// Applies uniform spacing to the bottom side of a widget.
  ///
  /// This method returns a `SpacingSideUtility<T>` for adding a specific amount of spacing
  /// (padding or margin) to the bottom edge. It is useful for managing vertical space and alignment
  /// in widget layouts.
  ///
  /// Parameters:
  /// `value` (double): The spacing value to apply to the bottom side.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Setting 5 units of spacing at the bottom side of a widget
  /// final bottomSpacing = spacing.bottom(5);
  /// ```
  ///
  /// See also:
  /// * [SpacingSideUtility], the utility class for applying spacing to individual sides of a widget
  SpacingSideUtility<T> get bottom {
    return SpacingSideUtility((value) => only(bottom: value));
  }

  /// Applies spacing to the left side.
  ///
  /// Ideal for adding padding or margin to the left edge.
  ///
  /// Example:
  ///
  /// ```dart
  /// final myLeftSpacing = spacing.left(8);
  /// ```
  ///
  /// See also:
  /// * [SpacingSideUtility], the utility class for applying spacing to individual sides of a widget
  SpacingSideUtility<T> get left {
    return SpacingSideUtility((value) => only(left: value));
  }

  /// Applies spacing to the right side.
  ///
  /// Use this method for padding or margin on the right edge.
  ///
  /// Example:
  ///
  /// ```dart
  /// final myRightSpacing = spacing.right(8);
  /// ```
  ///
  /// See also:
  /// * [SpacingSideUtility], the utility class for applying spacing to individual sides of a widget
  SpacingSideUtility<T> get right {
    return SpacingSideUtility((value) => only(right: value));
  }

  /// Applies spacing to the start side of the widget, considering the text direction.
  ///
  /// This method returns a `SpacingSideUtility<T>` for adding padding or margin to the start side,
  /// which is dynamically determined based on the text direction (LTR or RTL).
  /// It is particularly useful in multilingual applications supporting RTL layouts.
  ///
  /// Parameters:
  /// `value` (double): The spacing value to apply to the start side.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Adding 10 units of spacing to the start side of a widget
  /// final startSpacing = spacing.start(10);
  /// ```
  ///
  /// See also:
  /// * [SpacingSideUtility], the utility class for applying spacing to individual sides of a widget
  SpacingSideUtility<T> get start {
    return SpacingSideUtility((value) => only(start: value));
  }

  /// Applies spacing to the end side of the widget, taking into account the text direction.
  ///
  /// This method returns a `SpacingSideUtility<T>` for applying padding or margin to the end side.
  /// The 'end' side is contextually determined based on the current text direction (LTR or RTL), making
  /// it suitable for RTL layouts and localization needs.
  ///
  /// Parameters:
  /// `value` (double): The spacing value to be applied to the end side.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Applying 10 units of spacing to the end side of a widget
  /// final endSpacing = spacing.end(10);
  /// ```
  ///
  /// See also:
  /// * [SpacingSideUtility], the utility class for applying spacing to individual sides of a widget
  SpacingSideUtility<T> get end {
    return SpacingSideUtility((double value) => only(end: value));
  }

  /// Creates a custom spacing attribute with individually specified values for each side.
  ///
  /// This method allows for granular control of spacing by specifying different values for top, bottom, left, right,
  /// start, and end sides. It is versatile for creating complex layouts with different spacing requirements on each side.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Creating a spacing attribute with custom values for each side
  /// final customSpacing = spacing.only(
  ///   top: 10,
  ///   bottom: 20,
  ///   left: 30,
  ///   right: 40,
  /// );
  /// ```
  /// See also:
  /// * [SpacingDto], the data transfer object for [SpacingDto]
  T only({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    return builder(
      SpacingDto.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        start: start,
        end: end,
      ),
    );
  }

  /// Creates a spacing attribute with flexible spacing values based on the number of parameters provided.
  ///
  /// This callable method allows for defining space by passing up to four parameters, each representing a different side.
  /// The behavior varies based on the number of parameters:
  /// - 1 parameter: Applies uniform spacing on all sides.
  /// - 2 parameters: Applies the first value to top and bottom, the second to left and right.
  /// - 3 parameters: Applies the first value to top, the second to left and right, the third to bottom.
  /// - 4 parameters: Applies each value to top, right, bottom, and left respectively.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Creating a spacing attribute with different values for each side
  /// final mixedSpacing = spacing(10, 20, 30, 40);
  /// ```
  /// See also:
  /// * [SpacingDto], the data transfer object for [SpacingDto]
  T call(double p1, [double? p2, double? p3, double? p4]) {
    double top = p1;
    double bottom = p1;
    double left = p1;
    double right = p1;

    if (p2 != null) {
      left = p2;
      right = p2;
    }

    if (p3 != null) bottom = p3;
    if (p4 != null) left = p4;

    return only(top: top, bottom: bottom, left: left, right: right);
  }
}

/// A utility class for creating directional spacing attributes in Flutter widgets.
///
/// `SpacingDirectionalUtility` is tailored for managing spacing attributes with directional properties,
/// such as `start` and `end`, in place of traditional `left` and `right`. This is especially beneficial
/// for layouts that need to support different writing directions (e.g., RTL - Right To Left). It works
/// in conjunction with `SpaceDirectionalAttribute` to apply directional spacing in a readable and
/// maintainable manner.
///
/// Example:
/// ```dart
///   final spacing = SpacingDirectionalUtility(SpacingDto.new);
///
///   // Apply uniform spacing of 10 units on all directional sides.
///   final uniform = spacing.all(10);
///
///   // Apply different spacing values for top, bottom, start, and end.
///   final custom = spacing.only(
///     top: 10,
///     bottom: 20,
///     start: 30,
///     end: 40,
///   );
///
///   // Apply 15 units of vertical and 20 units of horizontal directional spacing.
///   final vertical = spacing.vertical(15);
///   final horizontal = spacing.horizontal(20);
/// ```
///
/// See also:
/// * [SpacingUtility], the utility class for creating spacing attributes
/// * [MixUtility], the base utility class for creating attributes
@immutable
class SpacingDirectionalUtility<T extends StyleAttribute>
    extends DtoUtility<T, SpacingDto, EdgeInsetsGeometry> {
  const SpacingDirectionalUtility(super.builder)
      : super(valueToDto: SpacingDto.from);

  /// Creates a spacing utility that applies uniform spacing to all sides of a widget.
  ///
  /// This method returns a `SpacingSideUtility<T>` for setting equal spacing on the top, bottom, left, and right sides.
  /// It is ideal for creating consistent padding or margin around a widget.
  ///
  /// Parameters:
  /// `value` (double): The uniform spacing value to apply on all sides.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Applying 10 units of uniform spacing to all sides of a widget
  /// final uniformSpacing = spacing.all(10);
  /// ```
  SpacingSideUtility<T> get all {
    return SpacingSideUtility(
      (value) => only(top: value, bottom: value, start: value, end: value),
    );
  }

  /// Applies spacing to the start side of the widget, considering the text direction.
  ///
  /// This method returns a `SpacingSideUtility<T>` for adding padding or margin to the start side,
  /// which is dynamically determined based on the text direction (LTR or RTL).
  /// It is particularly useful in multilingual applications supporting RTL layouts.
  ///
  /// Parameters:
  /// `value` (double): The spacing value to apply to the start side.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Adding 10 units of spacing to the start side of a widget
  /// final startSpacing = spacing.start(10);
  /// ```
  SpacingSideUtility<T> get start {
    return SpacingSideUtility((value) => only(start: value));
  }

  /// Applies spacing to the end side of the widget, taking into account the text direction.
  ///
  /// This method returns a `SpacingSideUtility<T>` for applying padding or margin to the end side.
  /// The 'end' side is contextually determined based on the current text direction (LTR or RTL), making
  /// it suitable for RTL layouts and localization needs.
  ///
  /// Parameters:
  /// `value` (double): The spacing value to be applied to the end side.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Applying 10 units of spacing to the end side of a widget
  /// final endSpacing = spacing.end(10);
  /// ```
  SpacingSideUtility<T> get end {
    return SpacingSideUtility((value) => only(end: value));
  }

  /// Applies uniform spacing to the top side of a widget.
  ///
  /// This method returns a `SpacingSideUtility<T>` for setting a specified amount of spacing
  /// (either padding or margin) at the top edge of a widget. It is helpful for adjusting vertical
  /// alignment and spacing within layouts.
  ///
  /// Parameters:
  /// `value` (double): The spacing value to be applied to the top side.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Adding 5 units of spacing to the top side of a widget
  /// final topSpacing = spacing.top(5);
  /// ```
  SpacingSideUtility<T> get top {
    return SpacingSideUtility((value) => only(top: value));
  }

  /// Applies uniform spacing to the bottom side of a widget.
  ///
  /// This method returns a `SpacingSideUtility<T>` for adding a specific amount of spacing
  /// (padding or margin) to the bottom edge. It is useful for managing vertical space and alignment
  /// in widget layouts.
  ///
  /// Parameters:
  /// `value` (double): The spacing value to apply to the bottom side.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Setting 5 units of spacing at the bottom side of a widget
  /// final bottomSpacing = spacing.bottom(5);
  /// ```
  SpacingSideUtility<T> get bottom {
    return SpacingSideUtility((value) => only(bottom: value));
  }

  /// Applies uniform vertical spacing to a widget.
  ///
  /// This method creates a `SpacingSideUtility<T>` instance that applies equal spacing to both the top and bottom sides of a widget.
  /// It's especially useful for achieving symmetrical vertical padding or margin, enhancing the visual balance of the layout.
  ///
  /// Parameters:
  /// `value` (double): The amount of vertical spacing to apply uniformly to the top and bottom.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Creating a vertical spacing utility with 20 units of spacing for the top and bottom sides
  /// final verticalSpacing = spacing.vertical(20);
  /// ```

  SpacingSideUtility<T> get vertical {
    return SpacingSideUtility((value) => only(top: value, bottom: value));
  }

  /// Applies uniform spacing on left and right sides.
  ///
  /// This method is useful for setting equal spacing on the start and end sides.
  ///
  /// Example:
  ///
  /// ```dart
  /// final horizontalSpacing = spacing.horizontal(15);
  /// ```

  SpacingSideUtility<T> get horizontal {
    return SpacingSideUtility(
      (double value) => only(start: value, end: value),
    );
  }

  /// Creates a spacing attribute with flexible spacing values based on the number of parameters provided.
  ///
  /// This callable method allows for defining space by passing up to four parameters, each representing a different side.
  /// The behavior varies based on the number of parameters:
  /// - 1 parameter: Applies uniform spacing on all sides.
  /// - 2 parameters: Applies the first value to top and bottom, the second to start and end.
  /// - 3 parameters: Applies the first value to top, the second to start and end, the third to bottom.
  /// - 4 parameters: Applies each value to top, end, bottom, and start respectively.
  ///
  /// Parameters:
  /// `p1`, `p2`, `p3`, `p4` (double): Spacing values for different sides.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Creating a spacing attribute with different values for each side
  /// final mixedSpacing = spacing(10, 20, 30, 40,);
  /// ```
  /// See also:
  /// * [SpacingDto], the data transfer object for [SpacingDto]
  T call(double p1, [double? p2, double? p3, double? p4]) {
    double top = p1;
    double bottom = p1;
    double start = p1;
    double end = p1;

    if (p2 != null) {
      start = p2;
      end = p2;
    }

    if (p3 != null) bottom = p3;

    if (p4 != null) start = p4;

    return only(top: top, bottom: bottom, start: start, end: end);
  }

  /// Creates a custom directional spacing attribute with individually specified values for each side.
  ///
  /// This method allows for granular control of spacing by specifying different values for top, bottom, start, end,
  /// start, and end sides. It is versatile for creating complex layouts with different spacing requirements on each side.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Creating a spacing attribute with custom values for each side
  /// final customSpacing = spacing.only(
  ///   top: 10,
  ///   bottom: 20,
  ///   start: 30,
  ///   end: 40,
  /// );
  /// ```
  /// See also:
  /// * [SpacingDto], the data transfer object for [SpacingDto]
  T only({double? top, double? bottom, double? start, double? end}) {
    return builder(
      SpacingDto.only(top: top, bottom: bottom, start: start, end: end),
    );
  }
}

/// A utility class for creating spacing attributes using design tokens from `MixTheme`.
///
/// `SpacingSideUtility` enables the application of standard spacing sizes (like xsmall, small, etc.) or custom values in widget layouts.
/// The sizes used are design tokens defined in `MixTheme`. These tokens are referenced values that get converted to actual spacing during
/// the widget build process, ensuring consistent and theme-aligned spacing throughout the application.
///
/// Example:
/// ```dart
/// // Using predefined spacing sizes from MixTheme design tokens
/// final smallSpacing = spacingSide.small();
///
/// // Applying a custom spacing value, to be converted in line with MixTheme during build
/// final customSpacing = spacingSide(15);
/// ```
///
/// See also:
/// * [SpaceToken], the design tokens for spacing sizes
/// * [SpacingUtility], the utility class for creating spacing attributes
/// * [SpacingDirectionalUtility], the utility class for creating directional spacing attributes
/// * [SpacingDto], the data transfer object for [SpacingDto]
@immutable
class SpacingSideUtility<T extends StyleAttribute>
    extends MixUtility<T, double> {
  /// Creates a `SpacingSideUtility` with a builder function.
  ///
  /// The builder function takes a `double` as a parameter and returns `T`.
  /// Now when using the utility it can inject custom methods into the builder function.
  ///
  /// Methods:
  /// - `xsmall()`: Applies the 'extra-small' spacing size from design tokens.
  /// - `small()`: Applies the 'small' spacing size from design tokens.
  /// - `medium()`: Applies the 'medium' spacing size from design tokens.
  /// - `large()`: Applies the 'large' spacing size from design tokens.
  /// - `xlarge()`: Applies the 'extra-large' spacing size from design tokens.
  /// - `xxlarge()`: Applies the 'extra-extra-large' spacing size from design tokens.
  /// - `call(double value)`: Applies a custom spacing value. The `value` parameter is the spacing value to apply.
  ///
  /// Each method returns a `T` type, representing the spacing attribute created, which aligns with the overall theme and design system of the application.
  const SpacingSideUtility(super.builder);

  /// Applies the 'extra-small' spacing size from design tokens.
  ///
  /// Example:
  ///
  /// ```dart
  /// final smallSpacing = spacingSide.small();
  /// ```
  ///
  /// See also:
  /// * [SpaceToken], the design tokens for spacing sizes
  T xsmall() => builder(SpaceToken.xsmall());

  /// Applies the 'small' spacing size from design tokens.
  ///
  /// Example:
  ///
  /// ```dart
  /// final smallSpacing = spacingSide.small();
  /// ```
  ///
  /// See also:
  /// * [SpaceToken], the design tokens for spacing sizes
  T small() => builder(SpaceToken.small());

  /// Applies the 'medium' spacing size from design tokens.
  ///
  /// Example:
  ///
  /// ```dart
  /// final mediumSpacing = spacingSide.medium();
  /// ```
  ///
  /// See also:
  /// * [SpaceToken], the design tokens for spacing sizes
  T medium() => builder(SpaceToken.medium());

  /// Applies the 'large' spacing size from design tokens.
  ///
  /// Example:
  ///
  /// ```dart
  /// final largeSpacing = spacingSide.large();
  /// ```
  ///
  /// See also:
  /// * [SpaceToken], the design tokens for spacing sizes
  T large() => builder(SpaceToken.large());

  /// Applies the 'extra-large' spacing size from design tokens.
  ///
  /// Example:
  ///
  /// ```dart
  /// final xlargeSpacing = spacingSide.xlarge();
  /// ```
  ///
  /// See also:
  /// * [SpaceToken], the design tokens for spacing sizes
  T xlarge() => builder(SpaceToken.xlarge());

  /// Applies the 'extra-extra-large' spacing size from design tokens.
  ///
  /// Example:
  ///
  /// ```dart
  /// final xxlargeSpacing = spacingSide.xxlarge();
  /// ```
  ///
  /// See also:
  /// * [SpaceToken], the design tokens for spacing sizes
  T xxlarge() => builder(SpaceToken.xxlarge());

  /// Applies a custom spacing value
  ///
  /// Parameters:
  /// `value` (double): The spacing value to apply.
  ///
  /// Example:
  ///
  /// ```dart
  /// final customSpacing = spacingSide(15);
  /// ```
  ///
  /// See also:
  /// * [SpaceToken], the design tokens for spacing sizes
  T call(double value) => builder(value);
}
