part of 'progress.dart';

class XProgress extends StatelessWidget {
  const XProgress({
    super.key,
    this.style = const Style.empty(),
    required this.value,
  })  : _blank = false,
        assert(
          value >= 0 || value <= 1,
          'Progress value must be between 0 and 1',
        );

  const XProgress.blank({
    super.key,
    required this.style,
    required this.value,
  })  : _blank = true,
        assert(
          value >= 0 || value <= 1,
          'Progress value must be between 0 and 1',
        );

  final Style style;
  final double value;
  final bool _blank;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: _blank ? style : XProgressStyle.base.merge(style),
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
