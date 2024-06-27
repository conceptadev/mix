import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:todo_list/style/design_tokens.dart';
import 'package:todo_list/style/patterns/outline.dart';
import 'package:todo_list/style/patterns/scale_effect.dart';

class _CheckboxVariant {
  static const checked = Variant("checked");
  static const unchecked = Variant("unchecked");
}

class TodoCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  const TodoCheckbox({
    super.key,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      onPress: () => onChanged(!value),
      style: Style(
        $box.height(20),
        $box.width(20),
        $box.color.ref($token.color.surface),
        $box.borderRadius(3),
        scaleEffect(),
        outlinePattern(),
        $icon.size(16),
        $icon.color.ref($token.color.surface),
        $icon.modifiers.opacity(0),
        $icon.modifiers.padding.top(5),
        $icon.modifiers.scale(0.5),
        _CheckboxVariant.checked(
          $icon.modifiers.padding.top(0),
          $icon.modifiers.scale(2),
          $icon.modifiers.opacity(1),
          $box.color.ref($token.color.primary),
          $box.border.color.ref($token.color.primary),
        ),
      )
          .applyVariant(
            value ? _CheckboxVariant.checked : _CheckboxVariant.unchecked,
          )
          .animate(
            duration: const Duration(milliseconds: 150),
          ),
      child: const StyledIcon(
        Icons.check,
      ),
    );
  }
}
