import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../dtos/border/box_border.dto.dart';
import '../../dtos/color.dto.dart';
import '../../dtos/edge_insets/edge_insets_geometry.dto.dart';
import '../../dtos/radius/border_radius_geometry.dto.dart';
import '../../dtos/shadow/box_shadow.dto.dart';
import '../../helpers/extensions.dart';

class BoxAttributes extends WidgetAttributes {
  final EdgeInsetsGeometryDto? margin;
  final EdgeInsetsGeometryDto? padding;
  final AlignmentGeometry? alignment;
  final double? height;
  final double? width;
  // Decoration
  final ColorDto? color;
  final BoxBorderDto? border;
  final BorderRadiusGeometryDto? borderRadius;
  final List<BoxShadowDto>? boxShadow;
  final Matrix4? transform;

  // Constraints
  final double? maxHeight;
  final double? minHeight;
  final double? maxWidth;
  final double? minWidth;
  final BoxShape? shape;
  final Gradient? gradient;

  const BoxAttributes({
    this.margin,
    this.padding,
    this.alignment,
    this.border,
    this.borderRadius,
    this.color,
    this.boxShadow,
    this.height,
    this.width,
    this.maxHeight,
    this.minHeight,
    this.maxWidth,
    this.minWidth,
    this.shape,
    this.transform,
    this.gradient,
  });

  @override
  BoxAttributes copyWith({
    EdgeInsetsGeometryDto? margin,
    EdgeInsetsGeometryDto? padding,
    AlignmentGeometry? alignment,
    ColorDto? color,
    BoxBorderDto? border,
    BorderRadiusGeometryDto? borderRadius,
    List<BoxShadowDto>? boxShadow,
    Matrix4? transform,
    double? height,
    double? width,
    double? maxHeight,
    double? minHeight,
    double? maxWidth,
    double? minWidth,
    BoxShape? shape,
    Gradient? gradient,
  }) {
    return BoxAttributes(
      // Mergeble values
      border: this.border?.merge(border) ?? border,
      borderRadius: this.borderRadius?.merge(borderRadius) ?? borderRadius,
      boxShadow: this.boxShadow?.merge(boxShadow) ?? boxShadow,
      margin: this.margin?.merge(margin) ?? margin,
      padding: this.padding?.merge(padding) ?? padding,
      transform: this.transform?.merge(transform) ?? transform,

      // Override values
      alignment: alignment ?? this.alignment,
      color: color ?? this.color,
      height: height ?? this.height,
      maxHeight: maxHeight ?? this.maxHeight,
      minHeight: minHeight ?? this.minHeight,

      width: width ?? this.width,
      maxWidth: maxWidth ?? this.maxWidth,
      minWidth: minWidth ?? this.minWidth,
      shape: shape ?? this.shape,
      gradient: gradient ?? this.gradient,
    );
  }

  factory BoxAttributes.from({
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
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
      margin: EdgeInsetsGeometryDto.maybeFrom(margin),
      padding: EdgeInsetsGeometryDto.maybeFrom(padding),
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

  @override
  BoxAttributes merge(BoxAttributes? other) {
    if (other == null) return this;

    return copyWith(
      // Mergeble values
      border: other.border,
      borderRadius: other.borderRadius,
      boxShadow: other.boxShadow,
      margin: other.margin,
      padding: other.padding,
      transform: other.transform,
      // Override values
      alignment: other.alignment,
      color: other.color,
      height: other.height,
      maxHeight: other.maxHeight,
      minHeight: other.minHeight,
      width: other.width,
      maxWidth: other.maxWidth,
      minWidth: other.minWidth,
      shape: other.shape,
      gradient: other.gradient,
    );
  }

  @override
  get props => [
        margin,
        padding,
        alignment,
        height,
        width,
        color,
        border,
        borderRadius,
        boxShadow,
        transform,
        maxHeight,
        minHeight,
        maxWidth,
        minWidth,
        shape,
        gradient,
      ];
}
