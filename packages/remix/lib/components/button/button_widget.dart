import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/button/button.style.dart';
import 'package:remix/components/button/button.variants.dart';
import 'package:remix/components/button/button_spec.dart';

/// A customizable button component with various styling options.
///
/// The [RxButton] allows you to create buttons with different variants, sizes,
/// and icons. You can also disable the button or show a loading state.
///
/// Example usage:
///
/// ```dart
/// RxButton(
///   label: 'Click me',
///   onPressed: () {},
///   iconLeft: Icons.add,
/// )
/// ```
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

  /// The text label displayed on the button.
  final String label;

  /// Whether the button is disabled.
  ///
  /// When disabled, the button will not respond to user interactions.
  final bool disabled;

  /// Whether the button is in a loading state.
  ///
  /// When loading, the button will display a loading indicator and
  /// will not respond to user interactions.
  final bool loading;

  /// An optional icon to display on the left side of the label.
  final IconData? iconLeft;

  /// An optional icon to display on the right side of the label.
  final IconData? iconRight;

  /// The button variant.
  final ButtonVariant type;

  /// The button size.
  final ButtonSize size;

  /// The callback function called when the button is pressed.
  ///
  /// This callback will not be called if the button is disabled or in a loading state.
  final VoidCallback? onPressed;

  /// Additional custom styling for the button.
  ///
  /// This allows you to override or extend the default button styling.
  final Style? style;

  bool get _hasIcon => iconLeft != null || iconRight != null;

  Style _buildStyle() {
    return buildDefaultButtonStyle()
        .merge(style)
        .applyVariants([size, type]).animate();
  }

  Widget _buildLoadingOverlay(ButtonSpec spec, Widget child) {
    return loading
        ? Stack(
            alignment: Alignment.center,
            children: [
              spec.spinner(),
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

    return loading ? _buildLoadingOverlay(spec, flexWidget) : flexWidget;
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
