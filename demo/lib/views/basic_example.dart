import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mix/mix.dart';

import '../styles.dart';

class BasicExample extends HookWidget {
  const BasicExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = Style(
      box.height(300),
      box.width(300),
      box.borderRadius(10),
      box.padding.all.large(),
      box.padding.top.small(),
      box.elevation(2),
      box.margin.horizontal(10),
      box.alignment.center(),
      box.color(Colors.purple),
      box.color.purple.shade300(),
      text.style(color: Colors.white),
      box.borderRadius(10),
      box.shapeDecoration.color.white(),
      text.style.color.white(),
      onPress(
        box.color(Colors.black),
      ),
      onHover(
        opacity(0.5),
      ),
      onLongPress(
        box.color(Colors.green),
      ),
    );

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
          Box(
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
              Style(
                text.style(
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
              Style(
                onLight(
                  text.style.color.of($colors.error),
                ),
                onDark(
                  text.style.color.of($colors.primary),
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
                  Style(
                    icon.size(50),
                  ),
                ),
              ),
              StyledIcon(
                Icons.one_k,
                style: onSurfaceMix.merge(
                  Style(
                    icon.size(60),
                  ),
                ),
              ),
              StyledIcon(
                Icons.waving_hand_rounded,
                style: onSurfaceMix.merge(
                  Style(
                    icon.size(70),
                    icon.color.of($colors.secondary),
                  ),
                ),
              ),
              StyledIcon(
                Icons.warning_amber,
                style: onSurfaceMix.merge(
                  Style(
                    icon.size(90),
                    icon.color.yellow.shade900(),
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
            child: Box(
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
