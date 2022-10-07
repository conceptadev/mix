import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/box/box.attributes.dart';
import 'package:mix/src/dto/border.dto.dart';
import 'package:mix/src/dto/border_radius.dto.dart';
import 'package:mix/src/dto/box_shadow.dto.dart';
import 'package:mix/src/dto/edge_insets.dto.dart';
import 'package:mix/src/helpers/extensions.dart';

///
/// ## Widget:
/// - [Box](Box-class.html)
///
/// Utility functions and short utils are listed in [Static Methods](#static-methods)
///
/// {@category Utilities}
class BoxUtility {
  const BoxUtility._();

  /// Short Utils: margin, m
  static BoxAttributes margin(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.all(value));
  }

  /// Short Utils: marginInsets, mi
  static BoxAttributes marginInsets(EdgeInsets insets) {
    return BoxAttributes(margin: EdgeInsetsDto.fromEdgeInsets(insets));
  }

  /// Short Utils: marginTop, mt
  static BoxAttributes marginTop(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(top: value));
  }

  /// Short Utils: marginRight, mr
  static BoxAttributes marginRight(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(right: value));
  }

  /// Short Utils: marginBottom, mb
  static BoxAttributes marginBottom(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(bottom: value));
  }

  /// Short Utils: marginLeft, ml
  static BoxAttributes marginLeft(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(left: value));
  }

  /// Short Utils: marginHorizontal, marginX, mx
  static BoxAttributes marginHorizontal(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.symmetric(horizontal: value));
  }

  /// Short Utils: marginVertical, marginY, my
  static BoxAttributes marginVertical(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.symmetric(vertical: value));
  }

  /// Short Utils: padding, p
  static BoxAttributes padding(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.all(value));
  }

  /// Short Utils: paddingInsets, pi
  static BoxAttributes paddingInsets(EdgeInsets insets) {
    return BoxAttributes(padding: EdgeInsetsDto.fromEdgeInsets(insets));
  }

  /// Short Utils: paddingTop, pt
  static BoxAttributes paddingTop(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(top: value));
  }

  /// Short Utils: paddingRight, pr
  static BoxAttributes paddingRight(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(right: value));
  }

  /// Short Utils: paddingBottom, pb
  static BoxAttributes paddingBottom(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(bottom: value));
  }

  /// Short Utils: paddingLeft, pl
  static BoxAttributes paddingLeft(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(left: value));
  }

  /// Short Utils: paddingHorizontal, px
  static BoxAttributes paddingHorizontal(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.symmetric(horizontal: value));
  }

  /// Short Utils: paddingVertical, py
  static BoxAttributes paddingVertical(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.symmetric(vertical: value));
  }

  /// Short Utils: bgColor
  static BoxAttributes backgroundColor(MixableProperty color) =>
      BoxAttributes(color: MixProperty.ensureProperty(color));

  /// Short Utils: height, h
  static BoxAttributes height(double height) {
    return BoxAttributes(height: height);
  }

  /// Short Utils: width, w
  static BoxAttributes width(double width) {
    return BoxAttributes(width: width);
  }

  /// Short Utils: maxHeight, maxH
  static BoxAttributes maxHeight(double maxHeight) {
    return BoxAttributes(maxHeight: maxHeight);
  }

  /// Short Utils: maxWidth, maxW
  static BoxAttributes maxWidth(double maxWidth) {
    return BoxAttributes(maxWidth: maxWidth);
  }

  /// Short Utils: minHeight, minH
  static BoxAttributes minHeight(double minHeight) {
    return BoxAttributes(minHeight: minHeight);
  }

  /// Short Utils: minWidth, minW
  static BoxAttributes minWidth(double minWidth) {
    return BoxAttributes(minWidth: minWidth);
  }

  /// Short Utils: (none: see rounded)
  static BoxAttributes borderRadius(BorderRadiusDto radius) {
    return BoxAttributes(borderRadius: radius);
  }

  /// Short Utils: rounded, r
  /// (Rounded corners)
  static BoxAttributes rounded(double value) {
    return borderRadius(BorderRadiusDto.all(value));
  }

  /// Short Utils: squared
  /// (Squared corners)
  static BoxAttributes squared() {
    return borderRadius(BorderRadiusDto.zero);
  }

  /// Short Utils: roundedTR, roundedBR, roundedTL, roundedBL
  /// (Rounding select corners)
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

  /// Short Utils: border
  /// (Border attributes for all border sides)
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
      final side = BorderSideDto.only(
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

  /// Short Utils: borderColor
  /// (Border color for all border sides)
  static BoxAttributes borderColor(Color color) {
    return BoxAttributes(border: BorderDto.all(color: color));
  }

  /// Short Utils: borderWidth
  /// (Border width for all border sides)
  static BoxAttributes borderWidth(double width) {
    return BoxAttributes(border: BorderDto.all(width: width));
  }

  /// Short Utils: align
  static BoxAttributes align(Alignment align) {
    return BoxAttributes(alignment: align);
  }

  /// Short Utils: borderStyle
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

  /// Short Utils: shadow
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

  /// Short Utils: elevation
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
          BoxShadowDto(
            blurRadius: 0,
            offset: Offset(0, 0),
            spreadRadius: 0,
            color: Colors.transparent,
          ),
          BoxShadowDto(
            blurRadius: 0,
            offset: Offset(0, 0),
            spreadRadius: 0,
            color: Colors.transparent,
          ),
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
          .map((e) => e.toBoxShadowProps())
          .toList(),
    );
  }
}
