import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class DesignTokens {
  static get primary => textColor(Colors.black);
  static get secondary => textColor(Colors.blue);

  static get font => fontFamily('Roboto');
}

class MixStyles extends MixData {
  Mix get baseFont => Mix(
        DesignTokens.font,
        DesignTokens.primary,
      );

  Mix get heading1 => baseFont.mix(
        fontWeight.bold,
        DesignTokens.secondary,
      );
}
