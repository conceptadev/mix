import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/values_ext.dart';
import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../scalars/scalar_util.dart';
import 'border_dto.dart';

/// Utility class for creating and manipulating [BoxBorder] attributes.
///
/// Accepts a [builder] function that takes a [BoxBorderDto] and returns an object of type [T].
///
/// Example usage:
///
/// ```dart
/// final boxBorder = BoxBorderUtility<StyleAttribute>(builder);
/// final attribute = boxBorder.all(
///   color: Colors.red,
///   width: 2.0,
/// );
///
/// final borderAttribute = boxBorder(
///   color: Colors.red,
///   width: 2.0,
///   style: BorderStyle.solid,
///   strokeAlign: 0.5,
/// );
/// ```
///
/// See also:
/// * [BoxBorder], which is a class for creating box borders.
/// * [BoxBorderDto], which is a data transfer object for [BoxBorder].
class BoxBorderUtility<T extends StyleAttribute>
    extends DtoUtility<T, BoxBorderDto, BoxBorder> {
  /// Constructor for creating an instance of the class.
  const BoxBorderUtility(super.builder) : super(valueToDto: BoxBorderDto.from);

  BoxBorderDto _symmetric({
    BorderSideDto? vertical,
    BorderSideDto? horizontal,
  }) {
    return BoxBorderDto(
      top: horizontal,
      bottom: horizontal,
      start: vertical,
      end: vertical,
    );
  }

  BoxBorderDto _fromBorderSide(BorderSideDto side) {
    return BoxBorderDto(top: side, bottom: side, left: side, right: side);
  }

  /// Method to set the border on all sides.
  ///
  /// Returns a `BorderSideUtility<T>` object for applying border attributes
  /// to all sides of a box. This method is useful for setting consistent border styles
  /// around the entire box.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderUtility<StyleAttribute>(builder);
  /// final attribute = border.all(
  ///   color: Colors.red,
  ///   width: 2.0,
  /// );
  /// ```
  ///
  /// `attribute` will hold a [T] with a [BorderAttribute] that applies
  /// a red color and a width of 2.0 uniformly to all border sides.
  ///
  /// See also:
  /// * [BorderSideUtility], which is effective for simultaneously configuring [BorderSide] attributes on all sides.
  BorderSideUtility<T> get all {
    return BorderSideUtility((side) => builder(_fromBorderSide(side)));
  }

  /// Method to set the border on the bottom side.
  ///
  /// Returns a `BorderSideUtility<T>` object for configuring border attributes
  /// specifically for the bottom side of a box. This utility enables precise control
  /// over the appearance of the bottom border.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderUtility<StyleAttribute>(builder);
  /// final attribute = border.bottom(
  ///   color: Colors.blue,
  ///   width: 3.0,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  /// ```
  ///
  /// `attribute` will create a [T] with a [BorderAttribute] for the bottom border,
  ///
  /// See also:
  /// * [BorderSideUtility], which offers specialized manipulation of individual [BorderSide] attributes.
  BorderSideUtility<T> get bottom {
    return BorderSideUtility((side) => only(bottom: side));
  }

  /// Method to set the border on the top side.
  ///
  /// Returns a `BorderSideUtility<T>` object for configuring border attributes
  /// specifically for the top side of a box. This utility enables precise control
  /// over the appearance of the top border.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderUtility<StyleAttribute>(builder);
  /// final attribute = border.top(
  ///   color: Colors.blue,
  ///   width: 3.0,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  /// ```
  ///
  /// `attribute` will create a [T] with a [BorderAttribute] for the top border,
  ///
  /// See also:
  /// * [BorderSideUtility], which offers specialized manipulation of individual [BorderSide] attributes.
  BorderSideUtility<T> get top {
    return BorderSideUtility((side) => only(top: side));
  }

  /// Method to set the border on the left side.
  ///
  /// Returns a `BorderSideUtility<T>` object for configuring border attributes
  /// specifically for the left side of a box. This utility enables precise control
  /// over the appearance of the left border.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderUtility<StyleAttribute>(builder);
  /// final attribute = border.left(
  ///   color: Colors.blue,
  ///   width: 3.0,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  /// ```
  ///
  /// `attribute` will create a [T] with a [BoxBorderDto] for the left border,
  ///
  /// See also:
  /// * [BorderSideUtility], which offers specialized manipulation of individual [BorderSide] attributes.
  BorderSideUtility<T> get left {
    return BorderSideUtility((side) => only(left: side));
  }

  /// Method to set the border on the right side.
  ///
  /// Returns a `BorderSideUtility<T>` object for configuring border attributes
  /// specifically for the right side of a box. This utility enables precise control
  /// over the appearance of the right border.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderUtility<StyleAttribute>(builder);
  /// final attribute = border.right(
  ///   color: Colors.blue,
  ///   width: 3.0,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  /// ```
  ///
  /// `attribute` will create a [T] with a [BoxBorderDto] for the right border,
  ///
  /// See also:
  /// * [BorderSideUtility], which offers specialized manipulation of individual [BorderSide] attributes.
  BorderSideUtility<T> get right {
    return BorderSideUtility((side) => only(right: side));
  }

  /// Method to set the border on the start side in a directional context.
  ///
  /// Returns a `BorderSideUtility<T>` designed for applying border attributes
  /// specifically to the start side of a directional box layout.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final boxBorder = BoxBorderUtility<StyleAttribute>(builder);
  /// final attribute = boxBorder.start(
  ///   color: Colors.purple,
  ///   width: 2.5,
  /// );
  /// ```
  ///
  /// In this example, `attribute` will be built with a [BoxBorderDto]
  /// that applies a purple color and a width of 2.5 to the start side of the border.
  ///
  /// See also:
  /// * [BorderSideUtility], which is utilized for modifying [BorderSide] attributes.
  BorderSideUtility<T> get start => directional.start;

  /// Method to set the border on the end side in a directional context.
  ///
  /// Creates a `BorderSideUtility<T>` object for applying border attributes
  /// to the end side of a directional box layout.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final boxBorder = BoxBorderUtility<StyleAttribute>(builder);
  /// final attribute = boxBorder.end(
  ///   color: Colors.orange,
  ///   width: 2.0,
  /// );
  /// ```
  ///
  /// Here, `attribute` will be built with a [BoxBorderDto] configured
  /// with an orange color and a width of 2.0 for the end border side.
  ///
  /// See also:
  /// * [BorderSideUtility], which helps in configuring [BorderSide] attributes for directional layouts.
  BorderSideUtility<T> get end => directional.end;

  /// Method to set the borders on the vertical sides.
  ///
  /// Returns a `BorderSideUtility<T>` object for applying border attributes
  /// to both the left and right sides of a box at the same time.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderUtility<StyleAttribute>(builder);
  /// final attribute = border.vertical(
  ///   color: Colors.indigo,
  ///   width: 1.5,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  ///
  /// In this instance, `attribute` will be built with a [BoxBorderDto]
  /// that applies an indigo color and a width of 1.5 to both the left and right border sides.
  ///
  /// See also:
  /// * [BorderSideUtility], which aids in setting [BorderSide] attributes for vertical borders.
  BorderSideUtility<T> get vertical {
    return BorderSideUtility((side) => builder(_symmetric(vertical: side)));
  }

  /// Method to set the borders on the horizontal sides.
  ///
  /// Returns a `BorderSideUtility<T>` object for applying border attributes
  /// to both the top and bottom sides of a box simultaneously.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderUtility<StyleAttribute>(builder);
  /// final attribute = border.horizontal(
  ///   color: Colors.teal,
  ///   width: 1.0,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  ///
  /// `attribute` will contain a [T] with a [BoxBorderDto] that applies
  /// a teal color and a width of 1.0 to both the top and bottom border sides.
  ///
  /// See also:
  /// * [BorderSideUtility], which facilitates simultaneous configuration of horizontal [BorderSide] attributes.
  BorderSideUtility<T> get horizontal {
    return BorderSideUtility(
      (side) => builder(_symmetric(horizontal: side)),
    );
  }

  /// Method to manage [BorderDirectional] attributes.
  ///
  /// Provides access to a `BorderDirectionalUtility<T>` for manipulating
  /// [BorderDirectional] attributes in a more granular and directional manner.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final boxBorder = BoxBorderUtility<StyleAttribute>(builder);
  /// final attribute = boxBorder.directional.start(
  ///   color: Colors.red,
  ///   width: 2.0,
  /// );
  /// ```
  ///
  /// `attribute` allows for detailed configuration of directional borders,
  /// supporting attributes like `start`, `end`, `top`, and `bottom`.
  ///
  /// See also:
  /// * [BorderDirectionalUtility], which is specialized for directional border attributes.
  BorderDirectionalUtility<T> get directional =>
      BorderDirectionalUtility(builder);

  BoxBorderDto fromBorderSide(BorderSideDto side) {
    return BoxBorderDto(top: side, bottom: side, left: side, right: side);
  }

  T only({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? left,
    BorderSideDto? right,
    BorderSideDto? start,
    BorderSideDto? end,
  }) {
    return builder(
      BoxBorderDto(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        start: start,
        end: end,
      ),
    );
  }

  /// Creates a [BoxBorderDto] with the provided parameters and calls the [builder] function.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final boxBorder = BoxBorderUtility<StyleAttribute>(builder);
  /// final attribute = boxBorder(
  ///   color: Colors.red,
  ///   width: 2.0,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  /// ```
  ///
  /// Attribute now holds a [StyleAttribute] with a [BoxBorderDto] that
  /// has color as red, width as 2.0, and BorderStyle as solid.
  T call({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return all(
      color: color,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );
  }
}

class BorderDirectionalUtility<T extends StyleAttribute>
    extends MixUtility<T, BoxBorderDto> {
  const BorderDirectionalUtility(super.builder);

  BoxBorderDto _symmetric({
    BorderSideDto? vertical,
    BorderSideDto? horizontal,
  }) {
    return BoxBorderDto(
      top: horizontal,
      bottom: horizontal,
      left: vertical,
      right: vertical,
    );
  }

  BoxBorderDto _fromBorderSide(BorderSideDto side) {
    return BoxBorderDto(top: side, bottom: side, start: side, end: side);
  }

  /// Method to set the border on the start side.
  ///
  /// Returns a `BorderSideUtility<T>` object for configuring border attributes
  /// specifically for the start side of a box. This utility enables precise control
  /// over the appearance of the start border.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderDirectionalUtility<StyleAttribute>(builder);
  /// final attribute = border.start(
  ///   color: Colors.red,
  ///   width: 2.0,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  ///
  /// `attribute` will create a [T] with a [BorderDirectionalAttribute] for the start border,
  ///
  /// See also:
  /// * [BorderSideUtility], which offers specialized manipulation of individual [BorderSide] attributes.
  BorderSideUtility<T> get start {
    return BorderSideUtility((side) => only(start: side));
  }

  /// Method to set the border on the end side.
  ///
  /// Returns a `BorderSideUtility<T>` object for configuring border attributes
  /// specifically for the end side of a box. This utility enables precise control
  /// over the appearance of the end border.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderDirectionalUtility<StyleAttribute>(builder);
  /// final attribute = border.end(
  ///   color: Colors.red,
  ///   width: 2.0,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  ///
  /// `attribute` will create a [T] with a [BorderDirectionalAttribute] for the end border,
  ///
  /// See also:
  /// * [BorderSideUtility], which offers specialized manipulation of individual [BorderSide] attributes.
  BorderSideUtility<T> get end {
    return BorderSideUtility((side) => only(end: side));
  }

  /// Method to set the border on the top side.
  ///
  /// Returns a `BorderSideUtility<T>` object for configuring border attributes
  /// specifically for the top side of a box. This utility enables precise control
  /// over the appearance of the top border.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderDirectionalUtility<StyleAttribute>(builder);
  /// final attribute = border.top(
  ///   color: Colors.red,
  ///   width: 2.0,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  ///
  /// `attribute` will create a [T] with a [BorderDirectionalAttribute] for the top border,
  ///
  /// See also:
  /// * [BorderSideUtility], which offers specialized manipulation of individual [BorderSide] attributes.
  BorderSideUtility<T> get top {
    return BorderSideUtility((side) => only(top: side));
  }

  /// Method to set the border on the bottom side.
  ///
  /// Returns a `BorderSideUtility<T>` object for configuring border attributes
  /// specifically for the bottom side of a box. This utility enables precise control
  /// over the appearance of the bottom border.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderDirectionalUtility<StyleAttribute>(builder);
  ///
  /// final attribute = border.bottom(
  ///   color: Colors.red,
  ///   width: 2.0,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  ///
  /// `attribute` will create a [T] with a [BorderDirectionalAttribute] for the bottom border,
  ///
  /// See also:
  /// * [BorderSideUtility], which offers specialized manipulation of individual [BorderSide] attributes.
  BorderSideUtility<T> get bottom {
    return BorderSideUtility((side) => only(bottom: side));
  }

  /// Method to set the borders on the horizontal sides.
  ///
  /// Returns a `BorderSideUtility<T>` object for applying border attributes
  /// to both the start and end sides of a box simultaneously.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderDirectionalUtility<StyleAttribute>(builder);
  ///
  /// final attribute = border.horizontal(
  ///   color: Colors.teal,
  ///   width: 1.0,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  ///
  /// `attribute` will contain a [T] with a [BorderDirectionalAttribute] that applies
  ///
  /// See also:
  /// * [BorderSideUtility], which facilitates simultaneous configuration of horizontal [BorderSide] attributes.
  BorderSideUtility<T> get horizontal {
    return BorderSideUtility(
      (side) => builder(_symmetric(horizontal: side)),
    );
  }

  /// Method to set the borders on the vertical sides.
  ///
  /// Returns a `BorderSideUtility<T>` object for applying border attributes
  /// to both the top and bottom sides of a box simultaneously.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderDirectionalUtility<StyleAttribute>(builder);
  ///
  /// final attribute = border.vertical(
  ///   color: Colors.indigo,
  ///   width: 1.5,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  ///
  /// In this instance, `attribute` will hold a [T] with a [BorderDirectionalAttribute]
  ///
  /// See also:
  /// * [BorderSideUtility], which facilitates simultaneous configuration of vertical [BorderSide] attributes.
  BorderSideUtility<T> get vertical {
    return BorderSideUtility((side) => builder(_symmetric(vertical: side)));
  }

  /// Method to set the borders on all sides.
  ///
  /// Returns a `BorderSideUtility<T>` object for applying border attributes
  /// to all sides of a box simultaneously.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderDirectionalUtility<StyleAttribute>(builder);
  ///
  /// final attribute = border.all(
  ///   color: Colors.red,
  ///   width: 2.0,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  ///
  ///
  /// `attribute` will hold a [T] with a [BorderDirectionalAttribute] that applies
  ///
  /// See also:
  /// * [BorderSideUtility], which facilitates simultaneous configuration of all [BorderSide] attributes.
  BorderSideUtility<T> get all {
    return BorderSideUtility((side) => builder(_fromBorderSide(side)));
  }

  /// Method to set each border side individually.
  ///
  /// Returns a `BorderSideUtility<T>` object for applying border attributes
  /// to each side of a box individually.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderDirectionalUtility<StyleAttribute>(builder);
  /// final attribute = border.only(
  ///   top: BorderSideDto(
  ///     color: Colors.red.toDto(),
  ///     width: 1.0,
  ///     style: BorderStyle.solid,
  ///     strokeAlign: 0.5,
  ///   ),
  ///   bottom: BorderSideDto(
  ///     color: Colors.blue.toDto(),
  ///     width: 1.0,
  ///     style: BorderStyle.solid,
  ///     strokeAlign: 0.5,
  ///   ),
  /// );
  ///
  /// `attribute` will contain a [T] with a [BorderDirectionalAttribute] that applies
  ///
  /// See also:
  /// * [BorderDirectionalAttribute], which is a class for creating border attributes.
  T only({
    BorderSideDto? start,
    BorderSideDto? end,
    BorderSideDto? top,
    BorderSideDto? bottom,
  }) {
    final border = BoxBorderDto(
      top: top,
      bottom: bottom,
      start: start,
      end: end,
    );

    return builder(border);
  }

  /// Allows to set the `BorderSide` properties as parameters. To all sides.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final border = BorderDirectionalUtility<StyleAttribute>(builder);
  /// final attribute = border(
  ///   color: Colors.red,
  ///   width: 2.0,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  ///
  /// attribute will hold a [T] with a [BorderDirectionalAttribute] that has color as red, width as 2.0, and BorderStyle as solid.
  ///
  /// See also:
  /// * [BorderDirectionalAttribute], which is a class for creating border attributes.
  T call({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return all(
      color: color,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );
  }
}

/// Utility class for creating and manipulating [BorderSideDto] attributes.
///
/// Accepts a [builder] function that takes a [BorderSideDto] and returns an object of type [T].
///
/// Example usage:
///
/// ```dart
/// final borderSide = BorderSideUtility<StyleAttribute>(builder);
///
/// final attribute = borderSide.call(
///   color: Colors.red,
///   width: 2.0,
///   style: BorderStyle.solid,
///   strokeAlign: 0.5,
/// );
/// ```
///
/// `attribute` will hold a [T] with a [BorderSideDto] that has color as red, width as 2.0, and BorderStyle as solid.
///
/// See also:
/// * [BorderSideDto], which is a data transfer object for [BorderSide].
class BorderSideUtility<T extends StyleAttribute>
    extends MixUtility<T, BorderSideDto> {
  const BorderSideUtility(super.builder);

  T _only({
    ColorDto? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return builder(BorderSideDto(
      color: color,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    ));
  }

  /// Method to set the color of the [BorderSideDto]
  ///
  /// Returns a `ColorUtility<T>` object for applying color attributes
  /// to the [BorderSideDto].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderSide = BorderSideUtility<StyleAttribute>(builder);
  /// final attribute = borderSide.color(Colors.red);
  /// ```
  ///
  /// `attribute` will hold a [T] with a [BorderSideDto] that has color as red.
  ///
  /// See also:
  /// * [ColorUtility], which is a utility class for manipulating [Color] attributes.
  /// * [ColorDto], which is a data transfer object for [Color].
  ColorUtility<T> get color => ColorUtility((color) => _only(color: color));

  /// Method to set the style of the [BorderSideDto]
  ///
  /// Returns a [BorderStyleUtility] object for applying scalar attributes
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderSide = BorderSideUtility<StyleAttribute>(builder);
  /// final attribute = borderSide.style.solid();
  /// ```
  ///
  /// `attribute` will hold a [T] with a [BorderSideDto] that has style as solid.
  ///
  /// See also:
  /// * [BorderStyleUtility], which is a utility class for manipulating [BorderStyle] attributes.
  BorderStyleUtility<T> get style =>
      BorderStyleUtility((style) => _only(style: style));

  /// Method to set the width of the [BorderSideDto]
  ///
  /// Accepts a [double] value as a parameter.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderSide = BorderSideUtility<StyleAttribute>(builder);
  /// final attribute = borderSide.width(2.0);
  /// ```
  ///
  /// `attribute` will hold a [T] with a [BorderSideDto] that has width as 2.0.
  T width(double width) => call(width: width);

  /// Method to set the stroke align of the [BorderSideDto]
  ///
  /// Accepts a [double] value as a parameter.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderSide = BorderSideUtility<StyleAttribute>(builder);
  /// final attribute = borderSide.strokeAlign(0.5);
  /// ```
  ///
  /// `attribute` will hold a [T] with a [BorderSideDto] that has stroke align as 0.5.
  T strokeAlign(double strokeAlign) => call(strokeAlign: strokeAlign);

  /// Method that allows to set individual properties of the [BorderSideDto] to all sides.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final borderSide = BorderSideUtility<StyleAttribute>(builder);
  /// final attribute = borderSide(
  ///   color: Colors.red,
  ///   width: 2.0,
  ///   style: BorderStyle.solid,
  ///   strokeAlign: 0.5,
  /// );
  ///
  /// attribute will hold a [T] with a [BorderSideDto] that has color as red, width as 2.0, style as solid, and stroke align as 0.5.
  ///
  /// See also:
  /// * [BorderSideDto], which is a data transfer object for [BorderSide].
  T call({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    final side = BorderSideDto(
      color: color?.toDto(),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );

    return builder(side);
  }
}
