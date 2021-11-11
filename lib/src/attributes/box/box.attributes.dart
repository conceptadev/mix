import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mix/src/attributes/box/box.props.dart';
import 'package:mix/src/interfaces/border.dart';
import 'package:mix/src/interfaces/border_radius.dart';
import 'package:mix/src/interfaces/box_shadow.dart';

import '../../helpers/extensions.dart';
import '../attribute.dart';

class BoxAttributes extends AttributeWithBuilder<BoxProps> {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final IBorder? border;
  final IBorderRadius? borderRadius;
  final IBoxShadow? boxShadow;
  final BoxDecoration? decoration;
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
    this.decoration,
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
      decoration: decoration ?? other.decoration,
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

  @override
  BoxProps build() {
    return BoxProps(
      margin: margin,
      padding: padding,
      alignment: alignment,
      backgroundColor: backgroundColor,
      border: border?.generate(),
      borderRadius: borderRadius?.generate(),
      boxShadow: boxShadow?.generate(),
      decoration: decoration,
      height: height,
      maxHeight: maxHeight,
      minHeight: minHeight,
      width: width,
      maxWidth: maxWidth,
      minWidth: minWidth,
      rotate: rotate,
      opacity: opacity,
      aspectRatio: aspectRatio,
    );
  }
}
