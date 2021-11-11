import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mix/src/attributes/box/box.props.dart';

import '../../helpers/extensions.dart';
import '../attribute.dart';

class BoxAttributes extends AttributeWithBuilder<BoxProps> {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final Border? border;
  final BorderRadius? borderRadius;
  final BoxShadow? boxShadow;

  final double? height;
  final double? maxHeight;
  final double? minHeight;
  final double? width;
  final double? maxWidth;
  final double? minWidth;
  final int? rotate;
  final double? opacity;
  final double? aspectRatio;
  final bool? hidden;
  final FlexFit? flexFit;
  final int? flex;

  const BoxAttributes({
    this.margin,
    this.padding,
    this.alignment,
    this.border,
    this.borderRadius,
    this.backgroundColor,
    this.boxShadow,
    this.height,
    this.maxHeight,
    this.minHeight,
    this.width,
    this.maxWidth,
    this.minWidth,
    this.rotate,
    this.opacity,
    this.aspectRatio,
    this.hidden,
    this.flex,
    this.flexFit,
  });

  BoxAttributes merge(BoxAttributes other) {
    return BoxAttributes(
      hidden: other.hidden ?? hidden,
      margin: other.margin?.merge(margin) ?? margin,
      padding: other.padding?.merge(padding) ?? padding,
      alignment: alignment ?? other.alignment,
      backgroundColor: backgroundColor ?? other.backgroundColor,
      border: other.border?.merge(border) ?? border,
      borderRadius: other.borderRadius?.merge(borderRadius) ?? borderRadius,
      boxShadow: boxShadow?.merge(boxShadow) ?? boxShadow,
      height: other.height ?? height,
      maxHeight: other.maxHeight ?? maxHeight,
      minHeight: other.minHeight ?? minHeight,
      width: other.width ?? width,
      maxWidth: other.maxWidth ?? maxWidth,
      minWidth: other.minWidth ?? minWidth,
      rotate: other.rotate ?? rotate,
      opacity: other.opacity ?? opacity,
      aspectRatio: other.aspectRatio ?? aspectRatio,
    );
  }

  BoxDecoration? get _decoration {
    if (border != null || borderRadius != null || boxShadow != null) {
      return BoxDecoration(
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow == null ? [] : [boxShadow!],
      );
    }
  }

  BoxConstraints? get _constraints {
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
  BoxProps build() {
    return BoxProps(
      margin: margin,
      padding: padding,
      alignment: alignment,
      backgroundColor: _decoration == null ? backgroundColor : null,
      decoration: _decoration,
      constraints: _constraints,
      rotate: rotate,
      opacity: opacity,
      aspectRatio: aspectRatio,
    );
  }
}
