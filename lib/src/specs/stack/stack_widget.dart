import 'package:flutter/widgets.dart';

import '../../core/styled_widget.dart';
import '../container/container_attribute.dart';
import '../container/container_spec.dart';
import '../container/container_widget.dart';
import 'stack_attribute.dart';
import 'stack_spec.dart';

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
    return withMix(context, (mix) {
      final spec = StackSpecAttribute.of(mix).resolve(mix);

      return StackSpecWidget(spec, children: children);
    });
  }
}

class StackSpecWidget extends StatelessWidget {
  const StackSpecWidget(this.mixture, {super.key, this.children});

  final List<Widget>? children;
  final StackSpec mixture;

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
      final containerSpec =
          mix.attributeOf<ContainerSpecAttribute>()?.resolve(mix) ??
              const ContainerSpec.empty();
      final stackSpec = mix.attributeOf<StackSpecAttribute>()?.resolve(mix) ??
          const StackSpec.empty();

      return ContainerSpecWidget(
        containerSpec,
        child: StackSpecWidget(stackSpec, children: children),
      );
    });
  }
}

const _defaultStack = Stack();
