import 'package:flutter/material.dart';

@immutable
abstract class ColorDirective with Comparable {
  const ColorDirective();

  Color modify(Color color);
}
