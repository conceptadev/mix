import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Box with BoxDecoration',
  type: Box,
)
Widget boxDecorationContainer(BuildContext context) {
  final boxStyle = Style(
    backgroundColor.red(),
    onPress(
      backgroundColor.blue(),
    ),
    opacity(0.5),
    (onHover & onDark)(
      backgroundColor.orange(),
    ),
    onHover(
      backgroundColor.grey(),
    ),
    padding.horizontal(15.0),
    padding.vertical(8.0),
    borderRadius(5),
    width(100),
    height(100),
    onDark(
      backgroundColor.purple(),
    ),
    alignment.center(),
    text.style.bold(),
  );

  return Center(
    child: Column(
      children: [
        PressableBox(
          style: boxStyle,
          onPressed: () {},
          child: const StyledText('Press me'),
        ),
        Pressable(
          child: AnimatedBox(
            style: boxStyle,
            duration: const Duration(milliseconds: 150),
            child: const StyledText('Press me Animated'),
          ),
        )
      ],
    ),
  );
}
