import 'package:flutter/material.dart';

import '../mixer/public.dart';
import 'utilities.dart';

// Color.fromRGBO(30, 144, 255, 0.1)
final _lightShadowColor = shadowColor(Colors.black12);

final _darkShadowColor = dark(shadowColor(Colors.black54));

final _baseShadow = Mix(_lightShadowColor, _darkShadowColor);

final shadow20 = _baseShadow.mix(shadowBlur(3), shadowOffset(0, 1));

final shadow40 = _baseShadow.mix(shadowBlur(4), shadowOffset(0, 2));

final shadow60 = _baseShadow.mix(shadowBlur(8), shadowOffset(0, 4));

final shadow80 = _baseShadow.mix(shadowBlur(16), shadowOffset(0, 8));

final shadow100 = _baseShadow.mix(shadowBlur(24), shadowOffset(0, 16));
