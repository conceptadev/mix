import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/box/box.attributes.dart';
import 'package:mix/src/mappers/border.mapper.dart';

class BoxUtility {
  const BoxUtility._();

  /// Rotate property
  static BoxAttributes rotate(int value) {
    return BoxAttributes(rotate: value);
  }

  /// Margin property
  static BoxAttributes margin(double value) {
    return BoxAttributes(margin: EdgeInsets.all(value));
  }

  /// Margin from insets
  static BoxAttributes marginInsets(EdgeInsets insets) {
    return BoxAttributes(margin: insets);
  }

  /// Margin top
  static BoxAttributes marginTop(double value) {
    return BoxAttributes(margin: EdgeInsets.only(top: value));
  }

  /// Margin right
  static BoxAttributes marginRight(double value) {
    return BoxAttributes(margin: EdgeInsets.only(right: value));
  }

  /// Margin bottom
  static BoxAttributes marginBottom(double value) {
    return BoxAttributes(margin: EdgeInsets.only(bottom: value));
  }

  /// Margin left
  static BoxAttributes marginLeft(double value) {
    return BoxAttributes(margin: EdgeInsets.only(left: value));
  }

  /// Margin horizontal
  static BoxAttributes marginHorizontal(double value) {
    return BoxAttributes(margin: EdgeInsets.symmetric(horizontal: value));
  }

  /// Margin vertical
  static BoxAttributes marginVertical(double value) {
    return BoxAttributes(margin: EdgeInsets.symmetric(vertical: value));
  }

  /// Padding property
  static BoxAttributes padding(double value) {
    return BoxAttributes(padding: EdgeInsets.all(value));
  }

  /// Padding from insets
  static BoxAttributes paddingInsets(EdgeInsets insets) {
    return BoxAttributes(padding: insets);
  }

  /// Padding top
  static BoxAttributes paddingTop(double value) {
    return BoxAttributes(padding: EdgeInsets.only(top: value));
  }

  /// Padding right
  static BoxAttributes paddingRight(double value) {
    return BoxAttributes(padding: EdgeInsets.only(right: value));
  }

  /// Padding bottom
  static BoxAttributes paddingBottom(double value) {
    return BoxAttributes(padding: EdgeInsets.only(bottom: value));
  }

  /// Padding left
  static BoxAttributes paddingLeft(double value) {
    return BoxAttributes(padding: EdgeInsets.only(left: value));
  }

  /// Padding horizontal
  static BoxAttributes paddingHorizontal(double value) {
    return BoxAttributes(padding: EdgeInsets.symmetric(horizontal: value));
  }

  /// Padding vertical
  static BoxAttributes paddingVertical(double value) {
    return BoxAttributes(padding: EdgeInsets.symmetric(vertical: value));
  }

  /// Elevation property
  static BoxAttributes elevation(double value) {
    return BoxAttributes(elevation: value);
  }

  /// Opacity
  static BoxAttributes opacity(double value) {
    return BoxAttributes(opacity: value);
  }

  /// Aspect Ratio
  static BoxAttributes aspectRatio(double value) {
    return BoxAttributes(aspectRatio: value);
  }

  /// Background color attribute
  static BoxAttributes backgroundColor(Color color) =>
      BoxAttributes(backgroundColor: color);

  /// Height
  static BoxAttributes height(double height) {
    return BoxAttributes(height: height);
  }

  /// Width
  static BoxAttributes width(double width) {
    return BoxAttributes(width: width);
  }

  /// Max height attribute
  static BoxAttributes maxHeight(double maxHeight) {
    return BoxAttributes(maxHeight: maxHeight);
  }

  /// Max width attribute
  static BoxAttributes maxWidth(double maxWidth) {
    return BoxAttributes(maxWidth: maxWidth);
  }

  /// Min height attribute
  static BoxAttributes minHeight(double minHeight) {
    return BoxAttributes(minHeight: minHeight);
  }

  /// Min width attribute
  static BoxAttributes minWidth(double minWidth) {
    return BoxAttributes(minWidth: minWidth);
  }

  /// Border radius
  static BoxAttributes borderRadius(BorderRadiusProps radius) {
    return BoxAttributes(borderRadius: radius);
  }

  /// Rounded border radius
  static BoxAttributes rounded(double value) {
    return borderRadius(BorderRadiusProps.all(value));
  }

  /// Squared border radius
  static BoxAttributes squared() {
    return borderRadius(BorderRadiusProps.zero);
  }

  static BoxAttributes roundedOnly({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return borderRadius(
      BorderRadiusProps.only(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      ),
    );
  }

  /// Flex
  static BoxAttributes flex(int value) => BoxAttributes(flex: value);

  /// FlexFit
  static BoxAttributes flexFit(FlexFit value) => BoxAttributes(flexFit: value);

  /// Expanded
  static BoxAttributes expanded() {
    return const BoxAttributes(flexFit: FlexFit.tight);
  }

  /// Flexible
  static BoxAttributes flexible() {
    return const BoxAttributes(flexFit: FlexFit.loose);
  }

  /// Border color for all borde sides
  static BoxAttributes border({
    Color? color,
    double? width,
    BorderStyle? style,
    Border? asBorder,
  }) {
    final border = asBorder ??
        BorderSideProps(
          color: color,
          width: width,
          style: style,
        ).toBorder();

    return BoxAttributes(
      border: border,
    );
  }

  /// Border color for all borde sides
  static BoxAttributes borderColor(Color color) {
    return BoxAttributes(border: Border.all(color: color));
  }

  /// Border width for all border sides
  static BoxAttributes borderWidth(double width) {
    return BoxAttributes(border: Border.all(width: width));
  }

  /// Align box attribute
  static BoxAttributes align(Alignment align) {
    return BoxAttributes(alignment: align);
  }

  /// Border style for all border sides
  static BoxAttributes borderStyle(BorderStyle style) {
    return BoxAttributes(border: Border.all(style: style));
  }

  /// Scale transform box utility
  static BoxAttributes scale(double scale) {
    return BoxAttributes(
      scale: scale,
    );
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
}
