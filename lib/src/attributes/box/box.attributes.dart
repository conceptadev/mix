import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../helpers/extensions.dart';
import '../common/attribute.dart';

class BoxAttributes extends Attribute {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final AlignmentGeometry? alignment;
  final double? height;
  final double? width;
  // Decoration
  final Color? backgroundColor;
  final Border? border;
  final BorderRadius? borderRadius;
  final BoxShadow? boxShadow;

  // Constraints
  final double? maxHeight;
  final double? minHeight;
  final double? maxWidth;
  final double? minWidth;
  // Addons
  final int? rotate;
  final double? opacity;
  final double? aspectRatio;
  final FlexFit? flexFit;
  final int? flex;
  final double? elevation;
  final double? scale;

  const BoxAttributes({
    this.margin,
    this.padding,
    this.alignment,
    this.border,
    this.borderRadius,
    this.backgroundColor,
    this.boxShadow,
    this.height,
    this.width,
    this.maxHeight,
    this.minHeight,
    this.maxWidth,
    this.minWidth,
    // Addons
    this.rotate,
    this.opacity,
    this.aspectRatio,
    this.flex,
    this.flexFit,
    this.elevation,
    this.scale,
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
      backgroundColor: box.backgroundColor,
      height: box.height,
      maxHeight: box.maxHeight,
      minHeight: box.minHeight,
      width: box.width,
      maxWidth: box.maxWidth,
      minWidth: box.minWidth,
      rotate: box.rotate,
      opacity: box.opacity,
      aspectRatio: box.aspectRatio,
      flex: box.flex,
      flexFit: box.flexFit,
      elevation: box.elevation,
      scale: box.scale,
    );
  }

  BoxDecoration? get decoration {
    if (border != null || borderRadius != null || boxShadow != null) {
      return BoxDecoration(
        color: backgroundColor,
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow == null ? [] : [boxShadow!],
      );
    }
  }

  BoxConstraints? get constraints {
    BoxConstraints? constraints;

    if (minWidth != null ||
        maxWidth != null ||
        minHeight != null ||
        maxHeight != null) {
      constraints = BoxConstraints(
        minHeight: minHeight ?? 0.0,
        maxHeight: maxHeight ?? double.infinity,
        minWidth: minWidth ?? 0.0,
        maxWidth: maxWidth ?? double.infinity,
      );
    }

    return constraints;
  }

  BoxAttributes applyContext(BuildContext context) {
    final spacingData = context.spacingData();

    return copyWith(
      margin: spacingData.applyEdgeInsets(context, margin),
      padding: spacingData.applyEdgeInsets(context, padding),
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
        other.backgroundColor == backgroundColor &&
        other.border == border &&
        other.borderRadius == borderRadius &&
        other.boxShadow == boxShadow &&
        other.maxHeight == maxHeight &&
        other.minHeight == minHeight &&
        other.maxWidth == maxWidth &&
        other.minWidth == minWidth &&
        other.rotate == rotate &&
        other.opacity == opacity &&
        other.aspectRatio == aspectRatio &&
        other.flexFit == flexFit &&
        other.flex == flex &&
        other.elevation == elevation &&
        other.scale == scale;
  }

  @override
  int get hashCode {
    return margin.hashCode ^
        padding.hashCode ^
        alignment.hashCode ^
        height.hashCode ^
        width.hashCode ^
        backgroundColor.hashCode ^
        border.hashCode ^
        borderRadius.hashCode ^
        boxShadow.hashCode ^
        maxHeight.hashCode ^
        minHeight.hashCode ^
        maxWidth.hashCode ^
        minWidth.hashCode ^
        rotate.hashCode ^
        opacity.hashCode ^
        aspectRatio.hashCode ^
        flexFit.hashCode ^
        flex.hashCode ^
        elevation.hashCode ^
        scale.hashCode;
  }

  BoxAttributes copyWith({
    EdgeInsets? margin,
    EdgeInsets? padding,
    AlignmentGeometry? alignment,
    double? height,
    double? width,
    Color? backgroundColor,
    Border? border,
    BorderRadius? borderRadius,
    BoxShadow? boxShadow,
    double? maxHeight,
    double? minHeight,
    double? maxWidth,
    double? minWidth,
    int? rotate,
    double? opacity,
    double? aspectRatio,
    FlexFit? flexFit,
    int? flex,
    double? elevation,
    double? scale,
  }) {
    return BoxAttributes(
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      alignment: alignment ?? this.alignment,
      height: height ?? this.height,
      width: width ?? this.width,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      boxShadow: boxShadow ?? this.boxShadow,
      maxHeight: maxHeight ?? this.maxHeight,
      minHeight: minHeight ?? this.minHeight,
      maxWidth: maxWidth ?? this.maxWidth,
      minWidth: minWidth ?? this.minWidth,
      rotate: rotate ?? this.rotate,
      opacity: opacity ?? this.opacity,
      aspectRatio: aspectRatio ?? this.aspectRatio,
      flexFit: flexFit ?? this.flexFit,
      flex: flex ?? this.flex,
      elevation: elevation ?? this.elevation,
      scale: scale ?? this.scale,
    );
  }
}
