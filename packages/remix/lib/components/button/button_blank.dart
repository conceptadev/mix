part of 'button.dart';

typedef RxButtonSpinnerBuilder = RxComponentBuilder<SpinnerSpec>;

class RxBlankButton extends StatelessWidget {
  const RxBlankButton({
    super.key,
    required this.label,
    this.disabled = false,
    this.loading = false,
    this.spinnerBuilder,
    this.iconLeft,
    this.iconRight,
    required this.onPressed,
    required this.style,
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

  final RxButtonSpinnerBuilder? spinnerBuilder;

  /// An optional icon to display on the left side of the label.
  final IconData? iconLeft;

  /// An optional icon to display on the right side of the label.
  final IconData? iconRight;

  /// The callback function called when the button is pressed.
  ///
  /// This callback will not be called if the button is disabled or in a loading state.
  final VoidCallback? onPressed;

  final Style style;

  bool get _hasIcon => iconLeft != null || iconRight != null;

  Widget _buildLoadingOverlay(
    ButtonSpec spec,
    BuildContext context,
    Widget child,
  ) {
    final Widget spinner =
        spinnerBuilder?.call(context, spec.spinner) ?? spec.spinner();

    return loading
        ? Stack(
            alignment: Alignment.center,
            children: [
              spinner,
              Opacity(opacity: 0.0, child: child),
            ],
          )
        : child;
  }

  Widget _buildChildren(ButtonSpec spec, BuildContext context) {
    final flexWidget = spec.flex(
      direction: Axis.horizontal,
      children: [
        if (iconLeft != null) spec.icon(iconLeft),
        // If there is no icon always render the label
        if (label.isNotEmpty || !_hasIcon) spec.label(label),
        if (iconRight != null) spec.icon(iconRight),
      ],
    );

    return loading
        ? _buildLoadingOverlay(spec, context, flexWidget)
        : flexWidget;
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = disabled || loading;
    return Pressable(
      onPress: disabled || loading ? null : onPressed,
      enabled: !isDisabled,
      child: SpecBuilder(
        style: style,
        builder: (context) {
          final spec = ButtonSpec.of(context);

          return spec.container(
            child: _buildChildren(spec, context),
          );
        },
      ),
    );
  }
}
