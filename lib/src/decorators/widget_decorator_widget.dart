import 'package:flutter/material.dart';

import '../core/attributes_map.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import 'widget_decorators.dart';

// Default order of decorators and their logic:
const _defaultOrder = [
  // 1. VisibilityDecorator: Controls overall visibility. Early exit if not visible.
  VisibilityDecorator,

  // 2. SizedBox: Explicitly sets size before adjusting aspect ratio or scaling.
  SizedBoxDecorator,

  // 3. FractionallySizedBox: Adjusts size relative to parent's size after fixed sizing.
  FractionallySizedBoxDecorator,

  // 4. Align: Aligns the widget within its allocated space, crucial for positioning before transformations.
  AlignDecorator,

  // 5. AspectRatioDecorator: Ensures the widget's aspect ratio is maintained.
  AspectRatioDecorator,

  // 6. ScaleDecorator: Scales the widget, affecting its size post aspect ratio adjustments.
  ScaleDecorator,

  // 7. Transform: Applies transformations like rotate, scale, and translate.
  TransformDecorator,

  // 8. Clip Decorators: Applies various clipping shapes after transformations to ensure correct final shape.
  ClipOvalDecorator,
  ClipRRectDecorator,
  ClipPathDecorator,
  ClipTriangleDecorator,
  ClipRectDecorator,

  // 9. OpacityDecorator: Modifies transparency, ideal as a final visual effect.
  OpacityDecorator,
];

class RenderWidgetDecorators extends StatelessWidget {
  const RenderWidgetDecorators({
    required this.mix,
    required this.child,
    super.key,
    this.orderOfDecorators = const [],
  });

  final MixData mix;
  final Widget child;
  final List<Type> orderOfDecorators;

  @override
  Widget build(BuildContext context) {
    Widget current = child;

    final decorators = mix.whereType<WidgetDecorator>();

    if (decorators.isEmpty) return current;

    final decoratorMap = AttributeMap<WidgetDecorator>(decorators).toMap();

    final listOfDecorators = {
      ...orderOfDecorators,
      ..._defaultOrder,
      ...decoratorMap.keys,
    }.toList().reversed;

    for (final decoratorType in listOfDecorators) {
      final decorator = decoratorMap.remove(decoratorType);
      if (decorator == null) continue;
      current = decorator.build(mix, current);
    }

    return current;
  }
}
