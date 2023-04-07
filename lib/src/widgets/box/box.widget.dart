import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../decorators/widget_decorator.dart';
import '../../factory/mix_provider_data.dart';
import '../empty/empty.widget.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import 'box.descriptor.dart';

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
    return MixBuilder(
      style: style,
      variants: variants,
      builder: (mix) {
        return MixedContainer(
          mix: mix,
          child: child,
        );
      },
    );
  }
}

@Deprecated('Use MixedContainer now')
typedef BoxMixedWidget = MixedContainer;

class MixedContainer extends StatelessWidget {
  // Child Widget
  final Widget? child;

  const MixedContainer({
    required this.mix,
    this.child,
    Key? key,
  }) : super(key: key);

  final MixData mix;

  @override
  Widget build(BuildContext context) {
    final common = CommonDescriptor.fromContext(mix);
    final box = BoxDescriptor.fromContext(mix);

    if (!common.visible) {
      return const Empty();
    }
    var current = child;

    if (common.animated) {
      current = AnimatedContainer(
        color: box.color,
        decoration: box.decoration,
        alignment: box.alignment,
        constraints: box.constraints,
        margin: box.margin,
        padding: box.padding,
        height: box.height,
        width: box.width,
        duration: common.animationDuration,
        curve: common.animationCurve,
        transform: box.transform,
        child: current,
      );
    } else {
      current = Container(
        color: box.color,
        decoration: box.decoration,
        alignment: box.alignment,
        constraints: box.constraints,
        margin: box.margin,
        padding: box.padding,
        height: box.height,
        width: box.width,
        transform: box.transform,
        child: current,
      );
    }

    if (mix.decorators != null) {
      // Wrap parent decorators
      current = WidgetDecoratorWrapper(
        mix,
        child: current,
      );
    }

    return current;
  }
}
