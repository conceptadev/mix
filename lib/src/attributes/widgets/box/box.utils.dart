import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/widgets/box/box.attributes.dart';

class BoxUtility {
  const BoxUtility._();

  /// Rotate property
  static BoxAttributes rotate(int value) => BoxAttributes(rotate: value);

  /// Margin property
  static BoxAttributes margin(EdgeInsets insets) =>
      BoxAttributes(margin: insets);

  /// Padding property
  static BoxAttributes padding(EdgeInsets insets) =>
      BoxAttributes(padding: insets);

  /// Opacity
  static BoxAttributes opacity(double value) => BoxAttributes(opacity: value);

  /// Aspect Ratio
  static BoxAttributes aspectRatio(double value) =>
      BoxAttributes(aspectRatio: value);

  /// Background color attribute
  static BoxAttributes backgroundColor(Color color) =>
      BoxAttributes(backgroundColor: color);

  /// Height
  static BoxAttributes height(double height) => BoxAttributes(height: height);

  /// Width
  static BoxAttributes width(double width) => BoxAttributes(width: width);

  /// Max height attribute
  static BoxAttributes maxHeight(double maxHeight) =>
      BoxAttributes(maxHeight: maxHeight);

  /// Max width attribute
  static BoxAttributes maxWidth(double maxWidth) =>
      BoxAttributes(maxWidth: maxWidth);

  /// Min height attribute
  static BoxAttributes minHeight(double minHeight) =>
      BoxAttributes(minHeight: minHeight);

  /// Min width attribute
  static BoxAttributes minWidth(double minWidth) =>
      BoxAttributes(minWidth: minWidth);

  static Radius _circular(double? value) => Radius.circular(value ?? 0.0);

  /// Border radius
  static BoxAttributes borderRadius(BorderRadius radius) =>
      BoxAttributes(borderRadius: radius);

  /// Rounded border radius
  static BoxAttributes rounded(double value) =>
      borderRadius(BorderRadius.all(BoxUtility._circular(value)));

  static BoxAttributes roundedOnly({
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

  /// Flex
  static BoxAttributes flex(int value) => BoxAttributes(flex: value);

  /// FlexFit
  static BoxAttributes flexFit(FlexFit value) => BoxAttributes(flexFit: value);

  /// Expanded
  static BoxAttributes expanded() =>
      const BoxAttributes(flexFit: FlexFit.tight);

  /// Flexible
  static BoxAttributes flexible() =>
      const BoxAttributes(flexFit: FlexFit.loose);

  /// Border color for all borde sides
  static BoxAttributes borderColor(Color color) =>
      BoxAttributes(border: Border.all(color: color));

  /// Border width for all border sides
  static BoxAttributes borderWidth(double width) =>
      BoxAttributes(border: Border.all(width: width));

  /// Border style for all border sides
  static BoxAttributes borderStyle(BorderStyle style) {
    return BoxAttributes(border: Border.all(style: style));
  }

  static BoxAttributes shadow({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    const boxShadow = BoxShadow();

    return BoxAttributes(
      boxShadow: boxShadow.copyWith(
        color: color,
        offset: offset,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      ),
    );
  }

  /// Hidden property
  static BoxAttributes hidden([bool? condition = true]) =>
      BoxAttributes(hidden: condition);
}
