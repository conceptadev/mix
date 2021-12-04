import 'package:flutter/widgets.dart';

import '../mixer/mix_context.dart';
import '../mixer/mix_factory.dart';
import 'box.widget.dart';
import 'gap.widget.dart';
import 'mix.widget.dart';

class FlexBox extends MixWidget {
  const FlexBox({
    Mix? mix,
    Key? key,
    required this.direction,
    required this.children,
  }) : super(mix, key: key);

  final List<Widget> children;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return FlexBoxMixerWidget(
      MixContext.create(context, mix),
      direction: direction,
      children: children,
    );
  }
}

class FlexBoxMixerWidget extends MixedWidget {
  const FlexBoxMixerWidget(
    MixContext mixer, {
    Key? key,
    required this.direction,
    required this.children,
  }) : super(mixer, key: key);

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
    return BoxMixedWidget(
      mixContext,
      child: Flex(
        direction: direction,
        mainAxisAlignment: flexMixer.mainAxisAlignment,
        crossAxisAlignment: flexMixer.crossAxisAlignment,
        mainAxisSize: flexMixer.mainAxisSize,
        verticalDirection: flexMixer.verticalDirection,
        children: _renderChildrenWithGap(flexMixer.gapSize, children),
      ),
    );
  }
}

class HBox extends FlexBox {
  const HBox({
    Mix? mix,
    Key? key,
    List<Widget> children = const <Widget>[],
  }) : super(
          mix: mix,
          key: key,
          children: children,
          direction: Axis.horizontal,
        );
}

class VBox extends FlexBox {
  const VBox({
    Mix? mix,
    Key? key,
    List<Widget> children = const <Widget>[],
  }) : super(
          mix: mix,
          key: key,
          children: children,
          direction: Axis.vertical,
        );
}
