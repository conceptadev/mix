import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/components/spinner/spinner_widget.dart';

part 'spinner_spec.g.dart';

enum SpinnerStyle {
  solid,
  dotted,
}

@MixableSpec()
final class SpinnerSpec extends Spec<SpinnerSpec> with _$SpinnerSpec {
  /// Size of the spinner
  final double size;

  /// Width of the stroke of the line
  /// Needs to be a double between 0 and 1
  final double? strokeWidth;

  /// Color of the spinner line
  final Color color;

  /// Duration of a full cycle of spin
  final Duration duration;

  final SpinnerStyle style;

  static const of = _$SpinnerSpec.of;
  static const from = _$SpinnerSpec.from;

  const SpinnerSpec({
    double? size,
    this.strokeWidth,
    Color? color,
    Duration? duration,
    SpinnerStyle? style,
    super.animated,
  })  : size = size ?? 24,
        color = color ?? Colors.white,
        style = style ?? SpinnerStyle.solid,
        duration = duration ?? const Duration(milliseconds: 500);

  Widget call() => RxSpinnerSpecWidget(spec: this);
}

final class SpinnerStyleUtility<T extends Attribute>
    extends ScalarUtility<T, SpinnerStyle> {
  SpinnerStyleUtility(super.builder);

  T dotted() => call(SpinnerStyle.dotted);
  T solid() => call(SpinnerStyle.solid);
}
