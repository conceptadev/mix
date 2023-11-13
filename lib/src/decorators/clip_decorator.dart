import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../factory/mix_provider_data.dart';
import 'decorator.dart';

abstract class ClipDecorator<T> extends ParentDecorator<ClipDecoratorData<T>> {
  final CustomClipper<T>? clipper;
  final Clip? clipBehavior;

  const ClipDecorator({this.clipper, this.clipBehavior});

  @override
  ClipDecorator<T> merge(covariant ClipDecorator<T> other);

  @override
  ClipDecoratorData<T> resolve(MixData mix);

  @override
  get props => [clipper, clipBehavior];

  @override
  Widget build(Widget child, covariant ClipDecoratorData<T> data);
}

class ClipDecoratorData<T> extends MixExtension<ClipDecoratorData<T>> {
  final Clip? clipBehavior;
  final CustomClipper<T>? clipper;

  const ClipDecoratorData({this.clipper, this.clipBehavior});

  @override
  ClipDecoratorData<T> lerp(ClipDecoratorData<T> other, double t) {
    return ClipDecoratorData(
      clipper: snap(clipper, other.clipper, t),
      clipBehavior: snap(clipBehavior, other.clipBehavior, t),
    );
  }

  @override
  ClipDecoratorData<T> copyWith({
    Clip? clipBehavior,
    CustomClipper<T>? clipper,
  }) {
    return ClipDecoratorData(
      clipper: clipper ?? this.clipper,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [clipper, clipBehavior];
}

class ClipOvalDecorator extends ClipDecorator<Rect> {
  const ClipOvalDecorator({super.clipper, super.clipBehavior});

  @override
  ClipOvalDecorator merge(ClipOvalDecorator other) {
    return ClipOvalDecorator(
      clipper: other.clipper ?? clipper,
      clipBehavior: other.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipDecoratorData<Rect> resolve(MixData mix) {
    return ClipDecoratorData(clipper: clipper, clipBehavior: clipBehavior);
  }

  @override
  Widget build(Widget child, ClipDecoratorData<Rect> data) {
    return ClipOval(
      clipper: data.clipper,
      clipBehavior: data.clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

class ClipPathDecorator extends ClipDecorator<Path> {
  const ClipPathDecorator({super.clipper, super.clipBehavior});

  @override
  ClipPathDecorator merge(ClipPathDecorator other) {
    return ClipPathDecorator(
      clipper: other.clipper,
      clipBehavior: other.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipDecoratorData<Path> resolve(MixData mix) {
    return ClipDecoratorData(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
    );
  }

  @override
  Widget build(Widget child, ClipDecoratorData<Path> data) {
    return ClipPath(
      clipper: data.clipper,
      clipBehavior: data.clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

class ClipRRectDecoratorData extends ClipDecoratorData<RRect> {
  final BorderRadius? borderRadius;

  const ClipRRectDecoratorData({
    required this.borderRadius,
    super.clipBehavior,
    super.clipper,
  });

  @override
  ClipRRectDecoratorData lerp(ClipRRectDecoratorData other, double t) {
    return ClipRRectDecoratorData(
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t),
      clipBehavior: snap(clipBehavior, other.clipBehavior, t),
      clipper: snap(clipper, other.clipper, t),
    );
  }

  @override
  ClipRRectDecoratorData copyWith({
    BorderRadius? borderRadius,
    Clip? clipBehavior,
    CustomClipper<RRect>? clipper,
  }) {
    return ClipRRectDecoratorData(
      borderRadius: borderRadius ?? this.borderRadius,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      clipper: clipper ?? this.clipper,
    );
  }

  @override
  get props => [borderRadius, clipper, clipBehavior];
}

class ClipRectDecorator extends ClipDecorator<Rect> {
  const ClipRectDecorator({super.clipper, super.clipBehavior});

  @override
  ClipRectDecorator merge(ClipRectDecorator other) {
    return ClipRectDecorator(
      clipper: other.clipper,
      clipBehavior: other.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipDecoratorData<Rect> resolve(MixData mix) {
    return ClipDecoratorData(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
    );
  }

  @override
  get props => [clipper, clipBehavior];

  @override
  Widget build(Widget child, ClipDecoratorData<Rect> data) {
    return ClipRect(
      clipper: data.clipper,
      clipBehavior: data.clipBehavior ?? Clip.hardEdge,
      child: child,
    );
  }
}

class ClipRRectDecorator extends ClipDecorator<RRect> {
  final BorderRadius? borderRadius;
  const ClipRRectDecorator({
    super.clipper,
    super.clipBehavior,
    this.borderRadius,
  });

  @override
  ClipRRectDecorator merge(ClipRRectDecorator other) {
    return ClipRRectDecorator(
      clipper: other.clipper,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      borderRadius: other.borderRadius ?? borderRadius,
    );
  }

  @override
  ClipRRectDecoratorData resolve(MixData mix) {
    return ClipRRectDecoratorData(
      borderRadius: borderRadius ?? BorderRadius.zero,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      clipper: clipper,
    );
  }

  @override
  get props => [clipper, clipBehavior, borderRadius];

  @override
  Widget build(Widget child, ClipRRectDecoratorData data) {
    return ClipRRect(
      borderRadius: data.borderRadius ?? BorderRadius.zero,
      clipper: data.clipper,
      clipBehavior: data.clipBehavior ?? Clip.antiAlias,
      child: child,
    );
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
