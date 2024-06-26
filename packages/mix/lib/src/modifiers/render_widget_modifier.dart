// ignore_for_file: avoid-dynamic

import 'package:flutter/widgets.dart';

import '../core/attributes_map.dart';
import '../core/factory/mix_data.dart';
import '../core/modifier.dart';
import 'align_widget_modifier.dart';
import 'aspect_ratio_widget_modifier.dart';
import 'clip_widget_modifier.dart';
import 'fractionally_sized_box_widget_modifier.dart';
import 'intrinsic_widget_modifier.dart';
import 'opacity_widget_modifier.dart';
import 'sized_box_widget_modifier.dart';
import 'transform_widget_modifier.dart';
import 'visibility_widget_modifier.dart';

// Default order of modifiers and their logic:
const _defaultOrder = [
  // 1. VisibilityModifier: Controls overall visibility. If the widget is set to be invisible,
  // none of the subsequent decorations are processed, providing an early exit and optimizing performance.
  VisibilityModifierAttribute,

  // 2. SizedBoxModifier: Explicitly sets the size of the widget before any other transformations are applied.
  // This ensures that the widget occupies a predetermined space, which is crucial for layouts that require exact dimensions.
  SizedBoxModifierAttribute,

  // 3. FractionallySizedBoxModifier: Adjusts the widget's size relative to its parent's size,
  // allowing for responsive layouts that scale with the parent widget. This modifier is applied after
  // explicit sizing to refine the widget's dimensions based on available space.
  FractionallySizedBoxModifierAttribute,

  // 4. AlignModifier: Aligns the widget within its allocated space, which is especially important
  // for positioning the widget correctly before applying any transformations that could affect its position.
  // Alignment is based on the size constraints established by previous modifiers.
  AlignModifierAttribute,

  // 5. IntrinsicHeightModifier: Adjusts the widget's height to fit its child's intrinsic height,
  // ensuring that the widget does not force its children to conform to an unnatural height. This is particularly
  // useful for widgets that should size themselves based on content.
  IntrinsicHeightModifierAttribute,

  // 6. IntrinsicWidthModifier: Similar to the IntrinsicHeightModifier, this adjusts the widget's width
  // to its child's intrinsic width. This modifier allows for content-driven width adjustments, making it ideal
  // for widgets that need to wrap their content tightly.
  IntrinsicWidthModifierAttribute,

  // 7. AspectRatioModifier: Maintains the widget's aspect ratio after sizing adjustments.
  // This modifier ensures that the widget scales correctly within its given aspect ratio constraints,
  // which is critical for preserving the visual integrity of images and other aspect-sensitive content.
  AspectRatioModifierAttribute,

  // 9. TransformModifier: Applies arbitrary transformations, such as rotation, scaling, and translation.
  // Transformations are applied after all sizing and positioning adjustments to modify the widget's appearance
  // and position in more complex ways without altering the logical layout.
  TransformModifierAttribute,

  // 10. Clip Modifiers: Applies clipping in various shapes to the transformed widget, shaping the final appearance.
  // Clipping is one of the last steps to ensure it is applied to the widget's final size, position, and transformation state.
  ClipOvalModifierAttribute,
  ClipRRectModifierAttribute,
  ClipPathModifierAttribute,
  ClipTriangleModifierAttribute,
  ClipRectModifierAttribute,

  // 11. OpacityModifier: Modifies the widget's opacity as the final decoration step. Applying opacity last ensures
  // that it does not influence the layout or transformations, serving purely as a visual effect to alter the transparency
  // of the widget and its decorations.
  OpacityModifierAttribute,
];

class RenderModifiers extends StatelessWidget {
  const RenderModifiers({
    required this.mix,
    required this.child,
    super.key,
    required this.orderOfModifiers,
  });

  final MixData mix;
  final Widget child;
  final List<Type> orderOfModifiers;

  @override
  Widget build(BuildContext context) {
    final specs = resolveModifierSpecs(orderOfModifiers, mix);

    var current = child;

    for (final spec in specs) {
      current = spec.build(current);
    }

    return current;
  }
}

class RenderAnimatedModifiers extends ImplicitlyAnimatedWidget {
  const RenderAnimatedModifiers({
    required this.mix,
    required this.child,
    required this.orderOfModifiers,
    super.key,
    required super.duration,
    super.curve = Curves.linear,
    super.onEnd,
  });

  final MixData mix;
  final Widget child;
  final List<Type> orderOfModifiers;

  @override
  RenderAnimatedModifiersState createState() => RenderAnimatedModifiersState();
}

class RenderAnimatedModifiersState
    extends AnimatedWidgetBaseState<RenderAnimatedModifiers> {
  final Map<Type, ModifierSpecTween> _specs = {};

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    final specs = resolveModifierSpecs(widget.orderOfModifiers, widget.mix);

    for (final spec in specs) {
      final specType = spec.runtimeType;
      final previousSpec = _specs[specType];

      _specs[specType] = visitor(
        previousSpec,
        spec,
        (dynamic value) =>
            ModifierSpecTween(begin: value as WidgetModifierSpec),
      ) as ModifierSpecTween;
    }
  }

  @override
  Widget build(BuildContext context) {
    var current = widget.child;

    for (final spec in _specs.keys) {
      final evaluatedSpec = _specs[spec]!.evaluate(animation);
      current = evaluatedSpec.build(current);
    }

    return current;
  }
}

Set<WidgetModifierSpec> resolveModifierSpecs(
  List<Type> orderOfModifiers,
  MixData mix,
) {
  final modifiers = mix.whereType<WidgetModifierAttribute>();

  if (modifiers.isEmpty) return {};
  final modifierMap = AttributeMap<WidgetModifierAttribute>(modifiers).toMap();

  final listOfModifiers = {
    // Prioritize the order of modifiers provided by the user.
    ...orderOfModifiers,
    // Add the default order of modifiers.
    ..._defaultOrder,
    // Add any remaining modifiers that were not included in the order.
    ...modifierMap.keys,
  }.toList().reversed;

  final specs = <WidgetModifierSpec>[];

  for (final modifierType in listOfModifiers) {
    // Resolve the modifier and add it to the list of specs.
    final modifier = modifierMap.remove(modifierType);
    if (modifier == null) continue;
    specs.add(modifier.resolve(mix) as WidgetModifierSpec);
  }

  return specs.toSet();
}

class ModifierSpecTween extends Tween<WidgetModifierSpec> {
  /// Creates an [EdgeInsetsGeometry] tween.
  ///
  /// The [begin] and [end] properties may be null; the null value
  /// is treated as an [WidgetModifierSpec]
  ModifierSpecTween({super.begin, super.end});

  /// Returns the value this variable has at the given animation clock value.
  @override
  WidgetModifierSpec lerp(double t) =>
      WidgetModifierSpec.lerpValue(begin, end, t)!;
}
