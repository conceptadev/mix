import 'dart:ui';

import 'package:flutter/material.dart';

class BoxProps {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final AlignmentGeometry? alignment;
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

  const BoxProps({
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
    Key? key,
  });
}
