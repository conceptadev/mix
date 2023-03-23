import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

MixFactory get mix => MixFactory(
      height(100),
      width(100),
      rounded(10),
      elevation(2),
      bgColor(MaterialTokens.colorScheme.surface),
      align(Alignment.center),
      textColor(MaterialTokens.colorScheme.onSurface),
    );

class DesignTokenExample extends StatelessWidget {
  const DesignTokenExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box(
      mix: mix,
      child: const TextMix('Surface'),
    );
  }
}
