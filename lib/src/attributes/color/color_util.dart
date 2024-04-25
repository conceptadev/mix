import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/color_ext.dart';
import '../../theme/tokens/color_token.dart';
import '../scalars/scalar_util.dart';
import 'color_directives.dart';
import 'color_dto.dart';

@immutable
abstract class BaseColorUtility<T extends StyleAttribute>
    extends MixUtility<T, ColorDto> {
  const BaseColorUtility(super.builder);

  T _buildColor(Color color) => builder(ColorDto(color));
}

@immutable
class SingleColorUtility<T extends StyleAttribute> extends BaseColorUtility<T>
    with ColorDirectiveMixin<T> {
  final Color color;
  const SingleColorUtility(super.builder, this.color);

  T call() => _buildColor(color);

  @override
  T directive(ColorDirective directive) =>
      builder(ColorDto.raw(value: color, directives: [directive]));
}

mixin ColorDirectiveMixin<T extends StyleAttribute> on BaseColorUtility<T> {
  T directive(ColorDirective directive) =>
      builder(ColorDto.directive(directive));
  T withOpacity(double opacity) => directive(OpacityColorDirective(opacity));
  T withAlpha(int alpha) => directive(AlphaColorDirective(alpha));
  T darken(int percentage) => directive(DarkenColorDirective(percentage));
  T lighten(int percentage) => directive(LightenColorDirective(percentage));
  T saturate(int percentage) => directive(SaturateColorDirective(percentage));
  T desaturate(int percentage) =>
      directive(DesaturateColorDirective(percentage));
  T tint(int percentage) => directive(TintColorDirective(percentage));
  T shade(int percentage) => directive(ShadeColorDirective(percentage));
  T brighten(int percentage) => directive(BrightenColorDirective(percentage));
}

@immutable
class ColorUtility<T extends StyleAttribute> extends BaseColorUtility<T>
    with ColorDirectiveMixin<T> {
  const ColorUtility(super.builder);

  MaterialColorUtility<T> get red => MaterialColorUtility(builder, Colors.red);
  MaterialColorUtility<T> get pink =>
      MaterialColorUtility(builder, Colors.pink);
  MaterialColorUtility<T> get purple =>
      MaterialColorUtility(builder, Colors.purple);
  MaterialColorUtility<T> get deepPurple =>
      MaterialColorUtility(builder, Colors.deepPurple);
  MaterialColorUtility<T> get indigo =>
      MaterialColorUtility(builder, Colors.indigo);
  MaterialColorUtility<T> get blue =>
      MaterialColorUtility(builder, Colors.blue);
  MaterialColorUtility<T> get lightBlue =>
      MaterialColorUtility(builder, Colors.lightBlue);
  MaterialColorUtility<T> get cyan =>
      MaterialColorUtility(builder, Colors.cyan);
  MaterialColorUtility<T> get teal =>
      MaterialColorUtility(builder, Colors.teal);
  MaterialColorUtility<T> get green =>
      MaterialColorUtility(builder, Colors.green);
  MaterialColorUtility<T> get lightGreen =>
      MaterialColorUtility(builder, Colors.lightGreen);
  MaterialColorUtility<T> get lime =>
      MaterialColorUtility(builder, Colors.lime);
  MaterialColorUtility<T> get yellow =>
      MaterialColorUtility(builder, Colors.yellow);
  MaterialColorUtility<T> get amber =>
      MaterialColorUtility(builder, Colors.amber);
  MaterialColorUtility<T> get orange =>
      MaterialColorUtility(builder, Colors.orange);
  MaterialColorUtility<T> get deepOrange =>
      MaterialColorUtility(builder, Colors.deepOrange);
  MaterialColorUtility<T> get brown =>
      MaterialColorUtility(builder, Colors.brown);
  MaterialColorUtility<T> get grey =>
      MaterialColorUtility(builder, Colors.grey);
  MaterialColorUtility<T> get blueGrey =>
      MaterialColorUtility(builder, Colors.blueGrey);
  MaterialAccentColorUtility<T> get redAccent =>
      MaterialAccentColorUtility(builder, Colors.redAccent);
  MaterialAccentColorUtility<T> get pinkAccent =>
      MaterialAccentColorUtility(builder, Colors.pinkAccent);
  MaterialAccentColorUtility<T> get purpleAccent =>
      MaterialAccentColorUtility(builder, Colors.purpleAccent);
  MaterialAccentColorUtility<T> get deepPurpleAccent =>
      MaterialAccentColorUtility(builder, Colors.deepPurpleAccent);
  MaterialAccentColorUtility<T> get indigoAccent =>
      MaterialAccentColorUtility(builder, Colors.indigoAccent);
  MaterialAccentColorUtility<T> get blueAccent =>
      MaterialAccentColorUtility(builder, Colors.blueAccent);
  MaterialAccentColorUtility<T> get lightBlueAccent =>
      MaterialAccentColorUtility(builder, Colors.lightBlueAccent);
  MaterialAccentColorUtility<T> get cyanAccent =>
      MaterialAccentColorUtility(builder, Colors.cyanAccent);
  MaterialAccentColorUtility<T> get tealAccent =>
      MaterialAccentColorUtility(builder, Colors.tealAccent);
  MaterialAccentColorUtility<T> get greenAccent =>
      MaterialAccentColorUtility(builder, Colors.greenAccent);
  MaterialAccentColorUtility<T> get lightGreenAccent =>
      MaterialAccentColorUtility(builder, Colors.lightGreenAccent);
  MaterialAccentColorUtility<T> get limeAccent =>
      MaterialAccentColorUtility(builder, Colors.limeAccent);
  MaterialAccentColorUtility<T> get yellowAccent =>
      MaterialAccentColorUtility(builder, Colors.yellowAccent);
  MaterialAccentColorUtility<T> get amberAccent =>
      MaterialAccentColorUtility(builder, Colors.amberAccent);
  MaterialAccentColorUtility<T> get orangeAccent =>
      MaterialAccentColorUtility(builder, Colors.orangeAccent);
  MaterialAccentColorUtility<T> get deepOrangeAccent =>
      MaterialAccentColorUtility(builder, Colors.deepOrangeAccent);

  SingleColorUtility<T> get transparent =>
      SingleColorUtility(builder, Colors.transparent);

  SingleColorUtility<T> get black =>
      SingleColorUtility(builder, const Color(0xFF000000));

  SingleColorUtility<T> get black87 =>
      SingleColorUtility(builder, const Color(0xDD000000));

  SingleColorUtility<T> get black54 =>
      SingleColorUtility(builder, const Color(0x8A000000));

  SingleColorUtility<T> get black45 =>
      SingleColorUtility(builder, const Color(0x73000000));

  SingleColorUtility<T> get black38 =>
      SingleColorUtility(builder, const Color(0x61000000));

  SingleColorUtility<T> get black26 =>
      SingleColorUtility(builder, const Color(0x42000000));

  SingleColorUtility<T> get black12 =>
      SingleColorUtility(builder, const Color(0x1F000000));

  SingleColorUtility<T> get white =>
      SingleColorUtility(builder, const Color(0xFFFFFFFF));

  SingleColorUtility<T> get white70 =>
      SingleColorUtility(builder, const Color(0xB3FFFFFF));

  SingleColorUtility<T> get white60 =>
      SingleColorUtility(builder, const Color(0x99FFFFFF));

  SingleColorUtility<T> get white54 =>
      SingleColorUtility(builder, const Color(0x8AFFFFFF));

  SingleColorUtility<T> get white38 =>
      SingleColorUtility(builder, const Color(0x62FFFFFF));

  SingleColorUtility<T> get white30 =>
      SingleColorUtility(builder, const Color(0x4DFFFFFF));

  SingleColorUtility<T> get white24 =>
      SingleColorUtility(builder, const Color(0x3DFFFFFF));

  SingleColorUtility<T> get white12 =>
      SingleColorUtility(builder, const Color(0x1FFFFFFF));

  SingleColorUtility<T> get white10 =>
      SingleColorUtility(builder, const Color(0x1AFFFFFF));

  T ref(ColorToken ref) => _buildColor(ref());

  T call(Color color) => _buildColor(color);
}

@immutable
abstract class ColorSwatchUtility<T extends StyleAttribute>
    extends BaseColorUtility<T> with ColorDirectiveMixin<T> {
  final ColorSwatch<int> color;
  const ColorSwatchUtility(super.builder, this.color);

  @override
  T _buildColor(Color color) => builder(ColorDto(color));
}

@immutable
class MaterialColorUtility<T extends StyleAttribute>
    extends ColorSwatchUtility<T> {
  const MaterialColorUtility(super.builder, super.color);

  SingleColorUtility<T> get shade50 => SingleColorUtility(builder, color[50]!);

  SingleColorUtility<T> get shade100 =>
      SingleColorUtility(builder, color[100]!);

  SingleColorUtility<T> get shade200 =>
      SingleColorUtility(builder, color[200]!);

  SingleColorUtility<T> get shade300 =>
      SingleColorUtility(builder, color[300]!);

  SingleColorUtility<T> get shade400 =>
      SingleColorUtility(builder, color[400]!);

  SingleColorUtility<T> get shade500 =>
      SingleColorUtility(builder, color[500]!);

  SingleColorUtility<T> get shade600 =>
      SingleColorUtility(builder, color[600]!);

  SingleColorUtility<T> get shade700 =>
      SingleColorUtility(builder, color[700]!);

  SingleColorUtility<T> get shade800 =>
      SingleColorUtility(builder, color[800]!);

  SingleColorUtility<T> get shade900 =>
      SingleColorUtility(builder, color[900]!);

  T call() => _buildColor(color[500]!);

  @override
  T directive(ColorDirective directive) =>
      builder(ColorDto.raw(value: color[500]!, directives: [directive]));
}

@immutable
class MaterialAccentColorUtility<T extends StyleAttribute>
    extends ColorSwatchUtility<T> {
  const MaterialAccentColorUtility(super.builder, super.color);

  SingleColorUtility<T> get shade100 =>
      SingleColorUtility(builder, color[100]!);
  SingleColorUtility<T> get shade200 =>
      SingleColorUtility(builder, color[200]!);
  SingleColorUtility<T> get shade400 =>
      SingleColorUtility(builder, color[400]!);
  SingleColorUtility<T> get shade700 =>
      SingleColorUtility(builder, color[700]!);

  T call() => _buildColor(color[400]!);

  @override
  T directive(ColorDirective directive) =>
      builder(ColorDto.raw(value: color[400]!, directives: [directive]));
}

typedef ColorModifier = Color Function(Color);

@immutable
class OpacityColorDirective extends ColorDirective {
  final double opacity;
  const OpacityColorDirective(this.opacity);

  @override
  Color modify(Color color) => color.withOpacity(opacity);

  @override
  get props => [opacity];
}

@immutable
class AlphaColorDirective extends ColorDirective {
  final int alpha;
  const AlphaColorDirective(this.alpha);

  @override
  Color modify(Color color) => color.withAlpha(alpha);

  @override
  get props => [alpha];
}

@immutable
class DarkenColorDirective extends ColorDirective {
  final int percentage;
  const DarkenColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.darken(percentage);

  @override
  get props => [percentage];
}

@immutable
class LightenColorDirective extends ColorDirective {
  final int percentage;
  const LightenColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.lighten(percentage);

  @override
  get props => [percentage];
}

@immutable
class SaturateColorDirective extends ColorDirective {
  final int percentage;
  const SaturateColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.saturate(percentage);

  @override
  get props => [percentage];
}

@immutable
class DesaturateColorDirective extends ColorDirective {
  final int percentage;
  const DesaturateColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.desaturate(percentage);

  @override
  get props => [percentage];
}

@immutable
class TintColorDirective extends ColorDirective {
  final int percentage;
  const TintColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.tint(percentage);

  @override
  get props => [percentage];
}

@immutable
class ShadeColorDirective extends ColorDirective {
  final int percentage;
  const ShadeColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.shade(percentage);

  @override
  get props => [percentage];
}

@immutable
class BrightenColorDirective extends ColorDirective {
  final int percentage;
  const BrightenColorDirective(this.percentage);

  @override
  Color modify(Color color) => color.brighten(percentage);

  @override
  get props => [percentage];
}
