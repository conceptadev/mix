part of 'slider.dart';

class Slider extends StatefulWidget {
  const Slider({
    super.key,
    this.min = 0.0,
    this.max = 100.0,
    this.divisions = 0,
    required this.onChanged,
    required this.value,
    this.onChangeEnd,
    this.onChangeStart,
    this.style,
    this.variants = const [],
    this.disabled = false,
  });

  final double min;
  final double max;
  final int divisions;
  final double value;
  final SliderStyle? style;
  final List<Variant> variants;
  final bool disabled;

  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeEnd;
  final ValueChanged<double>? onChangeStart;

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> with TickerProviderStateMixin {
  double _sliderWidth = 0.0;
  final ValueNotifier<Offset> _value = ValueNotifier(Offset.zero);
  late MixWidgetStateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MixWidgetStateController();
  }

  double _calculateValue(Offset localPosition) {
    double dx = localPosition.dx.clamp(0, _sliderWidth);
    double percent = dx / (_sliderWidth);
    int divisions = widget.divisions;

    if (divisions > 0) {
      final range = widget.max - widget.min;
      final step = range / divisions;
      final rounded = ((percent * range) / step).round();

      return step * rounded;
    }

    return widget.min + percent * (widget.max - widget.min);
  }

  @override
  void dispose() {
    _controller.dispose();
    _value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style ?? context.remix.components.slider;
    final configuration = SpecConfiguration(context, SliderSpecUtility.self);

    return Pressable(
      enabled: !widget.disabled,
      onPanUpdate: (details) {
        final value = _calculateValue(details.localPosition);
        widget.onChanged?.call(value);
      },
      onPanEnd: (details) {
        final value = _calculateValue(details.localPosition);
        widget.onChangeEnd?.call(value);
      },
      child: SpecBuilder(
        style: style.makeStyle(configuration).applyVariants(widget.variants),
        builder: (context) {
          final spec = SliderSpec.of(context);

          return LayoutBuilder(
            builder: (context, constraints) {
              _sliderWidth = constraints.maxWidth;

              return _SliderSpecWidget(
                spec: spec,
                min: widget.min,
                max: widget.max,
                value: widget.value,
                divisions: widget.divisions,
                onChanged: widget.onChanged,
                onChangeEnd: widget.onChangeEnd,
                onChangeStart: widget.onChangeStart,
              );
            },
          );
        },
      ),
    );
  }
}

class _SliderSpecWidget extends StatefulWidget {
  const _SliderSpecWidget({
    required this.spec,
    required this.min,
    required this.max,
    required this.value,
    required this.divisions,
    required this.onChanged,
    required this.onChangeEnd,
    required this.onChangeStart,
  });

  final SliderSpec spec;
  final double min;
  final double max;
  final double value;
  final int divisions;

  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeEnd;
  final ValueChanged<double>? onChangeStart;

  @override
  State createState() => _SliderSpecWidgetState();
}

class _SliderSpecWidgetState extends State<_SliderSpecWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curve;
  late SliderSpecTween _tween;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: widget.spec.animated?.duration ?? Duration.zero,
      vsync: this,
    );

    curve = CurvedAnimation(
      parent: controller,
      curve: widget.spec.animated?.curve ?? Curves.easeInOut,
    );

    _tween = SliderSpecTween(begin: widget.spec, end: widget.spec);
  }

  @override
  didUpdateWidget(_SliderSpecWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.spec != widget.spec) {
      _tween = SliderSpecTween(begin: oldWidget.spec, end: widget.spec);
      controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    curve.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final spec = _tween.lerp(curve.value);

        return CustomPaint(
          painter: _SliderPainter(
            currentValue: widget.value,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            divisionColor: spec.divisionColor,
            thumbColor: spec.thumbColor,
            thumbStrokeColor: spec.thumbStrokeColor,
            trackColor: spec.trackColor,
            activeTrackColor: spec.activeTrackColor,
            trackHeight: spec.trackHeight,
            thumbRadius: spec.thumbRadius,
            thumbStrokeWidth: spec.thumbStrokeWidth,
          ),
          // size: const Size(double.infinity, 50),
          child: Container(
            color: Colors.transparent,
            height: 50,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    double percent =
                        (widget.value - widget.min) / (widget.max - widget.min);

                    double thumbX = (percent * constraints.maxWidth).clamp(
                      spec.thumbRadius / 2,
                      constraints.maxWidth,
                    );

                    return Container(
                      color: Colors.yellow,
                      width: 10,
                      height: 10,
                      transform: Matrix4.translationValues(thumbX, 0, 0),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SliderPainter extends CustomPainter {
  final double currentValue;
  final int divisions;
  final double min;
  final double max;
  final Color divisionColor;
  final Color thumbColor;
  final Color thumbStrokeColor;
  final Color trackColor;
  final Color activeTrackColor;
  final double trackHeight;
  final double thumbRadius;
  final double thumbStrokeWidth;

  const _SliderPainter({
    required this.currentValue,
    required this.min,
    required this.max,
    required this.divisions,
    required this.divisionColor,
    required this.thumbColor,
    required this.thumbStrokeColor,
    required this.trackColor,
    required this.activeTrackColor,
    required this.trackHeight,
    required this.thumbRadius,
    required this.thumbStrokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the track
    Paint trackPaint = Paint()
      ..color = trackColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = trackHeight;
    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);
    canvas.drawLine(start, end, trackPaint);

    // Calculate thumb position
    double percent = (currentValue - min) / (max - min);
    double thumbX = (percent * size.width).clamp(0, size.width);

    Paint divisionPaint = Paint()
      ..color = divisionColor
      ..strokeCap = StrokeCap.round;

    if (divisions > 0) {
      for (int i = 0; i <= divisions; i++) {
        double divisionX = (i * size.width / divisions);

        canvas.drawCircle(
          Offset(divisionX, size.height / 2),
          1.5,
          divisionPaint,
        );
      }
    }

    // Draw the active track
    Paint activeTrackPaint = Paint()
      ..color = activeTrackColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = trackHeight;

    canvas.drawLine(
      start,
      Offset(thumbX, size.height / 2),
      activeTrackPaint,
    );

    // Draw the thumb
    Paint thumbPaint = Paint()
      ..color = thumbColor
      ..strokeWidth = thumbStrokeWidth
      ..style = PaintingStyle.fill;

    // Draw the thumb stroke
    Paint thumbStrokePaint = Paint()
      ..color = thumbStrokeColor
      ..strokeWidth = thumbStrokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(thumbX, size.height / 2),
      thumbRadius,
      thumbStrokePaint,
    );

    canvas.drawCircle(
      Offset(thumbX, size.height / 2),
      thumbRadius,
      thumbPaint,
    );
  }

  @override
  bool shouldRepaint(_SliderPainter oldDelegate) {
    return oldDelegate.currentValue != currentValue ||
        oldDelegate.min != min ||
        oldDelegate.max != max ||
        oldDelegate.thumbColor != thumbColor ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.activeTrackColor != activeTrackColor;
  }
}
