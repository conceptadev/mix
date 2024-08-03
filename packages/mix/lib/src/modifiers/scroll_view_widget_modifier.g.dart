// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scroll_view_widget_modifier.dart';

// **************************************************************************
// MixableSpecGenerator
// **************************************************************************

mixin _$ScrollViewModifierSpec on WidgetModifierSpec<ScrollViewModifierSpec> {
  /// Creates a copy of this [ScrollViewModifierSpec] but with the given fields
  /// replaced with the new values.
  @override
  ScrollViewModifierSpec copyWith({
    Axis? scrollDirection,
    bool? reverse,
    EdgeInsetsGeometry? padding,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    DragStartBehavior? dragStartBehavior,
    Clip? clipBehavior,
    String? restorationId,
    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior,
  }) {
    return ScrollViewModifierSpec(
      scrollDirection: scrollDirection ?? _$this.scrollDirection,
      reverse: reverse ?? _$this.reverse,
      padding: padding ?? _$this.padding,
      controller: controller ?? _$this.controller,
      primary: primary ?? _$this.primary,
      physics: physics ?? _$this.physics,
      dragStartBehavior: dragStartBehavior ?? _$this.dragStartBehavior,
      clipBehavior: clipBehavior ?? _$this.clipBehavior,
      restorationId: restorationId ?? _$this.restorationId,
      keyboardDismissBehavior:
          keyboardDismissBehavior ?? _$this.keyboardDismissBehavior,
    );
  }

  /// Linearly interpolates between this [ScrollViewModifierSpec] and another [ScrollViewModifierSpec] based on the given parameter [t].
  ///
  /// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
  /// When [t] is 0.0, the current [ScrollViewModifierSpec] is returned. When [t] is 1.0, the [other] [ScrollViewModifierSpec] is returned.
  /// For values of [t] between 0.0 and 1.0, an interpolated [ScrollViewModifierSpec] is returned.
  ///
  /// If [other] is null, this method returns the current [ScrollViewModifierSpec] instance.
  ///
  /// The interpolation is performed on each property of the [ScrollViewModifierSpec] using the appropriate
  /// interpolation method:
  ///
  /// - [EdgeInsetsGeometry.lerp] for [padding].

  /// For [scrollDirection] and [reverse] and [controller] and [primary] and [physics] and [dragStartBehavior] and [clipBehavior] and [restorationId] and [keyboardDismissBehavior], the interpolation is performed using a step function.
  /// If [t] is less than 0.5, the value from the current [ScrollViewModifierSpec] is used. Otherwise, the value
  /// from the [other] [ScrollViewModifierSpec] is used.
  ///
  /// This method is typically used in animations to smoothly transition between
  /// different [ScrollViewModifierSpec] configurations.
  @override
  ScrollViewModifierSpec lerp(ScrollViewModifierSpec? other, double t) {
    if (other == null) return _$this;

    return ScrollViewModifierSpec(
      scrollDirection: t < 0.5 ? _$this.scrollDirection : other.scrollDirection,
      reverse: t < 0.5 ? _$this.reverse : other.reverse,
      padding: EdgeInsetsGeometry.lerp(_$this.padding, other.padding, t),
      controller: t < 0.5 ? _$this.controller : other.controller,
      primary: t < 0.5 ? _$this.primary : other.primary,
      physics: t < 0.5 ? _$this.physics : other.physics,
      dragStartBehavior:
          t < 0.5 ? _$this.dragStartBehavior : other.dragStartBehavior,
      clipBehavior: t < 0.5 ? _$this.clipBehavior : other.clipBehavior,
      restorationId: t < 0.5 ? _$this.restorationId : other.restorationId,
      keyboardDismissBehavior: t < 0.5
          ? _$this.keyboardDismissBehavior
          : other.keyboardDismissBehavior,
    );
  }

  /// The list of properties that constitute the state of this [ScrollViewModifierSpec].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ScrollViewModifierSpec] instances for equality.
  @override
  List<Object?> get props => [
        _$this.scrollDirection,
        _$this.reverse,
        _$this.padding,
        _$this.controller,
        _$this.primary,
        _$this.physics,
        _$this.dragStartBehavior,
        _$this.clipBehavior,
        _$this.restorationId,
        _$this.keyboardDismissBehavior,
      ];

  ScrollViewModifierSpec get _$this => this as ScrollViewModifierSpec;

  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(DiagnosticsProperty(
        'scrollDirection', _$this.scrollDirection,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty('reverse', _$this.reverse, defaultValue: null));
    properties.add(
        DiagnosticsProperty('padding', _$this.padding, defaultValue: null));
    properties.add(DiagnosticsProperty('controller', _$this.controller,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty('primary', _$this.primary, defaultValue: null));
    properties.add(
        DiagnosticsProperty('physics', _$this.physics, defaultValue: null));
    properties.add(DiagnosticsProperty(
        'dragStartBehavior', _$this.dragStartBehavior,
        defaultValue: null));
    properties.add(DiagnosticsProperty('clipBehavior', _$this.clipBehavior,
        defaultValue: null));
    properties.add(DiagnosticsProperty('restorationId', _$this.restorationId,
        defaultValue: null));
    properties.add(DiagnosticsProperty(
        'keyboardDismissBehavior', _$this.keyboardDismissBehavior,
        defaultValue: null));
  }
}

/// Represents the attributes of a [ScrollViewModifierSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [ScrollViewModifierSpec].
///
/// Use this class to configure the attributes of a [ScrollViewModifierSpec] and pass it to
/// the [ScrollViewModifierSpec] constructor.
final class ScrollViewModifierSpecAttribute
    extends WidgetModifierSpecAttribute<ScrollViewModifierSpec>
    with Diagnosticable {
  final Axis? scrollDirection;
  final bool? reverse;
  final SpacingDto? padding;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final DragStartBehavior? dragStartBehavior;
  final Clip? clipBehavior;
  final String? restorationId;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;

  const ScrollViewModifierSpecAttribute({
    this.scrollDirection,
    this.reverse,
    this.padding,
    this.controller,
    this.primary,
    this.physics,
    this.dragStartBehavior,
    this.clipBehavior,
    this.restorationId,
    this.keyboardDismissBehavior,
  });

  /// Resolves to [ScrollViewModifierSpec] using the provided [MixData].
  ///
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `defaultValue` for that property.
  ///
  /// ```dart
  /// final scrollViewModifierSpec = ScrollViewModifierSpecAttribute(...).resolve(mix);
  /// ```
  @override
  ScrollViewModifierSpec resolve(MixData mix) {
    return ScrollViewModifierSpec(
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding?.resolve(mix),
      controller: controller,
      primary: primary,
      physics: physics,
      dragStartBehavior: dragStartBehavior,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      keyboardDismissBehavior: keyboardDismissBehavior,
    );
  }

  /// Merges the properties of this [ScrollViewModifierSpecAttribute] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [ScrollViewModifierSpecAttribute] with the properties of [other] taking precedence over
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  ScrollViewModifierSpecAttribute merge(
      ScrollViewModifierSpecAttribute? other) {
    if (other == null) return this;

    return ScrollViewModifierSpecAttribute(
      scrollDirection: other.scrollDirection ?? scrollDirection,
      reverse: other.reverse ?? reverse,
      padding: padding?.merge(other.padding) ?? other.padding,
      controller: other.controller ?? controller,
      primary: other.primary ?? primary,
      physics: other.physics ?? physics,
      dragStartBehavior: other.dragStartBehavior ?? dragStartBehavior,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      restorationId: other.restorationId ?? restorationId,
      keyboardDismissBehavior:
          other.keyboardDismissBehavior ?? keyboardDismissBehavior,
    );
  }

  /// The list of properties that constitute the state of this [ScrollViewModifierSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [ScrollViewModifierSpecAttribute] instances for equality.
  @override
  List<Object?> get props => [
        scrollDirection,
        reverse,
        padding,
        controller,
        primary,
        physics,
        dragStartBehavior,
        clipBehavior,
        restorationId,
        keyboardDismissBehavior,
      ];

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('scrollDirection', scrollDirection,
        defaultValue: null));
    properties.add(DiagnosticsProperty('reverse', reverse, defaultValue: null));
    properties.add(DiagnosticsProperty('padding', padding, defaultValue: null));
    properties
        .add(DiagnosticsProperty('controller', controller, defaultValue: null));
    properties.add(DiagnosticsProperty('primary', primary, defaultValue: null));
    properties.add(DiagnosticsProperty('physics', physics, defaultValue: null));
    properties.add(DiagnosticsProperty('dragStartBehavior', dragStartBehavior,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty('clipBehavior', clipBehavior, defaultValue: null));
    properties.add(DiagnosticsProperty('restorationId', restorationId,
        defaultValue: null));
    properties.add(DiagnosticsProperty(
        'keyboardDismissBehavior', keyboardDismissBehavior,
        defaultValue: null));
  }
}

/// A tween that interpolates between two [ScrollViewModifierSpec] instances.
///
/// This class can be used in animations to smoothly transition between
/// different [ScrollViewModifierSpec] specifications.
class ScrollViewModifierSpecTween extends Tween<ScrollViewModifierSpec?> {
  ScrollViewModifierSpecTween({
    super.begin,
    super.end,
  });

  @override
  ScrollViewModifierSpec lerp(double t) {
    if (begin == null && end == null) {
      return ScrollViewModifierSpec();
    }

    if (begin == null) {
      return end!;
    }

    return begin!.lerp(end!, t);
  }
}
