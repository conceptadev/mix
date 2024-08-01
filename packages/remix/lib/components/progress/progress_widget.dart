part of 'progress.dart';

class RxProgress extends StatelessWidget {
  const RxProgress({
    super.key,
    this.value = 0.0,
    this.size = ProgressSize.medium,
    this.type = ProgressVariant.surface,
    this.radius = ProgressRadius.none,
    this.style,
    this.duration,
  });

  final double value;
  final ProgressSize size;
  final ProgressVariant type;
  final Style? style;

  final ProgressRadius radius;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: _buildProgressStyle(style, [size, type, radius]),
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
