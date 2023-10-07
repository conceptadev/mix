import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../decorators/widget_decorator_wrapper.dart';
import '../../factory/mix_provider_data.dart';
import '../empty/empty.widget.dart';
import '../styled.widget.dart';
import 'container.descriptor.dart';

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
    return buildWithMix(
      context,
      (mix) => MixedContainer(mix: mix, child: child),
    );
  }
}

@Deprecated('Use MixedContainer now')
typedef BoxMixedWidget = MixedContainer;

class MixedContainer extends StatelessWidget {
  const MixedContainer({required this.mix, this.child, Key? key})
      : super(key: key);

  // Child Widget.
  final Widget? child;

  final MixData mix;

  @override
  Widget build(BuildContext context) {
    final common = CommonDescriptor.fromContext(mix);
    final box = StyledContainerDescriptor.fromContext(mix);

    if (!common.visible) {
      return const Empty();
    }
    Widget? current = child;

    current = common.animated
        ? AnimatedContainer(
            alignment: box.alignment,
            padding: box.padding,
            color: box.color,
            decoration: box.decoration,
            width: box.width,
            height: box.height,
            constraints: box.constraints,
            margin: box.margin,
            transform: box.transform,
            curve: common.animationCurve,
            duration: common.animationDuration,
            child: current,
          )
        : Container(
            alignment: box.alignment,
            padding: box.padding,
            color: box.color,
            decoration: box.decoration,
            width: box.width,
            height: box.height,
            constraints: box.constraints,
            margin: box.margin,
            transform: box.transform,
            child: current,
          );
    // Wrap parent decorators.
    current = WidgetDecoratorWrapper(mix, child: current);

    return current;
  }
}
