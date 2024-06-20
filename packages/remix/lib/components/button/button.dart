import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/button/button.style.dart';
import 'package:remix/components/button/button.variants.dart';
import 'package:remix/components/button/button_spec.dart';

class RXButton extends StatelessWidget {
  const RXButton({
    super.key,
    required this.label,
    this.disabled = false,
    this.loading = false,
    this.iconLeft,
    this.iconRight,
    this.type = ButtonType.primary,
    this.size = ButtonSize.xsmall,
    this.loadingLabel,
    required this.onPressed,
    this.style,
  });

  final String label;
  final bool disabled;
  final bool loading;
  final String? loadingLabel;
  final IconData? iconLeft;
  final IconData? iconRight;
  final ButtonType type;
  final ButtonSize size;
  final VoidCallback? onPressed;

  final Style? style;

  Style _buildStyle() {
    return defaultButtonStyle
        .merge(style)
        .applyVariants([size, type]).animate();
  }

  List<Widget> _buildChildren(IconSpec iconSpec, TextSpec labelSpec) {
    return loading
        ? _buildLoadingChildren(iconSpec, labelSpec)
        : _buildDefaultChildren(iconSpec, labelSpec);
  }

  List<Widget> _buildLoadingChildren(IconSpec iconSpec, TextSpec labelSpec) => [
        _buildLoadingIndicator(iconSpec),
        if (loadingLabel != null) labelSpec(loadingLabel!),
      ];

  Widget _buildLoadingIndicator(IconSpec iconSpec) {
    const indicatorWidth = 2.5;

    return SizedBox(
      width: iconSpec.size,
      height: iconSpec.size,
      child: CircularProgressIndicator(
        strokeWidth: indicatorWidth,
        color: iconSpec.color,
      ),
    );
  }

  List<Widget> _buildDefaultChildren(IconSpec iconSpec, TextSpec labelSpec) => [
        if (iconLeft != null) iconSpec(iconLeft),
        if (label.isNotEmpty) labelSpec(label),
        if (iconRight != null) iconSpec(iconRight),
      ];

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPress: disabled || loading ? null : onPressed,
      child: SpecBuilder(
          style: _buildStyle(),
          builder: (context) {
            final buttonSpec = ButtonSpec.of(context);

            final containerSpec = buttonSpec.container;
            final flexSpec = buttonSpec.flex;
            final iconSpec = buttonSpec.icon;
            final labelSpec = buttonSpec.label;

            return containerSpec(
              child: flexSpec(
                direction: Axis.horizontal,
                children: _buildChildren(iconSpec, labelSpec),
              ),
            );
          }),
    );
  }
}
