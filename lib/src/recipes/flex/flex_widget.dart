import 'package:flutter/widgets.dart';

import '../../helpers/build_context_ext.dart';
import '../../widgets/gap_widget.dart';
import '../../widgets/styled_widget.dart';
import '../container/container_widget.dart';
import 'flex_attribute.dart';
import 'flex_mixture.dart';

/// A flexible layout widget enhanced with `StyleMix` for simplified styling.
///
/// `StyledFlex` extends the capabilities of the Flutter `Flex` widget by integrating
/// `StyleMix`, allowing for more streamlined styling. This widget is ideal for creating
/// flexible layouts (either rows or columns) with enhanced styling capabilities.
///
/// The `direction` parameter determines the layout orientation, while the `children`
/// parameter takes a list of widgets. The `StyleMix` integration allows for applying
/// consistent styles across all child widgets easily.
///
/// Example Usage:
/// ```dart
/// StyledFlex(
///   direction: Axis.horizontal,
///   style: yourStyleMix,
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
  });

  final List<Widget> children;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    final attribute = inherit
        ? context.mix?.attributeOf<FlexMixAttribute>() ??
            const FlexMixAttribute()
        : const FlexMixAttribute();

    return withMix(context, (mix) {
      final mixture =
          attribute.merge(mix.attributeOf<FlexMixAttribute>()).resolve(mix);

      List<Widget> renderSpacedChildren() {
        return mixture.gap == null
            ? children
            : List<Widget>.generate(
                children.length * 2 - 1,
                (index) =>
                    index % 2 == 0 ? children[index ~/ 2] : Gap(mixture.gap!),
              );
      }

      return MixedFlex(
        mixture,
        direction: direction,
        children: renderSpacedChildren(),
      );
    });
  }
}

class MixedFlex extends StatelessWidget {
  const MixedFlex(
    this.mixture, {
    super.key,
    required this.children,
    required this.direction,
  });

  final List<Widget> children;
  final Axis direction;
  final FlexMixture mixture;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      mainAxisAlignment:
          mixture.mainAxisAlignment ?? _defaultFlex.mainAxisAlignment,
      mainAxisSize: mixture.mainAxisSize ?? _defaultFlex.mainAxisSize,
      crossAxisAlignment:
          mixture.crossAxisAlignment ?? _defaultFlex.crossAxisAlignment,
      verticalDirection:
          mixture.verticalDirection ?? _defaultFlex.verticalDirection,
      children: children,
    );
  }
}

/// A horizontal layout widget leveraging `StyleMix` for advanced styling.
///
/// `StyledRow` is a specialized form of `StyledFlex` that defaults to a horizontal
/// direction (i.e., `Axis.horizontal`). It benefits from `StyleMix` integration,
/// enabling more efficient and consistent styling across its children.
///
/// Inherits all the styling and layout properties of `StyledFlex`, with a simplified
/// interface for horizontal layouts.
///
/// Example Usage:
/// ```dart
/// StyledRow(
///   style: yourStyleMix,
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

/// A vertical layout widget enhanced with `StyleMix` for easy styling.
///
/// `StyledColumn` is a vertical variant of `StyledFlex`, employing `StyleMix` for
/// an improved styling experience. It's designed for vertical arrangements of widgets,
/// providing a consistent and easy-to-manage styling approach.
///
/// Inherits the comprehensive styling capabilities of `StyledFlex`, tailored for
/// vertical layouts.
///
/// Example Usage:
/// ```dart
/// StyledColumn(
///   style: yourStyleMix,
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

/// A flex container widget with integrated `StyleMix` for enhanced styling.
///
/// `FlexBox` combines the features of `StyledContainer` and `StyledFlex`, offering
/// a powerful tool for creating flexible layouts with advanced styling capabilities
/// through `StyleMix`. It's perfect for designing complex layouts that require both
/// container and flex properties with uniform styling.
///
/// The `direction` parameter sets the layout's orientation, while the `StyleMix`
/// integration simplifies the process of applying consistent styles to all elements.
///
/// Example Usage:
/// ```dart
/// FlexBox(
///   direction: Axis.horizontal,
///   style: yourStyleMix,
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
  });

  final List<Widget> children;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (mix) {
      return StyledContainer(
        inherit: true,
        child: StyledFlex(
          inherit: true,
          direction: direction,
          children: children,
        ),
      );
    });
  }
}

/// A horizontal flex container with `StyleMix` for easy and consistent styling.
///
/// `HBox` is a specialized `FlexBox` designed for horizontal layouts, simplifying
/// the process of applying horizontal alignment with advanced styling via `StyleMix`.
/// It's an efficient way to achieve consistent styling in horizontal arrangements.
///
/// Inherits all functionalities of `FlexBox`, optimized for horizontal layouts.
///
/// Example Usage:
/// ```dart
/// HBox(
///   style: yourStyleMix,
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

/// A vertical flex container that uses `StyleMix` for streamlined styling.
///
/// `VBox` is a vertical counterpart to `HBox`, utilizing `StyleMix` for efficient
/// and consistent styling in vertical layouts. It offers an easy way to manage
/// vertical alignment and styling in a cohesive manner.
///
/// Inherits the comprehensive styling and layout capabilities of `FlexBox`, tailored
/// for vertical orientations.
///
/// Example Usage:
/// ```dart
/// VBox(
///   style: yourStyleMix,
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

const _defaultFlex = Flex(direction: Axis.horizontal, children: <Widget>[]);
