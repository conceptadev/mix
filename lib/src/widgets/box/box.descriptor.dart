
import 'package:flutter/material.dart';

import '../../../mix.dart';
import '../../dtos/shadow/box_shadow.dto.dart';
import '../../factory/mix_provider.dart';
import '../../helpers/equatable_mixin.dart';
import 'box.decorator.dart';

class BoxDescriptor with EquatableMixin {
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

  final List<BoxDecorator>? decorators;

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
    final mix = MixProvider.ensureOf(context);
    final attributes = mix.attributesOfType<BoxAttributes>();

    return BoxDescriptor(
      color: attributes?.color?.resolve(context),
      alignment: attributes?.alignment,
      margin: attributes?.margin?.resolve(context),
      padding: attributes?.padding?.resolve(context),
      width: attributes?.width,
      height: attributes?.height,
      border: attributes?.border?.resolve(context),
      borderRadius: attributes?.borderRadius?.resolve(context),
      boxShadow: attributes?.boxShadow?.resolve(context),
      maxHeight: attributes?.maxHeight,
      maxWidth: attributes?.maxWidth,
      minHeight: attributes?.minHeight,
      minWidth: attributes?.minWidth,
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
  get props => [
        _color,
        alignment,
        padding,
        margin,
        width,
        height,
        border,
        borderRadius,
        boxShadow,
        maxHeight,
        minHeight,
        maxWidth,
        minWidth,
        shape,
        transform,
        gradient,
        decorators,
      ];
}
