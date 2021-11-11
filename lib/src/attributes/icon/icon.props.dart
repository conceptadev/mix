import 'package:flutter/material.dart';

class IconProps {
  final Color? color;
  final TextDirection? textDirection;
  final double size;

  const IconProps({
    required this.size,
    this.color,
    this.textDirection,
  });
}
