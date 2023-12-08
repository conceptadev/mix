import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Box with BoxDecoration',
  type: Box,
)
Widget boxDecorationContainer(BuildContext context) {
  final boxStyle = StyleMix(
    box.color.red(),
    onPress(
      box.color.blue(),
    ),
    box.opacity(0.5),
    (onHover & onDark)(
      box.color.orange(),
    ),
    onHover(
      box.color.grey(),
    ),
    box.padding.horizontal(15.0),
    box.padding.vertical(8.0),
    box.border.radius(5),
    box.width(100),
    box.height(100),
    onDark(
      box.color.purple(),
    ),
    box.alignment.center(),
    text.style.bold(),
  );

  return Center(
    child: Column(
      children: [
        GestureBox(
          style: boxStyle,
          onPressed: () {},
          child: const StyledText('Press me'),
        ),
        Pressable(
          child: AnimatedBox(
            style: boxStyle,
            child: const StyledText('Press me Animated'),
          ),
        )
      ],
    ),
  );
}
