import 'package:flutter/material.dart';

import '../../attributes/exports.dart';
import '../../factory/mix_provider_data.dart';
import '../decorator.dart';

enum ClipDecoratorType {
  oval,
  rect,
  rounded,
  triangle,
}

class ClipDecorator extends Decorator {
  final BorderRadius borderRadius;
  final ClipDecoratorType clipType;

  const ClipDecorator(
    this.clipType, {
    this.borderRadius = BorderRadius.zero,
    super.key,
  });

  @override
  ClipDecorator merge(ClipDecorator other) {
    return other;
  }

  @override
  get props => [borderRadius, clipType];
  @override
  Widget build(Widget child, MixData mix) {
    if (clipType == ClipDecoratorType.triangle) {
      return ClipPath(
        key: mergeKey,
        clipper: const TriangleClipper(),
        child: child,
      );
    }

    if (clipType == ClipDecoratorType.rect) {
      return ClipRect(key: mergeKey, child: child);
    }

    if (clipType == ClipDecoratorType.rounded) {
      final animation = mix.mustGet<AnimationAttribute, AnimationDto>(
        const AnimationDto.defaults(),
      );

      return mix.animated
          ? AnimatedClipRRect(
              duration: animation.duration,
              curve: animation.curve,
              borderRadius: borderRadius,
              key: mergeKey,
              child: child,
            )
          : ClipRRect(key: mergeKey, borderRadius: borderRadius, child: child);
    }

    if (clipType == ClipDecoratorType.oval) {
      return ClipOval(key: mergeKey, child: child);
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

  static Widget _builder(
    BuildContext context,
    BorderRadius radius,
    Widget? child,
  ) {
    return ClipRRect(borderRadius: radius, child: child);
  }

  final Duration duration;
  final Curve curve;
  final BorderRadius borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<BorderRadius>(
      tween: Tween(begin: BorderRadius.zero, end: borderRadius),
      duration: duration,
      curve: curve,
      builder: _builder,
      child: child,
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  const TriangleClipper();
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
