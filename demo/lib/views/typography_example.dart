import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../components/m2_typography.dart';
import '../components/m3_typography.dart';
import '../styles.dart';

StyleMix get button => StyleMix(
      textStyle(as: MaterialTextStyles.bodyMedium),
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
          const SizedBox(height: 20),
          StyledText(
            "This is a StyledText with a custom textStyle!",
            style: headingMix.merge(
              StyleMix(
                textStyle(
                  color: $M3Color.surface,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2,
                  wordSpacing: 2,
                  height: 1.5,
                  shadows: [
                    const Shadow(
                      color: $M3Color.secondary,
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                onDark(
                  textStyle(color: $M3Color.surface),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
