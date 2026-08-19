import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' as r;
import 'package:flutter/widgets.dart' as w;
import 'package:mix_core/mix_core.dart' as core;
import 'package:mix_core/mix_core.dart' show DeepCollectionEquality, Mixable;

import '../animation/animation_config.dart';
import '../modifiers/widget_modifier_config.dart';
import 'prop.dart';
import 'spec.dart';
import 'style.dart';
import 'style_spec.dart';
import 'widget_modifier.dart';

// Prop-level operations (directive merge/apply, context-aware Mix merging)
// live in package:mix_core.
export 'package:mix_core/mix_core.dart' show PropOps;

/// Core operations for Mix framework value transformations.
///
/// Provides value resolution, merging, and interpolation operations
/// used throughout the Mix styling system.
class MixOps {
  static const deepEquality = DeepCollectionEquality();

  static const lerp = _lerpValue;

  static const lerpSnap = _lerpSnap;

  static const mergeList = _mergeList;

  const MixOps._();

  static List<V>? resolveList<V>(BuildContext context, Prop<List<V>>? prop) {
    return resolve(context, prop);
  }

  static V? resolve<V>(BuildContext context, Prop<V>? prop) {
    if (prop == null) return null;

    return prop.resolveProp(context);
  }

  static P? merge<P extends Prop<V>, V>(P? a, P? b) {
    if (a == null) return b;
    if (b == null) return a;

    return a.mergeProp(b) as P;
  }

  static AnimationConfig? mergeAnimation(
    AnimationConfig? current,
    AnimationConfig? other,
  ) {
    return other ?? current;
  }

  static WidgetModifierConfig? mergeModifier(
    WidgetModifierConfig? current,
    WidgetModifierConfig? other,
  ) {
    return current?.merge(other) ?? other;
  }

  static List<VariantStyle<S>>? mergeVariants<S extends Spec<S>>(
    List<VariantStyle<S>>? current,
    List<VariantStyle<S>>? other,
  ) {
    return core.mergeVariantLists<BuildContext, StyleSpec<S>, Style<S>>(
      current,
      other,
    );
  }

  static List<T>? _mergeList<T>(
    List<T>? a,
    List<T>? b, {

    /// Defaults to `replace`
    ListMergeStrategy? strategy,
  }) {
    if (b == null) return a;
    if (a == null) return b;

    if (a.isEmpty) return b;
    if (b.isEmpty) return a;

    strategy ??= .replace;

    switch (strategy) {
      case .append:
        return [...a, ...b];
      case .replace:
        final listLength = a.length;
        final otherLength = b.length;
        final maxLength = math.max(listLength, otherLength);

        return List.generate(maxLength, (int index) {
          if (index < listLength && index < otherLength) {
            final currentValue = a[index];
            final otherValue = b[index];

            if (currentValue is Mixable && otherValue is Mixable) {
              return currentValue.merge(otherValue) as T;
            }

            return otherValue ?? currentValue;
          } else if (index < listLength) {
            return a[index];
          }

          return b[index];
        });
      case .override:
        return b;
    }
  }

  static w.StrutStyle? _lerpStrutStyle(
    w.StrutStyle? a,
    w.StrutStyle? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return w.StrutStyle(
      fontFamily: t < 0.5 ? a.fontFamily : b.fontFamily,
      fontFamilyFallback: t < 0.5 ? a.fontFamilyFallback : b.fontFamilyFallback,
      fontSize: ui.lerpDouble(a.fontSize, b.fontSize, t),
      height: ui.lerpDouble(a.height, b.height, t),
      leadingDistribution: t < 0.5
          ? a.leadingDistribution
          : b.leadingDistribution,
      leading: ui.lerpDouble(a.leading, b.leading, t),
      fontWeight: r.FontWeight.lerp(a.fontWeight, b.fontWeight, t),
      fontStyle: t < 0.5 ? a.fontStyle : b.fontStyle,
      forceStrutHeight: t < 0.5 ? a.forceStrutHeight : b.forceStrutHeight,
      debugLabel: a.debugLabel ?? b.debugLabel,
    );
  }
}

/// Snap interpolation for non-lerpable types.
/// Returns [a] when t < 0.5, otherwise returns [b].
T? _lerpSnap<T>(T? a, T? b, double t) {
  return t < 0.5 ? a : b;
}

/// Lerp modifier lists using ModifierListTween
List<WidgetModifier>? _lerpModifierList(
  List<WidgetModifier>? a,
  List<WidgetModifier>? b,
  double t,
) {
  return ModifierListTween(begin: a, end: b).lerp(t);
}

Matrix4? _lerpMatrix4(Matrix4? a, Matrix4? b, double t) {
  if (a == null && b == null) return null;

  return Matrix4Tween(
    begin: a ?? Matrix4.identity(),
    end: b ?? Matrix4.identity(),
  ).lerp(t);
}

T? _lerpValue<T>(T? a, T? b, double t) {
  return switch ((a, b)) {
    (Spec? a, Spec? b) => a?.lerp(b, t) as T?,

    // Numeric types
    (int? a, int? b) => ui.lerpDouble(a, b, t)?.round() as T?,
    (double? a, double? b) => ui.lerpDouble(a, b, t) as T?,

    // Core Flutter geometry (dart:ui)
    (Offset? a, Offset? b) => Offset.lerp(a, b, t) as T?,
    (Size? a, Size? b) => Size.lerp(a, b, t) as T?,
    (Rect? a, Rect? b) => Rect.lerp(a, b, t) as T?,
    (RRect? a, RRect? b) => RRect.lerp(a, b, t) as T?,

    // Core Flutter color (dart:ui)
    (Color? a, Color? b) => Color.lerp(a, b, t) as T?,
    (HSVColor? a, HSVColor? b) => HSVColor.lerp(a, b, t) as T?,
    (HSLColor? a, HSLColor? b) => HSLColor.lerp(a, b, t) as T?,

    // Alignment - handle specific types first
    (FractionalOffset? a, FractionalOffset? b) =>
      FractionalOffset.lerp(a, b, t) as T?,
    (Alignment? a, Alignment? b) => Alignment.lerp(a, b, t) as T?,
    (AlignmentGeometry? a, AlignmentGeometry? b) =>
      AlignmentGeometry.lerp(a, b, t) as T?,

    // EdgeInsets - handle specific types first
    (Decoration? a, Decoration? b) => Decoration.lerp(a, b, t) as T?,
    (EdgeInsets? a, EdgeInsets? b) => EdgeInsets.lerp(a, b, t) as T?,
    (EdgeInsetsGeometry? a, EdgeInsetsGeometry? b) =>
      EdgeInsetsGeometry.lerp(a, b, t) as T?,

    // BorderRadius - handle specific types first
    (BorderRadius? a, BorderRadius? b) => BorderRadius.lerp(a, b, t) as T?,
    (BorderRadiusGeometry? a, BorderRadiusGeometry? b) =>
      BorderRadiusGeometry.lerp(a, b, t) as T?,

    // Relative positioning
    (RelativeRect? a, RelativeRect? b) => RelativeRect.lerp(a, b, t) as T?,

    (List<BoxShadow>? a, List<BoxShadow>? b) =>
      BoxShadow.lerpList(a, b, t) as T?,
    (List<Shadow>? a, List<Shadow>? b) => Shadow.lerpList(a, b, t) as T?,

    // Text painting
    (TextStyle? a, TextStyle? b) => TextStyle.lerp(a, b, t) as T?,
    (StrutStyle? a, StrutStyle? b) => MixOps._lerpStrutStyle(a, b, t) as T?,

    // Shadows
    (BoxShadow? a, BoxShadow? b) => BoxShadow.lerp(a, b, t) as T?,
    (Shadow? a, Shadow? b) => Shadow.lerp(a, b, t) as T?,

    // Borders and shapes
    (Border? a, Border? b) => Border.lerp(a, b, t) as T?,
    (ShapeBorder? a, ShapeBorder? b) => ShapeBorder.lerp(a, b, t) as T?,

    // Gradients
    (LinearGradient? a, LinearGradient? b) =>
      LinearGradient.lerp(a, b, t) as T?,
    (RadialGradient? a, RadialGradient? b) =>
      RadialGradient.lerp(a, b, t) as T?,
    (SweepGradient? a, SweepGradient? b) => SweepGradient.lerp(a, b, t) as T?,

    // Constraints
    (BoxConstraints? a, BoxConstraints? b) =>
      BoxConstraints.lerp(a, b, t) as T?,

    // Theme data
    (IconThemeData? a, IconThemeData? b) => IconThemeData.lerp(a, b, t) as T?,

    // Matrix4 - animate using identity as the implicit endpoint when null
    (Matrix4? a, Matrix4? b) => _lerpMatrix4(a, b, t) as T?,

    // List of Modifiers - use ModifierListTween for proper lerping
    (List<WidgetModifier>? a, List<WidgetModifier>? b) =>
      _lerpModifierList(a, b, t) as T?,

    // Default snap behavior for non-lerpable types
    _ => t < 0.5 ? a : b,
  };
}

/// Merge strategy for lists
enum ListMergeStrategy {
  /// Append items from other list (default)
  append,

  /// Replace items at same index
  replace,

  /// Override entire list
  override,
}
