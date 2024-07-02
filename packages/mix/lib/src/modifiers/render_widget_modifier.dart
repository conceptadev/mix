// ignore_for_file: avoid-dynamic

import 'package:flutter/material.dart';

import '../core/attributes_map.dart';
import '../core/factory/mix_data.dart';
import '../core/modifier.dart';
import '../core/spec.dart';
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
@Deprecated("Use _defaultSpecsOrder instead")
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

const _defaultSpecsOrder = [
  // 1. VisibilityModifier: Controls overall visibility. If the widget is set to be invisible,
  // none of the subsequent decorations are processed, providing an early exit and optimizing performance.
  VisibilityModifierSpec,

  // 2. SizedBoxModifier: Explicitly sets the size of the widget before any other transformations are applied.
  // This ensures that the widget occupies a predetermined space, which is crucial for layouts that require exact dimensions.
  SizedBoxModifierSpec,

  // 3. FractionallySizedBoxModifier: Adjusts the widget's size relative to its parent's size,
  // allowing for responsive layouts that scale with the parent widget. This modifier is applied after
  // explicit sizing to refine the widget's dimensions based on available space.
  FractionallySizedBoxModifierSpec,

  // 4. AlignModifier: Aligns the widget within its allocated space, which is especially important
  // for positioning the widget correctly before applying any transformations that could affect its position.
  // Alignment is based on the size constraints established by previous modifiers.
  AlignModifierSpec,

  // 5. IntrinsicHeightModifier: Adjusts the widget's height to fit its child's intrinsic height,
  // ensuring that the widget does not force its children to conform to an unnatural height. This is particularly
  // useful for widgets that should size themselves based on content.
  IntrinsicHeightModifierSpec,

  // 6. IntrinsicWidthModifier: Similar to the IntrinsicHeightModifier, this adjusts the widget's width
  // to its child's intrinsic width. This modifier allows for content-driven width adjustments, making it ideal
  // for widgets that need to wrap their content tightly.
  IntrinsicWidthModifierSpec,

  // 7. AspectRatioModifier: Maintains the widget's aspect ratio after sizing adjustments.
  // This modifier ensures that the widget scales correctly within its given aspect ratio constraints,
  // which is critical for preserving the visual integrity of images and other aspect-sensitive content.
  AspectRatioModifierSpec,

  // 9. TransformModifier: Applies arbitrary transformations, such as rotation, scaling, and translation.
  // Transformations are applied after all sizing and positioning adjustments to modify the widget's appearance
  // and position in more complex ways without altering the logical layout.
  TransformModifierSpec,

  // 10. Clip Modifiers: Applies clipping in various shapes to the transformed widget, shaping the final appearance.
  // Clipping is one of the last steps to ensure it is applied to the widget's final size, position, and transformation state.
  ClipOvalModifierSpec,
  ClipRRectModifierSpec,
  ClipPathModifierSpec,
  ClipTriangleModifierSpec,
  ClipRectModifierSpec,

  // 11. OpacityModifier: Modifies the widget's opacity as the final decoration step. Applying opacity last ensures
  // that it does not influence the layout or transformations, serving purely as a visual effect to alter the transparency
  // of the widget and its decorations.
  OpacityModifierSpec,
];

class RenderModifiers extends StatelessWidget {
  const RenderModifiers({
    required this.child,
    //TODO Should be required in the next version
    this.modifiers = const <WidgetModifierSpec<dynamic>>{},
    @Deprecated("Use modifiers parameter") this.mix,
    @Deprecated("Use modifiers parameter") this.orderOfModifiers,
    super.key,
  });

  final Widget child;
  final MixData? mix;
  final List<Type>? orderOfModifiers;
  final Set<WidgetModifierSpec<dynamic>> modifiers;

  @Deprecated("Should be removed in the next major version")
  Widget deprecatedBuild() {
    final specs = resolveModifierSpecs(orderOfModifiers!, mix!);

    var current = child;

    for (final spec in specs) {
      current = spec.build(current);
    }

    return current;
  }

  @override
  Widget build(BuildContext context) {
    assert(
      (mix == null) || (modifiers.isEmpty),
    );
    assert(
      (orderOfModifiers?.isEmpty ?? true) || (modifiers.isEmpty),
    );

    if (mix != null && orderOfModifiers != null) {
      return deprecatedBuild();
    }

    var current = child;

    for (final spec in modifiers) {
      current = spec.build(current);
    }

    return current;
  }
}

class RenderAnimatedModifiers extends ImplicitlyAnimatedWidget {
  const RenderAnimatedModifiers({
    //TODO Should be required in the next version
    this.modifiers = const {},
    required this.child,
    required super.duration,
    @Deprecated("Use modifiers parameter") this.mix,
    @Deprecated("Use modifiers parameter")
    this.orderOfModifiers = const <Type>[],
    super.key,
    super.curve = Curves.linear,
    super.onEnd,
  });

  final Widget child;
  final MixData? mix;
  final List<Type>? orderOfModifiers;
  final Set<WidgetModifierSpec<dynamic>> modifiers;

  @override
  RenderAnimatedModifiersState createState() => RenderAnimatedModifiersState();
}

class RenderAnimatedModifiersState
    extends AnimatedWidgetBaseState<RenderAnimatedModifiers> {
  final Map<Type, ModifierSpecTween> _specs = {};

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    if (widget.mix != null && widget.orderOfModifiers != null) {
      deprecatedForEachTween(visitor);
    }

    for (final spec in widget.modifiers) {
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

  @Deprecated('should be deleted in the next major version')
  void deprecatedForEachTween(TweenVisitor<dynamic> visitor) {
    final specs = resolveModifierSpecs(widget.orderOfModifiers!, widget.mix!);

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
    assert(
      (widget.mix == null) || (widget.modifiers.isEmpty),
    );
    assert(
      (widget.orderOfModifiers?.isEmpty ?? true) || (widget.modifiers.isEmpty),
    );

    var current = widget.child;

    for (final spec in _specs.keys) {
      final evaluatedSpec = _specs[spec]!.evaluate(animation);
      current = evaluatedSpec.build(current);
    }

    return current;
  }
}

Set<WidgetModifierSpec<dynamic>> orderSpecs(
  List<Type> orderOfModifiers, [
  Set<WidgetModifierSpec<dynamic>> modifiers = const {},
]) {
  final listOfModifiers = ({
    // Prioritize the order of modifiers provided by the user.
    ...orderOfModifiers,
    // Add the default order of modifiers.
    ..._defaultSpecsOrder,
    // Add any remaining modifiers that were not included in the order.
    ...modifiers.map((e) => e.type),
  }).toList();

  final specs = <WidgetModifierSpec<dynamic>>{};

  for (final modifierType in listOfModifiers) {
    // Resolve the modifier and add it to the list of specs.
    final modifier = modifiers.where((e) => e.type == modifierType).firstOrNull;
    if (modifier == null) continue;
    specs.add(modifier as WidgetModifierSpec<WidgetModifierSpec<dynamic>>);
  }

  return specs;
}

Set<WidgetModifierSpec<dynamic>> resolveModifierSpecs(
  List<Type> orderOfModifiers,
  MixData mix,
) {
  final modifiers = mix.whereType<WidgetModifierAttribute>();

  if (modifiers.isEmpty) return {};
  final orderedModifiers = orderModifierSpecs(orderOfModifiers, modifiers);

  return orderedModifiers.map((e) => e.resolve(mix)).toSet();
}

Iterable<WidgetModifierAttribute> orderModifierSpecs(
  List<Type> orderOfModifiers,
  Iterable<WidgetModifierAttribute> modifiers,
) {
  final modifierMap = AttributeMap<WidgetModifierAttribute>(modifiers).toMap();

  final listOfModifiers = {
    // Prioritize the order of modifiers provided by the user.
    ...orderOfModifiers,
    // Add the default order of modifiers.
    ..._defaultOrder,
    // Add any remaining modifiers that were not included in the order.
    ...modifierMap.keys,
  }.toList().reversed;

  final specs = <WidgetModifierAttribute>[];

  for (final modifierType in listOfModifiers) {
    // Resolve the modifier and add it to the list of specs.
    final modifier = modifierMap.remove(modifierType);
    if (modifier == null) continue;
    specs.add(modifier);
  }

  return specs;
}

class RenderSpecModifiers extends StatelessWidget {
  const RenderSpecModifiers({
    required this.orderOfModifiers,
    required this.child,
    required this.spec,
    super.key,
  });

  final Widget child;
  final List<Type> orderOfModifiers;
  final Spec spec;

  @override
  Widget build(BuildContext context) {
    return spec.isAnimated
        ? RenderAnimatedModifiers(
            modifiers: orderSpecs(
              orderOfModifiers,
              spec.modifiers?.value.toSet() ?? {},
            ),
            duration: spec.animated!.duration,
            curve: spec.animated!.curve,
            child: child,
          )
        : RenderModifiers(
            modifiers: orderSpecs(
              orderOfModifiers,
              spec.modifiers?.value.toSet() ?? {},
            ),
            child: child,
          );
  }
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
