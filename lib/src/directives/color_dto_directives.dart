import 'package:flutter/material.dart';

Color contrastColor(Color color) {
  return color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}
