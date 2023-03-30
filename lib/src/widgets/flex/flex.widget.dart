import 'package:flutter/widgets.dart';

import '../../attributes/common/common.descriptor.dart';
import '../box/box.descriptor.dart';
import '../box/box.widget.dart';
import '../gap/gap_widget.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import 'flex.descriptor.dart';

class FlexBox extends MixWidget {
  const FlexBox({
    super.mix,
    super.key,
    super.variants,
    super.inherit,
    required this.direction,
    required this.children,
  });

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
        widgets.add(Gap(gapSize));
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
    super.mix,
    super.variants,
    super.key,
    super.inherit,
    List<Widget> children = const <Widget>[],
  }) : super(
          direction: Axis.horizontal,
          children: children,
        );
}

class VBox extends FlexBox {
  const VBox({
    super.mix,
    super.variants,
    super.key,
    super.inherit,
    List<Widget> children = const <Widget>[],
  }) : super(
          children: children,
          direction: Axis.vertical,
        );
}
