part of 'spinner.dart';

class XSpinner extends StatelessWidget {
  const XSpinner({
    super.key,
    this.style = const Style.empty(),
    this.variants = const [],
  });

  final Style style;
  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    final styleFromTheme = RemixThemeProvider.maybeOf(context)?.spinner;

    return SpecBuilder(
      style: (styleFromTheme ?? XSpinnerStyle.base)
          .merge(style)
          .applyVariants(variants),
      builder: (context) {
        final SpinnerWidget = SpinnerSpec.of(context);

        return SpinnerWidget();
      },
    );
  }
}

class XSpinnerSpecWidget extends StatefulWidget {
  const XSpinnerSpecWidget({this.spec = const SpinnerSpec(), super.key});

  final SpinnerSpec spec;

  @override
  _XSpinnerSpecWidgetState createState() => _XSpinnerSpecWidgetState();
}

class _XSpinnerSpecWidgetState extends State<XSpinnerSpecWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.spec.duration,
      vsync: this,
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant XSpinnerSpecWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.spec.duration != widget.spec.duration) {
      controller.duration = widget.spec.duration;
      controller.repeat();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spec = widget.spec;
    final color = spec.color;
    final strokeWidth = spec.strokeWidth ?? 1;
    final size = spec.size;
    final painter = spec.style == SpinnerStyle.dotted
        ? DottedSpinnerPainter(
            animation: controller,
            strokeWidth: strokeWidth,
            color: color,
          )
        : SolidSpinnerPainter(
            animation: controller,
            strokeWidth: strokeWidth,
            color: color,
          );

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return CustomPaint(painter: painter, size: Size(size, size));
      },
    );
  }
}
