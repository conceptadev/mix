import 'package:flutter/widgets.dart';

import '../../../mixer/mix_factory.dart';
import '../../../mixer/mixer.dart';
import '../../../widgets/gap_widget.dart';
import '../../../widgets/mix_widget.dart';
import '../box/box.widget.dart';

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
    final mixer = Mixer.build(context, mix);
    return FlexBoxMixerWidget(
      mixer,
      direction: direction,
      children: children,
    );
  }
}

class FlexBoxMixerWidget extends MixerWidget {
  const FlexBoxMixerWidget(
    Mixer mixer, {
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
    final mainAxis = flexProps.mainAxisAlignment ?? MainAxisAlignment.start;
    final crossAxis = flexProps.crossAxisAlignment ?? CrossAxisAlignment.center;
    final mainAxisSize = flexProps.mainAxisSize ?? MainAxisSize.max;
    final vDirection = flexProps.verticalDirection ?? VerticalDirection.down;
    final gapSize = flexProps.gapSize;

    return BoxMixerWidget(
      recipe,
      child: Flex(
        direction: direction,
        mainAxisAlignment: mainAxis,
        crossAxisAlignment: crossAxis,
        mainAxisSize: mainAxisSize,
        verticalDirection: vDirection,
        children: _renderChildrenWithGap(gapSize, children),
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
