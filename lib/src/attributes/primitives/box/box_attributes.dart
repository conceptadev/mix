import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../base_attribute.dart';

class BoxAttribute extends Attribute<bool> {
  final bool? animated;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final AlignmentGeometry? alignment;
  final bool? hidden;
  final Color? backgroundColor;
  final Border? border;
  final BorderRadius? borderRadius;
  final BoxShadow? boxShadow;
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
  // Container properties
  //Animation
  final Duration animationDuration;
  final Curve animationCurve;

  const BoxAttribute({
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.alignment,
    this.hidden,
    this.backgroundColor,
    this.border,
    this.borderRadius,
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
    this.animationDuration = const Duration(milliseconds: 100),
    this.animationCurve = Curves.linear,
    this.animated,
    Key? key,
  });
  @override
  bool get value => true;

  BoxAttribute merge(BoxAttribute attribute) {
    return BoxAttribute(
      margin: attribute.margin?.merge(margin) ?? margin,
      padding: attribute.padding?.merge(padding) ?? padding,
      alignment: alignment,
      hidden: hidden ?? attribute.hidden,
      backgroundColor: backgroundColor ?? attribute.backgroundColor,
      border: attribute.border?.merge(border) ?? border,
      borderRadius: attribute.borderRadius?.merge(borderRadius) ?? borderRadius,
      boxShadow: boxShadow?.merge(boxShadow) ?? boxShadow,
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
      animationDuration: animationDuration,
      animationCurve: animationCurve,
      animated: animated,
    );
  }
}
