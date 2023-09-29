import 'package:flutter/material.dart';

import '../../mix.dart';

typedef WidgetMixBuilder = Widget Function(MixData mix);

class MixBuilder extends StyledWidget {
  const MixBuilder({
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.variants,
    super.key,
    super.inherit,
    required WidgetMixBuilder builder,
  }) : _builder = builder;

  final WidgetMixBuilder _builder;

  @override
  Widget build(BuildContext context) {
    return buildWithMix(context, _builder);
  }
}
