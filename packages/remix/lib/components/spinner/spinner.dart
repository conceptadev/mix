// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/spinner/painters/dotted_spinner_painter.dart';
import 'package:remix/components/spinner/painters/solid_spinner_painter.dart';
import 'package:remix/components/spinner/spinner.style.dart';
import 'package:remix/components/spinner/spinner.variants.dart';
import 'package:remix/components/spinner/spinner_spec.dart';

class RXSpinner extends StatelessWidget {
  const RXSpinner({
    this.style,
    super.key,
    this.size = SpinnerSize.medium,
  });

  final Style? style;
  final SpinnerSize size;

  Style _buildStyle() {
    return defaultSpinnerStyle.merge(style).applyVariants([size]).animate();
  }

  @override
  Widget build(BuildContext context) {
    return SpecBuilder(
      style: _buildStyle(),
      builder: (context) {
        final spinnerSpec = SpinnerSpec.of(context);
        return RxSpinnerSpecWidget(spec: spinnerSpec);
      },
    );
  }
}

class RxSpinnerSpecWidget extends StatefulWidget {
  const RxSpinnerSpecWidget({
    this.spec = const SpinnerSpec(),
    super.key,
  });

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
    final painter = widget.spec.style == SpinnerStyle.dotted
        ? DottedSpinnerPainter(animation: controller, spec: widget.spec)
        : SolidSpinnerPainter(animation: controller, spec: widget.spec);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return SizedBox(
          width: widget.spec.size,
          height: widget.spec.size,
          child: CustomPaint(
            painter: painter,
          ),
        );
      },
    );
  }
}
