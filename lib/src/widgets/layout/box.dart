import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Box extends StatelessWidget {
  final bool animated;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;
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
  //Animation
  final Duration animationDuration;
  final Curve animationCurve;
  // Child Widget
  final Widget? child;

  const Box({
    this.margin,
    this.padding,
    this.alignment,
    this.constraints,
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
    this.animated = false,
    this.child,
  });

  EdgeInsetsGeometry? get _paddingIncludingDecoration {
    if (decoration == null || decoration!.padding == null) {
      return padding;
    }
    final decorationPadding = decoration!.padding;
    if (padding == null) return decorationPadding;
    return padding!.add(decorationPadding!);
  }

  @override
  Widget build(BuildContext context) {
    var current = child;

    if (hidden != null) {
      if (hidden == true) {
        return const SizedBox.shrink();
      }
    }

    if (child == null && (constraints == null || !constraints!.isTight)) {
      current = LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
        ),
      );
    }

    if (aspectRatio != null) {
      if (animated) {
        current = TweenAnimationBuilder<double>(
          tween: Tween<double>(end: aspectRatio),
          duration: animationDuration,
          curve: animationCurve,
          builder: (context, value, child) {
            return AspectRatio(aspectRatio: value, child: child);
          },
          child: current,
        );
      } else {
        current = AspectRatio(
          aspectRatio: aspectRatio!,
          child: current,
        );
      }
    }

    if (alignment != null) {
      if (animated) {
        current = AnimatedAlign(
          duration: animationDuration,
          curve: animationCurve,
          alignment: alignment!,
          child: current,
        );
      } else {
        current = Align(
          alignment: alignment!,
          child: current,
        );
      }
    }

    final effectivePadding = _paddingIncludingDecoration;
    if (effectivePadding != null) {
      if (animated) {
        current = AnimatedPadding(
          duration: animationDuration,
          curve: animationCurve,
          padding: effectivePadding,
          child: current,
        );
      } else {
        current = Padding(
          padding: effectivePadding,
          child: current,
        );
      }
    }

    if (backgroundColor != null) {
      if (animated) {
        current = TweenAnimationBuilder<Color?>(
          duration: animationDuration,
          curve: animationCurve,
          tween: ColorTween(end: backgroundColor),
          builder: (context, color, child) {
            if (color == null) {
              return child!;
            }
            return ColoredBox(color: color, child: child);
          },
          child: current,
        );
      } else {
        current = ColoredBox(
          color: backgroundColor!,
          child: current,
        );
      }
    }

    if (decoration != null) {
      if (animated) {
        current = TweenAnimationBuilder<Decoration>(
          duration: animationDuration,
          curve: animationCurve,
          tween: DecorationTween(end: decoration),
          builder: (context, value, child) {
            return DecoratedBox(decoration: value, child: child);
          },
          child: current,
        );
      } else {
        current = DecoratedBox(
          decoration: decoration!,
          child: current,
        );
      }
    }

    if (opacity != null) {
      if (animated) {
        current = AnimatedOpacity(
          duration: animationDuration,
          curve: animationCurve,
          opacity: opacity!,
          child: current,
        );
      } else {
        current = Opacity(
          opacity: opacity!,
          child: current,
        );
      }
    }

    /// Set child constraints
    if (constraints != null) {
      if (animated) {
        current = TweenAnimationBuilder<BoxConstraints>(
          duration: animationDuration,
          curve: animationCurve,
          tween: BoxConstraintsTween(end: constraints!),
          builder: (context, value, child) {
            return ConstrainedBox(constraints: value, child: child);
          },
          child: current,
        );
      } else {
        current = ConstrainedBox(
          constraints: constraints!,
          child: current,
        );
      }
    }

    if (maxHeight != null || maxWidth != null) {
      current = LimitedBox(
        maxHeight: maxHeight ?? double.infinity,
        maxWidth: maxWidth ?? double.infinity,
        child: current,
      );
    }

    if (rotate != null) {
      current = RotatedBox(
        quarterTurns: rotate!,
        child: current,
      );
    }

    if (margin != null) {
      if (animated) {
        current = AnimatedPadding(
          duration: animationDuration,
          curve: animationCurve,
          padding: margin!,
          child: current,
        );
      } else {
        current = Padding(
          padding: margin!,
          child: current,
        );
      }
    }

    return current!;
  }
}
