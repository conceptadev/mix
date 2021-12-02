import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/dto/box_shadow.dto.dart';
import 'package:mix/src/theme/refs/refs.dart';

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
  final Matrix4? transform;

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
    this.transform,
  }) : _color = color;

  factory BoxMixer.fromContext(MixContext mixContext) {
    final context = mixContext.context;
    final box = mixContext.boxAttribute;

    var color = box?.color;

    if (color is ColorRef) {
      color = mixContext.getColorRef(color);
    }

    return BoxMixer(
      color: color,
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
      transform: box?.transform,
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoxMixer &&
        other._color == _color &&
        other.alignment == alignment &&
        other.padding == padding &&
        other.margin == margin &&
        other.width == width &&
        other.height == height &&
        other.border == border &&
        other.borderRadius == borderRadius &&
        listEquals(other.boxShadow, boxShadow) &&
        other.transform == transform &&
        other.maxHeight == maxHeight &&
        other.minHeight == minHeight &&
        other.maxWidth == maxWidth &&
        other.minWidth == minWidth &&
        other.shape == shape;
  }

  @override
  int get hashCode {
    return _color.hashCode ^
        alignment.hashCode ^
        padding.hashCode ^
        margin.hashCode ^
        width.hashCode ^
        height.hashCode ^
        border.hashCode ^
        borderRadius.hashCode ^
        boxShadow.hashCode ^
        transform.hashCode ^
        maxHeight.hashCode ^
        minHeight.hashCode ^
        maxWidth.hashCode ^
        minWidth.hashCode ^
        shape.hashCode;
  }
}
