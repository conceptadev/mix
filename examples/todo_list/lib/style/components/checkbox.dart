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
        outlinePattern(),
        scaleEffect(),
        _CheckboxVariant.checked(
          $box.color.ref($token.color.primary),
          $box.border.color.ref($token.color.primary),
        ),
      )
          .applyVariant(
            value ? _CheckboxVariant.checked : _CheckboxVariant.unchecked,
          )
          .animate(
            duration: Durations.short2,
          ),
      child: StyledIcon(
        Icons.check,
        style: Style(
          $icon.weight(16),
          $icon.color.ref($token.color.surface),
          $with.opacity(0),
          $with.padding.top(5),
          _CheckboxVariant.checked(
            $with.padding.top(0),
            $with.opacity(1),
          ),
        )
            .applyVariant(
              value ? _CheckboxVariant.checked : _CheckboxVariant.unchecked,
            )
            .animate(
              duration: Durations.short4,
            ),
      ),
    );
  }
}
