import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import '../../mixer/mix_context.dart';
import '../../mixer/mix_factory.dart';
import '../../variants/variants.dart';
import '../box/box.widget.dart';
import '../gap.widget.dart';
import '../mixable.widget.dart';

/// _Mix_ corollary to Flutter _Flex_ widget
/// Use wherever you would use a Flutter _Text_ widget
///
/// ## Attributes
/// - [FlexAttributes](FlexAttributes-class.html)
/// - [SharedAttributes](SharedAttributes-class.html)
/// ## Utilities
/// - [FlexUtils](FlexUtils-class.html)
/// - [SharedUtils](SharedUtils-class.html)
///
/// {@category Mixable Widgets}
class FlexBox extends MixableWidget {
  const FlexBox({
    Mix? mix,
    Key? key,
    List<Variant>? variants,
    bool inherit = false,
    required this.direction,
    required this.children,
  }) : super(
          mix,
          variants: variants,
          inherit: inherit,
          key: key,
        );

  final List<Widget> children;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return FlexBoxMixedWidget(
      createMixContext(context),
      direction: direction,
      children: children,
    );
  }
}

/// @nodoc
class FlexBoxMixedWidget extends MixedWidget {
  const FlexBoxMixedWidget(
    MixContext mixContext, {
    Key? key,
    required this.direction,
    required this.children,
  }) : super(mixContext, key: key);

  final List<Widget> children;
  final Axis direction;

  // Creates gap to space in between
  List<Widget> _renderChildrenWithGap(double? gapSize, List<Widget> children) {
    // If no gap is set return widgets
    if (gapSize == null) return children;

    // List of widgets with gap
    final widgets = <Widget>[];
    for (var idx = 0; idx < children.length; idx++) {
      final widget = children[idx];
      widgets.add(widget);
      // Add gap if not last item if its not last element

      if (widget != children.last) {
        widgets.add(GapWidget(gapSize));
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final props = mixContext.flexProps;

    return BoxMixedWidget(
      mixContext,
      child: Flex(
        direction: direction,
        mainAxisAlignment: props.mainAxisAlignment,
        crossAxisAlignment: props.crossAxisAlignment,
        mainAxisSize: props.mainAxisSize,
        verticalDirection: props.verticalDirection,
        children: _renderChildrenWithGap(props.gapSize, children),
      ),
    );
  }
}

/// Horizontal FlexBox, corollary to Flutter _Row_ widget
///
/// See [FlexBox](FlexBox-class.html) for _Attributes_ and _Utility links.
///
/// {@category Mixable Widgets}
class HBox extends FlexBox {
  const HBox({
    Mix? mix,
    List<Variant>? variants,
    Key? key,
    bool inherit = false,
    List<Widget> children = const <Widget>[],
  }) : super(
          mix: mix,
          key: key,
          variants: variants,
          children: children,
          inherit: inherit,
          direction: Axis.horizontal,
        );
}

/// Vertical FlexBox, corollary to Flutter _Column_ widget
///
/// See [FlexBox](FlexBox-class.html) for _Attributes_ and _Utility links.
///
/// {@category Mixable Widgets}
class VBox extends FlexBox {
  const VBox({
    Mix? mix,
    List<Variant>? variants,
    Key? key,
    bool inherit = false,
    List<Widget> children = const <Widget>[],
  }) : super(
          mix: mix,
          variants: variants,
          key: key,
          inherit: inherit,
          children: children,
          direction: Axis.vertical,
        );
}
