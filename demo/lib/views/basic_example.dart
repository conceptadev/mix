import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mix/mix.dart';

import '../styles.dart';

class BasicExample extends HookWidget {
  const BasicExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = StyleMix.fromAttributes([
      height(300),
      width(300),
      rounded(10),
      animation(),
      elevation(2),
      margin(10),
      alignment(Alignment.center),
      backgroundColor(Colors.purple),
      alignment(Alignment.center),
      textStyle(color: Colors.white),
      onPress(
        backgroundColor(Colors.black),
      ),
      onHover(
        opacity(0.5),
      ),
      onLongPress(
        backgroundColor(Colors.green),
      ),
    ]);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: StyledFlex(
        style: onSurfaceMix.merge(flexAlign),
        direction: Axis.vertical,
        children: [
          flexAlign.container(child: const SizedBox()),
          StyledText(
            "Container",
            style: headingMix,
          ),
          StyledContainer(
            style: mix,
            child: StyledText(
              "Hello World, this is a StyledContainer!",
              style: mix,
            ),
          ),
          const Divider(),
          StyledText(
            "StyledText",
            style: headingMix,
          ),
          StyledText(
            "This is another StyledText, but using a different mix!",
            style: onSurfaceMix,
          ),
          StyledText(
            "This is another StyledText, but yet another a different mix!",
            style: onSurfaceMix.merge(
              StyleMix(
                textStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          StyledText(
            "This is a StyledText that changes to a different when in dark mode!",
            style: onSurfaceMix.merge(
              StyleMix(
                onLight(
                  textStyle(color: $M3Color.error),
                ),
                onDark(
                  textStyle(color: $M3Color.primary),
                ),
              ),
            ),
          ),
          const Divider(),
          StyledText(
            "StyledIcon",
            style: headingMix,
          ),
          StyledFlex(
            style: flexAlign,
            direction: Axis.horizontal,
            children: [
              StyledIcon(
                Icons.move_to_inbox,
                style: onSurfaceMix.merge(
                  StyleMix(
                    iconSize(50),
                  ),
                ),
              ),
              StyledIcon(
                Icons.one_k,
                style: onSurfaceMix.merge(
                  StyleMix(
                    iconSize(60),
                  ),
                ),
              ),
              StyledIcon(
                Icons.waving_hand_rounded,
                style: onSurfaceMix.merge(
                  StyleMix(
                    iconSize(70),
                    iconColor($M3Color.secondary),
                  ),
                ),
              ),
              StyledIcon(
                Icons.warning_amber,
                style: onSurfaceMix.merge(
                  StyleMix(
                    iconSize(90),
                    iconColor(Colors.yellow.shade900),
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          StyledText(
            "Pressable with a StyledContainer",
            style: headingMix,
          ),
          Pressable(
            onPressed: () {
              return;
            },
            child: StyledContainer(
              style: mix,
              child: StyledText(
                "Press or long press me!",
                style: mix,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
