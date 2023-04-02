import 'package:flutter/material.dart';

import '../../mix.dart';
import '../factory/mix_provider.dart';

typedef WidgetMixBuilder = Widget Function(
  BuildContext context,
  MixData mixContext,
);

class MixBuilder extends MixWidget {
  const MixBuilder({
    super.mix,
    super.variants,
    super.key,
    required WidgetMixBuilder builder,
  }) : _builder = builder;

  final WidgetMixBuilder _builder;

  @override
  Widget build(BuildContext context) {
    final mix = createMixData(context);

    return MixProvider(
      mix,
      child: Builder(
        builder: (context) => _builder(
          context,
          mix,
        ),
      ),
    );
  }
}
