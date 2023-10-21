import 'package:flutter/widgets.dart';

import '../attributes/flex.attribute.dart';
import '../factory/mix_provider.dart';
import 'styled.widget.dart';

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
      MixedFlex(direction: direction, children: children),
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
      MixedFlex(direction: direction, children: children),
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

  List<Widget> _prepareChildrenWithGap() {
    final spacedChildren = <Widget>[];

    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);
      if (i < children.length - 1) {
        // spacedChildren.add(Gap(gap));
      }
    }

    return spacedChildren;
  }

  @override
  Widget build(BuildContext context) {
    final mix = MixProvider.maybeOf(context);
    final flex = mix?.maybeGet<FlexAttributes, FlexSpec>();

    return Flex(
      direction: direction,
      mainAxisAlignment: flex?.mainAxisAlignment ?? MainAxisAlignment.start,
      mainAxisSize: flex?.mainAxisSize ?? MainAxisSize.max,
      crossAxisAlignment: flex?.crossAxisAlignment ?? CrossAxisAlignment.center,
      verticalDirection: flex?.verticalDirection ?? VerticalDirection.down,
      children: _prepareChildrenWithGap(),
    );
  }
}
