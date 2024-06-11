import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:themed_button/styles/orbit.dart';
import 'package:themed_button/styles/tokens.dart';

final shadcnTheme = orbitTheme.copyWith(
  colors: {
    $token.color.primary: Colors.black,
    $token.color.primaryHover: const Color.fromARGB(255, 66, 66, 66),
    $token.color.onPrimary: Colors.white,
  },
);
