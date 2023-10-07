import 'package:flutter/material.dart';

import '../../attributes/border/box_border.attribute.dart';
import '../../attributes/box_shadow/box_shadow.dto.dart';
import '../../attributes/color/color.dto.dart';
import '../../attributes/exports.dart';
import '../../attributes/width_height/height_attribute.dart';
import '../../attributes/width_height/width_height_attribute.dart';
import '../../dtos/border/box_border.dto.dart';
import '../../dtos/color.dto.dart';
import '../../dtos/shadow/box_shadow.dto.dart';
import '../../extensions/helper_ext.dart';

@Deprecated('Use ContainerStyleAttributes instead')
typedef BoxAttributes = StyledContainerAttributes;

class StyledContainerAttributes extends StyledWidgetAttributes {
  final MarginAttribute? margin;
  final PaddingAttribute? padding;
  final AlignmentGeometry? alignment;
  final HeightAttribute? height;
  final WidthAttribute? width;
  // Decoration.
  final ColorDto? color;
  final BoxBorderAttribute? border;
  final BorderRadiusAttribute? borderRadius;
  final List<BoxShadowDto>? boxShadow;
  final Matrix4? transform;
  final BoxConstraintsAttribute? constraints;

  // Constraints.
  final BoxConstraintsAttribute? constraints;

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
      // Constraints.
      maxHeight: maxHeight,
      minHeight: minHeight,
      maxWidth: maxWidth,
      minWidth: minWidth,
      margin: margin == null ? null : MarginAttribute.from(margin),
      padding: padding == null ? null : PaddingAttribute.from(padding),
      alignment: alignment,
      border: BoxBorderDto.maybeFrom(border),
      borderRadius: borderRadius == null
          ? null
          : BorderRadiusAttribute.from(borderRadius),
      // Decoration.
      color: ColorDto.maybeFrom(color),
      boxShadow: boxShadow,
      height: height,
      width: width, shape: shape,
      transform: transform, gradient: gradient,
    );
  }

  @override
  StyledContainerAttributes copyWith({
    MarginAttribute? margin,
    PaddingAttribute? padding,
    AlignmentGeometry? alignment,
    ColorDto? color,
    BoxBorderAttribute? border,
    BorderRadiusAttribute? borderRadius,
    List<BoxShadowRef>? boxShadow,
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
      maxHeight: maxHeight ?? this.maxHeight,
      minHeight: minHeight ?? this.minHeight,

      maxWidth: maxWidth ?? this.maxWidth,
      minWidth: minWidth ?? this.minWidth,
      margin: this.margin?.merge(margin) ?? margin,
      padding: this.padding?.merge(padding) ?? padding,
      // Override values.
      alignment: alignment ?? this.alignment,
      // Mergeble values.
      border: this.border?.merge(border) ?? border,
      borderRadius: this.borderRadius?.merge(borderRadius) ?? borderRadius,
      color: color ?? this.color,
      boxShadow: Mergeable.mergeLists(this.boxShadow, boxShadow),
      height: height ?? this.height,
      width: width ?? this.width,
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
