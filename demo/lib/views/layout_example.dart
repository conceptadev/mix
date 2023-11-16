import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../styles.dart';

StyleMix get mix => StyleMix(
      height(300),
      width(300),
      borderRadius(10),
      elevation(2),
      bgColor($colors.surface),
      alignment.center(),
      textStyle.color($colors.onSurface),
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
              StyledContainer(
                style: mix,
                child: StyledText(
                  "This is a StyledContainer inside a StyledStack!",
                  style: mix,
                ),
              ),
              StyledContainer(
                style: mix.merge(
                  StyleMix(
                    width(200),
                    height(100),
                    backgroundColor(Colors.green),
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
