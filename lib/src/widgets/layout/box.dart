import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/primitives/box/box_attributes.dart';

import '../../mixer/mix_factory.dart';
import '../../mixer/mixer.dart';
import '../mix_widget.dart';

class Box extends MixWidget {
  const Box(
    Mix mix, {
    required this.child,
    Key? key,
  }) : super(mix, key: key);

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final mixer = Mixer.build(context, mix);

    return BoxWidget(
      mixer.boxAttribute,
      child: child,
    );
  }
}

class BoxWidget extends StatelessWidget {
  final BoxAttribute attributes;
  // Child Widget
  final Widget? child;

  const BoxWidget(
    this.attributes, {
    this.child,
    Key? key,
  }) : super(key: key);

  EdgeInsetsGeometry? get _paddingIncludingDecoration {
    if (attributes.decoration == null ||
        attributes.decoration!.padding == null) {
      return attributes.padding;
    }
    final decorationPadding = attributes.decoration!.padding;
    if (attributes.padding == null) return decorationPadding;
    return attributes.padding!.add(decorationPadding!);
  }

  BoxConstraints? get _constraints {
    BoxConstraints? constraints;

    if (attributes.minWidth != null ||
        attributes.maxWidth != null ||
        attributes.minHeight != null ||
        attributes.maxHeight != null) {
      constraints = BoxConstraints(
        minHeight: attributes.minHeight ?? 0.0,
        maxHeight: attributes.maxHeight ?? double.infinity,
        minWidth: attributes.minWidth ?? 0.0,
        maxWidth: attributes.maxWidth ?? double.infinity,
      );
    }

    // If there are min or max constraints
    if (attributes.height != null || attributes.width != null) {
      if (constraints != null) {
        constraints = constraints.tighten(
          width: attributes.width,
          height: attributes.height,
        );
      } else {
        constraints = BoxConstraints.tightFor(
          width: attributes.width,
          height: attributes.height,
        );
      }
    }

    return constraints;
  }

  @override
  Widget build(BuildContext context) {
    var current = child;
    const ms100 = Duration(milliseconds: 100);

    final animated = attributes.animated ?? false;
    final animationDuration = attributes.animationDuration ?? ms100;
    final animationCurve = attributes.animationCurve ?? Curves.linear;
    final alignment = attributes.alignment;
    final aspectRatio = attributes.aspectRatio;
    final hidden = attributes.hidden;
    final backgroundColor = attributes.backgroundColor;
    final decoration = attributes.decoration;
    final opacity = attributes.opacity;
    final rotate = attributes.rotate;
    final margin = attributes.margin;

    final constraints = _constraints;

    if (hidden != null) {
      if (hidden == true) {
        return const SizedBox.shrink();
      }
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

    return current!;
  }
}
