import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/widget_decorators/clip_decorators/clip_utils.dart';
import 'package:mix/src/mixer/mix_context.dart';

ClipDecorator clipRounded(double radius) {
  return ClipDecorator(
    ClipDecoratorType.rounded,
    borderRadius: BorderRadius.circular(radius),
  );
}

ClipDecorator clipOval() {
  return const ClipDecorator(ClipDecoratorType.oval);
}

ClipDecorator clipTriangle() {
  return const ClipDecorator(ClipDecoratorType.triangle);
}

enum ClipDecoratorType {
  triangle,
  rect,
  rounded,
  oval,
}

class ClipDecorator extends ParentWidgetDecorator<ClipDecorator> {
  final BorderRadius? borderRadius;
  final ClipDecoratorType clipType;

  const ClipDecorator(
    this.clipType, {
    this.borderRadius,
  });

  @override
  ClipDecorator merge(ClipDecorator other) {
    return other;
  }

  @override
  Widget render(MixContext mixContext, Widget child) {
    final shared = mixContext.sharedMixer;

    if (clipType == ClipDecoratorType.triangle) {
      return ClipPath(
        clipper: TriangleClipper(),
        child: child,
      );
    }

    if (clipType == ClipDecoratorType.rect) {
      return ClipRect(
        child: child,
      );
    }

    if (clipType == ClipDecoratorType.rounded) {
      if (shared.animated) {
        return AnimatedClipRRect(
          duration: shared.animationDuration,
          curve: shared.animationCurve,
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          child: child,
        );
      } else {
        return ClipRRect(
          borderRadius: borderRadius,
          child: child,
        );
      }
    }

    if (clipType == ClipDecoratorType.oval) {
      return ClipOval(
        child: child,
      );
    }

    throw Exception('Unknown clip type: $clipType');
  }
}

class AnimatedClipRRect extends StatelessWidget {
  const AnimatedClipRRect({
    required this.duration,
    this.curve = Curves.linear,
    required this.borderRadius,
    required this.child,
    Key? key,
  }) : super(key: key);

  final Duration duration;
  final Curve curve;
  final BorderRadius borderRadius;
  final Widget child;

  static Widget _builder(
      BuildContext context, BorderRadius radius, Widget? child) {
    return ClipRRect(borderRadius: radius, child: child);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<BorderRadius>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: BorderRadius.zero, end: borderRadius),
      builder: _builder,
      child: child,
    );
  }
}
