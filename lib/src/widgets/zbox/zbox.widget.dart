import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../box/box.widget.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import 'zbox.props.dart';

// ZBox widget, a custom Box widget that has a Stack as a child. It combines
// the features of a Box widget with a Stack widget, allowing developers to
// create complex and responsive layouts.

class StyledStack extends StyledWidget {
  const StyledStack({
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.key,
    super.variants,
    super.inherit,
    this.children = const <Widget>[],
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return MixBuilder(
      style: style,
      variants: variants,
      builder: (mix) {
        final zProps = ZBoxProps.fromContext(mix);

        return Stack(
          alignment: zProps.alignment,
          clipBehavior: zProps.clipBehavior,
          fit: zProps.fit,
          children: children,
        );
      },
    );
  }
}

class ZBox extends StyledWidget {
  const ZBox({
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.key,
    super.variants,
    super.inherit,
    this.children = const <Widget>[],
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return MixBuilder(
      style: style,
      variants: variants,
      builder: (mix) {
        return MixedContainer(
          mix: mix,
          child: MixedStack(
            mix: mix,
            children: children,
          ),
        );
      },
    );
  }
}

class MixedStack extends StatelessWidget {
  const MixedStack({
    super.key,
    required this.mix,
    this.children = const <Widget>[],
  });

  final MixData mix;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final zProps = ZBoxProps.fromContext(mix);

    return Stack(
      alignment: zProps.alignment,
      clipBehavior: zProps.clipBehavior,
      fit: zProps.fit,
      children: children,
    );
  }
}
