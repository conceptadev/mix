import 'package:flutter/widgets.dart';

import '../box/box.widget.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import 'zbox.props.dart';

// ZBox widget, a custom Box widget that has a Stack as a child. It combines
// the features of a Box widget with a Stack widget, allowing developers to
// create complex and responsive layouts.
class ZBox extends MixWidget {
  const ZBox({
    super.mix,
    super.key,
    super.variants,
    this.children = const <Widget>[],
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return MixBuilder(
      mix: mix,
      variants: variants,
      builder: (mix) {
        final zProps = ZBoxProps.fromContext(mix);

        return BoxMixedWidget(
          mix: mix,
          child: Stack(
            alignment: zProps.alignment,
            clipBehavior: zProps.clipBehavior,
            fit: zProps.fit,
            children: children,
          ),
        );
      },
    );
  }
}
