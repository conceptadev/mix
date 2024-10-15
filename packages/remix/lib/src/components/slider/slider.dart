import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../theme/remix_theme.dart';

part 'slider.g.dart';
part 'slider_style.dart';
// part 'slider_theme.dart';
part 'slider_widget.dart';

@MixableSpec()
class SliderSpec extends Spec<SliderSpec> with _$SliderSpec, Diagnosticable {
  final Color thumbColor;
  final Color thumbStrokeColor;
  final double thumbRadius;
  final double thumbStrokeWidth;
  final Color divisionColor;
  final Color trackColor;
  final double trackHeight;
  final double divisionRadius;
  final Color activeTrackColor;
  final EdgeInsetsGeometry padding;

  /// {@macro button_spec_of}
  static const of = _$SliderSpec.of;

  static const from = _$SliderSpec.from;

  SliderSpec({
    Color? thumbColor,
    Color? thumbStrokeColor,
    Color? trackColor,
    Color? activeTrackColor,
    double? trackHeight,
    double? thumbRadius,
    double? thumbStrokeWidth,
    EdgeInsetsGeometry? padding,
    Color? divisionColor,
    double? divisionRadius,
    super.modifiers,
    super.animated,
  })  : thumbColor = thumbColor ?? const Color(0xff000000),
        thumbStrokeColor = thumbStrokeColor ?? const Color(0xffffffff),
        trackColor = trackColor ?? const Color(0xff000000),
        activeTrackColor = activeTrackColor ?? const Color(0xff000000),
        trackHeight = trackHeight ?? 4.0,
        thumbRadius = thumbRadius ?? 10.0,
        thumbStrokeWidth = thumbStrokeWidth ?? 2.0,
        padding = padding ?? EdgeInsets.zero,
        divisionColor = divisionColor ?? const Color(0xff000000),
        divisionRadius = divisionRadius ?? 1.5;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
