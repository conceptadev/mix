import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import 'color_util.dart';

@immutable
final class MaterialColorUtility<T extends Attribute>
    extends FoundationColorUtility<T, MaterialColor> {
  late final shade50 = FoundationColorUtility(build, color.shade50);
  late final shade100 = FoundationColorUtility(build, color.shade100);
  late final shade200 = FoundationColorUtility(build, color.shade200);
  late final shade300 = FoundationColorUtility(build, color.shade300);
  late final shade400 = FoundationColorUtility(build, color.shade400);
  late final shade500 = FoundationColorUtility(build, color.shade500);
  late final shade600 = FoundationColorUtility(build, color.shade600);
  late final shade700 = FoundationColorUtility(build, color.shade700);
  late final shade800 = FoundationColorUtility(build, color.shade800);
  late final shade900 = FoundationColorUtility(build, color.shade900);
  MaterialColorUtility(super.builder, super.color);
}

base mixin MaterialColorsMixin<T extends Attribute> on BaseColorUtility<T> {
  late final _color = MaterialColorUtility.new;
  late final _accent = MaterialAccentColorUtility.new;
  late final red = _color(build, Colors.red);
  late final pink = _color(build, Colors.pink);
  late final purple = _color(build, Colors.purple);
  late final deepPurple = _color(build, Colors.deepPurple);
  late final indigo = _color(build, Colors.indigo);
  late final blue = _color(build, Colors.blue);
  late final lightBlue = _color(build, Colors.lightBlue);
  late final cyan = _color(build, Colors.cyan);
  late final teal = _color(build, Colors.teal);
  late final green = _color(build, Colors.green);
  late final lightGreen = _color(build, Colors.lightGreen);
  late final lime = _color(build, Colors.lime);
  late final yellow = _color(build, Colors.yellow);
  late final amber = _color(build, Colors.amber);
  late final orange = _color(build, Colors.orange);
  late final deepOrange = _color(build, Colors.deepOrange);
  late final brown = _color(build, Colors.brown);
  late final grey = _color(build, Colors.grey);
  late final blueGrey = _color(build, Colors.blueGrey);
  late final redAccent = _accent(build, Colors.redAccent);
  late final pinkAccent = _accent(build, Colors.pinkAccent);
  late final purpleAccent = _accent(build, Colors.purpleAccent);
  late final deepPurpleAccent = _accent(build, Colors.deepPurpleAccent);
  late final indigoAccent = _accent(build, Colors.indigoAccent);
  late final blueAccent = _accent(build, Colors.blueAccent);
  late final lightBlueAccent = _accent(build, Colors.lightBlueAccent);
  late final cyanAccent = _accent(build, Colors.cyanAccent);
  late final tealAccent = _accent(build, Colors.tealAccent);
  late final greenAccent = _accent(build, Colors.greenAccent);
  late final lightGreenAccent = _accent(build, Colors.lightGreenAccent);
  late final limeAccent = _accent(build, Colors.limeAccent);
  late final yellowAccent = _accent(build, Colors.yellowAccent);
  late final amberAccent = _accent(build, Colors.amberAccent);
  late final orangeAccent = _accent(build, Colors.orangeAccent);
  late final deepOrangeAccent = _accent(build, Colors.deepOrangeAccent);
}

@immutable
final class MaterialAccentColorUtility<T extends Attribute>
    extends FoundationColorUtility<T, MaterialAccentColor> {
  late final shade100 = FoundationColorUtility(build, color.shade100);
  late final shade200 = FoundationColorUtility(build, color.shade200);
  late final shade400 = FoundationColorUtility(build, color.shade400);
  late final shade700 = FoundationColorUtility(build, color.shade700);
  MaterialAccentColorUtility(super.builder, super.color);
}
