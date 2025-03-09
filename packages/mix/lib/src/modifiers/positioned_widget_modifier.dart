// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/modifier.dart';
import '../core/utility.dart';

part 'positioned_widget_modifier.g.dart';

@MixableSpec(skipUtility: true)
final class PositionedModifierSpec
    extends WidgetModifierSpec<PositionedModifierSpec>
    with _$PositionedModifierSpec, Diagnosticable {
  final num? right;
  final num? left;
  final num? top;
  final num? bottom;
  final num? width;
  final num? height;
  final bool fill;

  const PositionedModifierSpec({
    this.right,
    this.left,
    this.top,
    this.bottom,
    this.width,
    this.height,
    bool? fill,
  }) : fill = fill ?? false;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }

  @override
  Widget build(Widget child) {
    if (fill == true) {
      return Positioned.fill(
        bottom: bottom?.toDouble(),
        top: top?.toDouble(),
        right: right?.toDouble(),
        left: left?.toDouble(),
        child: child,
      );
    } else {
      return Positioned(
        right: right?.toDouble(),
        left: left?.toDouble(),
        top: top?.toDouble(),
        bottom: bottom?.toDouble(),
        width: width?.toDouble(),
        height: height?.toDouble(),
        child: child,
      );
    }
  }
}

final class PositionedModifierSpecUtility<T extends Attribute>
    extends MixUtility<T, PositionedModifierSpecAttribute> {
  PositionedModifierSpecUtility(super.builder);

  T call({
    double? right,
    double? left,
    double? top,
    double? bottom,
    double? width,
    double? height,
  }) =>
      builder(
        PositionedModifierSpecAttribute(
          right: right,
          left: left,
          top: top,
          bottom: bottom,
          width: width,
          height: height,
        ),
      );

  T fill({
    double? right,
    double? left,
    double? top,
    double? bottom,
  }) =>
      builder(
        PositionedModifierSpecAttribute(
          right: right,
          left: left,
          top: top,
          bottom: bottom,
          fill: true,
        ),
      );
}
