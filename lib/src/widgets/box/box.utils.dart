import 'package:flutter/material.dart';

import '../../helpers/dto/border.dto.dart';
import '../../helpers/dto/border_radius.dto.dart';
import '../../helpers/dto/box_shadow.dto.dart';
import '../../helpers/dto/color.dto.dart';
import '../../helpers/dto/double.dto.dart';
import '../../helpers/dto/edge_insets.dto.dart';
import 'box.attributes.dart';

class BoxUtility {
  const BoxUtility._();

  /// Sets margin for the Box object. value specifies the amount of margin for all sides.
  static BoxAttributes margin(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.all(value.dto));
  }

  /// Sets margin for the Box object using EdgeInsets.
  static BoxAttributes marginInsets(EdgeInsets insets) {
    return BoxAttributes(margin: EdgeInsetsDto.fromEdgeInsets(insets));
  }

  /// Sets margin on top side.
  static BoxAttributes marginTop(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(top: value.dto));
  }

  /// Sets margin on right side.

  static BoxAttributes marginRight(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(right: value.dto));
  }

  /// Sets margin on bottom side.
  static BoxAttributes marginBottom(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(bottom: value.dto));
  }

  /// Sets margin on left side.
  static BoxAttributes marginLeft(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(left: value.dto));
  }

  /// Sets margin on both horizontal sides.
  static BoxAttributes marginHorizontal(double value) {
    return BoxAttributes(
        margin: EdgeInsetsDto.symmetric(horizontal: value.dto));
  }

  /// Sets margin on both vertical sides.
  static BoxAttributes marginVertical(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.symmetric(vertical: value.dto));
  }

  /// Sets padding for the Box object. value specifies the amount of padding for all sides.
  static BoxAttributes padding(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.all(value.dto));
  }

  /// Sets padding for the Box object using EdgeInsets.
  static BoxAttributes paddingInsets(EdgeInsets insets) {
    return BoxAttributes(padding: EdgeInsetsDto.fromEdgeInsets(insets));
  }

  /// Sets padding on top side.
  static BoxAttributes paddingTop(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(top: value.dto));
  }

  /// Sets padding on right side.
  static BoxAttributes paddingRight(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(right: value.dto));
  }

  /// Sets padding on bottom side.
  static BoxAttributes paddingBottom(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(bottom: value.dto));
  }

  /// Sets padding on left side.
  static BoxAttributes paddingLeft(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(left: value.dto));
  }

  /// Sets padding on both horizontal sides.
  static BoxAttributes paddingHorizontal(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDto.symmetric(
        horizontal: value.dto,
      ),
    );
  }

  /// Sets padding on both vertical sides.
  static BoxAttributes paddingVertical(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.symmetric(vertical: value.dto));
  }

  /// Sets the color of the Box object.
  static BoxAttributes backgroundColor(Color color) {
    return BoxAttributes(
      color: ColorDto(color),
    );
  }

  /// Sets the height of the Box object.
  static BoxAttributes height(double height) {
    return BoxAttributes(height: height.dto);
  }

  static BoxAttributes width(double width) {
    return BoxAttributes(width: width.dto);
  }

  static BoxAttributes maxHeight(double maxHeight) {
    return BoxAttributes(maxHeight: maxHeight.dto);
  }

  static BoxAttributes maxWidth(double maxWidth) {
    return BoxAttributes(maxWidth: maxWidth.dto);
  }

  static BoxAttributes minHeight(double minHeight) {
    return BoxAttributes(minHeight: minHeight.dto);
  }

  static BoxAttributes minWidth(double minWidth) {
    return BoxAttributes(minWidth: minWidth.dto);
  }

  static BoxAttributes borderRadius(BorderRadiusDto radius) {
    return BoxAttributes(borderRadius: radius);
  }

  /// (Rounded corners)
  static BoxAttributes rounded(double value) {
    return borderRadius(BorderRadiusDto.all(value.dto));
  }

  /// (Squared corners)
  static BoxAttributes squared() {
    return borderRadius(BorderRadiusDto.zero);
  }

  /// (Rounding select corners)
  static BoxAttributes roundedOnly({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return borderRadius(
      BorderRadiusDto.only(
        topLeft: topLeft?.dto,
        topRight: topRight?.dto,
        bottomLeft: bottomLeft?.dto,
        bottomRight: bottomRight?.dto,
      ),
    );
  }

  /// (Border attributes for all border sides)
  static BoxAttributes border({
    Color? color,
    double? width,
    BorderStyle? style,
    Border? asBorder,
  }) {
    return BoxAttributes(
      border: asBorder != null
          ? BorderDto.fromBorder(asBorder)
          : BorderDto.fromBorderSide(
              BorderSideDto.only(
                color: color,
                width: width,
                style: style,
              ),
            ),
    );
  }

  static BoxAttributes transform(Matrix4 transform) {
    return BoxAttributes(transform: transform);
  }

  /// (Border color for all border sides)
  static BoxAttributes borderColor(Color color) {
    return BoxAttributes(border: BorderDto.all(color: color));
  }

  /// (Border width for all border sides)
  static BoxAttributes borderWidth(double width) {
    return BoxAttributes(border: BorderDto.all(width: width));
  }

  static BoxAttributes align(Alignment align) {
    return BoxAttributes(alignment: align);
  }

  /// (Border style for all border sides)
  static BoxAttributes borderStyle(BorderStyle style) {
    return BoxAttributes(border: BorderDto.all(style: style));
  }

  // ignore: long-parameter-list
  static BoxAttributes linearGradient({
    Alignment begin = Alignment.centerLeft,
    Alignment end = Alignment.centerRight,
    required List<Color> colors,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
  }) {
    return BoxAttributes(
      gradient: LinearGradient(
        begin: begin,
        end: end,
        colors: colors,
        stops: stops,
        tileMode: tileMode,
        transform: transform,
      ),
    );
  }

  // ignore: long-parameter-list
  static BoxAttributes radialGradient({
    Alignment center = Alignment.center,
    double radius = 0.5,
    required List<Color> colors,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    AlignmentGeometry? focal,
    double focalRadius = 0.0,
    GradientTransform? transform,
  }) {
    return BoxAttributes(
      gradient: RadialGradient(
        center: center,
        radius: radius,
        colors: colors,
        stops: stops,
        tileMode: tileMode,
        focal: focal,
        focalRadius: focalRadius,
        transform: transform,
      ),
    );
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

  static BoxAttributes elevation(int elevation) {
    const elevationOptions = [0, 1, 2, 3, 4, 6, 8, 9, 12, 16, 24];
    assert(
      elevationOptions.contains(elevation),
      'Elevation must be one of the following: ${elevationOptions.join(', ')}',
    );

    if (elevation == 0) {
      return const BoxAttributes(
        boxShadow: [
          BoxShadowDto(
            blurRadius: 0,
            offset: Offset(0, 0),
            spreadRadius: 0,
            color: Colors.transparent,
          ),
        ],
      );
    }

    return BoxAttributes(
      boxShadow: kElevationToShadow[elevation]!
          .map((e) => BoxShadowDto.fromBoxShadow(e))
          .toList(),
    );
  }
}
