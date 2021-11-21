import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/mappers/border.mapper.dart';
import 'package:mix/src/mappers/border_radius.mapper.dart';
import 'package:mix/src/mappers/box_shadow.mapper.dart';

import '../../helpers/extensions.dart';
import '../common/attribute.dart';

class BoxAttributes extends Attribute {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final AlignmentGeometry? alignment;
  final double? height;
  final double? width;
  // Decoration
  final Color? color;
  final BorderProps? border;
  final BorderRadiusProps? borderRadius;
  final List<BoxShadowProps>? boxShadow;

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
        other.maxHeight == maxHeight &&
        other.minHeight == minHeight &&
        other.maxWidth == maxWidth &&
        other.minWidth == minWidth;
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
        maxHeight.hashCode ^
        minHeight.hashCode ^
        maxWidth.hashCode ^
        minWidth.hashCode;
  }

  BoxAttributes copyWith({
    EdgeInsets? margin,
    EdgeInsets? padding,
    AlignmentGeometry? alignment,
    double? height,
    double? width,
    Color? color,
    BorderProps? border,
    BorderRadiusProps? borderRadius,
    List<BoxShadowProps>? boxShadow,
    double? maxHeight,
    double? minHeight,
    double? maxWidth,
    double? minWidth,
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
      maxHeight: maxHeight ?? this.maxHeight,
      minHeight: minHeight ?? this.minHeight,
      maxWidth: maxWidth ?? this.maxWidth,
      minWidth: minWidth ?? this.minWidth,
    );
  }
}
