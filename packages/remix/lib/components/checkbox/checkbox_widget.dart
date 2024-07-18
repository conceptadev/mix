import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/checkbox/checkbox_spec.dart';
import 'package:remix/components/checkbox/checkbox_style.dart';
import 'package:remix/components/checkbox/checkbox_variants.dart';

class RxCheckbox extends StatelessWidget {
  const RxCheckbox({
    super.key,
    this.disabled = false,
    this.value = false,
    this.onChanged,
    this.iconChecked = Icons.check_rounded,
    this.iconUnchecked,
    this.style,
    this.size = CheckboxSize.medium,
    this.variant = CheckboxVariant.solid,
  });

  final bool disabled;
  final bool value;
  final IconData iconChecked;
  final IconData? iconUnchecked;
  final ValueChanged<bool>? onChanged;

  /// Additional custom styling for the button.
  ///
  /// This allows you to override or extend the default button styling.
  final Style? style;

  final CheckboxSize size;
  final CheckboxVariant variant;

  void _handleOnPress() => onChanged?.call(!value);

  Style _buildStyle() {
    return buildDefaultCheckboxStyle().merge(style).applyVariants([
      size,
      variant,
      value ? CheckboxStatus.checked : CheckboxStatus.unchecked
    ]).animate();
  }

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPress: disabled ? null : _handleOnPress,
      enabled: !disabled,
      child: SpecBuilder(
        style: _buildStyle(),
        builder: (context) {
          final spec = CheckboxSpec.of(context);

          final ContainerWidget = spec.container;
          final IconWidget = spec.indicator;

          return ContainerWidget(
            child: IconWidget(
              value ? iconChecked : iconUnchecked,
            ),
          );
        },
      ),
    );
  }
}
