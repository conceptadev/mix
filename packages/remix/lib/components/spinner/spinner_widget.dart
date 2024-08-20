part of 'spinner.dart';

class RxSpinner extends StatelessWidget {
  const RxSpinner({this.style, super.key, this.size = SpinnerSize.medium});

  final Style? style;
  final SpinnerSize size;

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      builder: (context) {
        final SpinnerWidget = SpinnerSpec.of(context);

        return SpinnerWidget();
      },
      style: _buildSpinnerStyle(style, [size]),
    );
  }
}

class RxSpinnerSpecWidget extends StatefulWidget {
  const RxSpinnerSpecWidget({this.spec = const SpinnerSpec(), super.key});

  final SpinnerSpec spec;

  @override
  _RxSpinnerSpecWidgetState createState() => _RxSpinnerSpecWidgetState();
}

class _RxSpinnerSpecWidgetState extends State<RxSpinnerSpecWidget>
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
  void didUpdateWidget(covariant RxSpinnerSpecWidget oldWidget) {
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
