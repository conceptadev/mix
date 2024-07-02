import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/button/button.style.dart';
import 'package:remix/components/button/button.variants.dart';
import 'package:remix/components/button/button_spec.dart';

class RxButton extends StatelessWidget {
  const RxButton({
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

  bool get _hasIcon => iconLeft != null || iconRight != null;

  Style _buildStyle() {
    return buildDefaultButtonStyle()
        .merge(style)
        .applyVariants([size, type]).animate();
  }

  Widget _buildLoadingOverlay(Widget child) {
    return loading
        ? Stack(
            alignment: Alignment.center,
            children: [
              child,
              Opacity(opacity: 0.0, child: child),
            ],
          )
        : child;
  }

  Widget _buildChildren(ButtonSpec spec) {
    final flexWidget = spec.flex(
      direction: Axis.horizontal,
      children: [
        if (iconLeft != null) spec.icon(iconLeft),
        // If there is no icon always render the label
        if (label.isNotEmpty || !_hasIcon) spec.label(label),
        if (iconRight != null) spec.icon(iconRight),
      ],
    );

    return loading ? _buildLoadingOverlay(flexWidget) : flexWidget;
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
            final spec = ButtonSpec.of(context);

            return spec.container(
              child: _buildChildren(spec),
            );
          }),
    );
  }
}
