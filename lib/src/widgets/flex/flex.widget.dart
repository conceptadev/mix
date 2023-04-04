import 'package:flutter/widgets.dart';

import '../box/box.widget.dart';
import '../gap/gap_widget.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import 'flex.descriptor.dart';

class FlexBox extends MixWidget {
  const FlexBox({
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.key,
    super.variants,
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

      if (idx != children.length - 1) {
        widgets.add(Gap(gapSize));
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return MixBuilder(
      style: style,
      variants: variants,
      builder: (mix) {
        final flex = FlexDescriptor.fromContext(mix);

        return BoxMixedWidget(
          mix: mix,
          child: Flex(
            direction: direction,
            mainAxisAlignment: flex.mainAxisAlignment,
            crossAxisAlignment: flex.crossAxisAlignment,
            mainAxisSize: flex.mainAxisSize,
            verticalDirection: flex.verticalDirection,
            children: _renderChildrenWithGap(
              flex.gapSize,
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
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.variants,
    super.key,
    List<Widget> children = const <Widget>[],
  }) : super(
          direction: Axis.horizontal,
          children: children,
        );
}

class VBox extends FlexBox {
  const VBox({
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.variants,
    super.key,
    List<Widget> children = const <Widget>[],
  }) : super(
          children: children,
          direction: Axis.vertical,
        );
}
