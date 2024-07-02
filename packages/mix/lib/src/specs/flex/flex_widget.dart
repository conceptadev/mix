// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';

import '../../core/styled_widget.dart';
import '../box/box_spec.dart';
import '../box/box_widget.dart';
import 'flex_spec.dart';

/// A flexible layout widget enhanced with `Style` for simplified styling.
///
/// `StyledFlex` extends the capabilities of the Flutter `Flex` widget by integrating
/// `Style`, allowing for more streamlined styling. This widget is ideal for creating
/// flexible layouts (either rows or columns) with enhanced styling capabilities.
///
/// The `direction` parameter determines the layout orientation, while the `children`
/// parameter takes a list of widgets. The `Style` integration allows for applying
/// consistent styles across all child widgets easily.
///
/// Example Usage:
/// ```dart
/// StyledFlex(
///   direction: Axis.horizontal,
///   style: yourStyle,
///   children: [Widget1(), Widget2(), Widget3()],
/// );
/// ```
class StyledFlex extends StyledWidget {
  const StyledFlex({
    super.style,
    super.key,
    super.inherit,
    required this.direction,
    this.children = const <Widget>[],
    super.orderOfModifiers = const [],
  });

  final List<Widget> children;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (context) {
      final spec = FlexSpec.of(context);

      return FlexSpecWidget(
        spec: spec,
        direction: direction,
        children: children,
      );
    });
  }
}

class FlexSpecWidget extends StatelessWidget {
  const FlexSpecWidget({
    super.key,
    this.spec,
    required this.children,
    required this.direction,
  });

  final List<Widget> children;
  final Axis direction;
  final FlexSpec? spec;

  List<Widget> _buildChildren(double? gap) {
    if (gap == null) return children;

    return List.generate(children.length + children.length - 1, (index) {
      if (index.isEven) return children[index ~/ 2];

      return direction == Axis.horizontal
          ? SizedBox(width: gap)
          : SizedBox(height: gap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final gap = spec?.gap;

    return Flex(
      direction: direction,
      mainAxisAlignment:
          spec?.mainAxisAlignment ?? _defaultFlex.mainAxisAlignment,
      mainAxisSize: spec?.mainAxisSize ?? _defaultFlex.mainAxisSize,
      crossAxisAlignment:
          spec?.crossAxisAlignment ?? _defaultFlex.crossAxisAlignment,
      verticalDirection:
          spec?.verticalDirection ?? _defaultFlex.verticalDirection,
      children: _buildChildren(gap),
    );
  }
}

/// A horizontal layout widget leveraging `Style` for advanced styling.
///
/// `StyledRow` is a specialized form of `StyledFlex` that defaults to a horizontal
/// direction (i.e., `Axis.horizontal`). It benefits from `Style` integration,
/// enabling more efficient and consistent styling across its children.
///
/// Inherits all the styling and layout properties of `StyledFlex`, with a simplified
/// interface for horizontal layouts.
///
/// Example Usage:
/// ```dart
/// StyledRow(
///   style: yourStyle,
///   children: [Widget1(), Widget2()],
/// );
/// ```
class StyledRow extends StyledFlex {
  const StyledRow({
    super.style,
    super.key,
    super.inherit,
    required super.children,
  }) : super(direction: Axis.horizontal);
}

/// A vertical layout widget enhanced with `Style` for easy styling.
///
/// `StyledColumn` is a vertical variant of `StyledFlex`, employing `Style` for
/// an improved styling experience. It's designed for vertical arrangements of widgets,
/// providing a consistent and easy-to-manage styling approach.
///
/// Inherits the comprehensive styling capabilities of `StyledFlex`, tailored for
/// vertical layouts.
///
/// Example Usage:
/// ```dart
/// StyledColumn(
///   style: yourStyle,
///   children: [Widget1(), Widget2()],
/// );
/// ```
class StyledColumn extends StyledFlex {
  const StyledColumn({
    super.style,
    super.key,
    super.inherit,
    super.children,
  }) : super(direction: Axis.vertical);
}

/// A flex container widget with integrated `Style` for enhanced styling.
///
/// `FlexBox` combines the features of `StyledContainer` and `StyledFlex`, offering
/// a powerful tool for creating flexible layouts with advanced styling capabilities
/// through `Style`. It's perfect for designing complex layouts that require both
/// container and flex properties with uniform styling.
///
/// The `direction` parameter sets the layout's orientation, while the `Style`
/// integration simplifies the process of applying consistent styles to all elements.
///
/// Example Usage:
/// ```dart
/// FlexBox(
///   direction: Axis.horizontal,
///   style: yourStyle,
///   children: [Widget1(), Widget2()],
/// );
/// ```
class FlexBox extends StyledWidget {
  const FlexBox({
    super.style,
    super.key,
    super.inherit,
    required this.direction,
    required this.children,
    super.orderOfModifiers = const [],
  });

  final List<Widget> children;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (mix) {
      final box = BoxSpec.of(mix);
      final flex = FlexSpec.of(mix);

      return BoxSpecWidget(
        spec: box,
        child: FlexSpecWidget(
          spec: flex,
          direction: direction,
          children: children,
        ),
      );
    });
  }
}

/// A horizontal flex container with `Style` for easy and consistent styling.
///
/// `HBox` is a specialized `FlexBox` designed for horizontal layouts, simplifying
/// the process of applying horizontal alignment with advanced styling via `Style`.
/// It's an efficient way to achieve consistent styling in horizontal arrangements.
///
/// Inherits all functionalities of `FlexBox`, optimized for horizontal layouts.
///
/// Example Usage:
/// ```dart
/// HBox(
///   style: yourStyle,
///   children: [Widget1(), Widget2()],
/// );
/// ```
class HBox extends FlexBox {
  const HBox({
    super.style,
    super.key,
    super.inherit,
    super.children = const <Widget>[],
  }) : super(direction: Axis.horizontal);
}

/// A vertical flex container that uses `Style` for streamlined styling.
///
/// `VBox` is a vertical counterpart to `HBox`, utilizing `Style` for efficient
/// and consistent styling in vertical layouts. It offers an easy way to manage
/// vertical alignment and styling in a cohesive manner.
///
/// Inherits the comprehensive styling and layout capabilities of `FlexBox`, tailored
/// for vertical orientations.
///
/// Example Usage:
/// ```dart
/// VBox(
///   style: yourStyle,
///   children: [Widget1(), Widget2()],
/// );
/// ```
class VBox extends FlexBox {
  const VBox({
    super.style,
    super.key,
    super.inherit,
    super.children = const <Widget>[],
  }) : super(direction: Axis.vertical);
}

final _defaultFlex = Flex(direction: Axis.horizontal, children: const []);
