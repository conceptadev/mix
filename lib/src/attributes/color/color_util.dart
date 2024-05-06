import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/color_ext.dart';
import '../../theme/tokens/color_token.dart';
import '../scalars/scalar_util.dart';
import 'color_directives.dart';
import 'color_dto.dart';

@immutable
abstract class BaseColorUtility<T extends Attribute>
    extends MixUtility<T, ColorDto> {
  const BaseColorUtility(super.builder);

  T _buildColor(Color color) => builder(ColorDto(color));
}

@immutable
class FoundationColorUtility<T extends Attribute, C extends Color>
    extends BaseColorUtility<T> with ColorDirectiveMixin<T> {
  final C color;
  const FoundationColorUtility(super.builder, this.color);

  T call() => _buildColor(color);

  @override
  T directive(ColorDirective directive) =>
      builder(ColorDto.raw(value: color, directives: [directive]));
}

typedef SimpleColorUtility<T extends Attribute>
    = FoundationColorUtility<T, Color>;
typedef MaterialSingleColorUtility<T extends Attribute>
    = FoundationColorUtility<T, MaterialColor>;

mixin ColorDirectiveMixin<T extends Attribute> on BaseColorUtility<T> {
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
class ColorUtility<T extends Attribute> extends BaseColorUtility<T>
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

  SimpleColorUtility<T> get transparent =>
      SimpleColorUtility(builder, Colors.transparent);

  SimpleColorUtility<T> get black => SimpleColorUtility(builder, Colors.black);

  SimpleColorUtility<T> get black87 =>
      SimpleColorUtility(builder, Colors.black87);

  SimpleColorUtility<T> get black54 =>
      SimpleColorUtility(builder, Colors.black54);

  SimpleColorUtility<T> get black45 =>
      SimpleColorUtility(builder, Colors.black45);

  SimpleColorUtility<T> get black38 =>
      SimpleColorUtility(builder, Colors.black38);

  SimpleColorUtility<T> get black26 =>
      SimpleColorUtility(builder, Colors.black26);

  SimpleColorUtility<T> get black12 =>
      SimpleColorUtility(builder, Colors.black12);

  SimpleColorUtility<T> get white => SimpleColorUtility(builder, Colors.white);

  SimpleColorUtility<T> get white70 =>
      SimpleColorUtility(builder, Colors.white70);

  SimpleColorUtility<T> get white60 =>
      SimpleColorUtility(builder, Colors.white60);

  SimpleColorUtility<T> get white54 =>
      SimpleColorUtility(builder, Colors.white54);

  SimpleColorUtility<T> get white38 =>
      SimpleColorUtility(builder, Colors.white38);

  SimpleColorUtility<T> get white30 =>
      SimpleColorUtility(builder, Colors.white30);

  SimpleColorUtility<T> get white24 =>
      SimpleColorUtility(builder, Colors.white24);

  SimpleColorUtility<T> get white12 =>
      SimpleColorUtility(builder, Colors.white12);

  SimpleColorUtility<T> get white10 =>
      SimpleColorUtility(builder, Colors.white10);

  T ref(ColorToken ref) => _buildColor(ref());

  T call(Color color) => _buildColor(color);
}

@immutable
class MaterialColorUtility<T extends Attribute>
    extends FoundationColorUtility<T, MaterialColor> {
  const MaterialColorUtility(super.builder, super.color);

  SimpleColorUtility<T> get shade50 =>
      SimpleColorUtility(builder, color.shade50);

  SimpleColorUtility<T> get shade100 =>
      SimpleColorUtility(builder, color.shade100);

  SimpleColorUtility<T> get shade200 =>
      SimpleColorUtility(builder, color.shade200);

  SimpleColorUtility<T> get shade300 =>
      SimpleColorUtility(builder, color.shade300);

  SimpleColorUtility<T> get shade400 =>
      SimpleColorUtility(builder, color.shade400);

  SimpleColorUtility<T> get shade500 =>
      SimpleColorUtility(builder, color.shade500);

  SimpleColorUtility<T> get shade600 =>
      SimpleColorUtility(builder, color.shade600);

  SimpleColorUtility<T> get shade700 =>
      SimpleColorUtility(builder, color.shade700);

  SimpleColorUtility<T> get shade800 =>
      SimpleColorUtility(builder, color.shade800);

  SimpleColorUtility<T> get shade900 =>
      SimpleColorUtility(builder, color.shade900);
}

@immutable
class MaterialAccentColorUtility<T extends Attribute>
    extends FoundationColorUtility<T, MaterialAccentColor> {
  const MaterialAccentColorUtility(super.builder, super.color);

  SimpleColorUtility<T> get shade100 =>
      SimpleColorUtility(builder, color.shade100);
  SimpleColorUtility<T> get shade200 =>
      SimpleColorUtility(builder, color.shade200);
  SimpleColorUtility<T> get shade400 =>
      SimpleColorUtility(builder, color.shade400);
  SimpleColorUtility<T> get shade700 =>
      SimpleColorUtility(builder, color.shade700);
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
