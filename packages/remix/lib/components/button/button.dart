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
    this.type = ButtonVariant.solid,
    this.size = ButtonSize.medium,
    required this.onPressed,
    this.style,
  });

  final String label;
  final bool disabled;
  final bool loading;

  final IconData? iconLeft;
  final IconData? iconRight;
  final ButtonVariant type;
  final ButtonSize size;
  final VoidCallback? onPressed;

  final Style? style;

  Style _buildStyle() {
    return buildDefaultButtonStyle()
        .merge(style)
        .applyVariants([size, type]).animate();
  }

  List<Widget> _buildChildren(ButtonSpec spec) {
    if (loading) {
      return [
        Stack(
          alignment: Alignment.center,
          children: [
            spec.spinner(),
            Opacity(opacity: 0.0, child: spec.label(label)),
          ],
        )
      ];
    }
    return [
      if (iconLeft != null) spec.icon(iconLeft),
      if (label.isNotEmpty) spec.label(label),
      if (iconRight != null) spec.icon(iconRight),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = disabled || loading;
    return Pressable(
      onPress: disabled || loading ? null : onPressed,
      enabled: !isDisabled,
      child: SpecBuilder(
          style: _buildStyle(),
          builder: (context) {
            var spec = ButtonSpec.of(context);

            final ContainerSpecWidget = spec.container;
            final FlexSpecWidget = spec.flex;

            return ContainerSpecWidget(
              child: FlexSpecWidget(
                direction: Axis.horizontal,
                children: _buildChildren(spec),
              ),
            );
          }),
    );
  }
}
