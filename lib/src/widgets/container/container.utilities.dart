import 'package:flutter/material.dart';

import './container.attributes.dart';
import '../../dtos/border/border.dto.dart';
import '../../dtos/border/border_side.dto.dart';
import '../../dtos/border/box_border.dto.dart';
import '../../dtos/color.dto.dart';
import '../../dtos/edge_insets/edge_insets.dto.dart';
import '../../dtos/edge_insets/edge_insets_directional.dto.dart';
import '../../dtos/edge_insets/edge_insets_geometry.dto.dart';
import '../../dtos/radius/border_radius.dto.dart';
import '../../dtos/radius/border_radius_directional.dto.dart';
import '../../dtos/radius/border_radius_geometry.dto.dart';
import '../../dtos/radius/radius_dto.dart';
import '../../dtos/shadow/box_shadow.dto.dart';

class ContainerStyleUtilities {
  StyledContainerAttributes margin(double value) {
    return StyledContainerAttributes(
      margin: EdgeInsetsDto.only(
        top: value,
        bottom: value,
        left: value,
        right: value,
      ),
    );
  }

  StyledContainerAttributes marginOnly({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return StyledContainerAttributes(
      margin: EdgeInsetsDto.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      ),
    );
  }

  StyledContainerAttributes marginInsets(EdgeInsetsGeometry insets) {
    return StyledContainerAttributes(
      margin: EdgeInsetsGeometryDto.from(insets),
    );
  }

  StyledContainerAttributes marginSymmetric({
    double? vertical,
    double? horizontal,
  }) {
    return StyledContainerAttributes(
      margin: EdgeInsetsDto.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
    );
  }

  StyledContainerAttributes marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  StyledContainerAttributes marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  StyledContainerAttributes marginTop(double value) {
    return StyledContainerAttributes(
      margin: EdgeInsetsDto.only(top: value),
    );
  }

  StyledContainerAttributes marginRight(double value) {
    return StyledContainerAttributes(margin: EdgeInsetsDto.only(right: value));
  }

  StyledContainerAttributes marginBottom(double value) {
    return StyledContainerAttributes(margin: EdgeInsetsDto.only(bottom: value));
  }

  StyledContainerAttributes marginLeft(double value) {
    return StyledContainerAttributes(margin: EdgeInsetsDto.only(left: value));
  }

  StyledContainerAttributes marginDirectionalStart(double value) {
    return StyledContainerAttributes(
      margin: EdgeInsetsDirectionalDto.only(start: value),
    );
  }

  StyledContainerAttributes marginDirectionalEnd(double value) {
    return StyledContainerAttributes(
      margin: EdgeInsetsDirectionalDto.only(end: value),
    );
  }

  StyledContainerAttributes marginDirectionalTop(double value) {
    return StyledContainerAttributes(
      margin: EdgeInsetsDirectionalDto.only(top: value),
    );
  }

  StyledContainerAttributes marginDirectionalBottom(double value) {
    return StyledContainerAttributes(
      margin: EdgeInsetsDirectionalDto.only(bottom: value),
    );
  }

  StyledContainerAttributes padding(double value) {
    return StyledContainerAttributes(padding: EdgeInsetsDto.all(value));
  }

  StyledContainerAttributes paddingAll(double value) {
    return StyledContainerAttributes(padding: EdgeInsetsDto.all(value));
  }

  StyledContainerAttributes paddingOnly(
    double top,
    double right,
    double bottom,
    double left,
  ) {
    return StyledContainerAttributes(
      padding: EdgeInsetsDto.only(
        top: top,
        right: right,
        bottom: bottom,
        left: left,
      ),
    );
  }

  StyledContainerAttributes paddingSymmetric({
    double? vertical,
    double? horizontal,
  }) {
    return StyledContainerAttributes(
      padding: EdgeInsetsDto.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
    );
  }

  StyledContainerAttributes paddingInsets(EdgeInsetsGeometry insets) {
    return StyledContainerAttributes(
      padding: EdgeInsetsGeometryDto.from(insets),
    );
  }

  StyledContainerAttributes paddingTop(double value) {
    return StyledContainerAttributes(padding: EdgeInsetsDto.only(top: value));
  }

  StyledContainerAttributes paddingRight(double value) {
    return StyledContainerAttributes(padding: EdgeInsetsDto.only(right: value));
  }

  StyledContainerAttributes paddingBottom(double value) {
    return StyledContainerAttributes(
      padding: EdgeInsetsDto.only(bottom: value),
    );
  }

  StyledContainerAttributes paddingLeft(double value) {
    return StyledContainerAttributes(padding: EdgeInsetsDto.only(left: value));
  }

  StyledContainerAttributes paddingHorizontal(double value) {
    return StyledContainerAttributes(
      padding: EdgeInsetsDto.symmetric(
        horizontal: value,
      ),
    );
  }

  StyledContainerAttributes paddingVertical(double value) {
    return StyledContainerAttributes(
      padding: EdgeInsetsDto.symmetric(
        vertical: value,
      ),
    );
  }

  StyledContainerAttributes paddingDirectionalOnly({
    double? top,
    double? bottom,
    double? start,
    double? end,
  }) {
    return StyledContainerAttributes(
      padding: EdgeInsetsDirectionalDto.only(
        top: top,
        bottom: bottom,
        start: start,
        end: end,
      ),
    );
  }

  StyledContainerAttributes paddingDirectionalStart(double value) {
    return paddingDirectionalOnly(start: value);
  }

  StyledContainerAttributes paddingDirectionalEnd(double value) {
    return paddingDirectionalOnly(end: value);
  }

  StyledContainerAttributes paddingDirectionalTop(double value) {
    return paddingDirectionalOnly(top: value);
  }

  StyledContainerAttributes paddingDirectionalBottom(double value) {
    return paddingDirectionalOnly(bottom: value);
  }

  StyledContainerAttributes backgroundColor(Color color) {
    return StyledContainerAttributes(
      color: ColorDto.from(color),
    );
  }

  StyledContainerAttributes height(double height) {
    return StyledContainerAttributes(
      height: height,
    );
  }

  StyledContainerAttributes width(double width) {
    return StyledContainerAttributes(
      width: width,
    );
  }

  StyledContainerAttributes maxHeight(double maxHeight) {
    return StyledContainerAttributes(
      maxHeight: maxHeight,
    );
  }

  StyledContainerAttributes maxWidth(double maxWidth) {
    return StyledContainerAttributes(
      maxWidth: maxWidth,
    );
  }

  StyledContainerAttributes minHeight(double minHeight) {
    return StyledContainerAttributes(
      minHeight: minHeight,
    );
  }

  StyledContainerAttributes minWidth(double minWidth) {
    return StyledContainerAttributes(
      minWidth: minWidth,
    );
  }

  StyledContainerAttributes _borderRadius(BorderRadiusGeometryDto radius) {
    return StyledContainerAttributes(borderRadius: radius);
  }

  StyledContainerAttributes rounded(double value) {
    return _borderRadius(
      BorderRadiusDto.all(
        RadiusDto.circular(value),
      ),
    );
  }

  StyledContainerAttributes squared() {
    return _borderRadius(BorderRadiusDto.zero);
  }

  StyledContainerAttributes roundedOnly({
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

  StyledContainerAttributes roundedDirectionalOnly({
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

  StyledContainerAttributes roundedHorizontal({
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

  StyledContainerAttributes roundedVertical({
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

  StyledContainerAttributes roundedDirectionalHorizontal({
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

  StyledContainerAttributes roundedDirectionalVertical({
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

  StyledContainerAttributes border({
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

    return StyledContainerAttributes(border: border);
  }

  StyledContainerAttributes borderTop({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return StyledContainerAttributes(
      border: BorderDto.only(
        top: _borderSide(
          color: color,
          width: width,
          style: style,
        ),
      ),
    );
  }

  StyledContainerAttributes borderBottom({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return StyledContainerAttributes(
      border: BorderDto.only(
        bottom: _borderSide(
          color: color,
          width: width,
          style: style,
        ),
      ),
    );
  }

  StyledContainerAttributes borderLeft({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return StyledContainerAttributes(
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

  StyledContainerAttributes borderRight({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return StyledContainerAttributes(
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

  StyledContainerAttributes borderHorizontal({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return StyledContainerAttributes(
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

  StyledContainerAttributes borderVertical({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return StyledContainerAttributes(
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

  StyledContainerAttributes borderDirectionalTop({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return StyledContainerAttributes(
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

  StyledContainerAttributes borderDirectionalBottom({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return StyledContainerAttributes(
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

  StyledContainerAttributes borderDirectionalStart({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return StyledContainerAttributes(
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

  StyledContainerAttributes borderDirectionalEnd({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return StyledContainerAttributes(
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

  StyledContainerAttributes transform(Matrix4 transform) {
    return StyledContainerAttributes(transform: transform);
  }

  StyledContainerAttributes alignment(AlignmentGeometry align) {
    return StyledContainerAttributes(alignment: align);
  }

  // ignore: long-parameter-list
  StyledContainerAttributes linearGradient({
    AlignmentGeometry begin = AlignmentDirectional.centerStart,
    AlignmentGeometry end = AlignmentDirectional.centerEnd,
    required List<Color> colors,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
  }) {
    return StyledContainerAttributes(
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
  StyledContainerAttributes radialGradient({
    AlignmentGeometry center = Alignment.center,
    double radius = 0.5,
    required List<Color> colors,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    AlignmentGeometry? focal,
    double focalRadius = 0.0,
    GradientTransform? transform,
  }) {
    return StyledContainerAttributes(
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

  StyledContainerAttributes shadow({
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

    return StyledContainerAttributes(
      boxShadow: [boxShadow],
    );
  }

  StyledContainerAttributes elevation(int elevation) {
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
      return const StyledContainerAttributes(
        boxShadow: [boxShadow, boxShadow, boxShadow, boxShadow],
      );
    }

    return StyledContainerAttributes(
      boxShadow: kElevationToShadow[elevation]!
          .map((e) => BoxShadowDto.fromBoxShadow(e))
          .toList(),
    );
  }

  @Deprecated('Use border(color:color) instead')
  StyledContainerAttributes borderColor(Color color) {
    return StyledContainerAttributes(
      border: BorderDto.all(
        color: ColorDto.maybeFrom(color),
      ),
    );
  }

  @Deprecated('Use border(width:width) instead')
  StyledContainerAttributes borderWidth(double width) {
    return StyledContainerAttributes(border: BorderDto.all(width: width));
  }

  @Deprecated('Use border(style:style) instead')
  StyledContainerAttributes borderStyle(BorderStyle style) {
    return StyledContainerAttributes(border: BorderDto.all(style: style));
  }

  @Deprecated('Use backgroundColor(style:style) instead')
  StyledContainerAttributes bgColor(Color color) {
    return StyledContainerAttributes(
      color: ColorDto.from(color),
    );
  }

  @Deprecated('Use alignment instead')
  StyledContainerAttributes align(AlignmentGeometry align) {
    return StyledContainerAttributes(alignment: align);
  }

  @Deprecated('Use borderDirectionalEnd instead')
  StyledContainerAttributes borderEnd({
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
  StyledContainerAttributes borderStart({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return StyledContainerAttributes(
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
  StyledContainerAttributes paddingStart(double value) {
    return StyledContainerAttributes(
      padding: EdgeInsetsDirectionalDto.only(
        start: value,
      ),
    );
  }

  @Deprecated('Use paddingDirectionalEnd instead')
  StyledContainerAttributes paddingEnd(double value) {
    return StyledContainerAttributes(
      padding: EdgeInsetsDirectionalDto.only(
        end: value,
      ),
    );
  }

  @Deprecated('Use marginDirectionalStart instead')
  StyledContainerAttributes marginStart(double value) {
    return StyledContainerAttributes(
      margin: EdgeInsetsDirectionalDto.only(start: value),
    );
  }

  @Deprecated('Use marginDirectionalStart instead')
  StyledContainerAttributes marginEnd(double value) {
    return StyledContainerAttributes(
      margin: EdgeInsetsDirectionalDto.only(end: value),
    );
  }
}
