import 'package:flutter/material.dart';

import '../core/attributes_map.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import 'widget_decorators.dart';

// Default order of decorators and their logic:
const _defaultOrder = [
  // 1. VisibilityDecorator: Placed first to control the overall visibility of the widget.
  // If a widget is not visible, none of the other decorators need to process it.
  VisibilityDecorator,

  // 2. AspectRatioDecorator: Comes next to ensure the widget maintains its aspect ratio
  // before any size transformations (like scaling) are applied.
  AspectRatioDecorator,

  // 3. ScaleDecorator: Applied after aspect ratio considerations to scale the widget.
  // Scaling changes the size of the widget and should be done before applying shape-specific
  // clipping to maintain proper proportions.
  ScaleDecorator,

  // 4. ClipDecorator: Used after scaling to apply clipping paths or shapes (like ClipOval) to the
  // scaled widget. This ensures that the clipping is applied to the widget's final size and shape.
  ClipDecorator,

  // 5. OpacityDecorator: Applied last as a visual effect. It alters the transparency of the
  // widget without affecting its size, shape, or layout, making it ideal to be the final step.
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

    Map<Object, WidgetDecorator> decoratorMap =
        AttributeMap<WidgetDecorator>(decorators).toMap();

    final listOfDecorators = {
      ...orderOfDecorators,
      ..._defaultOrder,
      ...decoratorMap.keys,
    }.toList().reversed;

    for (final decoratorType in listOfDecorators) {
      final decorator = decoratorMap.remove(decoratorType);
      if (decorator == null) continue;
      current = decorator.build(mix, current);

      // Remove the decorator from the MixData, because it can be applied only once.
      mix.removeType(decoratorType);
    }

    return current;
  }
}
