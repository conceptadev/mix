import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../mixer/mix_context.dart';
import 'box.attributes.dart';

class BoxProps {
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
  final Gradient? gradient;

  // Constraints
  final double? maxHeight;
  final double? minHeight;
  final double? maxWidth;
  final double? minWidth;
  final BoxShape? shape;

  const BoxProps({
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
    this.gradient,
  }) : _color = color;

  factory BoxProps.fromContext(MixContext mixContext) {
    final boxAttributes = mixContext.attributesOfType<BoxAttributes>();
    final context = mixContext.context;

    var color = boxAttributes?.color;

    // if (color is ColorToken) {
    //   color = color.resolve(context);
    // }

    return BoxProps(
      color: color?.resolve(context),
      alignment: boxAttributes?.alignment,
      margin: boxAttributes?.margin?.resolve(context),
      padding: boxAttributes?.padding?.resolve(context),
      width: boxAttributes?.width,
      height: boxAttributes?.height,
      border: boxAttributes?.border?.resolve(context),
      borderRadius: boxAttributes?.borderRadius?.resolve(context),
      boxShadow: boxAttributes?.boxShadow?.resolve(context),
      maxHeight: boxAttributes?.maxHeight,
      maxWidth: boxAttributes?.maxWidth,
      minHeight: boxAttributes?.minHeight,
      minWidth: boxAttributes?.minWidth,
      shape: boxAttributes?.shape,
      transform: boxAttributes?.transform,
      gradient: boxAttributes?.gradient,
    );
  }

  // Color is null decoration exists, color gets added to decoration
  Color? get color => decoration == null ? _color : null;

  BoxDecoration? get decoration {
    BoxDecoration? boxDecoration;
    if (border != null ||
        borderRadius != null ||
        boxShadow != null ||
        shape != null ||
        gradient != null) {
      boxDecoration = BoxDecoration(
        color: _color,
        border: border,
        boxShadow: boxShadow,
        gradient: gradient,
      );

      // Shape is added separately because it doesn't accept a nullable value
      if (shape != null) {
        boxDecoration = boxDecoration.copyWith(
          shape: shape,
        );
      }

      // Border radius is added if no shape exists.
      if (shape == null && borderRadius != null) {
        boxDecoration = boxDecoration.copyWith(
          borderRadius: borderRadius,
        );
      }

      return boxDecoration;
    } else {
      return null;
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

    return other is BoxProps &&
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

  /// Check what properties are different from another instance of [BoxProps].
  List<String> getDifference(BoxProps other) {
    final diff = <String>[];
    if (_color != other._color) {
      diff.add('color');
    }

    if (alignment != other.alignment) {
      diff.add('alignment');
    }
    if (padding != other.padding) {
      diff.add('padding');
    }
    if (margin != other.margin) {
      diff.add('margin');
    }
    if (width != other.width) {
      diff.add('width');
    }
    if (height != other.height) {
      diff.add('height');
    }
    if (border != other.border) {
      diff.add('border');
    }
    if (borderRadius != other.borderRadius) {
      diff.add('borderRadius');
    }
    if (!listEquals(boxShadow, other.boxShadow)) {
      diff.add('boxShadow');
    }
    if (transform != other.transform) {
      diff.add('transform');
    }
    if (maxHeight != other.maxHeight) {
      diff.add('maxHeight');
    }
    if (minHeight != other.minHeight) {
      diff.add('minHeight');
    }
    if (maxWidth != other.maxWidth) {
      diff.add('maxWidth');
    }
    if (minWidth != other.minWidth) {
      diff.add('minWidth');
    }
    if (shape != other.shape) {
      diff.add('shape');
    }

    return diff;
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
        shape.hashCode ^
        gradient.hashCode;
  }
}
