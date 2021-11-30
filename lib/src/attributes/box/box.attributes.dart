import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/dto/border.dto.dart';
import 'package:mix/src/dto/border_radius.dto.dart';
import 'package:mix/src/dto/box_shadow.dto.dart';
import 'package:mix/src/dto/edge_insets.dto.dart';

import '../common/attribute.dart';

class BoxAttributes extends Attribute {
  final EdgeInsetsDto? margin;
  final EdgeInsetsDto? padding;
  final AlignmentGeometry? alignment;
  final double? height;
  final double? width;
  // Decoration
  final Color? color;
  final BorderDto? border;
  final BorderRadiusDto? borderRadius;
  final List<BoxShadowDto>? boxShadow;
  final Matrix4? transform;

  // Constraints
  final double? maxHeight;
  final double? minHeight;
  final double? maxWidth;
  final double? minWidth;
  final BoxShape? shape;

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
  });

  BoxAttributes merge(BoxAttributes? box) {
    if (box == null) return this;

    return copyWith(
      // Mergeble values
      border: border?.merge(box.border) ?? box.border,
      borderRadius: borderRadius?.merge(box.borderRadius) ?? box.borderRadius,
      boxShadow: boxShadow?.merge(box.boxShadow) ?? box.boxShadow,
      margin: margin?.merge(box.margin) ?? box.margin,
      padding: padding?.merge(box.padding) ?? box.padding,
      transform: transform?.merge(box.transform) ?? box.transform,
      // Override values
      alignment: box.alignment,
      color: box.color,
      height: box.height,
      maxHeight: box.maxHeight,
      minHeight: box.minHeight,
      width: box.width,
      maxWidth: box.maxWidth,
      minWidth: box.minWidth,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoxAttributes &&
        other.margin == margin &&
        other.padding == padding &&
        other.alignment == alignment &&
        other.height == height &&
        other.width == width &&
        other.color == color &&
        other.border == border &&
        other.borderRadius == borderRadius &&
        listEquals(other.boxShadow, boxShadow) &&
        other.transform == transform &&
        other.maxHeight == maxHeight &&
        other.minHeight == minHeight &&
        other.maxWidth == maxWidth &&
        other.minWidth == minWidth &&
        other.shape == shape;
  }

  @override
  int get hashCode {
    return margin.hashCode ^
        padding.hashCode ^
        alignment.hashCode ^
        height.hashCode ^
        width.hashCode ^
        color.hashCode ^
        border.hashCode ^
        borderRadius.hashCode ^
        boxShadow.hashCode ^
        transform.hashCode ^
        maxHeight.hashCode ^
        minHeight.hashCode ^
        maxWidth.hashCode ^
        minWidth.hashCode ^
        shape.hashCode;
  }

  BoxAttributes copyWith({
    EdgeInsetsDto? margin,
    EdgeInsetsDto? padding,
    AlignmentGeometry? alignment,
    double? height,
    double? width,
    Color? color,
    BorderDto? border,
    BorderRadiusDto? borderRadius,
    List<BoxShadowDto>? boxShadow,
    Matrix4? transform,
    double? maxHeight,
    double? minHeight,
    double? maxWidth,
    double? minWidth,
    BoxShape? shape,
  }) {
    return BoxAttributes(
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      alignment: alignment ?? this.alignment,
      height: height ?? this.height,
      width: width ?? this.width,
      color: color ?? this.color,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      boxShadow: boxShadow ?? this.boxShadow,
      transform: transform ?? this.transform,
      maxHeight: maxHeight ?? this.maxHeight,
      minHeight: minHeight ?? this.minHeight,
      maxWidth: maxWidth ?? this.maxWidth,
      minWidth: minWidth ?? this.minWidth,
      shape: shape ?? this.shape,
    );
  }

  @override
  String toString() {
    return 'BoxAttributes(margin: $margin, padding: $padding, alignment: $alignment, height: $height, width: $width, color: $color, border: $border, borderRadius: $borderRadius, boxShadow: $boxShadow, transform: $transform, maxHeight: $maxHeight, minHeight: $minHeight, maxWidth: $maxWidth, minWidth: $minWidth, shape: $shape)';
  }
}
