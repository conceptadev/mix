import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../components/m2_typography.dart';
import '../components/m3_typography.dart';

StyleMix get button => StyleMix(
      textStyle(as: $M3Text.bodyMedium),
      bold(),
      textStyle(fontSize: 6.0),
      backgroundColor($M3Color.primary),
      onHover(
        backgroundColor($M3Color.secondary),
      ),
      paddingHorizontal(15.0),
      paddingVertical(8.0),
    );

class TypographyExample extends StatelessWidget {
  const TypographyExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flexAlign = StyleMix(
      mainAxisAlignment(MainAxisAlignment.start),
      crossAxis(CrossAxisAlignment.start),
      mainAxisSize(MainAxisSize.max),
      width(double.infinity),
    );

    final onSurfaceMix = StyleMix(
      textStyle(color: Colors.black),
      onDark(
        textStyle(color: Colors.white),
      ),
    );

    final headingMix = StyleMix.fromAttributes([
      textStyle(fontSize: 24),
      ...onSurfaceMix.toAttributes(),
    ]);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: StyledFlex(
        direction: Axis.vertical,
        style: flexAlign,
        children: [
          flexAlign.container(child: const SizedBox()),
          StyledText(
            "Typography is cool, and mix makes it esay!",
            style: headingMix,
          ),
          const SizedBox(height: 20),
          const M3TokensTypographyExampleTile(),
          const M2TokensTypographyExampleTile(),
        ],
      ),
    );
  }
}
