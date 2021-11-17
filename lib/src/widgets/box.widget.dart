import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../mixer/mix_factory.dart';
import '../mixer/mixer.dart';
import '../mixer/mixer.notifier.dart';
import 'mix.widget.dart';
import 'nothing.widget.dart';

class Box extends MixWidget {
  const Box({
    Mix? mix,
    Key? key,
    this.child,
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
    Mixer mixer, {
    this.child,
    Key? key,
  }) : super(mixer, key: key);

  @override
  Widget build(BuildContext context) {
    var current = child;

    // Box Attributes
    final alignment = boxProps?.alignment;
    final aspectRatio = boxProps?.aspectRatio;
    final bgColor =
        boxProps?.decoration == null ? boxProps?.backgroundColor : null;
    final decoration = boxProps?.decoration;
    final opacity = boxProps?.opacity;
    final rotate = boxProps?.rotate;
    final margin = boxProps?.margin;
    final padding = boxProps?.padding;
    final flex = boxProps?.flex;
    final flexFit = boxProps?.flexFit;
    final constraints = boxProps?.constraints;
    final height = boxProps?.height;
    final width = boxProps?.width;
    final elevation = boxProps?.elevation;
    final borderRadius = boxProps?.borderRadius?.toBorderRadius();
    final scale = boxProps?.scale;

    if (hidden == true) {
      return const Empty();
    }
    // Apply notifier to children
    if (current != null) {
      current = MixerNotifier(
        mixer: mixer,
        child: current,
      );
    }

    if (animated) {
      current = AnimatedContainer(
        color: bgColor,
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
        color: bgColor,
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

    if (elevation != null) {
      current = Material(
        borderRadius: borderRadius,
        elevation: elevation,
        color: Colors.transparent,
        animationDuration: animationDuration,
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
            return AspectRatio(
              aspectRatio: value,
              child: child,
            );
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

    if (scale != null) {
      if (animated) {
        current = AnimatedScale(
          scale: scale,
          duration: animationDuration,
          child: current,
        );
      } else {
        current = Transform.scale(
          scale: scale,
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
