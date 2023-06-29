import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mix/mix.dart';

class M3TokensTypographyExampleTile extends HookWidget {
  const M3TokensTypographyExampleTile({super.key});
  @override
  Widget build(BuildContext context) {
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

    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      title: StyledText(
        "Material 3 Typography",
        style: headingMix,
      ),
      tilePadding: const EdgeInsets.all(0),
      children: [
        StyledText(
          "This is displaySmall.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.displaySmall),
            ),
          ),
        ),
        StyledText(
          "This is displayMedium.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.displayMedium),
            ),
          ),
        ),
        StyledText(
          "This is displayLarge.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.displayLarge),
            ),
          ),
        ),
        const Divider(),
        StyledText(
          "This is headlineSmall.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.headlineSmall),
            ),
          ),
        ),
        StyledText(
          "This is headlineMedium.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.headlineMedium),
            ),
          ),
        ),
        StyledText(
          "This is headlineLarge.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.headlineLarge),
            ),
          ),
        ),
        const Divider(),
        StyledText(
          "This is titleSmall.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.titleSmall),
            ),
          ),
        ),
        StyledText(
          "This is titleSmall.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.titleMedium),
            ),
          ),
        ),
        StyledText(
          "This is titleSmall.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.titleLarge),
            ),
          ),
        ),
        const Divider(),
        StyledText(
          "This is bodySmall.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.bodySmall),
            ),
          ),
        ),
        StyledText(
          "This is bodyMedium.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.bodyMedium),
            ),
          ),
        ),
        StyledText(
          "This is bodyLarge.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.bodyLarge),
            ),
          ),
        ),
        const Divider(),
        StyledText(
          "This is labelSmall.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.labelSmall),
            ),
          ),
        ),
        StyledText(
          "This is labelMedium.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.labelMedium),
            ),
          ),
        ),
        StyledText(
          "This is labelLarge.",
          style: onSurfaceMix.merge(
            StyleMix(
              textStyle(as: $M3Text.labelLarge),
            ),
          ),
        ),
      ],
    );
  }
}
