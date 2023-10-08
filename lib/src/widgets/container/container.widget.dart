// ignore_for_file: avoid-unnecessary-reassignment

import 'package:flutter/material.dart';

import '../../attributes/decorators/widget_decorator_wrapper.dart';
import '../../factory/mix_provider.dart';
import '../empty/empty.widget.dart';
import '../styled.widget.dart';
import 'container.attribute.dart';

@Deprecated('Use MixedContainer now')
typedef BoxMixedWidget = MixedContainer;

typedef Box = StyledContainer;

class StyledContainer extends StyledWidget {
  const StyledContainer({
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.key,
    super.variants,
    super.inherit,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return withMix(context, MixedContainer(child: child));
  }
}

class MixedContainer extends StatelessWidget {
  const MixedContainer({this.child, super.key, this.animated = false});

  // Child Widget.
  final Widget? child;
  final bool animated;

  @override
  Widget build(BuildContext context) {
    final mix = MixProvider.ensureOf(context);
    final attr = mix.resolveAttributeOfType<ContainerAttributes,
        ContainerAttributesResolved>();

    if (attr?.visible == false) {
      return const Empty();
    }
    Widget? current = child;

    current = mix.animated
        ? AnimatedContainer(
            alignment: attr?.alignment,
            padding: attr?.padding,
            color: attr?.color,
            decoration: attr?.decoration,
            width: attr?.width,
            height: attr?.height,
            constraints: attr?.constraints,
            margin: attr?.margin,
            transform: attr?.transform,
            curve: attr?.animation?.curve ?? Curves.linear,
            duration:
                attr?.animation?.duration ?? const Duration(milliseconds: 300),
            child: current,
          )
        : Container(
            alignment: attr?.alignment,
            padding: attr?.padding,
            color: attr?.color,
            decoration: attr?.decoration,
            width: attr?.width,
            height: attr?.height,
            constraints: attr?.constraints,
            margin: attr?.margin,
            transform: attr?.transform,
            child: current,
          );
    // Wrap parent decorators.
    current = WidgetDecoratorWrapper(mix, child: current);

    return current;
  }
}
