import 'package:flutter/material.dart';
import 'package:themed_button/styles/orbit.dart';
import 'package:themed_button/styles/tokens.dart';

final _color = ColorTokens();

final shadcnTheme = orbitTheme.copyWith(
  colors: {
    _color.primary: Colors.black,
    _color.primaryHover: const Color.fromARGB(255, 66, 66, 66),
    _color.onPrimary: Colors.white,
  },
);
