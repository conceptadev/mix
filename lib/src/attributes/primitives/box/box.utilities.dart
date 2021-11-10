import 'package:flutter/material.dart';
import 'package:mix/src/attributes/primitives/box/box.properties.dart';

class BoxUtility {
  const BoxUtility();

  /// Rotate property
  BoxProperties rotate(int value) => BoxProperties(rotate: value);

  /// Margin property
  BoxProperties margin(EdgeInsets insets) => BoxProperties(margin: insets);

  /// Padding property
  BoxProperties padding(EdgeInsets insets) => BoxProperties(padding: insets);

  /// Opacity
  BoxProperties opacity(double value) => BoxProperties(opacity: value);

  /// Aspect Ratio
  BoxProperties aspectRatio(double value) => BoxProperties(aspectRatio: value);

  /// Background color attribute
  BoxProperties backgroundColor(Color color) =>
      BoxProperties(backgroundColor: color);

  /// Height
  BoxProperties height(double height) => BoxProperties(height: height);

  /// Width
  BoxProperties width(double width) => BoxProperties(width: width);

  /// Max height attribute
  BoxProperties maxHeight(double maxHeight) =>
      BoxProperties(maxHeight: maxHeight);

  /// Max width attribute
  BoxProperties maxWidth(double maxWidth) => BoxProperties(maxWidth: maxWidth);

  /// Min height attribute
  BoxProperties minHeight(double minHeight) =>
      BoxProperties(minHeight: minHeight);

  /// Min width attribute
  BoxProperties minWidth(double minWidth) => BoxProperties(minWidth: minWidth);

  Radius _circular(double? value) => Radius.circular(value ?? 0.0);

  /// Border radius
  BoxProperties borderRadius(BorderRadius radius) =>
      BoxProperties(borderRadius: radius);

  /// Rounded border radius
  BoxProperties rounded(double value) =>
      borderRadius(BorderRadius.all(_circular(value)));

  BoxProperties roundedOnly({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return borderRadius(
      BorderRadius.only(
        topLeft: _circular(topLeft),
        topRight: _circular(topRight),
        bottomLeft: _circular(bottomLeft),
        bottomRight: _circular(bottomRight),
      ),
    );
  }

  /// Border color for all borde sides
  BoxProperties borderColor(Color color) =>
      BoxProperties(border: Border.all(color: color));

  /// Border width for all border sides
  BoxProperties borderWidth(double width) =>
      BoxProperties(border: Border.all(width: width));

  /// Border style for all border sides
  BoxProperties borderStyle(BorderStyle style) {
    return BoxProperties(border: Border.all(style: style));
  }

  BoxProperties shadow({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return BoxProperties(
      boxShadow: BoxShadowProperties(
        color: color,
        offset: offset,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      ),
    );
  }
}
