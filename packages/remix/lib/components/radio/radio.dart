import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../utils/component_recipe.dart';
import 'radio.style.dart';
import 'radio.variants.dart';

class RemixRadio extends StatelessWidget
    implements RemixComponentRecipe<RemixRadioStyle> {
  const RemixRadio({
    super.key,
    this.label,
    this.disabled = false,
    this.active = false,
    this.onChanged,
    this.style,
    this.variants = const [],
  });

  final String? label;
  final bool disabled;
  final bool active;
  final ValueChanged<bool>? onChanged;

  @override
  final RemixRadioStyle? style;

  @override
  final List<Variant> variants;

  RemixRadioStyle buildStyle(List<Variant> variants) {
    final result = style == null ? RemixRadioStyle.base() : style!;
    return result.applyVariants(variants);
  }

  void Function()? _handleOnChange() {
    return onChanged == null || disabled ? null : () => onChanged!(!active);
  }

  @override
  Widget build(BuildContext context) {
    var internalVariants = active ? RadioState.active : RadioState.inactive;

    final style = buildStyle([internalVariants, ...variants]);

    return PressableBox(
      onPressed: _handleOnChange,
      child: HBox(
        style: style.row,
        children: [
          Box(
            style: style.outerContainer,
            child: Box(
              style: style.innerContainer,
            ),
          ),
          if (label != null)
            StyledText(
              label!,
              style: style.label,
            ),
        ],
      ),
    );
  }
}
