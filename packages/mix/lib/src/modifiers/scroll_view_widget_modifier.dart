import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
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
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final DragStartBehavior? dragStartBehavior;
  final Clip? clipBehavior;
  final String? restorationId;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;

  ScrollViewModifierSpec({
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
      controller: controller,
      primary: primary,
      physics: physics,
      dragStartBehavior: dragStartBehavior ?? DragStartBehavior.start,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      restorationId: restorationId,
      keyboardDismissBehavior:
          keyboardDismissBehavior ?? ScrollViewKeyboardDismissBehavior.manual,
      child: child,
    );
  }
}

final class ScrollViewModifierSpecUtility<T extends Attribute>
    extends MixUtility<T, ScrollViewModifierSpecAttribute> {
  const ScrollViewModifierSpecUtility(super.builder);

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

  /// Set the controller of the scroll view.
  T controller(ScrollController controller) => call(controller: controller);

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

  /// Set the drag start behavior of the scroll view.
  T dragStartBehavior(DragStartBehavior dragStartBehavior) =>
      call(dragStartBehavior: dragStartBehavior);

  /// Set the clip behavior of the scroll view.
  T clipBehavior(Clip clipBehavior) => call(clipBehavior: clipBehavior);

  /// Set the restoration ID of the scroll view.
  T restorationId(String restorationId) => call(restorationId: restorationId);

  /// Set the keyboard dismiss behavior of the scroll view.
  T keyboardDismissBehavior(
          ScrollViewKeyboardDismissBehavior keyboardDismissBehavior) =>
      call(keyboardDismissBehavior: keyboardDismissBehavior);

  /// Make the scroll view dismiss the keyboard on drag.
  T keyboardDismissOnDrag() =>
      call(keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag);

  T call({
    Axis? scrollDirection,
    bool? reverse,
    SpacingDto? padding,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    DragStartBehavior? dragStartBehavior,
    Clip? clipBehavior,
    String? restorationId,
    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior,
  }) =>
      builder(
        ScrollViewModifierSpecAttribute(
          scrollDirection: scrollDirection,
          reverse: reverse,
          padding: padding,
          controller: controller,
          primary: primary,
          physics: physics,
          dragStartBehavior: dragStartBehavior,
          clipBehavior: clipBehavior,
          restorationId: restorationId,
          keyboardDismissBehavior: keyboardDismissBehavior,
        ),
      );
}
