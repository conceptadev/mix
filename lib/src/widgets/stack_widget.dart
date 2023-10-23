import 'package:flutter/widgets.dart';

import '../attributes/stack_attribute.dart';
import '../factory/mix_provider.dart';
import 'container_widget.dart';
import 'styled_widget.dart';

class StyledStack extends StyledWidget {
  const StyledStack({
    this.children = const <Widget>[],
    super.inherit,
    super.key,
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.variants,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return withMix(context, MixedStack(children: children));
  }
}

// ZBox widget, a custom Box widget that has a Stack as a child. It combines
// the features of a Box widget with a Stack widget, allowing developers to
// create complex and responsive layouts.

class ZBox extends StyledWidget {
  const ZBox({
    this.children = const <Widget>[],
    super.inherit,
    super.key,
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.variants,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return withMix(
      context,
      MixedContainer(child: MixedStack(children: children)),
    );
  }
}

class MixedStack extends StatelessWidget {
  const MixedStack({this.children = const <Widget>[], super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final mix = MixProvider.of(context);
    final spec = mix.spec<StackSpec>();

    return Stack(
      alignment: spec?.alignment ?? AlignmentDirectional.topStart,
      fit: spec?.fit ?? StackFit.loose,
      clipBehavior: spec?.clipBehavior ?? Clip.hardEdge,
      children: children,
    );
  }
}
