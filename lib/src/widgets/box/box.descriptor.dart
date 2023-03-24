import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../helpers/dto/box_shadow.dto.dart';
import '../../mixer/mix_context.dart';
import 'box.attributes.dart';
import 'box.decorator.dart';

class BoxDescriptor {
  final Color? _color;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;

  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Matrix4? transform;
  final Gradient? gradient;

  // Constraints
  final double? maxHeight;

  final double? minHeight;
  final double? maxWidth;
  final double? minWidth;
  final BoxShape? shape;

  final List<BoxDecoratorAttribute>? decorators;

  const BoxDescriptor({
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
    // Decorators
    this.decorators,
  }) : _color = color;

  factory BoxDescriptor.fromContext(BuildContext context) {
    final mixContext = MixContext.ensureOf(context);
    final attributes = mixContext.attributesOfType<BoxAttributes>();

    return BoxDescriptor(
      color: attributes?.color?.resolve(context),
      alignment: attributes?.alignment,
      margin: attributes?.margin?.resolve(context),
      padding: attributes?.padding?.resolve(context),
      width: attributes?.width?.resolve(context),
      height: attributes?.height?.resolve(context),
      border: attributes?.border?.resolve(context),
      borderRadius: attributes?.borderRadius?.resolve(context),
      boxShadow: attributes?.boxShadow?.resolve(context),
      maxHeight: attributes?.maxHeight?.resolve(context),
      maxWidth: attributes?.maxWidth?.resolve(context),
      minHeight: attributes?.minHeight?.resolve(context),
      minWidth: attributes?.minWidth?.resolve(context),
      shape: attributes?.shape,
      transform: attributes?.transform,
      gradient: attributes?.gradient,
      // Decorators
      decorators: attributes?.decorators?.values.toList(),
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

    return other is BoxDescriptor &&
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
        other.decorators == decorators &&
        other.shape == shape;
  }

  /// Returns a list of properties that are different between this [BoxDescriptor] instance
  /// and another [BoxDescriptor] instance.
  List<String> getDifference(BoxDescriptor other) {
    final diff = <String>[];

// Return if there are no diferences
    if (this == other) return diff;

    if (_color != other._color) diff.add('color');
    if (alignment != other.alignment) diff.add('alignment');
    if (padding != other.padding) diff.add('padding');
    if (margin != other.margin) diff.add('margin');
    if (width != other.width) diff.add('width');
    if (height != other.height) diff.add('height');
    if (border != other.border) diff.add('border');
    if (borderRadius != other.borderRadius) diff.add('borderRadius');
    if (!listEquals(boxShadow, other.boxShadow)) diff.add('boxShadow');
    if (transform != other.transform) diff.add('transform');
    if (maxHeight != other.maxHeight) diff.add('maxHeight');
    if (minHeight != other.minHeight) diff.add('minHeight');
    if (maxWidth != other.maxWidth) diff.add('maxWidth');
    if (minWidth != other.minWidth) diff.add('minWidth');
    if (shape != other.shape) diff.add('shape');
    if (decorators != other.decorators) {
      diff.add('decorators');
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
        gradient.hashCode ^
        decorators.hashCode;
  }
}
