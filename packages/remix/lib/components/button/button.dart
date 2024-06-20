import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/button/button.variants.dart';

class RemixButton extends StatelessWidget
    implements RemixComponentRecipe<RemixButtonStyle> {
  const RemixButton({
    super.key,
    this.label,
    this.disabled = false,
    this.loading = false,
    this.iconLeft,
    this.iconRight,
    this.type = ButtonType.primary,
    this.size = ButtonSize.xsmall,
    this.loadingLabel,
    required this.onPressed,
    this.style,
    this.variants = const [],
  });

  final String? label;
  final bool disabled;
  final bool loading;
  final String? loadingLabel;
  final IconData? iconLeft;
  final IconData? iconRight;
  final ButtonType type;
  final ButtonSize size;
  final VoidCallback? onPressed;

  @override
  final Style? style;

  @override
  final List<Variant> variants;

  RemixButtonStyle buildStyle(List<Variant> variants) {
    final result = style == null ? RemixButtonStyle.base() : style!;
    return result.applyVariants(variants);
  }

  List<Widget> _buildChildren(BuildContext context, RemixButtonStyle style) {
    return loading
        ? _buildLoadingChildren(context, style)
        : _buildDefaultChildren(style);
  }

  List<Widget> _buildLoadingChildren(
    BuildContext context,
    RemixButtonStyle buttonStyle,
  ) =>
      [
        _buildLoadingIndicator(context),
        if (loadingLabel != null)
          StyledText(
            loadingLabel!,
            style: buttonStyle.label,
          ),
      ];

  Widget _buildLoadingIndicator(BuildContext context) {
    final icon = IconSpec.of(context);
    const indicatorWidth = 2.5;

    return SizedBox(
      width: icon.size,
      height: icon.size,
      child: CircularProgressIndicator(
        strokeWidth: indicatorWidth,
        color: icon.color,
      ),
    );
  }

  List<Widget> _buildDefaultChildren(RemixButtonStyle style) => [
        if (iconLeft != null) StyledIcon(iconLeft, style: style.icon),
        if (label != null) StyledText(label!, style: style.label),
        if (iconRight != null) StyledIcon(iconRight, style: style.icon),
      ];

  @override
  Widget build(BuildContext context) {
    final style = buildStyle([size, type, ...variants]);

    return PressableBox(
      onPress: disabled || loading ? null : onPressed,
      child: HBox(
        style: style.container,
        children: _buildChildren(context, style),
      ),
    );
  }
}
