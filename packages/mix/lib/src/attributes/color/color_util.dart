import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../theme/tokens/color_token.dart';
import '../scalars/scalar_util.dart';
import 'color_directives.dart';
import 'color_dto.dart';

@immutable
abstract base class BaseColorUtility<T extends Attribute>
    extends MixUtility<T, ColorDto> {
  const BaseColorUtility(super.builder);

  T _buildColor(Color color) => builder(ColorDto(color));
}

@immutable
final class FoundationColorUtility<T extends Attribute, C extends Color>
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

base mixin ColorDirectiveMixin<T extends Attribute> on BaseColorUtility<T> {
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

/// A utility class for building [Attribute] instances from a list of [ColorDto] objects.
///
/// This class extends [MixUtility] and provides a convenient way to create [Attribute]
/// instances by transforming a list of [Color] objects into a list of [ColorDto] objects.
final class ColorListUtility<T extends Attribute>
    extends MixUtility<T, List<ColorDto>> {
  const ColorListUtility(super.builder);

  /// Creates an [Attribute] instance from a list of [Color] objects.
  ///
  /// This method maps each [Color] object to a [ColorDto] object and passes the
  /// resulting list to the [builder] function to create the [Attribute] instance.
  T call(List<Color> colors) {
    return builder(colors.map((e) => e.toDto()).toList());
  }
}

@immutable
final class ColorUtility<T extends Attribute> extends BaseColorUtility<T>
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
final class MaterialColorUtility<T extends Attribute>
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
final class MaterialAccentColorUtility<T extends Attribute>
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

extension ColorExtUtilities on Color {
  Color mix(Color toColor, [int amount = 50]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;

    return Color.fromARGB(
      ((toColor.alpha - alpha) * p + alpha).round(),
      ((toColor.red - red) * p + red).round(),
      ((toColor.green - green) * p + green).round(),
      ((toColor.blue - blue) * p + blue).round(),
    );
  }

  Color lighten([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = HSLColor.fromColor(this);
    final lightness = _clamp(hsl.lightness + p);

    return hsl.withLightness(lightness).toColor();
  }

  Color brighten([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;

    return Color.fromARGB(
      alpha,
      math.max(0, math.min(255, red - (255 * -p).round())),
      math.max(0, math.min(255, green - (255 * -p).round())),
      math.max(0, math.min(255, blue - (255 * -p).round())),
    );
  }

  Color contrast([int amount = 100]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;

    final luminance = computeLuminance();

    return luminance > 0.5 ? darken((p).round()) : brighten((p).round());
  }

  Color darken([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = HSLColor.fromColor(this);
    final lightness = _clamp(hsl.lightness - p);

    return hsl.withLightness(lightness).toColor();
  }

  Color tint([int amount = 10]) => mix(
        const Color.fromRGBO(255, 255, 255, 1.0),
        amount,
      );

  Color shade([int amount = 10]) => mix(
        const Color.fromRGBO(0, 0, 0, 1.0),
        amount,
      );

  Color desaturate([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = HSLColor.fromColor(this);
    final saturation = _clamp(hsl.saturation - p);

    return hsl.withSaturation(saturation).toColor();
  }

  Color saturate([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = HSLColor.fromColor(this);
    final saturation = _clamp(hsl.saturation + p);

    return hsl.withSaturation(saturation).toColor();
  }

  Color greyscale() => desaturate(100);

  Color complement() {
    final hsl = HSLColor.fromColor(this);
    final hue = (hsl.hue + 180) % 360;

    return hsl.withHue(hue).toColor();
  }
}

double _clamp(double val) => math.min(1.0, math.max(0.0, val));
