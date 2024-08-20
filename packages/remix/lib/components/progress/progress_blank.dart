part of 'progress.dart';

class RxBlankProgress extends StatelessWidget {
  const RxBlankProgress({
    super.key,
    required this.style,
    required this.value,
  }) : assert(
          value >= 0 || value <= 1,
          'Progress value must be between 0 and 1',
        );

  final Style style;
  final double value;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      builder: (context) {
        final spec = ProgressSpec.of(context);

        return spec.container(
          child: Stack(
            children: [
              spec.track(),
              LayoutBuilder(builder: (context, constraints) {
                final biggestSize = constraints.biggest;

                return SizedBox(
                  width: biggestSize.width * value,
                  child: spec.fill(),
                );
              }),
              spec.outerContainer(),
            ],
          ),
        );
      },
      style: style,
    );
  }
}
