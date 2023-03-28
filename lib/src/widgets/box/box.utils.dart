import 'package:flutter/material.dart';

import '../../helpers/dto/border.dto.dart';
import '../../helpers/dto/border_radius.dto.dart';
import '../../helpers/dto/box_shadow.dto.dart';
import '../../helpers/dto/color.dto.dart';
import '../../helpers/dto/edge_insets.dto.dart';
import '../../helpers/dto/radius_dto.dart';
import '../../helpers/mergeable_map.dart';
import 'box.attributes.dart';
import 'box.decorator.dart';

class BoxUtility {
  const BoxUtility._();

  // ignore: long-parameter-list
  static BoxAttributes fromValues({
    EdgeInsets? margin,
    EdgeInsets? padding,
    AlignmentGeometry? alignment,
    double? height,
    double? width,
    // Decoration
    Color? color,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadowDto>? boxShadow,
    Matrix4? transform,

    // Constraints
    double? maxHeight,
    double? minHeight,
    double? maxWidth,
    double? minWidth,
    BoxShape? shape,
    Gradient? gradient,
  }) {
    return BoxAttributes(
      margin: EdgeInsetsDto.maybeFrom(margin),
      padding: EdgeInsetsDto.maybeFrom(padding),
      alignment: alignment,
      height: height,
      width: width,
      // Decoration
      color: ColorDto.maybeFrom(color),
      border: BoxBorderDto.maybeFrom(border),
      borderRadius: BorderRadiusGeometryDto.maybeFrom(borderRadius),
      boxShadow: boxShadow,
      transform: transform,
      // Constraints
      maxHeight: maxHeight,
      minHeight: minHeight,
      maxWidth: maxWidth,
      minWidth: minWidth,
      shape: shape,
      gradient: gradient,
    );
  }

  /// Short Utils: margin, m
  static BoxAttributes margin(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDto.only(
        top: value,
        bottom: value,
        left: value,
        right: value,
      ),
    );
  }

  /// Short Utils: marginInsets, mi
  static BoxAttributes marginInsets(EdgeInsetsGeometry insets) {
    return BoxAttributes(margin: EdgeInsetsGeometryDto.from(insets));
  }

  /// Short Utils: marginTop, mt
  static BoxAttributes marginTop(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDto.only(top: value),
    );
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

  /// Short Utils: marginStart, ms
  static BoxAttributes marginStart(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDirectionalDto.only(
        start: value,
      ),
    );
  }

  /// Short Utils: marginEnd, me
  static BoxAttributes marginEnd(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDirectionalDto.only(
        end: value,
      ),
    );
  }

  /// Short Utils: marginHorizontal, marginX, mx
  static BoxAttributes marginHorizontal(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDto.symmetric(
        horizontal: value,
      ),
    );
  }

  /// Short Utils: marginVertical, marginY, my
  static BoxAttributes marginVertical(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDto.symmetric(
        vertical: value,
      ),
    );
  }

  /// Short Utils: padding, p
  static BoxAttributes padding(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.all(value));
  }

  /// Short Utils: paddingInsets, pi
  static BoxAttributes paddingInsets(EdgeInsetsGeometry insets) {
    return BoxAttributes(padding: EdgeInsetsGeometryDto.from(insets));
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

  /// Short Utils: paddingStart, ps
  static BoxAttributes paddingStart(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDirectionalDto.only(
        start: value,
      ),
    );
  }

  /// Short Utils: paddingEnd, pe
  static BoxAttributes paddingEnd(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDirectionalDto.only(
        end: value,
      ),
    );
  }

  /// Short Utils: paddingHorizontal, px
  static BoxAttributes paddingHorizontal(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDto.symmetric(
        horizontal: value,
      ),
    );
  }

  /// Short Utils: paddingVertical, py
  static BoxAttributes paddingVertical(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDto.symmetric(
        vertical: value,
      ),
    );
  }

  /// Short Utils: bgColor
  static BoxAttributes backgroundColor(Color color) =>
      BoxAttributes(color: ColorDto.from(color));

  /// Short Utils: height, h
  static BoxAttributes height(double height) {
    return BoxAttributes(
      height: height,
    );
  }

  /// Short Utils: width, w
  static BoxAttributes width(double width) {
    return BoxAttributes(
      width: width,
    );
  }

  /// Short Utils: maxHeight, maxH
  static BoxAttributes maxHeight(double maxHeight) {
    return BoxAttributes(
      maxHeight: maxHeight,
    );
  }

  /// Short Utils: maxWidth, maxW
  static BoxAttributes maxWidth(double maxWidth) {
    return BoxAttributes(
      maxWidth: maxWidth,
    );
  }

  /// Short Utils: minHeight, minH
  static BoxAttributes minHeight(double minHeight) {
    return BoxAttributes(
      minHeight: minHeight,
    );
  }

  /// Short Utils: minWidth, minW
  static BoxAttributes minWidth(double minWidth) {
    return BoxAttributes(
      minWidth: minWidth,
    );
  }

  /// Short Utils: (none: see rounded)
  static BoxAttributes borderRadius(BorderRadiusGeometryDto radius) {
    return BoxAttributes(borderRadius: radius);
  }

  /// Short Utils: rounded, r
  /// (Rounded corners)
  static BoxAttributes rounded(double value) {
    return borderRadius(
      BorderRadiusDto.all(
        RadiusDto.circular(
          value,
        ),
      ),
    );
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
        topLeft: topLeft != null ? RadiusDto.circular(topLeft) : null,
        topRight: topRight != null ? RadiusDto.circular(topRight) : null,
        bottomLeft: bottomLeft != null ? RadiusDto.circular(bottomLeft) : null,
        bottomRight:
            bottomRight != null ? RadiusDto.circular(bottomRight) : null,
      ),
    );
  }

  /// Short Utils: roundedTE, roundedBE, roundedTS, roundedBS
  /// (Rounding select corners)
  static BoxAttributes roundedDirectionalOnly({
    double? topStart,
    double? topEnd,
    double? bottomStart,
    double? bottomEnd,
  }) {
    return borderRadius(
      BorderRadiusDirectionalDto.only(
        topStart: topStart != null ? RadiusDto.circular(topStart) : null,
        topEnd: topEnd != null ? RadiusDto.circular(topEnd) : null,
        bottomStart:
            bottomStart != null ? RadiusDto.circular(bottomStart) : null,
        bottomEnd: bottomEnd != null ? RadiusDto.circular(bottomEnd) : null,
      ),
    );
  }

  /// Short Utils: roundedHorizontal, roundedH
  static BoxAttributes roundedHorizontal({
    double? left,
    double? right,
  }) {
    return borderRadius(
      BorderRadiusDto.horizontal(
        left: left != null ? RadiusDto.circular(left) : null,
        right: right != null ? RadiusDto.circular(right) : null,
      ),
    );
  }

  /// Short Utils: roundedVertical, roundedV
  static BoxAttributes roundedVertical({
    double? top,
    double? bottom,
  }) {
    return borderRadius(
      BorderRadiusDto.vertical(
        top: top != null
            ? RadiusDto.circular(
                top,
              )
            : null,
        bottom: bottom != null
            ? RadiusDto.circular(
                bottom,
              )
            : null,
      ),
    );
  }

  /// Short Utils: roundedDirectionalHorizontal, roundedDH
  static BoxAttributes roundedDirectionalHorizontal({
    double? start,
    double? end,
  }) {
    return borderRadius(
      BorderRadiusDirectionalDto.horizontal(
        start: start != null
            ? RadiusDto.circular(
                start,
              )
            : null,
        end: end != null
            ? RadiusDto.circular(
                end,
              )
            : null,
      ),
    );
  }

  /// Short Utils: border
  /// (Border attributes for all border sides)
  static BoxAttributes border({
    Color? color,
    double? width,
    BorderStyle? style,
    // If you want to use a custom border, use [asBorder] instead
    // This will ignore [color], [width] and [style]
    BoxBorder? asBorder,
  }) {
    BoxBorderDto border;

    if (asBorder != null) {
      border = BoxBorderDto.from(asBorder);
    } else {
      border = BorderDto.all(
        color: ColorDto.maybeFrom(color),
        width: width,
        style: style,
      );
    }

    return BoxAttributes(
      border: border,
    );
  }

  /// Short Utils: borderTop, bt
  static BoxAttributes borderTop({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BoxAttributes(
      border: BorderDto.only(
        top: BorderSideDto.only(
          color: ColorDto.maybeFrom(color),
          width: width,
          style: style,
        ),
      ),
    );
  }

  /// Short Utils: borderBottom, bb
  static BoxAttributes borderBottom({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BoxAttributes(
      border: BorderDto.only(
        bottom: BorderSideDto.only(
          color: ColorDto.maybeFrom(color),
          width: width,
          style: style,
        ),
      ),
    );
  }

  /// Short Utils: borderLeft, bl
  static BoxAttributes borderLeft({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BoxAttributes(
      border: BorderDto.only(
        left: BorderSideDto.only(
          color: ColorDto.maybeFrom(color),
          width: width,
          style: style,
        ),
      ),
    );
  }

  /// Short Utils: borderRight, br
  static BoxAttributes borderRight({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BoxAttributes(
      border: BorderDto.only(
        right: BorderSideDto.only(
          color: ColorDto.maybeFrom(color),
          width: width,
          style: style,
        ),
      ),
    );
  }

  /// Short Utils: borderStart, bs
  static BoxAttributes borderStart({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BoxAttributes(
      border: BorderDirectionalDto.only(
        start: BorderSideDto.only(
          color: ColorDto.maybeFrom(color),
          width: width,
          style: style,
        ),
      ),
    );
  }

  /// Short Utils: borderEnd, be
  static BoxAttributes borderEnd({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BoxAttributes(
      border: BorderDirectionalDto.only(
        end: BorderSideDto.only(
          color: ColorDto.maybeFrom(color),
          width: width,
          style: style,
        ),
      ),
    );
  }

  static BoxAttributes transform(Matrix4 transform) {
    return BoxAttributes(transform: transform);
  }

  /// Short Utils: borderColor
  /// (Border color for all border sides)
  static BoxAttributes borderColor(Color color) {
    return BoxAttributes(
      border: BorderDto.all(
        color: ColorDto.maybeFrom(color),
      ),
    );
  }

  /// Short Utils: borderWidth
  /// (Border width for all border sides)
  static BoxAttributes borderWidth(double width) {
    return BoxAttributes(border: BorderDto.all(width: width));
  }

  /// Short Utils: align
  static BoxAttributes align(AlignmentGeometry align) {
    return BoxAttributes(alignment: align);
  }

  /// Short Utils: borderStyle
  /// (Border style for all border sides)
  static BoxAttributes borderStyle(BorderStyle style) {
    return BoxAttributes(border: BorderDto.all(style: style));
  }

  // ignore: long-parameter-list
  static BoxAttributes linearGradient({
    AlignmentGeometry begin = AlignmentDirectional.centerStart,
    AlignmentGeometry end = AlignmentDirectional.centerEnd,
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
    AlignmentGeometry center = Alignment.center,
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
      color: ColorDto.maybeFrom(color),
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );

    return BoxAttributes(
      boxShadow: [boxShadow],
    );
  }

  static BoxAttributes decorators(List<BoxDecorator> decorators) {
    return BoxAttributes(
      decorators: MergeableMap(decorators),
    );
  }

  static BoxAttributes decorator(BoxDecorator decorator) {
    return BoxUtility.decorators([decorator]);
  }

  /// Short Utils: elevation
  static BoxAttributes elevation(int elevation) {
    const elevationOptions = [0, 1, 2, 3, 4, 6, 8, 9, 12, 16, 24];
    assert(
      elevationOptions.contains(elevation),
      'Elevation must be one of the following: ${elevationOptions.join(', ')}',
    );

    const boxShadow = BoxShadowDto(
      blurRadius: 0,
      offset: Offset(0, 0),
      spreadRadius: 0,
      color: ColorDto(Colors.transparent),
    );

    if (elevation == 0) {
      return const BoxAttributes(
        boxShadow: [boxShadow, boxShadow, boxShadow, boxShadow],
      );
    }

    return BoxAttributes(
      boxShadow: kElevationToShadow[elevation]!
          .map((e) => BoxShadowDto.fromBoxShadow(e))
          .toList(),
    );
  }
}
