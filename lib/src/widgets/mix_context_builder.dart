import 'package:flutter/material.dart';

import '../../mix.dart';
import '../mixer/mix_context.dart';

typedef WidgetMixBuilder = Widget Function(
  BuildContext context,
  MixContextData mixContext,
);

class MixContextBuilder extends MixWidget {
  const MixContextBuilder({
    required Mix mix,
    bool inherit = false,
    List<Variant>? variants,
    required WidgetMixBuilder builder,
    Key? key,
  })  : _builder = builder,
        super(
          mix,
          key: key,
          inherit: inherit,
          variants: variants,
        );

  final WidgetMixBuilder _builder;

  @override
  Widget build(BuildContext context) {
    final mixContext = createMixContextData(context);

    return MixContext(
      mixContext,
      child: _builder(
        context,
        mixContext,
      ),
    );
  }
}
