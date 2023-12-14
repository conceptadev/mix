import 'package:flutter/material.dart';

import '../factory/mix_provider.dart';
import '../factory/mix_provider_data.dart';
import '../factory/style_mix.dart';

abstract class StyledWidget extends StatelessWidget {
  /// Constructor.
  const StyledWidget({
    required Style? style,
    super.key,

    /// Inherit beavhior is off by default and allows to inherit the style from the parent Context.
    /// Only WidgetAttributes are inherited. Decorators will not be inherited as
    /// decorators should have already been applied to the parent Widget.
    this.inherit = false,
  }) : style = style ?? const Style.empty();

  final Style style;

  final bool inherit;

  Widget withMix(BuildContext context, MixBuilder builder) {
    final inheritedMix = inherit ? MixProvider.maybeOf(context) : null;

    final mixData = MixData.create(context, style);

    final mergedMixData = inheritedMix?.merge(mixData) ?? mixData;

    return MixProvider(data: mergedMixData, child: builder(mergedMixData));
  }

  @override
  Widget build(BuildContext context);
}

abstract class AnimatedStyledWidget extends StyledWidget {
  const AnimatedStyledWidget({
    super.key,
    super.inherit,
    super.style,
    this.curve = Curves.linear,
    required this.duration,
  });

  final Curve curve;
  final Duration duration;
}
