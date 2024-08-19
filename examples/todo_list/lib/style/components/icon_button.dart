import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:todo_list/style/design_tokens.dart';

import '../patterns/outline.dart';
import '../patterns/scale_effect.dart';

const _colors = ColorTokens();

class TodoIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const TodoIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      onPress: onPressed,
      style: Style(
        $box.color.ref(_colors.surface),
        $box.height(50),
        $box.width(50),
        $box.borderRadius(4),
        scaleEffect(),
        $icon.color.ref(_colors.primary),
        $icon.weight(20),
        outlinePattern(),
        $on.press(
          $box.color.ref(_colors.surfaceContainer),
        ),
      ).animate(
        duration: const Duration(milliseconds: 150),
      ),
      child: StyledIcon(
        icon,
        style: Style(
          $with.scale(1),
          $on.press(
            $with.scale(1.1),
          ),
        ).animate(
          duration: const Duration(milliseconds: 150),
        ),
      ),
    );
  }
}
