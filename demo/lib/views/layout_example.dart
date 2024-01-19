import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../styles.dart';

Style get mix => Style(
      box.height(300),
      box.width(300),
      box.borderRadius(10),
      box.elevation(2),
      box.color.of($colors.surface),
      box.alignment.center(),
      text.style.color.of($colors.onSurface),
    );

class LayoutExample extends StatelessWidget {
  const LayoutExample({Key? key}) : super(key: key);

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
            "Stack",
            style: headingMix,
          ),
          StyledStack(
            style: mix,
            children: [
              Box(
                style: mix,
                child: StyledText(
                  "This is a StyledContainer inside a StyledStack!",
                  style: mix,
                ),
              ),
              Box(
                style: mix.merge(
                  Style(
                    box.width(200),
                    box.height(100),
                    box.color(Colors.green),
                  ),
                ),
                child: StyledText(
                  "This is another StyledContainer inside a StyledStack!",
                  style: mix,
                ),
              ),
            ],
          ),
          const Divider(),
          StyledText(
            "Flex (Vertical)",
            style: headingMix,
          ),
          StyledFlex(
            direction: Axis.vertical,
            style: flexAlign,
            children: [
              StyledText(
                "This is a StyledText inside a StyledFlex!",
                style: mix,
              ),
              StyledText(
                "This is another StyledText inside a StyledFlex!",
                style: mix,
              ),
              StyledText(
                "This yet another StyledText inside a StyledFlex! It works just like a column!",
                style: mix,
              ),
            ],
          ),
          const Divider(),
          StyledText(
            "Flex (Horizontal)",
            style: headingMix,
          ),
          StyledFlex(
            direction: Axis.horizontal,
            style: flexAlign,
            children: [
              StyledIcon(
                Icons.one_k,
                style: mix,
              ),
              StyledIcon(
                Icons.two_k,
                style: mix,
              ),
              StyledIcon(
                Icons.three_k,
                style: mix,
              ),
              StyledIcon(
                Icons.four_k,
                style: mix,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
