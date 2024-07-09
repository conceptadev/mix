import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/badge/badge.style.dart';
import 'package:remix/components/badge/badge.variants.dart';
import 'package:remix/components/badge/badge_spec.dart';

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

  Style _buildStyle() {
    return buildDefaultBadgeStyle()
        .merge(style)
        .applyVariants([size, variant]).animate();
  }

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: _buildStyle(),
      builder: (context) {
        final spec = BadgeSpec.of(context);

        return spec.container(
          child: spec.label(label),
        );
      },
    );
  }
}
