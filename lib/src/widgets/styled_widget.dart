import 'package:flutter/material.dart';

import '../factory/mix_provider.dart';
import '../factory/style_mix.dart';

abstract class StyledWidget extends StatelessWidget {
  /// Constructor.
  const StyledWidget({
    this.style = StyleMix.empty,
    super.key,

    /// Inherit beavhior is off by default and allows to inherit the style from the parent Context.
    /// Only WidgetAttributes are inherited. Decorators will not be inherited as
    /// decorators should have already been applied to the parent Widget.
    this.inherit = false,
  });

  final StyleMix style;

  final bool inherit;

  Widget buildWithStyle(BuildContext context, MixBuilder builder) {
    return MixProvider.build(
      context,
      style: style,
      builder: builder,
      inherit: inherit,
    );
  }

  @override
  Widget build(BuildContext context);
}

abstract class AnimatedStyledWidget extends StyledWidget {
  const AnimatedStyledWidget({
    super.key,
    super.inherit,
    super.style,
    required this.curve,
    required this.duration,
  });

  final Curve curve;
  final Duration duration;
}
