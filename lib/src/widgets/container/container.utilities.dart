import 'package:flutter/material.dart';

import './container.attributes.dart';
import '../../dtos/border/border.dto.dart';
import '../../dtos/border/border_side.dto.dart';
import '../../dtos/border/box_border.dto.dart';
import '../../dtos/color.dto.dart';
import '../../dtos/radius/border_radius_geometry.dto.dart';
import '../../dtos/shadow/box_shadow.dto.dart';

class ContainerStyleUtilities {
  const ContainerStyleUtilities();

  StyledContainerAttributes backgroundColor(Color color) {
    return StyledContainerAttributes(color: ColorDto.from(color));
  }

  StyledContainerAttributes height(double height) {
    return StyledContainerAttributes(height: height);
  }

  StyledContainerAttributes width(double width) {
    return StyledContainerAttributes(width: width);
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

    border = as != null
        ? BoxBorderDto.from(as)
        : BorderDto.all(
            color: ColorDto.maybeFrom(color),
            width: width,
            style: style,
          );

    return StyledContainerAttributes(border: border);
  }

  StyledContainerAttributes borderTop({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return StyledContainerAttributes(
      border: BorderDto.only(
        top: _borderSide(color: color, width: width, style: style),
      ),
    );
  }

  StyledContainerAttributes borderBottom({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return StyledContainerAttributes(
      border: BorderDto.only(
        bottom: _borderSide(color: color, width: width, style: style),
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
        left: _borderSide(color: color, width: width, style: style, as: as),
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
        right: _borderSide(color: color, width: width, style: style, as: as),
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
        top: _borderSide(color: color, width: width, style: style, as: as),
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
        start: _borderSide(color: color, width: width, style: style, as: as),
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
        end: _borderSide(color: color, width: width, style: style, as: as),
      ),
    );
  }

  StyledContainerAttributes transform(Matrix4 transform) {
    return StyledContainerAttributes(transform: transform);
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

    return StyledContainerAttributes(boxShadow: [boxShadow]);
  }

  StyledContainerAttributes elevation(int elevation) {
    const elevationOptions = [0, 1, 2, 3, 4, 6, 8, 9, 12, 16, 24];
    assert(
      elevationOptions.contains(elevation),
      'Elevation must be one of the following: ${elevationOptions.join(', ')}',
    );

    const boxShadow = BoxShadowDto(
      color: ColorDto(Colors.transparent),
      offset: Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 0,
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
      border: BorderDto.all(color: ColorDto.maybeFrom(color)),
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
    return StyledContainerAttributes(color: ColorDto.from(color));
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
    return borderDirectionalEnd(color: color, width: width, style: style);
  }

  @Deprecated('Use borderDirectionalStart instead')
  StyledContainerAttributes borderStart({
    Color? color,
    double? width,
    BorderStyle? style,
  }) {
    return StyledContainerAttributes(
      border: BorderDirectionalDto.only(
        start: _borderSide(color: color, width: width, style: style),
      ),
    );
  }

  StyledContainerAttributes _borderRadius(BorderRadiusGeometryDto radius) {
    return StyledContainerAttributes(borderRadius: radius);
  }

  BorderSideDto _borderSide({
    Color? color,
    double? width,
    BorderStyle? style,
    BorderSide? as,
  }) {
    return as != null
        ? BorderSideDto.from(as)
        : BorderSideDto.only(
            color: ColorDto.maybeFrom(color),
            style: style,
            width: width,
          );
  }
}
