import 'package:flutter/material.dart';

import '../core/decorator.dart';

class ImplicitlyAnimatedWidgetDecorator<T extends DecoratorSpec<T>>
    extends ImplicitlyAnimatedWidget {
  const ImplicitlyAnimatedWidgetDecorator({
    Key? key,
    required this.spec,
    required this.child,
    required Duration duration,
    Curve curve = Curves.linear,
  }) : super(key: key, duration: duration, curve: curve);

  final T spec;
  final Widget child;

  @override
  // ignore: library_private_types_in_public_api
  _ImplicitlyAnimatedWidgetDecoratorState<T> createState() =>
      _ImplicitlyAnimatedWidgetDecoratorState();
}

class _ImplicitlyAnimatedWidgetDecoratorState<T extends DecoratorSpec<T>>
    extends AnimatedWidgetBaseState<ImplicitlyAnimatedWidgetDecorator<T>> {
  SpecTween<T>? _specTween;

  @override
  // ignore: avoid-dynamic
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _specTween = visitor(
      _specTween,
      widget.spec,
      (value) => SpecTween<T>(begin: value as T),
    ) as SpecTween<T>?;
  }

  @override
  Widget build(BuildContext context) {
    // Use the interpolated spec to build the widget
    T animatedSpec = _specTween!.evaluate(animation);

    return animatedSpec.build(widget.child);
  }
}

class SpecTween<T extends DecoratorSpec<T>> extends Tween<T> {
  SpecTween({super.begin, super.end});

  @override
  T lerp(double t) => begin!.lerp(end!, t) as T;
}
