import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../helpers/extensions.dart';
import '../../attribute.dart';

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
  final bool? hidden;

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
    this.rotate,
    this.opacity,
    this.aspectRatio,
    this.hidden,
    this.flex,
    this.flexFit,
  });

  BoxAttributes merge(BoxAttributes o) {
    return BoxAttributes(
      border: border?.merge(o.border) ?? border,
      borderRadius: borderRadius?.merge(o.borderRadius) ?? o.borderRadius,
      boxShadow: boxShadow?.merge(o.boxShadow) ?? o.boxShadow,
      margin: margin?.merge(o.margin) ?? o.margin,
      padding: padding?.merge(o.padding) ?? o.padding,
      hidden: o.hidden ?? hidden,
      alignment: alignment ?? o.alignment,
      backgroundColor: backgroundColor ?? o.backgroundColor,
      height: o.height ?? height,
      maxHeight: o.maxHeight ?? maxHeight,
      minHeight: o.minHeight ?? minHeight,
      width: o.width ?? width,
      maxWidth: o.maxWidth ?? maxWidth,
      minWidth: o.minWidth ?? minWidth,
      rotate: o.rotate ?? rotate,
      opacity: o.opacity ?? opacity,
      aspectRatio: o.aspectRatio ?? aspectRatio,
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
        other.hidden == hidden;
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
        hidden.hashCode;
  }
}
