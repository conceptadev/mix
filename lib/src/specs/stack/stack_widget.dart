import 'package:flutter/widgets.dart';

import '../../core/styled_widget.dart';
import '../../factory/mix_provider_data.dart';
import '../container/box_widget.dart';
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
      return MixedStack(mix, children: children);
    });
  }
}

class MixedStack extends StatelessWidget {
  const MixedStack(this.mix, {super.key, this.children});

  final List<Widget>? children;
  final MixData mix;

  @override
  Widget build(BuildContext context) {
    final spec = mix.attributeOf<StackSpecAttribute>()?.resolve(mix) ??
        const StackSpec.empty();

    return Stack(
      alignment: spec.alignment ?? _defaultStack.alignment,
      textDirection: spec.textDirection,
      fit: spec.fit ?? _defaultStack.fit,
      clipBehavior: spec.clipBehavior ?? _defaultStack.clipBehavior,
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
      return MixedBox(mix, child: MixedStack(mix, children: children));
    });
  }
}

const _defaultStack = Stack();
