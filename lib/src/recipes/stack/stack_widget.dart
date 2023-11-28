import 'package:flutter/widgets.dart';

import '../../helpers/build_context_ext.dart';
import '../../widgets/styled_widget.dart';
import '../container/container_widget.dart';
import 'stack_attribute.dart';

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
    final attribute = inherit
        ? context.mix?.attributeOf<StackMixAttribute>() ??
            const StackMixAttribute()
        : const StackMixAttribute();

    return withMix(context, (mix) {
      final mixture =
          attribute.merge(mix.attributeOf<StackMixAttribute>()).resolve(mix);

      return Stack(
        alignment: mixture.alignment ?? _defaultStack.alignment,
        textDirection: mixture.textDirection,
        fit: mixture.fit ?? _defaultStack.fit,
        clipBehavior: mixture.clipBehavior ?? _defaultStack.clipBehavior,
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
    return withMix(context, (mix) {
      return StyledContainer(
        inherit: true,
        child: StyledStack(inherit: true, children: children),
      );
    });
  }
}

const _defaultStack = Stack();
