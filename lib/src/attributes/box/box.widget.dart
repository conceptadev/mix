import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/box/box.attributes.dart';

import '../../mixer/mix_factory.dart';
import '../../mixer/recipe_factory.dart';
import '../../widgets/mix_widget.dart';

class Box extends MixWidget {
  const Box(
    Mix<BoxAttributes> mix, {
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
    final hidden = props.hidden;
    final alignment = boxProps.alignment;
    final aspectRatio = boxProps.aspectRatio;
    final backgroundColor = boxProps.backgroundColor;
    final decoration = boxProps.decoration;
    final opacity = boxProps.opacity;
    final rotate = boxProps.rotate;
    final margin = boxProps.margin;
    final flex = boxProps.flex;
    final flexFit = boxProps.flexFit;
    final constraints = boxProps.constraints;
    final padding = boxProps.padding;
    final height = boxProps.height;
    final width = boxProps.width;

    if (hidden == true) {
      return const SizedBox.shrink();
    }

    if (animated) {
      current = AnimatedContainer(
        color: backgroundColor,
        decoration: decoration,
        alignment: alignment,
        constraints: constraints,
        margin: margin,
        padding: padding,
        height: height,
        width: width,
        child: current,
        duration: animationDuration,
        curve: animationCurve,
      );
    } else {
      current = Container(
        color: backgroundColor,
        decoration: decoration,
        alignment: alignment,
        constraints: constraints,
        margin: margin,
        padding: padding,
        height: height,
        width: width,
        child: current,
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

    if (rotate != null) {
      current = RotatedBox(
        quarterTurns: rotate,
        child: current,
      );
    }

    if (flexFit != null || flex != null) {
      current = Flexible(
        flex: flex ?? 1,
        fit: flexFit ?? FlexFit.loose,
        child: current,
      );
    }

    return current;
  }
}
