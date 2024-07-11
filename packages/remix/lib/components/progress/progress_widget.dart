import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/progress/progress_spec.dart';
import 'package:remix/components/progress/progress_style.dart';
import 'package:remix/components/progress/progress_variants.dart';

class RxProgress extends StatelessWidget {
  const RxProgress({
    super.key,
    this.value = 0.0,
    this.size = ProgressSize.medium,
    this.variant = ProgressVariant.surface,
    this.highContrast = false,
    this.radius = ProgressRadius.none,
    this.duration,
  });

  final double value;
  final ProgressSize size;
  final ProgressVariant variant;

  final bool highContrast;
  final ProgressRadius radius;
  final Duration? duration;

  Style _buildStyle() {
    return buildDefaultProgressStyle().applyVariants(
      [size, variant, radius],
    ).animate();
  }

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: _buildStyle(),
      builder: (context) {
        final spec = ProgressSpec.of(context);

        final FillWidget = spec.fill.copyWith(
          width: value * 100,
        );

        return spec.container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              spec.track(),
              FillWidget(),
            ],
          ),
        );
      },
    );
  }
}
