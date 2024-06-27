import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:todo_list/style/design_tokens.dart';

import '../patterns/scale_effect.dart';

class TodoButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const TodoButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      onPress: onPressed,
      style: Style(
        $box.color.ref($token.color.primary),
        $box.height(50),
        $box.borderRadius(6),
        scaleEffect(),
      ).animate(
        duration: const Duration(milliseconds: 150),
      ),
      child: StyledText(
        text,
        style: Style(
          $text.style.color.ref($token.color.surface),
          $text.style.ref($token.textStyle.heading3),
          $text.style.bold(),
          $with.scale(1),
          $with.align(alignment: Alignment.center),
          $on.press(
            $with.scale(1.1),
          ),
        ),
      ),
    );
  }
}
