import 'package:flutter/widgets.dart';

import '../../helpers/build_context_ext.dart';
import '../../widgets/styled_widget.dart';
import '../container/container_attribute.dart';
import '../container/container_widget.dart';
import 'stack_attribute.dart';
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
    final contextMix = context.mix;
    final inheritedAttribute = inherit && contextMix != null
        ? StackMixAttribute.of(contextMix)
        : const StackMixAttribute();

    return withMix(context, (mix) {
      final attribute = StackMixAttribute.of(mix);
      final merged = inheritedAttribute.merge(attribute);

      final mixture = merged.resolve(mix);

      return MixedStack(mixture, children: children);
    });
  }
}

class MixedStack extends StatelessWidget {
  const MixedStack(this.mixture, {super.key, this.children});

  final List<Widget>? children;
  final StackMixture mixture;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: mixture.alignment ?? _defaultStack.alignment,
      textDirection: mixture.textDirection,
      fit: mixture.fit ?? _defaultStack.fit,
      clipBehavior: mixture.clipBehavior ?? _defaultStack.clipBehavior,
      children: children ?? const <Widget>[],
    );
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
      final containerMix = ContainerMixAttribute.of(mix).resolve(mix);
      final stackMix = StackMixAttribute.of(mix).resolve(mix);

      return MixedContainer(
        containerMix,
        child: MixedStack(stackMix, children: children),
      );
    });
  }
}

const _defaultStack = Stack();
