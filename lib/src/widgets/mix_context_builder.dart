import 'package:flutter/material.dart';

import '../../mix.dart';
import '../factory/mix_provider.dart';

typedef WidgetMixBuilder = Widget Function(
  BuildContext context,
  MixData mixContext,
);

class MixContextBuilder extends MixWidget {
  const MixContextBuilder({
    super.mix,
    super.inherit,
    super.variants,
    super.key,
    required WidgetMixBuilder builder,
  }) : _builder = builder;

  final WidgetMixBuilder _builder;

  @override
  Widget build(BuildContext context) {
    final mixContext = createMixContextData(context);

    return MixProvider(
      mixContext,
      child: Builder(
        builder: (context) => _builder(
          context,
          mixContext,
        ),
      ),
    );
  }
}
