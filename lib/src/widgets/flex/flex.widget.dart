import 'package:flutter/widgets.dart';

import '../../factory/mix_provider.dart';
import '../container/container.widget.dart';
import '../gap/gap_widget.dart';
import '../styled.widget.dart';
import 'flex.attribute.dart';
import 'flex.descriptor.dart';

class StyledFlex extends StyledWidget {
  const StyledFlex({
    super.style,
    super.key,
    super.variants,
    super.inherit,
    required this.direction,
    required this.children,
  });

  final List<Widget> children;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return withMix(
      context,
      (mix) => MixedFlex(mix: mix, direction: direction, children: children),
    );
  }
}

class FlexBox extends StyledWidget {
  const FlexBox({
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.key,
    super.variants,
    super.inherit,
    required this.direction,
    required this.children,
  });

  final List<Widget> children;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return withMix(
      context,
      (mix) => MixedContainer(
        mixData: mix,
        child: MixedFlex(mix: mix, direction: direction, children: children),
      ),
    );
  }
}

class StyledRow extends StyledFlex {
  const StyledRow({
    super.style,
    super.key,
    super.variants,
    super.inherit,
    super.children = const <Widget>[],
  }) : super(direction: Axis.horizontal);
}

class StyledColumn extends StyledFlex {
  const StyledColumn({
    super.style,
    super.key,
    super.variants,
    super.inherit,
    super.children = const <Widget>[],
  }) : super(direction: Axis.vertical);
}

class HBox extends FlexBox {
  const HBox({
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.variants,
    super.key,
    super.inherit,
    super.children = const <Widget>[],
  }) : super(direction: Axis.horizontal);
}

class VBox extends FlexBox {
  const VBox({
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.variants,
    super.key,
    super.inherit,
    super.children = const <Widget>[],
  }) : super(direction: Axis.vertical);
}

class MixedFlex extends StatelessWidget {
  const MixedFlex({
    super.key,
    required this.direction,
    required this.children,
  });

  final List<Widget> children;
  final Axis direction;

  // Creates gap to space in between.
  List<Widget> _renderChildrenWithGap(double? gapSize, List<Widget> children) {
    // If no gap is set return widgets.
    if (gapSize == null) return children;

    // List of widgets with gap.
    final widgets = <Widget>[];
    for (int idx = 0; idx < children.length; idx++) {
      final widget = children[idx];
      widgets.add(widget);
      // Add gap if not last item if its not last element.
      if (idx != children.length - 1) {
        widgets.add(Gap(gapSize));
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final mix = MixProvider.of(context);
    final flex =
        mix?.resolveAttributeOfType<FlexAttributes, FlexAttributesResolved>();

    return Flex(
      direction: direction,
      mainAxisAlignment: flex.mainAxisAlignment,
      mainAxisSize: flex.mainAxisSize,
      crossAxisAlignment: flex.crossAxisAlignment,
      verticalDirection: flex.verticalDirection,
      children: _renderChildrenWithGap(flex.gapSize, children),
    );
  }
}
