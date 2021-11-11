import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mix/mix.dart';

import '../../mixer/mix_factory.dart';
import '../../mixer/recipe_factory.dart';
import '../../widgets/mix_widget.dart';

class Box extends MixWidget {
  const Box(
    Mix mix, {
    required this.child,
    Key? key,
  }) : super(mix, key: key);

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return BoxMixerWidget(
      mix.build(context),
      child: child,
    );
  }
}

class BoxMixerWidget extends MixerWidget {
  // Child Widget
  final Widget? child;

  const BoxMixerWidget(
    Recipe recipe, {
    this.child,
    Key? key,
  }) : super(recipe, key: key);

  @override
  Widget build(BuildContext context) {
    var current = child;

    // Generic widget attributes
    final animated = props.animated;
    final animationDuration = props.animationDuration;
    final animationCurve = props.animationCurve;

    // Box Attributes
    final hidden = boxProps.hidden;
    final alignment = boxProps.alignment;
    final aspectRatio = boxProps.aspectRatio;
    final backgroundColor = boxProps.backgroundColor;
    final decoration = boxProps.decoration;
    final opacity = boxProps.opacity;
    final rotate = boxProps.rotate;
    final margin = boxProps.margin;
    final flex = boxProps.flex;
    final flexFit = boxProps.flexFit;
    final effectivePadding = boxProps.padding;
    final constraints = boxProps.constraints;

    if (hidden == true) {
      return const SizedBox.shrink();
    }

    if (child == null && (constraints == null || !constraints.isTight)) {
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
          aspectRatio: aspectRatio,
          child: current,
        );
      }
    }

    if (alignment != null) {
      if (animated) {
        current = AnimatedAlign(
          duration: animationDuration,
          curve: animationCurve,
          alignment: alignment,
          child: current,
        );
      } else {
        current = Align(
          alignment: alignment,
          child: current,
        );
      }
    }

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
          color: backgroundColor,
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
          decoration: decoration,
          child: current,
        );
      }
    }

    if (opacity != null) {
      if (animated) {
        current = AnimatedOpacity(
          duration: animationDuration,
          curve: animationCurve,
          opacity: opacity,
          child: current,
        );
      } else {
        current = Opacity(
          opacity: opacity,
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
          tween: BoxConstraintsTween(end: constraints),
          builder: (context, value, child) {
            return ConstrainedBox(constraints: value, child: child);
          },
          child: current,
        );
      } else {
        current = ConstrainedBox(
          constraints: constraints,
          child: current,
        );
      }
    }
    // TODO: is this still needed?
    // if (maxHeight != null || maxWidth != null) {
    //   current = LimitedBox(
    //     maxHeight: maxHeight ?? double.infinity,
    //     maxWidth: maxWidth ?? double.infinity,
    //     child: current,
    //   );
    // }

    if (rotate != null) {
      current = RotatedBox(
        quarterTurns: rotate,
        child: current,
      );
    }

    if (margin != null) {
      if (animated) {
        current = AnimatedPadding(
          duration: animationDuration,
          curve: animationCurve,
          padding: margin,
          child: current,
        );
      } else {
        current = Padding(
          padding: margin,
          child: current,
        );
      }
    }

    if (flexFit != null || flex != null) {
      current = Flexible(
        flex: flex ?? 1,
        fit: flexFit ?? FlexFit.loose,
        child: current!,
      );
    }

    return current!;
  }
}
