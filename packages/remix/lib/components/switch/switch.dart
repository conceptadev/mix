import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../utils/component_recipe.dart';
import 'switch.style.dart';
import 'switch.variants.dart';

class RemixSwitch extends StatelessWidget
    implements RemixComponentRecipe<RemixSwitchStyle> {
  const RemixSwitch({
    super.key,
    this.disabled = false,
    this.active = false,
    this.onChanged,
    this.style,
    this.variants = const [],
  });

  final bool disabled;
  final bool active;
  final ValueChanged<bool>? onChanged;

  @override
  final RemixSwitchStyle? style;

  @override
  final List<Variant> variants;

  RemixSwitchStyle buildStyle(List<Variant> variants) {
    final result = style == null ? RemixSwitchStyle.base() : style!;
    return result.applyVariants(variants);
  }

  void Function()? _handleOnChange() {
    return onChanged == null || disabled ? null : () => onChanged!(!active);
  }

  @override
  Widget build(BuildContext context) {
    var internalVariants = active ? SwitchState.active : SwitchState.inactive;

    final style = buildStyle([internalVariants, ...variants]);

    return PressableBox(
      onPressed: _handleOnChange,
      style: style.outerFlexContainer,
      child: Box(
        style: style.innerContainer,
      ),
    );
  }
}
