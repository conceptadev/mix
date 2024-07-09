// ignore_for_file: avoid-dynamic

import 'package:flutter/material.dart';

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

const _defaultOrder = [
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
    this.modifiers = const [],
    @Deprecated("Use modifiers parameter") this.mix,
    required this.orderOfModifiers,
    super.key,
  });

  final Widget child;
  final MixData? mix;
  final List<Type> orderOfModifiers;
  final List<WidgetModifierSpec<dynamic>> modifiers;

  @override
  Widget build(BuildContext context) {
    var current = child;

    final orderedSpecs = _combineModifiers(mix, modifiers, orderOfModifiers);

    for (final spec in orderedSpecs.reversed) {
      current = spec.build(current);
    }

    return current;
  }
}

class RenderAnimatedModifiers extends ImplicitlyAnimatedWidget {
  RenderAnimatedModifiers({
    //TODO Should be required in the next version
    this.modifiers = const [],
    required this.child,
    required super.duration,
    @Deprecated("Use modifiers parameter") this.mix,
    required this.orderOfModifiers,
    super.key,
    super.curve = Curves.linear,
    super.onEnd,
  }) : _appliedModifiers = _combineModifiers(mix, modifiers, orderOfModifiers);

  final Widget child;
  final MixData? mix;
  final List<Type> orderOfModifiers;
  final List<WidgetModifierSpec<dynamic>> modifiers;
  final List<WidgetModifierSpec<dynamic>> _appliedModifiers;

  @override
  RenderAnimatedModifiersState createState() => RenderAnimatedModifiersState();
}

class RenderAnimatedModifiersState
    extends AnimatedWidgetBaseState<RenderAnimatedModifiers> {
  final Map<Type, ModifierSpecTween> _specs = {};

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    for (final spec in widget._appliedModifiers.reversed) {
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

@visibleForTesting
List<WidgetModifierSpec<dynamic>> resolveModifierSpecs(
  List<Type> orderOfModifiers,
  MixData mix,
) {
  return orderModifiers(orderOfModifiers, mix.modifiers);
}

@visibleForTesting
List<WidgetModifierSpec<dynamic>> orderModifiers(
  List<Type> orderOfModifiers,
  List<WidgetModifierSpec<dynamic>> modifiers,
) {
  final listOfModifiers = ({
    // Prioritize the order of modifiers provided by the user.
    ...orderOfModifiers,
    // Add the default order of modifiers.
    ..._defaultOrder,
    // Add any remaining modifiers that were not included in the order.
    ...modifiers.map((e) => e.type),
  }).toList();

  final specs = <WidgetModifierSpec<dynamic>>[];

  for (final modifierType in listOfModifiers) {
    // Resolve the modifier and add it to the list of specs.
    final modifier = modifiers.where((e) => e.type == modifierType).firstOrNull;
    if (modifier == null) continue;
    // ignore: avoid-unnecessary-type-casts
    specs.add(modifier as WidgetModifierSpec<WidgetModifierSpec<dynamic>>);
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
    final modifiers = spec.modifiers?.value ?? [];

    return spec.isAnimated
        ? RenderAnimatedModifiers(
            modifiers: modifiers,
            duration: spec.animated!.duration,
            orderOfModifiers: orderOfModifiers,
            curve: spec.animated!.curve,
            child: child,
          )
        : RenderModifiers(
            modifiers: modifiers,
            orderOfModifiers: orderOfModifiers,
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

List<Type> _normalizeOrderedTypes(MixData? mix, List<Type>? orderedTypes) {
  orderedTypes ??= [];
  if (mix == null) return orderedTypes;

  final modifierAttributes = mix.whereType<WidgetModifierAttribute>();

  final specs = [...orderedTypes];

  for (int i = 0; i < orderedTypes.length; i++) {
    final type = orderedTypes[i];
    // Resolve the modifier and replace the attribute type with the spec type.
    final modifier =
        modifierAttributes.where((e) => e.runtimeType == type).firstOrNull;
    if (modifier != null) {
      specs[i] = modifier.resolve(mix).runtimeType;
    }
  }

  return specs;
}

List<WidgetModifierSpec<dynamic>> _combineModifiers(
  MixData? mix,
  List<WidgetModifierSpec<dynamic>> modifiers,
  List<Type> orderOfModifiers,
) {
  final normalizedModifiers = _normalizeOrderedTypes(mix, orderOfModifiers);

  final mergedModifiers = [...modifiers];

  if (mix != null) {
    mergedModifiers.addAll(mix.modifiers);
  }

  return orderModifiers(normalizedModifiers, mergedModifiers);
}
