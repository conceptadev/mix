part of 'progress.dart';

class RxProgress extends StatelessWidget {
  const RxProgress({
    super.key,
    this.value = 0.0,
    this.size = ProgressSize.size2,
    this.variant = ProgressVariant.surface,
    this.radius = ProgressRadius.none,
    this.style,
    this.duration,
  });

  final double value;
  final ProgressSize size;
  final ProgressVariant variant;
  final Style? style;

  final ProgressRadius radius;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return RxBlankProgress(
      style: _buildProgressStyle(style, [size, variant, radius]),
      value: value,
    );
  }
}
