import 'package:flutter/material.dart';

import '../core/decorator.dart';

class ImplicitlyAnimatedWidgetDecorator<T extends DecoratorSpec>
    extends ImplicitlyAnimatedWidget {
  const ImplicitlyAnimatedWidgetDecorator({
    super.key,
    required this.spec,
    required this.child,
    required super.duration,
    super.curve,
  });

  final T spec;
  final Widget child;

  @override
  // ignore: library_private_types_in_public_api
  _ImplicitlyAnimatedWidgetDecoratorState<T> createState() =>
      _ImplicitlyAnimatedWidgetDecoratorState();
}

class _ImplicitlyAnimatedWidgetDecoratorState<T extends DecoratorSpec>
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

class SpecTween<T extends DecoratorSpec> extends Tween<T> {
  SpecTween({super.begin, super.end});

  @override
  T lerp(double t) => begin!.lerp(end!, t) as T;
}
