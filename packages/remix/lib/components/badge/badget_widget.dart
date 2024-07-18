import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/badge/badge_spec.dart';
import 'package:remix/components/badge/badge_style.dart';
import 'package:remix/components/badge/badge_variants.dart';

class RxBadge extends StatelessWidget {
  const RxBadge({
    super.key,
    required this.label,
    this.style,
    this.size = BadgeSize.medium,
    this.variant = BadgeVariant.soft,
  });

  final String label;

  /// Additional custom styling for the badge.
  ///
  /// This allows you to override or extend the default badge styling.
  final Style? style;

  final BadgeSize size;
  final BadgeVariant variant;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: badgeStyle(style, [size, variant]),
      builder: (context) {
        final spec = BadgeSpec.of(context);

        return spec.container(
          child: spec.label(label),
        );
      },
    );
  }
}
