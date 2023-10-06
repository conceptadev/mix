import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../dtos/border/box_border.dto.dart';
import '../../dtos/color.dto.dart';
import '../../dtos/edge_insets/edge_insets_geometry.dto.dart';
import '../../dtos/radius/border_radius_geometry.dto.dart';
import '../../dtos/shadow/box_shadow.dto.dart';
import '../../extensions/helper_ext.dart';

@Deprecated('Use ContainerStyleAttributes instead')
typedef BoxAttributes = StyledContainerAttributes;

class StyledContainerAttributes extends StyledWidgetAttributes {
  final EdgeInsetsGeometryDto? margin;
  final EdgeInsetsGeometryDto? padding;
  final AlignmentGeometry? alignment;
  final double? height;
  final double? width;
  // Decoration.
  final ColorDto? color;
  final BoxBorderDto? border;
  final BorderRadiusGeometryDto? borderRadius;
  final List<BoxShadowDto>? boxShadow;
  final Matrix4? transform;

  // Constraints.
  final double? maxHeight;
  final double? minHeight;
  final double? maxWidth;
  final double? minWidth;
  final BoxShape? shape;
  final Gradient? gradient;

  const StyledContainerAttributes({
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

  factory StyledContainerAttributes.from({
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    AlignmentGeometry? alignment,
    double? height,
    double? width,
    // Decoration.
    Color? color,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadowDto>? boxShadow,
    Matrix4? transform,

    // Constraints.
    double? maxHeight,
    double? minHeight,
    double? maxWidth,
    double? minWidth,
    BoxShape? shape,
    Gradient? gradient,
  }) {
    return StyledContainerAttributes(
      margin: EdgeInsetsGeometryDto.maybeFrom(margin),
      padding: EdgeInsetsGeometryDto.maybeFrom(padding),
      alignment: alignment,
      border: BoxBorderDto.maybeFrom(border),
      borderRadius: BorderRadiusGeometryDto.maybeFrom(borderRadius),
      // Decoration.
      color: ColorDto.maybeFrom(color),
      boxShadow: boxShadow,
      height: height,
      width: width,
      // Constraints.
      maxHeight: maxHeight,
      minHeight: minHeight,
      maxWidth: maxWidth,
      minWidth: minWidth,
      shape: shape,
      transform: transform, gradient: gradient,
    );
  }

  @override
  StyledContainerAttributes copyWith({
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
    return StyledContainerAttributes(
      margin: this.margin?.merge(margin) ?? margin,
      padding: this.padding?.merge(padding) ?? padding,
      // Override values.
      alignment: alignment ?? this.alignment,
      // Mergeble values.
      border: this.border?.merge(border) ?? border,
      borderRadius: this.borderRadius?.merge(borderRadius) ?? borderRadius,
      color: color ?? this.color,
      boxShadow: MergeMixin.mergeLists(this.boxShadow, boxShadow),
      height: height ?? this.height,
      width: width ?? this.width,
      maxHeight: maxHeight ?? this.maxHeight,
      minHeight: minHeight ?? this.minHeight,

      maxWidth: maxWidth ?? this.maxWidth,
      minWidth: minWidth ?? this.minWidth,
      shape: shape ?? this.shape,
      transform: this.transform?.merge(transform) ?? transform,

      gradient: gradient ?? this.gradient,
    );
  }

  @override
  StyledContainerAttributes merge(StyledContainerAttributes? other) {
    if (other == null) return this;

    return copyWith(
      margin: other.margin,
      padding: other.padding,
      // Override values.
      alignment: other.alignment,
      color: other.color,
      // Mergeble values.
      border: other.border,
      borderRadius: other.borderRadius,
      boxShadow: other.boxShadow,
      transform: other.transform,
      height: other.height,
      width: other.width,
      maxHeight: other.maxHeight,
      minHeight: other.minHeight,
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
