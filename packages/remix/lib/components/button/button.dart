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

  List<Widget> _buildChildren(ButtonSpec spec) {
    return loading ? _buildLoadingChildren(spec) : _buildDefaultChildren(spec);
  }

  List<Widget> _buildLoadingChildren(ButtonSpec spec) {
    return [
      spec.spinner(),
      if (loadingLabel != null) spec.label(loadingLabel!),
    ];
  }

  List<Widget> _buildDefaultChildren(ButtonSpec spec) => [
        if (iconLeft != null) spec.icon(iconLeft),
        if (label.isNotEmpty) spec.label(label),
        if (iconRight != null) spec.icon(iconRight),
      ];

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPress: disabled || loading ? null : onPressed,
      child: SpecBuilder(
          style: _buildStyle(),
          builder: (context) {
            var spec = ButtonSpec.of(context);

            final containerSpec = spec.container;
            final flexSpec = spec.flex;

            return containerSpec(
              child: flexSpec(
                direction: Axis.horizontal,
                children: _buildChildren(spec),
              ),
            );
          }),
    );
  }
}
