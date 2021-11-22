import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/box/box.attributes.dart';
import 'package:mix/src/dto/border.dto.dart';
import 'package:mix/src/dto/border_radius.dto.dart';
import 'package:mix/src/dto/box_shadow.dto.dart';
import 'package:mix/src/dto/edge_insets.dto.dart';

class BoxUtility {
  const BoxUtility._();

  /// Margin property
  static BoxAttributes margin(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.all(value));
  }

  /// Margin from insets
  static BoxAttributes marginInsets(EdgeInsets insets) {
    return BoxAttributes(margin: EdgeInsetsDto.fromEdgeInsets(insets));
  }

  /// Margin top
  static BoxAttributes marginTop(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(top: value));
  }

  /// Margin right
  static BoxAttributes marginRight(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(right: value));
  }

  /// Margin bottom
  static BoxAttributes marginBottom(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(bottom: value));
  }

  /// Margin left
  static BoxAttributes marginLeft(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(left: value));
  }

  /// Margin horizontal
  static BoxAttributes marginHorizontal(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.symmetric(horizontal: value));
  }

  /// Margin vertical
  static BoxAttributes marginVertical(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.symmetric(vertical: value));
  }

  /// Padding property
  static BoxAttributes padding(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.all(value));
  }

  /// Padding from insets
  static BoxAttributes paddingInsets(EdgeInsets insets) {
    return BoxAttributes(padding: EdgeInsetsDto.fromEdgeInsets(insets));
  }

  /// Padding top
  static BoxAttributes paddingTop(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(top: value));
  }

  /// Padding right
  static BoxAttributes paddingRight(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(right: value));
  }

  /// Padding bottom
  static BoxAttributes paddingBottom(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(bottom: value));
  }

  /// Padding left
  static BoxAttributes paddingLeft(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(left: value));
  }

  /// Padding horizontal
  static BoxAttributes paddingHorizontal(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.symmetric(horizontal: value));
  }

  /// Padding vertical
  static BoxAttributes paddingVertical(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.symmetric(vertical: value));
  }

  /// Background color attribute
  static BoxAttributes backgroundColor(Color color) =>
      BoxAttributes(color: color);

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
  static BoxAttributes borderRadius(BorderRadiusDto radius) {
    return BoxAttributes(borderRadius: radius);
  }

  /// Rounded border radius
  static BoxAttributes rounded(double value) {
    return borderRadius(BorderRadiusDto.all(value));
  }

  /// Squared border radius
  static BoxAttributes squared() {
    return borderRadius(BorderRadiusDto.zero);
  }

  static BoxAttributes roundedOnly({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return borderRadius(
      BorderRadiusDto.only(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      ),
    );
  }

  /// Border color for all borde sides
  static BoxAttributes border({
    Color? color,
    double? width,
    BorderStyle? style,
    Border? asBorder,
  }) {
    BorderDto border;
    if (asBorder != null) {
      border = BorderDto.fromBorder(asBorder);
    } else {
      final side = BorderSideProps.only(
        color: color,
        width: width,
        style: style,
      );
      border = BorderDto.fromBorderSide(side);
    }

    return BoxAttributes(
      border: border,
    );
  }

  /// Border color for all borde sides
  static BoxAttributes borderColor(Color color) {
    return BoxAttributes(border: BorderDto.all(color: color));
  }

  /// Border width for all border sides
  static BoxAttributes borderWidth(double width) {
    return BoxAttributes(border: BorderDto.all(width: width));
  }

  /// Align box attribute
  static BoxAttributes align(Alignment align) {
    return BoxAttributes(alignment: align);
  }

  /// Border style for all border sides
  static BoxAttributes borderStyle(BorderStyle style) {
    return BoxAttributes(border: BorderDto.all(style: style));
  }

  static BoxAttributes shadow({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    final boxShadow = BoxShadowDto(
      color: color,
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );

    return BoxAttributes(
      boxShadow: [boxShadow],
    );
  }

  /// Elevation property for box attributes
  static BoxAttributes elevation(int elevation) {
    const elevationOptions = [1, 2, 3, 4, 6, 8, 9, 12, 16, 24];
    assert(
      elevationOptions.contains(elevation),
      'Elevation must be one of the following: ${elevationOptions.join(', ')}',
    );

    return BoxAttributes(
      boxShadow: kElevationToShadow[elevation]!
          .map((e) => e.toBoxShadowProps())
          .toList(),
    );
  }
}
