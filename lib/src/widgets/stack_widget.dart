import 'package:flutter/widgets.dart';

import '../recipes/container/container_widget.dart';
import '../recipes/stack/stack_recipe.dart';
import 'styled_widget.dart';

class StyledStack extends StyledWidget {
  const StyledStack({
    this.children = const <Widget>[],
    super.inherit,
    super.key,
    super.style,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return buildWithStyle(context, (data) {
      final spec = StackRecipeMix.resolve(data);

      const fallback = Stack();

      return Stack(
        alignment: spec.alignment ?? fallback.alignment,
        textDirection: spec.textDirection,
        fit: spec.fit ?? fallback.fit,
        clipBehavior: spec.clipBehavior ?? fallback.clipBehavior,
        children: children,
      );
    });
  }
}

class ZBox extends StyledWidget {
  const ZBox({
    this.children = const <Widget>[],
    super.inherit,
    super.key,
    super.style,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return buildWithStyle(context, (data) {
      return StyledContainer(
        inherit: true,
        child: StyledStack(inherit: true, children: children),
      );
    });
  }
}
