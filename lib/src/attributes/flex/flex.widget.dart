import 'package:flutter/widgets.dart';
import 'package:mix/src/attributes/box/box.widget.dart';

import '../../mixer/mix_factory.dart';
import '../../mixer/recipe_factory.dart';
import '../../widgets/helper_widgets.dart';
import '../../widgets/mix_widget.dart';

class FlexBox extends MixWidget {
  const FlexBox(
    Mix mix, {
    Key? key,
    required this.direction,
    required this.children,
  }) : super(mix, key: key);

  final List<Widget> children;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    final mixer = Recipe.build(context, mix);
    return FlexBoxMixerWidget(
      mixer,
      direction: direction,
      children: children,
    );
  }
}

class FlexBoxMixerWidget extends MixerWidget {
  const FlexBoxMixerWidget(
    Recipe mixer, {
    Key? key,
    required this.direction,
    required this.children,
  }) : super(mixer, key: key);

  final List<Widget> children;
  final Axis direction;

  // Creates gap to space in between
  List<Widget> renderChildrenWithGap(List<Widget> children) {
    // If no gap is set return widgets
    final gapSize = flexProps.gapSize;

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
    return BoxMixerWidget(
      recipe,
      child: Flex(
        direction: direction,
        mainAxisAlignment: flexProps.mainAxisAlignment,
        crossAxisAlignment: flexProps.crossAxisAlignment,
        mainAxisSize: flexProps.mainAxisSize,
        verticalDirection: flexProps.verticalDirection,
        children: renderChildrenWithGap(children),
      ),
    );
  }
}

class HBox extends FlexBox {
  const HBox(
    Mix mix, {
    Key? key,
    List<Widget> children = const <Widget>[],
  }) : super(
          mix,
          key: key,
          children: children,
          direction: Axis.horizontal,
        );
}

class VBox extends FlexBox {
  const VBox(
    Mix mix, {
    Key? key,
    List<Widget> children = const <Widget>[],
  }) : super(
          mix,
          key: key,
          children: children,
          direction: Axis.vertical,
        );
}
