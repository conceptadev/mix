import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class RxColors {
  static Color get black => hexToColor('#000000');
  static Color get white => hexToColor('#FFFFFF');

  static Color get primary => hexToColor('#1E90FF');
  static Color get secondary => hexToColor('#115FFB');
  static Color get tertiary => hexToColor('#5540FB');

  static MaterialColor get grey => Colors.grey;

  static Color get success => hexToColor('#18A957');
  static Color get warning => hexToColor('#FFBB38');
  static Color get error => hexToColor('#DF1642');

  static Color get lightShadow => grey.shade300;
  static Color get darkShadow => grey.shade900;
}
