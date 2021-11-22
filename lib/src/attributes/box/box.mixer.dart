import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/dto/box_shadow.dto.dart';

class BoxMixer {
  final Color? _color;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;

  final Border? border;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;

  // Constraints
  final double? maxHeight;
  final double? minHeight;
  final double? maxWidth;
  final double? minWidth;
  final BoxShape? shape;

  const BoxMixer({
    Color? color,
    this.alignment,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.maxHeight,
    this.minHeight,
    this.maxWidth,
    this.minWidth,
    this.shape,
  }) : _color = color;

  factory BoxMixer.fromContext(MixContext mixContext) {
    final context = mixContext.context;
    final box = mixContext.mix.boxAttribute;

    return BoxMixer(
      color: box?.color,
      alignment: box?.alignment,
      margin: box?.margin?.create(context),
      padding: box?.padding?.create(context),
      width: box?.width,
      height: box?.height,
      border: box?.border?.create(context),
      borderRadius: box?.borderRadius?.create(context),
      boxShadow: box?.boxShadow?.create(context),
      maxHeight: box?.maxHeight,
      maxWidth: box?.maxWidth,
      minHeight: box?.minHeight,
      minWidth: box?.minWidth,
      shape: box?.shape,
    );
  }

  Color? get color => decoration == null ? _color : null;

  BoxDecoration? get decoration {
    if (border != null ||
        borderRadius != null ||
        boxShadow != null ||
        shape != null) {
      var boxDecoration = BoxDecoration(
        color: _color,
        border: border,
        boxShadow: boxShadow,
      );

      if (shape != null) {
        boxDecoration = boxDecoration.copyWith(
          shape: shape,
        );
      }

      if (shape == null && borderRadius != null) {
        boxDecoration = boxDecoration.copyWith(
          borderRadius: borderRadius,
        );
      }

      return boxDecoration;
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
}
