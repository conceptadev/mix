import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/callout/callout_spec.dart';
import 'package:remix/components/callout/callout_style.dart';
import 'package:remix/components/callout/callout_variants.dart';

class RxCallout extends StatelessWidget {
  const RxCallout({
    super.key,
    required this.text,
    this.icon,
    this.style,
    this.variant = CalloutVariant.soft,
  });

  final String text;
  final IconData? icon;

  /// Additional custom styling for the callout.
  ///
  /// This allows you to override or extend the default callout styling.
  final Style? style;

  final CalloutVariant variant;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: calloutStyle(style, [variant]),
      builder: (context) {
        final spec = CalloutSpec.of(context);

        return spec.container(
          child: spec.flex(
            direction: Axis.horizontal,
            children: [
              if (icon != null) spec.icon(icon!),
              spec.text(text),
            ],
          ),
        );
      },
    );
  }
}
