import 'package:flutter/widgets.dart';

import '../specs/flex_attribute.dart';
import 'container_widget.dart';
import 'styled_widget.dart';

class StyledFlex extends StyledWidget {
  const StyledFlex({
    super.style,
    super.key,
    super.inherit,
    required this.direction,
    this.children = const <Widget>[],
  });

  final List<Widget> children;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return buildWithStyle(context, (data) {
      final spec = FlexSpec.resolve(data);
      List<Widget> _childrenWithGap() {
        final spacedChildren = <Widget>[];
        for (int i = 0; i < children.length; i++) {
          spacedChildren.add(children[i]);
          if (i < children.length - 1) {
            // spacedChildren.add(Gap(gap));
          }
        }

        return spacedChildren;
      }

      final fallback = Flex(direction: direction);

      return Flex(
        direction: direction,
        mainAxisAlignment: spec.mainAxisAlignment ?? fallback.mainAxisAlignment,
        mainAxisSize: spec.mainAxisSize ?? fallback.mainAxisSize,
        crossAxisAlignment:
            spec.crossAxisAlignment ?? fallback.crossAxisAlignment,
        verticalDirection: spec.verticalDirection ?? fallback.verticalDirection,
        children: _childrenWithGap(),
      );
    });
  }
}

class StyledRow extends StyledFlex {
  const StyledRow({
    super.style,
    super.key,
    super.inherit,
    required super.children,
  }) : super(direction: Axis.horizontal);
}

class StyledColumn extends StyledFlex {
  const StyledColumn({
    super.style,
    super.key,
    super.inherit,
    super.children,
  }) : super(direction: Axis.vertical);
}

class FlexBox extends StyledWidget {
  const FlexBox({
    super.style,
    super.key,
    super.inherit,
    required this.direction,
    required this.children,
  });

  final List<Widget> children;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return buildWithStyle(context, (data) {
      return StyledContainer(
        inherit: true,
        child: StyledFlex(
          inherit: true,
          direction: direction,
          children: children,
        ),
      );
    });
  }
}

class HBox extends FlexBox {
  const HBox({
    super.style,
    super.key,
    super.inherit,
    super.children = const <Widget>[],
  }) : super(direction: Axis.horizontal);
}

class VBox extends FlexBox {
  const VBox({
    super.style,
    super.key,
    super.inherit,
    super.children = const <Widget>[],
  }) : super(direction: Axis.vertical);
}
