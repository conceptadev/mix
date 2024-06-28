// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports,
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'icon_spec.g.dart';

@MixableSpec()
final class IconSpec extends Spec<IconSpec> with _$IconSpec {
  final Color? color;
  final double? size;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final TextDirection? textDirection;
  final bool? applyTextScaling;

  // TODO: add shadow utility
  final List<Shadow>? shadows;
  final double? fill;

  static const of = _$IconSpec.of;

  static const from = _$IconSpec.from;

  const IconSpec({
    this.color,
    this.size,
    this.weight,
    this.grade,
    this.opticalSize,
    this.shadows,
    this.textDirection,
    this.applyTextScaling,
    this.fill,
    super.animated,
    super.modifiers,
  });

  Widget call(IconData? icon, {String? semanticLabel}) {
    return isAnimated
        ? AnimatedIconSpecWidget(
            icon,
            spec: this,
            semanticLabel: semanticLabel,
            textDirection: textDirection,
            curve: animated!.curve,
            duration: animated!.duration,
          )
        : IconSpecWidget(
            icon,
            spec: this,
            semanticLabel: semanticLabel,
            textDirection: textDirection,
          );
  }
}

extension IconSpecUtilityExt<T extends Attribute> on IconSpecUtility<T> {
  ShadowUtility get shadow => ShadowUtility((v) => only(shadows: [v]));
}
