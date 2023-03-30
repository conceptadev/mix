import 'package:flutter/material.dart';

import '../../../dtos/border/border.dto.dart';
import '../../../dtos/border/border_side.dto.dart';
import '../../../dtos/border/box_border.dto.dart';
import '../../../dtos/color.dto.dart';
import '../../../dtos/edge_insets/edge_insets.dto.dart';
import '../../../dtos/edge_insets/edge_insets_directional.dto.dart';
import '../../../dtos/radius/border_radius.dto.dart';
import '../../../dtos/radius/border_radius_directional.dto.dart';
import '../../../dtos/radius/border_radius_geometry.dto.dart';
import '../../../dtos/radius/radius_dto.dart';
import '../../../dtos/shadow/box_shadow.dto.dart';
import '../../../helpers/mergeable_map.dart';
import '../box.attributes.dart';
import '../box.decorator.dart';

extension BoxUtilities on BoxAttributes {
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

  static BoxAttributes marginInsets(EdgeInsetsGeometry insets) {
    return BoxAttributes.from(margin: insets);
  }

  static BoxAttributes marginTop(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDto.only(top: value),
    );
  }

  static BoxAttributes marginRight(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(right: value));
  }

  static BoxAttributes marginBottom(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(bottom: value));
  }

  static BoxAttributes marginLeft(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(left: value));
  }

  static BoxAttributes marginStart(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDirectionalDto.only(
        start: value,
      ),
    );
  }

  static BoxAttributes marginEnd(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDirectionalDto.only(
        end: value,
      ),
    );
  }

  static BoxAttributes marginHorizontal(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDto.symmetric(
        horizontal: value,
      ),
    );
  }

  static BoxAttributes marginVertical(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDto.symmetric(
        vertical: value,
      ),
    );
  }

  static BoxAttributes padding(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.all(value));
  }

  static BoxAttributes paddingAll(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.all(value));
  }

  static BoxAttributes paddingOnly(
    double top,
    double right,
    double bottom,
    double left,
  ) {
    return BoxAttributes(
      padding: EdgeInsetsDto.only(
        top: top,
        right: right,
        bottom: bottom,
        left: left,
      ),
    );
  }

  static BoxAttributes paddingInsets(EdgeInsetsGeometry insets) {
    return BoxAttributes.from(padding: insets);
  }

  static BoxAttributes paddingTop(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(top: value));
  }

  static BoxAttributes paddingRight(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(right: value));
  }

  static BoxAttributes paddingBottom(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(bottom: value));
  }

  static BoxAttributes paddingLeft(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(left: value));
  }

  static BoxAttributes paddingStart(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDirectionalDto.only(
        start: value,
      ),
    );
  }

  static BoxAttributes paddingEnd(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDirectionalDto.only(
        end: value,
      ),
    );
  }

  static BoxAttributes paddingHorizontal(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDto.symmetric(
        horizontal: value,
      ),
    );
  }

  static BoxAttributes paddingVertical(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDto.symmetric(
        vertical: value,
      ),
    );
  }

  static BoxAttributes backgroundColor(Color color) =>
      BoxAttributes.from(color: color);

  static BoxAttributes height(double height) {
    return BoxAttributes(
      height: height,
    );
  }

  static BoxAttributes width(double width) {
    return BoxAttributes(
      width: width,
    );
  }

  static BoxAttributes maxHeight(double maxHeight) {
    return BoxAttributes(
      maxHeight: maxHeight,
    );
  }

  static BoxAttributes maxWidth(double maxWidth) {
    return BoxAttributes(
      maxWidth: maxWidth,
    );
  }

  static BoxAttributes minHeight(double minHeight) {
    return BoxAttributes(
      minHeight: minHeight,
    );
  }

  static BoxAttributes minWidth(double minWidth) {
    return BoxAttributes(
      minWidth: minWidth,
    );
  }

  static BoxAttributes _borderRadius(BorderRadiusGeometryDto radius) {
    return BoxAttributes(borderRadius: radius);
  }

  static BoxAttributes rounded(double value) {
    return _borderRadius(
      BorderRadiusDto.all(
        RadiusDto.circular(value),
      ),
    );
  }

  static BoxAttributes squared() {
    return _borderRadius(BorderRadiusDto.zero);
  }

  static BoxAttributes roundedOnly({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return _borderRadius(
      BorderRadiusDto.only(
        topLeft: topLeft != null ? RadiusDto.circular(topLeft) : null,
        topRight: topRight != null ? RadiusDto.circular(topRight) : null,
        bottomLeft: bottomLeft != null ? RadiusDto.circular(bottomLeft) : null,
        bottomRight:
            bottomRight != null ? RadiusDto.circular(bottomRight) : null,
      ),
    );
  }

  static BoxAttributes roundedDirectionalOnly({
    double? topStart,
    double? topEnd,
    double? bottomStart,
    double? bottomEnd,
  }) {
    return _borderRadius(
      BorderRadiusDirectionalDto.only(
        topStart: topStart != null ? RadiusDto.circular(topStart) : null,
        topEnd: topEnd != null ? RadiusDto.circular(topEnd) : null,
        bottomStart:
            bottomStart != null ? RadiusDto.circular(bottomStart) : null,
        bottomEnd: bottomEnd != null ? RadiusDto.circular(bottomEnd) : null,
      ),
    );
  }

  static BoxAttributes roundedHorizontal({
    double? left,
    double? right,
  }) {
    return _borderRadius(
      BorderRadiusDto.horizontal(
        left: left != null ? RadiusDto.circular(left) : null,
        right: right != null ? RadiusDto.circular(right) : null,
      ),
    );
  }

  static BoxAttributes roundedVertical({
    double? top,
    double? bottom,
  }) {
    return _borderRadius(
      BorderRadiusDto.vertical(
        top: top != null ? RadiusDto.circular(top) : null,
        bottom: bottom != null ? RadiusDto.circular(bottom) : null,
      ),
    );
  }

  static BoxAttributes roundedDirectionalHorizontal({
    double? start,
    double? end,
  }) {
    return _borderRadius(
      BorderRadiusDirectionalDto.horizontal(
        start: start != null ? RadiusDto.circular(start) : null,
        end: end != null ? RadiusDto.circular(end) : null,
      ),
    );
  }

  static BoxAttributes roundedDirectionalVertical({
    double? top,
    double? bottom,
  }) {
    return _borderRadius(
      BorderRadiusDirectionalDto.vertical(
        top: top != null ? RadiusDto.circular(top) : null,
        bottom: bottom != null ? RadiusDto.circular(bottom) : null,
      ),
    );
  }

  static BoxAttributes _borderHelper({
    required BoxBorderSide side,
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    BorderSideDto borderSide = BorderSideDto.only(
      color: ColorDto.maybeFrom(color),
      width: width,
      style: style,
    );

    switch (side) {
      case BoxBorderSide.top:
        return BoxAttributes(border: BorderDto.only(top: borderSide));
      case BoxBorderSide.bottom:
        return BoxAttributes(border: BorderDto.only(bottom: borderSide));
      case BoxBorderSide.left:
        return BoxAttributes(border: BorderDto.only(left: borderSide));
      case BoxBorderSide.right:
        return BoxAttributes(border: BorderDto.only(right: borderSide));
      case BoxBorderSide.start:
        return BoxAttributes(
          border: BorderDirectionalDto.only(start: borderSide),
        );
      case BoxBorderSide.end:
        return BoxAttributes(
          border: BorderDirectionalDto.only(end: borderSide),
        );
      default:
        throw ArgumentError('Invalid side provided: $side');
    }
  }

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

    return BoxAttributes(border: border);
  }

  static BoxAttributes borderTop({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return _borderHelper(
      side: BoxBorderSide.top,
      color: color,
      width: width,
      style: style,
    );
  }

  static BoxAttributes borderBottom({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return _borderHelper(
      side: BoxBorderSide.bottom,
      color: color,
      width: width,
      style: style,
    );
  }

  static BoxAttributes borderLeft({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return _borderHelper(
      side: BoxBorderSide.left,
      color: color,
      width: width,
      style: style,
    );
  }

  static BoxAttributes borderRight({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return _borderHelper(
      side: BoxBorderSide.right,
      color: color,
      width: width,
      style: style,
    );
  }

  static BoxAttributes borderStart({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return _borderHelper(
      side: BoxBorderSide.start,
      color: color,
      width: width,
      style: style,
    );
  }

  static BoxAttributes borderEnd({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return _borderHelper(
      side: BoxBorderSide.end,
      color: color,
      width: width,
      style: style,
    );
  }

  static BoxAttributes transform(Matrix4 transform) {
    return BoxAttributes(transform: transform);
  }

  static BoxAttributes borderColor(Color color) {
    return BoxAttributes(
      border: BorderDto.all(
        color: ColorDto.maybeFrom(color),
      ),
    );
  }

  static BoxAttributes borderWidth(double width) {
    return BoxAttributes(border: BorderDto.all(width: width));
  }

  static BoxAttributes align(AlignmentGeometry align) {
    return BoxAttributes(alignment: align);
  }

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
    return BoxUtilities.decorators([decorator]);
  }

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
