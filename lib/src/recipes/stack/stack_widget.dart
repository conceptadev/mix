import 'package:flutter/widgets.dart';

import '../../widgets/styled_widget.dart';
import '../container/container_widget.dart';
import 'stack_mixture.dart';

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
    return withMix(context, (data) {
      final spec = StackMixture.resolve(data);

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
    return withMix(context, (data) {
      return StyledContainer(
        inherit: true,
        child: StyledStack(inherit: true, children: children),
      );
    });
  }
}
