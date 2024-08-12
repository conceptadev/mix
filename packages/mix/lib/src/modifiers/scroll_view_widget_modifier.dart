import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'scroll_view_widget_modifier.g.dart';

@MixableSpec(skipUtility: true, withLerp: false)
final class ScrollViewModifierSpec
    extends WidgetModifierSpec<ScrollViewModifierSpec>
    with _$ScrollViewModifierSpec, Diagnosticable {
  final Axis? scrollDirection;
  final bool? reverse;
  final EdgeInsetsGeometry? padding;
  final bool? primary;
  final ScrollPhysics? physics;
  final Clip? clipBehavior;

  ScrollViewModifierSpec({
    this.scrollDirection,
    this.reverse,
    this.padding,
    this.primary,
    this.physics,
    this.clipBehavior,
  });

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }

  @override
  Widget build(Widget child) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection ?? Axis.vertical,
      reverse: reverse ?? false,
      padding: padding,
      primary: primary,
      physics: physics,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      child: child,
    );
  }
}

final class ScrollViewModifierSpecUtility<T extends Attribute>
    extends MixUtility<T, ScrollViewModifierSpecAttribute> {
  ScrollViewModifierSpecUtility(super.builder);

  /// Set the scroll direction of the scroll view.
  T direction(Axis axis) => call(scrollDirection: axis);

  /// Set the scroll direction of the scroll view to horizontal.
  T horizontal() => call(scrollDirection: Axis.horizontal);

  /// Set the scroll direction of the scroll view to vertical.
  T vertical() => call(scrollDirection: Axis.vertical);

  /// Make the scroll view reverse or not.
  T reverse([bool reverse = true]) => call(reverse: reverse);

  /// Set the padding of the scroll view.
  SpacingUtility<T> get padding =>
      SpacingUtility((padding) => call(padding: padding));

  /// Mark the scroll view as primary or not.
  T primary([bool primary = true]) => call(primary: primary);

  /// Set the physics of the scroll view.
  T physics(ScrollPhysics physics) => call(physics: physics);

  /// Disable the scroll physics of the scroll view.
  T neverScrollableScrollPhysics() => physics(NeverScrollableScrollPhysics());

  /// Set the iOS-style scroll physics of the scroll view.
  T bouncingScrollPhysics() => physics(BouncingScrollPhysics());

  /// Set the Android-style scroll physics of the scroll view.
  T clampingScrollPhysics() => physics(ClampingScrollPhysics());

  /// Set the clip behavior of the scroll view.
  late final clipBehavior = ClipUtility((clip) => call(clipBehavior: clip));

  T call({
    Axis? scrollDirection,
    bool? reverse,
    SpacingDto? padding,
    bool? primary,
    ScrollPhysics? physics,
    Clip? clipBehavior,
  }) =>
      builder(
        ScrollViewModifierSpecAttribute(
          scrollDirection: scrollDirection,
          reverse: reverse,
          padding: padding,
          primary: primary,
          physics: physics,
          clipBehavior: clipBehavior,
        ),
      );
}
