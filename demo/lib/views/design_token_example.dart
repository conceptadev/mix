import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

StyleMix get mix => StyleMix(
      height(100),
      width(100),
      rounded(10),
      elevation(2),
      backgroundColor($M3Color.surface),
      alignment(Alignment.center),
      textStyle(color: $M3Color.onSurface),
    );

class DesignTokenExample extends StatelessWidget {
  const DesignTokenExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StyledContainer(
      style: mix,
      child: const StyledText('Surface'),
    );
  }
}
