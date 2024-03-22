import 'package:flutter/widgets.dart';

import '../../core/styled_widget.dart';
import '../../factory/mix_provider_data.dart';
import '../container/box_widget.dart';
import 'stack_spec.dart';

/// [StyledStack] - A styled widget that creates a stack layout with a mix of styles.
///
/// This widget extends [StyledWidget] and is designed to arrange its [children] in a stack,
/// applying the styles defined in a `Style`. It is useful when you need to layer widgets
/// on top of each other and control their styling in a unified manner.
///
/// Parameters:
///   - [children]: The list of widgets to stack on top of each other.
///   - [inherit]: Determines whether the [StyledStack] should inherit styles from its ancestors.
///     Inherits from [StyledWidget].
///   - [key]: The key for the widget. Inherits from [StyledWidget].
///   - [style]: The [Style] to be applied. Inherits from [StyledWidget].
class StyledStack extends StyledWidget {
  const StyledStack({
    this.children = const <Widget>[],
    super.inherit,
    super.key,
    super.style,
    super.orderOfDecorators = const [],
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // The withMix method applies the current styling context and creates a MixedStack.
    return withMix(context, (mix) {
      return MixedStack(mix: mix, children: children);
    });
  }
}

/// [MixedStack] - A StatelessWidget that applies a given [MixData] to a Stack.
///
/// This widget is used to render a stack layout with the styling attributes defined in the `MixData`.
/// It is particularly useful for creating layered UIs where each layer's position and styling
/// can be controlled through a `Style`.
///
/// Parameters:
///   - [mix]: The `MixData` representing the current styling context.
///   - [key]: The key for the widget.
///   - [children]: The list of widgets to stack.
class MixedStack extends StatelessWidget {
  const MixedStack({required this.mix, super.key, this.children});

  final List<Widget>? children;
  final MixData mix;

  @override
  Widget build(BuildContext context) {
    // Resolve the StackSpecAttribute from the mix to apply specific stack-related styles.
    final spec = StackSpec.of(mix);

    // The Stack widget is used here, applying the resolved styles from StackSpec.
    return Stack(
      alignment: spec.alignment ?? _defaultStack.alignment,
      textDirection: spec.textDirection,
      fit: spec.fit ?? _defaultStack.fit,
      clipBehavior: spec.clipBehavior ?? _defaultStack.clipBehavior,
      children: children ?? const [],
    );
  }
}

/// [ZBox] - A styled widget that combines the functionalities of [Box] and [StyledStack].
///
/// This widget is designed to apply a `Style` to a stack layout, making it a combination
/// of a box and a stack. It is ideal for scenarios where you need to create a stacked layout
/// with specific styling and alignment, encapsulated within a box-like structure.
///
/// Parameters:
///   - [children]: The list of widgets to stack and style.
///   - [inherit]: Determines whether the [ZBox] should inherit styles from its ancestors.
///     Inherits from [StyledWidget].
///   - [key]: The key for the widget. Inherits from [StyledWidget].
///   - [style]: The [Style] to be applied. Inherits from [StyledWidget].
class ZBox extends StyledWidget {
  const ZBox({
    this.children = const <Widget>[],
    super.inherit,
    super.key,
    super.style,
    super.orderOfDecorators = const [],
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // The withMix method is used to apply the styling context to both the box and the stack.
    return withMix(context, (mix) {
      return MixedBox(
        mix: mix,
        child: MixedStack(mix: mix.toInheritable(), children: children),
      );
    });
  }
}

// Default Stack used as a fallback
// for styling properties in MixedStack.

// TODO: This is a temporary solution to avoid errors with more recent versions of Flutter.
// ignore: prefer_const_constructors
final _defaultStack = Stack();
