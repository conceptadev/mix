import 'package:flutter/material.dart';

import '../headless/switch/switch.theme.dart';
import 'tokens.dart';

class SwitchXToken extends SwitchXThemeData
    implements MixToken<SwitchXThemeData> {
  SwitchXToken(this.valueGetter);

  @override
  final TokenValueGetter<SwitchXThemeData> valueGetter;

  @override
  SwitchXThemeData resolve(BuildContext context) {
    return valueGetter(context);
  }
}
