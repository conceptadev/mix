part of 'progress.dart';

class Progress extends StatelessWidget {
  const Progress({
    super.key,
    this.style,
    this.variants = const [],
    required this.value,
  }) : assert(
          value >= 0 && value <= 1,
          'Progress value must be between 0 and 1',
        );

  final ProgressStyle? style;
  final double value;
  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? context.remix.components.progress;

    final configuration = SpecConfiguration(context, ProgressSpecUtility.self);

    return SpecBuilder(
      style: style.makeStyle(configuration).applyVariants(variants),
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
    );
  }
}
