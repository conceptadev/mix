import 'dart:ui';

import 'package:flutter/material.dart';

class BoxProps {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final BoxDecoration? decoration;
  final BoxConstraints? constraints;
  final int? rotate;
  final double? opacity;
  final double? aspectRatio;
  final bool? hidden;
  final FlexFit? flexFit;
  final int? flex;

  const BoxProps({
    this.margin,
    this.padding,
    this.alignment,
    this.backgroundColor,
    this.decoration,
    this.constraints,
    this.rotate,
    this.opacity,
    this.aspectRatio,
    this.hidden,
    this.flex,
    this.flexFit,
  });
}
