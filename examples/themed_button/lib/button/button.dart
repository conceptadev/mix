import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:themed_button/button/button.style.dart' as style;

import 'button.variants.dart';

class ThemedButton extends StatelessWidget {
  const ThemedButton({
    super.key,
    required this.onPressed,
    this.label,
    this.disabled = false,
    this.loading = false,
    this.iconLeft,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
  });

  final String? label;
  final bool disabled;
  final bool loading;
  final IconData? iconLeft;
  final ButtonType type;
  final ButtonSize size;
  final VoidCallback? onPressed;

  List<Widget> _buildDefaultChildren() => [
        if (iconLeft != null)
          StyledIcon(
            iconLeft,
            style: style.icon().applyVariant(type, size),
          ),
        if (label != null)
          StyledText(
            label!,
            style: style.label().applyVariant(type, size),
          ),
      ];

  @override
  Widget build(BuildContext context) {
    // final style = buildStyle([size, type, ...variants]);

    return PressableBox(
      onPress: disabled || loading ? null : onPressed,
      child: HBox(
        style: style.container().applyVariant(type, size),
        children: _buildDefaultChildren(),
      ),
    );
  }
}
