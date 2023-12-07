import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../styles.dart';

StyleMix get button => StyleMix(
      text.style.of($textStyles.bodyMedium),
      box.padding.top(10),
      text.style.bold(),
      text.style(fontSize: 6.0),
      box.color.of($colors.primary),
      onHover(
        box.color.of($colors.secondary),
      ),
      box.padding(8, 15),
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
          const SizedBox(height: 20),
          StyledText(
            "This is a StyledText with a custom textStyle!",
            style: headingMix.merge(
              StyleMix(
                text.style(
                  color: $colors.surface(),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2,
                  wordSpacing: 2,
                  height: 1.5,
                  shadows: [
                    Shadow(
                      color: $colors.secondary(),
                      offset: const Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                onDark(
                  text.style.color.of($colors.surface),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
