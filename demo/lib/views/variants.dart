import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mix/mix.dart';

import '../styles.dart';

class VariantsExample extends HookWidget {
  const VariantsExample({super.key});

  @override
  Widget build(BuildContext context) {
    final baseStyle = StyleMix(
      height(300),
      width(300),
      rounded(10),
      elevation(2),
      margin(10),
      alignmentCenter(),
    );

    final style = StyleMix(
      backgroundColor($M3Color.primary),
      textStyle(color: $M3Color.onPrimary),
      onHover(
        backgroundColor($M3Color.secondary),
        textStyle(color: $M3Color.onPrimary),
      ),
    ).merge(baseStyle);

    final onDarkStyle = StyleMix(
      backgroundColor($M3Color.primary),
      textStyle(color: $M3Color.onPrimary),
      onDark(
        backgroundColor(Colors.red),
        textStyle(color: $M3Color.onPrimary),
      ),
    ).merge(baseStyle);

    return SingleChildScrollView(
      child: StyledFlex(
        style: flexAlign,
        direction: Axis.vertical,
        children: [
          flexAlign.container(child: const SizedBox()),
          StyledText(
            "Default variants",
            style: headingMix,
          ),
          Pressable(
            onPressed: () {
              return;
            },
            child: StyledContainer(
              style: style,
              child: StyledText(
                'onHover variant',
                style: style,
              ),
            ),
          ),
          const SizedBox(height: 20),
          StyledText(
            "onDark variants",
            style: headingMix,
          ),
          StyledContainer(
            style: onDarkStyle,
            child: StyledText(
              'onDark variant',
              style: onDarkStyle,
            ),
          ),
          const SizedBox(height: 20),
          StyledText(
            "and more...",
            style: headingMix,
          ),
          StyledText(
            """
onXSmall
onMedium
onSmall
onLarge

onPortrait
onLandscape

onDark
onLight

onRTL
onLTR

onDisabled
onEnabled

onFocus
onHover
onPress
onLongPress

onNot
""",
            style: onSurfaceMix,
          ),
        ],
      ),
    );
  }
}
