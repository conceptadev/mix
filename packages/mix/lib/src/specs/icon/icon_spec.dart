// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports,
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../attributes/inline_modifier/inline_modifiers_data.dart';

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

  @override
  @MixableProperty(utilities: [
    MixableUtility(
      alias: '_modifiers',
      properties: [(path: 'add', alias: 'mod')],
    ),
  ])
  // ignore: overridden_fields
  final InlineModifiersData? inlineModifiers;

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
    this.inlineModifiers,
    super.animated,
  });

  Widget call({
    required IconData? icon,
    required String? semanticLabel,
    required TextDirection? textDirection,
  }) {
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
