import 'package:flutter/widgets.dart';

import '../../attributes/common/common.descriptor.dart';
import '../../mixer/mix_factory.dart';
import '../../variants/variant.dart';
import '../box/box.descriptor.dart';
import '../box/box.widget.dart';
import '../gap.widget.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import 'flex.descriptor.dart';

class FlexBox extends MixWidget {
  const FlexBox({
    Mix? mix,
    Key? key,
    List<Variant>? variants,
    bool? inherit,
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
    return MixContextBuilder(
      mix: mix,
      inherit: inherit,
      variants: variants,
      builder: (context, mixContext) {
        final flexProps = FlexDescriptor.fromContext(context);
        final boxProps = BoxDescriptor.fromContext(context);
        final commonProps = CommonDescriptor.fromContext(context);

        return BoxMixedWidget(
          boxProps: boxProps,
          commonProps: commonProps,
          child: Flex(
            direction: direction,
            mainAxisAlignment: flexProps.mainAxisAlignment,
            crossAxisAlignment: flexProps.crossAxisAlignment,
            mainAxisSize: flexProps.mainAxisSize,
            verticalDirection: flexProps.verticalDirection,
            children: _renderChildrenWithGap(
              flexProps.gapSize,
              children,
            ),
          ),
        );
      },
    );
  }
}

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
