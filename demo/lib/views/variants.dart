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
      borderRadius(10),
      elevation(2),
      margin(10),
      alignment.center(),
    );

    final style = StyleMix(
      backgroundColor($colors.primary()),
      text.style(color: $colors.onPrimary()),
      onHover(
        backgroundColor($colors.secondary()),
        text.style(color: $colors.onPrimary()),
      ),
    ).merge(baseStyle);

    final onDarkStyle = StyleMix(
      backgroundColor($colors.primary()),
      text.style(color: $colors.onPrimary()),
      onDark(
        backgroundColor(Colors.red),
        text.style(color: $colors.onPrimary()),
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
