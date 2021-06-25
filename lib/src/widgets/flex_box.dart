import 'package:flutter/widgets.dart';

import '../mixer/mix.dart';
import '../mixer/mixer.dart';
import 'box.dart';
import 'helper_widgets.dart';
import 'mix_widget.dart';

class FlexBox extends MixWidget {
  const FlexBox(
    Mix mix, {
    Key? key,
    required this.direction,
    required this.children,
  }) : super(mix, key: key);

  final List<Widget> children;
  final Axis direction;

  factory FlexBox.row(
    Mix mix, {
    Key? key,
    required List<Widget> children,
  }) {
    return FlexBox(
      mix,
      key: key,
      children: children,
      direction: Axis.horizontal,
    );
  }

  factory FlexBox.column(
    Mix mix, {
    Key? key,
    required List<Widget> children,
  }) {
    return FlexBox(
      mix,
      key: key,
      children: children,
      direction: Axis.vertical,
    );
  }
  @override
  Widget build(BuildContext context) {
    final mixer = Mixer.build(context, mix);
    return FlexBoxMixer(
      mixer,
      direction: direction,
      children: children,
    );
  }
}

class FlexBoxMixer extends MixerWidget {
  const FlexBoxMixer(
    Mixer mixer, {
    Key? key,
    required this.direction,
    required this.children,
  }) : super(mixer, key: key);

  final List<Widget> children;
  final Axis direction;

  // Creates gap to space in between
  List<Widget> renderChildrenWithGap(List<Widget> children) {
    // If no gap is set return widgets
    if (mixer.gap == null) return children;

    // List of widgets with gap
    final widgets = <Widget>[];
    for (var idx = 0; idx < children.length; idx++) {
      final widget = children[idx];
      widgets.add(widget);
      // Add gap if not last item if its not last element

      if (widget != children.last) {
        widgets.add(GapWidget(mixer.gap!.value));
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return BoxMixer(
      mixer,
      child: Flex(
        direction: direction,
        mainAxisAlignment:
            mixer.mainAxisAlignment?.value ?? MainAxisAlignment.start,
        crossAxisAlignment:
            mixer.crossAxisAlignment?.value ?? CrossAxisAlignment.center,
        mainAxisSize: mixer.mainAxisSize?.value ?? MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        children: renderChildrenWithGap(children),
      ),
    );
  }
}

class RowBox extends FlexBox {
  RowBox(
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

class ColumnBox extends FlexBox {
  ColumnBox(
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
