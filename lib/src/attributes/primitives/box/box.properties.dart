import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mix/src/attributes/primitives/box/box.attributes.dart';

import '../../../helpers/extensions.dart';
import '../../base_attribute.dart';

class BoxProperties extends Properties<BoxAttributes> {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final Border? border;
  final BorderRadius? borderRadius;
  final BoxShadowProperties? boxShadow;
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

  const BoxProperties({
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

  BoxProperties merge(BoxProperties other) {
    return BoxProperties(
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
  BoxAttributes build() {
    return BoxAttributes(
      margin: margin,
      padding: padding,
      alignment: alignment,
      backgroundColor: backgroundColor,
      border: border,
      borderRadius: borderRadius,
      boxShadow: boxShadow?.build(),
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

class BoxShadowProperties extends Properties<BoxShadow> {
  const BoxShadowProperties({
    this.color,
    this.offset,
    this.blurRadius,
    this.spreadRadius,
  });

  /// The amount the box should be inflated prior to applying the blur.
  final double? spreadRadius;
  final Color? color;
  final Offset? offset;
  final double? blurRadius;

  BoxShadowProperties merge(BoxShadowProperties? boxShadow) {
    if (boxShadow == null) {
      return this;
    }
    return BoxShadowProperties(
      color: boxShadow.color ?? color,
      offset: boxShadow.offset ?? offset,
      blurRadius: boxShadow.blurRadius ?? blurRadius,
      spreadRadius: boxShadow.spreadRadius ?? spreadRadius,
    );
  }

  final BoxShadow _defaultBoxShadow = const BoxShadow();

  @override
  BoxShadow build() {
    return BoxShadow(
      color: color ?? _defaultBoxShadow.color,
      offset: offset ?? _defaultBoxShadow.offset,
      blurRadius: blurRadius ?? _defaultBoxShadow.blurRadius,
      spreadRadius: spreadRadius ?? _defaultBoxShadow.spreadRadius,
    );
  }
}
