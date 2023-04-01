import 'package:flutter/material.dart';

import '../../../dtos/border/border.dto.dart';
import '../../../dtos/border/border_side.dto.dart';
import '../../../dtos/border/box_border.dto.dart';
import '../../../dtos/color.dto.dart';
import '../../../dtos/edge_insets/edge_insets.dto.dart';
import '../../../dtos/edge_insets/edge_insets_directional.dto.dart';
import '../../../dtos/edge_insets/edge_insets_geometry.dto.dart';
import '../../../dtos/radius/border_radius.dto.dart';
import '../../../dtos/radius/border_radius_directional.dto.dart';
import '../../../dtos/radius/border_radius_geometry.dto.dart';
import '../../../dtos/radius/radius_dto.dart';
import '../../../dtos/shadow/box_shadow.dto.dart';
import '../box.attributes.dart';

class BoxUtilities {
  BoxAttributes margin(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDto.only(
        top: value,
        bottom: value,
        left: value,
        right: value,
      ),
    );
  }

  BoxAttributes marginOnly({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return BoxAttributes(
      margin: EdgeInsetsDto.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      ),
    );
  }

  BoxAttributes marginInsets(EdgeInsetsGeometry insets) {
    return BoxAttributes(margin: EdgeInsetsGeometryDto.from(insets));
  }

  BoxAttributes marginSymmetric({
    double? vertical,
    double? horizontal,
  }) {
    return BoxAttributes(
      margin: EdgeInsetsDto.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
    );
  }

  BoxAttributes marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  BoxAttributes marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  BoxAttributes marginTop(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDto.only(top: value),
    );
  }

  BoxAttributes marginRight(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(right: value));
  }

  BoxAttributes marginBottom(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(bottom: value));
  }

  BoxAttributes marginLeft(double value) {
    return BoxAttributes(margin: EdgeInsetsDto.only(left: value));
  }

  BoxAttributes marginDirectionalStart(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDirectionalDto.only(start: value),
    );
  }

  BoxAttributes marginDirectionalEnd(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDirectionalDto.only(end: value),
    );
  }

  BoxAttributes marginDirectionalTop(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDirectionalDto.only(top: value),
    );
  }

  BoxAttributes marginDirectionalBottom(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDirectionalDto.only(bottom: value),
    );
  }

  BoxAttributes padding(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.all(value));
  }

  BoxAttributes paddingAll(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.all(value));
  }

  BoxAttributes paddingOnly(
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

  BoxAttributes paddingSymmetric({
    double? vertical,
    double? horizontal,
  }) {
    return BoxAttributes(
      padding: EdgeInsetsDto.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
    );
  }

  BoxAttributes paddingInsets(EdgeInsetsGeometry insets) {
    return BoxAttributes(padding: EdgeInsetsGeometryDto.from(insets));
  }

  BoxAttributes paddingTop(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(top: value));
  }

  BoxAttributes paddingRight(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(right: value));
  }

  BoxAttributes paddingBottom(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(bottom: value));
  }

  BoxAttributes paddingLeft(double value) {
    return BoxAttributes(padding: EdgeInsetsDto.only(left: value));
  }

  BoxAttributes paddingHorizontal(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDto.symmetric(
        horizontal: value,
      ),
    );
  }

  BoxAttributes paddingVertical(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDto.symmetric(
        vertical: value,
      ),
    );
  }

  BoxAttributes paddingDirectionalOnly({
    double? top,
    double? bottom,
    double? start,
    double? end,
  }) {
    return BoxAttributes(
      padding: EdgeInsetsDirectionalDto.only(
        top: top,
        bottom: bottom,
        start: start,
        end: end,
      ),
    );
  }

  BoxAttributes paddingDirectionalStart(double value) {
    return paddingDirectionalOnly(start: value);
  }

  BoxAttributes paddingDirectionalEnd(double value) {
    return paddingDirectionalOnly(end: value);
  }

  BoxAttributes paddingDirectionalTop(double value) {
    return paddingDirectionalOnly(top: value);
  }

  BoxAttributes paddingDirectionalBottom(double value) {
    return paddingDirectionalOnly(bottom: value);
  }

  BoxAttributes backgroundColor(Color color) {
    return BoxAttributes(
      color: ColorDto.from(color),
    );
  }

  BoxAttributes height(double height) {
    return BoxAttributes(
      height: height,
    );
  }

  BoxAttributes width(double width) {
    return BoxAttributes(
      width: width,
    );
  }

  BoxAttributes maxHeight(double maxHeight) {
    return BoxAttributes(
      maxHeight: maxHeight,
    );
  }

  BoxAttributes maxWidth(double maxWidth) {
    return BoxAttributes(
      maxWidth: maxWidth,
    );
  }

  BoxAttributes minHeight(double minHeight) {
    return BoxAttributes(
      minHeight: minHeight,
    );
  }

  BoxAttributes minWidth(double minWidth) {
    return BoxAttributes(
      minWidth: minWidth,
    );
  }

  BoxAttributes _borderRadius(BorderRadiusGeometryDto radius) {
    return BoxAttributes(borderRadius: radius);
  }

  BoxAttributes rounded(double value) {
    return _borderRadius(
      BorderRadiusDto.all(
        RadiusDto.circular(value),
      ),
    );
  }

  BoxAttributes squared() {
    return _borderRadius(BorderRadiusDto.zero);
  }

  BoxAttributes roundedOnly({
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

  BoxAttributes roundedDirectionalOnly({
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

  BoxAttributes roundedHorizontal({
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

  BoxAttributes roundedVertical({
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

  BoxAttributes roundedDirectionalHorizontal({
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

  BoxAttributes roundedDirectionalVertical({
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

  BorderSideDto _borderSide({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    if (as != null) {
      return BorderSideDto.from(as);
    } else {
      return BorderSideDto.only(
        color: ColorDto.maybeFrom(color),
        width: width,
        style: style,
      );
    }
  }

  BoxAttributes border({
    Color? color,
    double? width,
    BorderStyle? style,
    // If you want to use a custom border, use [asBorder] instead
    // This will ignore [color], [width] and [style]
    BoxBorder? as,
  }) {
    BoxBorderDto border;

    if (as != null) {
      border = BoxBorderDto.from(as);
    } else {
      border = BorderDto.all(
        color: ColorDto.maybeFrom(color),
        width: width,
        style: style,
      );
    }

    return BoxAttributes(border: border);
  }

  BoxAttributes borderTop({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return BoxAttributes(
      border: BorderDto.only(
        top: _borderSide(
          color: color,
          width: width,
          style: style,
        ),
      ),
    );
  }

  BoxAttributes borderBottom({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return BoxAttributes(
      border: BorderDto.only(
        bottom: _borderSide(
          color: color,
          width: width,
          style: style,
        ),
      ),
    );
  }

  BoxAttributes borderLeft({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return BoxAttributes(
      border: BorderDto.only(
        left: _borderSide(
          color: color,
          width: width,
          style: style,
          as: as,
        ),
      ),
    );
  }

  BoxAttributes borderRight({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return BoxAttributes(
      border: BorderDto.only(
        right: _borderSide(
          color: color,
          width: width,
          style: style,
          as: as,
        ),
      ),
    );
  }

  BoxAttributes borderHorizontal({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return BoxAttributes(
      border: BorderDto.symmetric(
        horizontal: _borderSide(
          color: color,
          width: width,
          style: style,
          as: as,
        ),
      ),
    );
  }

  BoxAttributes borderVertical({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return BoxAttributes(
      border: BorderDto.symmetric(
        vertical: _borderSide(
          color: color,
          width: width,
          style: style,
          as: as,
        ),
      ),
    );
  }

  BoxAttributes borderDirectionalTop({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return BoxAttributes(
      border: BorderDirectionalDto.only(
        top: _borderSide(
          color: color,
          width: width,
          style: style,
          as: as,
        ),
      ),
    );
  }

  BoxAttributes borderDirectionalBottom({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return BoxAttributes(
      border: BorderDirectionalDto.only(
        bottom: _borderSide(
          color: color,
          width: width,
          style: style,
          as: as,
        ),
      ),
    );
  }

  BoxAttributes borderDirectionalStart({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return BoxAttributes(
      border: BorderDirectionalDto.only(
        start: _borderSide(
          color: color,
          width: width,
          style: style,
          as: as,
        ),
      ),
    );
  }

  BoxAttributes borderDirectionalEnd({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return BoxAttributes(
      border: BorderDirectionalDto.only(
        end: _borderSide(
          color: color,
          width: width,
          style: style,
          as: as,
        ),
      ),
    );
  }

  BoxAttributes transform(Matrix4 transform) {
    return BoxAttributes(transform: transform);
  }

  BoxAttributes alignment(AlignmentGeometry align) {
    return BoxAttributes(alignment: align);
  }

  // ignore: long-parameter-list
  BoxAttributes linearGradient({
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
  BoxAttributes radialGradient({
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

  BoxAttributes shadow({
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

  BoxAttributes elevation(int elevation) {
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

  @Deprecated('Use border(color:color) instead')
  BoxAttributes borderColor(Color color) {
    return BoxAttributes(
      border: BorderDto.all(
        color: ColorDto.maybeFrom(color),
      ),
    );
  }

  @Deprecated('Use border(width:width) instead')
  BoxAttributes borderWidth(double width) {
    return BoxAttributes(border: BorderDto.all(width: width));
  }

  @Deprecated('Use border(style:style) instead')
  BoxAttributes borderStyle(BorderStyle style) {
    return BoxAttributes(border: BorderDto.all(style: style));
  }

  @Deprecated('Use backgroundColor(style:style) instead')
  BoxAttributes bgColor(Color color) {
    return BoxAttributes(
      color: ColorDto.from(color),
    );
  }

  @Deprecated('Use alignment instead')
  BoxAttributes align(AlignmentGeometry align) {
    return BoxAttributes(alignment: align);
  }

  @Deprecated('Use borderDirectionalEnd instead')
  BoxAttributes borderEnd({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return borderDirectionalEnd(
      color: color,
      width: width,
      style: style,
    );
  }

  @Deprecated('Use borderDirectionalStart instead')
  BoxAttributes borderStart({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return BoxAttributes(
      border: BorderDirectionalDto.only(
        start: _borderSide(
          color: color,
          width: width,
          style: style,
        ),
      ),
    );
  }

  @Deprecated('Use paddingDirectionalStart instead')
  BoxAttributes paddingStart(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDirectionalDto.only(
        start: value,
      ),
    );
  }

  @Deprecated('Use paddingDirectionalEnd instead')
  BoxAttributes paddingEnd(double value) {
    return BoxAttributes(
      padding: EdgeInsetsDirectionalDto.only(
        end: value,
      ),
    );
  }

  @Deprecated('Use marginDirectionalStart instead')
  BoxAttributes marginStart(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDirectionalDto.only(start: value),
    );
  }

  @Deprecated('Use marginDirectionalStart instead')
  BoxAttributes marginEnd(double value) {
    return BoxAttributes(
      margin: EdgeInsetsDirectionalDto.only(end: value),
    );
  }
}
