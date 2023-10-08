import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../container/container.widget.dart';
import '../styled.widget.dart';

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
    return withMix(context, (mix) {
      final zProps = StyledStackDescriptor.fromContext(mix);

      return Stack(
        alignment: zProps.alignment,
        fit: zProps.fit,
        clipBehavior: zProps.clipBehavior,
        children: children,
      );
    });
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
      (mix) => MixedContainer(
        mixData: mix,
        child: MixedStack(mix: mix, children: children),
      ),
    );
  }
}

class MixedStack extends StatelessWidget {
  const MixedStack({
    this.children = const <Widget>[],
    super.key,
    required this.mix,
  });

  final MixData mix;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final zProps = StyledStackDescriptor.fromContext(mix);

    return Stack(
      alignment: zProps.alignment,
      fit: zProps.fit,
      clipBehavior: zProps.clipBehavior,
      children: children,
    );
  }
}
