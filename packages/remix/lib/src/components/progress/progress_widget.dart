part of 'progress.dart';

class XProgress extends StatelessWidget {
  const XProgress({
    super.key,
    this.style = const Style.empty(),
    this.variants = const [],
    required this.value,
  }) : assert(
          value >= 0 || value <= 1,
          'Progress value must be between 0 and 1',
        );

  final Style style;
  final double value;
  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    final styleFromTheme = RemixThemeProvider.maybeOf(context)?.progress;

    return SpecBuilder(
      style: (styleFromTheme ?? XProgressStyle.base)
          .merge(style)
          .applyVariants(variants),
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
