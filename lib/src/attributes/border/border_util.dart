import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../scalars/scalar_util.dart';
import 'border_dto.dart';

/// Utility class for creating and manipulating [BorderSideDto] attributes.
///
/// Accepts a [builder] function that takes a [BorderSideDto] and returns an object of type [T].
///
/// Example usage:
///
/// ```dart
/// final borderSide = BorderSideUtility<StyleAttribute>(builder);
///
/// final attribute = borderSide(
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
class BorderSideUtility<T extends StyleAttribute> extends MixUtility<T, BorderSideDto> {
  const BorderSideUtility(super.builder);

  T _only({
    ColorDto? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return builder(
      BorderSideDto(
        color: color,
        strokeAlign: strokeAlign,
        style: style,
        width: width,
      ),
    );
  }

  /// Returns a [ColorUtility] to manipulate [Color] of the [BorderSideDto]
  ColorUtility<T> get color => ColorUtility((color) => _only(color: color));

  /// Returns a [BorderStyleUtility] to manipulate [BorderStyle] of the [BorderSideDto]
  BorderStyleUtility<T> get style => BorderStyleUtility((style) => _only(style: style));

  T as(BorderSide side) => builder(BorderSideDto.from(side));

  /// Sets the width of the [BorderSideDto]
  T width(double width) => call(width: width);

  /// Sets the stroke align of the [BorderSideDto]
  T strokeAlign(double strokeAlign) => call(strokeAlign: strokeAlign);

  T none() => as(BorderSide.none);

  /// Creates a [BorderSideDto] with the provided parameters and calls the [builder] function.
  T call({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    final side = BorderSideDto(
      color: ColorDto.maybeFrom(color),
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );

    return builder(side);
  }
}

class BorderUtility<T extends StyleAttribute> extends DtoUtility<T, BoxBorderDto, BoxBorder> {
  /// Constructor for creating an instance of the class.
  const BorderUtility(super.builder) : super(valueToDto: BoxBorderDto.from);

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
    return BoxBorderDto(top: side, bottom: side, left: side, right: side);
  }

  BorderDirectionalUtility<T> get _directional =>
      BorderDirectionalUtility((border) => builder(border));

  /// Method to set the border on the start side
  BorderSideUtility<T> get start => _directional.start;

  /// Method to set the border on the end side
  BorderSideUtility<T> get end => _directional.end;

  /// Method to set the border on all sides.
  BorderSideUtility<T> get all {
    return BorderSideUtility((side) => builder(_fromBorderSide(side)));
  }

  /// Method to set the border on the bottom side.
  BorderSideUtility<T> get bottom {
    return BorderSideUtility((side) => only(bottom: side));
  }

  /// Method to set the border on the top side.
  BorderSideUtility<T> get top {
    return BorderSideUtility((side) => only(top: side));
  }

  /// Method to set the border on the left side.
  BorderSideUtility<T> get left {
    return BorderSideUtility((side) => only(left: side));
  }

  /// Method to set the border on the right side.
  BorderSideUtility<T> get right {
    return BorderSideUtility((side) => only(right: side));
  }

  /// Method to set the borders on the vertical sides.
  BorderSideUtility<T> get vertical {
    return BorderSideUtility((side) => builder(_symmetric(vertical: side)));
  }

  /// Method to set the borders on the horizontal sides.
  BorderSideUtility<T> get horizontal {
    return BorderSideUtility(
      (side) => builder(_symmetric(horizontal: side)),
    );
  }

  /// Returns a [ColorUtility] to manipulate [Color] of the [BorderSideDto]
  ColorUtility<T> get color => all.color;

  BorderStyleUtility<T> get style => all.style;

  T width(double width) => all.width(width);

  T strokeAlign(double strokeAlign) => all.strokeAlign(strokeAlign);

  T none() => all.none();

  /// Method to set the border individually on each side.
  T only({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? left,
    BorderSideDto? right,
  }) {
    return builder(
      BoxBorderDto(top: top, bottom: bottom, left: left, right: right),
    );
  }

  /// Creates a [BoxBorderDto] with the provided parameters and calls the [builder] function.
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
    extends DtoUtility<T, BoxBorderDto, BoxBorder> {
  /// Constructor for creating an instance of the class.
  const BorderDirectionalUtility(super.builder) : super(valueToDto: BoxBorderDto.from);

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
    return BoxBorderDto(top: side, bottom: side, start: side, end: side);
  }

  T _only({
    BorderSideDto? top,
    BorderSideDto? bottom,
    BorderSideDto? start,
    BorderSideDto? end,
  }) {
    return builder(
      BoxBorderDto(top: top, bottom: bottom, start: start, end: end),
    );
  }

  /// Method to set the border on all sides.
  BorderSideUtility<T> get all {
    return BorderSideUtility((side) => builder(_fromBorderSide(side)));
  }

  /// Method to set the border on the bottom side.
  BorderSideUtility<T> get bottom {
    return BorderSideUtility((side) => _only(bottom: side));
  }

  /// Method to set the border on the top side.
  BorderSideUtility<T> get top {
    return BorderSideUtility((side) => _only(top: side));
  }

  /// Method to set the border on the start side in a directional context.
  BorderSideUtility<T> get start => BorderSideUtility((side) => _only(start: side));

  /// Method to set the border on the end side in a directional context.
  BorderSideUtility<T> get end => BorderSideUtility((side) => _only(end: side));

  /// Method to set the borders on the vertical sides.
  BorderSideUtility<T> get vertical {
    return BorderSideUtility((side) => builder(_symmetric(vertical: side)));
  }

  /// Method to set the borders on the horizontal sides.
  BorderSideUtility<T> get horizontal {
    return BorderSideUtility(
      (side) => builder(_symmetric(horizontal: side)),
    );
  }

  /// Creates a [BoxBorderDto] with the provided parameters and calls the [builder] function.
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
